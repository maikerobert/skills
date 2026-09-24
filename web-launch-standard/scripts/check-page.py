#!/usr/bin/env python3
"""Launch check for a live page (Web Launch Standard).

Usage:
    python3 check-page.py URL             check a public page
    python3 check-page.py URL --private   check a private or staging page

Only the Python 3 standard library is required. Exit code 1 when any check fails.
"""

import json
import re
import sys
import urllib.error
import urllib.request
from html.parser import HTMLParser
from urllib.parse import urljoin, urlparse

USER_AGENT = "web-launch-standard-check/1.0"
TIMEOUT = 20


class PageParser(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.lang = None
        self.title = ""
        self.in_title = False
        self.meta = {}
        self.links = []
        self.h1_count = 0
        self.images = []
        self.json_ld = []
        self.in_json_ld = False
        self.json_buffer = ""
        self.scripts = []

    def handle_starttag(self, tag, attrs):
        a = {k.lower(): (v or "") for k, v in attrs}
        if tag == "html":
            self.lang = a.get("lang")
        elif tag == "title":
            self.in_title = True
        elif tag == "meta":
            key = (a.get("name") or a.get("property") or "").lower()
            if key:
                self.meta.setdefault(key, a.get("content", ""))
        elif tag == "link":
            self.links.append(a)
        elif tag == "h1":
            self.h1_count += 1
        elif tag == "img":
            self.images.append(a)
        elif tag == "script":
            if a.get("type", "").lower() == "application/ld+json":
                self.in_json_ld = True
                self.json_buffer = ""
            if a.get("src"):
                self.scripts.append(a["src"])

    def handle_endtag(self, tag):
        if tag == "title":
            self.in_title = False
        elif tag == "script" and self.in_json_ld:
            self.json_ld.append(self.json_buffer)
            self.in_json_ld = False

    def handle_data(self, data):
        if self.in_title:
            self.title += data
        if self.in_json_ld:
            self.json_buffer += data


def fetch(url):
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(request, timeout=TIMEOUT) as response:
            body = response.read().decode(response.headers.get_content_charset() or "utf-8", "replace")
            return response.status, response.geturl(), dict(response.headers), body
    except urllib.error.HTTPError as error:
        return error.code, url, dict(error.headers or {}), ""
    except (urllib.error.URLError, TimeoutError) as error:
        return None, url, {}, str(error)


class Report:
    def __init__(self):
        self.failures = 0
        self.warnings = 0

    def ok(self, message):
        print(f"  PASS  {message}")

    def warn(self, message):
        self.warnings += 1
        print(f"  WARN  {message}")

    def fail(self, message):
        self.failures += 1
        print(f"  FAIL  {message}")

    def check(self, condition, message, severity="fail"):
        if condition:
            self.ok(message)
        elif severity == "warn":
            self.warn(message)
        else:
            self.fail(message)


def rel_values(link):
    return link.get("rel", "").lower().split()


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    private = "--private" in sys.argv
    if len(args) != 1:
        print(__doc__)
        sys.exit(2)
    url = args[0]
    report = Report()
    profile = "private" if private else "public"
    print(f"Checking {url} as a {profile} page\n")

    status, final_url, headers, body = fetch(url)
    print("Response")
    if status is None:
        report.fail(f"page could not be loaded ({body})")
        sys.exit(1)
    report.check(status == 200, f"status {status}")
    if status != 200:
        print("\nThe page must return 200 before the other checks make sense.")
        sys.exit(1)
    report.check(urlparse(final_url).scheme == "https", f"served over HTTPS ({final_url})")

    page = PageParser()
    page.feed(body)
    meta = page.meta
    robots = (meta.get("robots", "") + " " + headers.get("X-Robots-Tag", headers.get("x-robots-tag", ""))).lower()

    print("\nMetadata")
    report.check(bool(page.lang), f"html lang attribute ({page.lang or 'missing'})")
    report.check(bool(page.title.strip()), f"title ({page.title.strip()[:70] or 'missing'})")
    report.check("viewport" in meta, "viewport meta tag")
    if private:
        report.check("noindex" in robots, "noindex in robots meta tag or X-Robots-Tag header")
    else:
        report.check("noindex" not in robots, "page is indexable (no noindex)")
        report.check(bool(meta.get("description")), "meta description")
        canonicals = [l for l in page.links if "canonical" in rel_values(l)]
        report.check(len(canonicals) == 1, f"exactly one canonical link (found {len(canonicals)})")
        if canonicals:
            href = urljoin(final_url, canonicals[0].get("href", ""))
            report.check(href.startswith("https://"), f"canonical is an absolute HTTPS URL ({href})", "warn")

    print("\nStructure and images")
    report.check(page.h1_count == 1, f"exactly one h1 (found {page.h1_count})", "warn")
    missing_alt = [i.get("src", "?") for i in page.images if "alt" not in i]
    report.check(not missing_alt, f"every image has an alt attribute ({len(missing_alt)} missing)")
    no_size = [i.get("src", "?") for i in page.images if not (i.get("width") and i.get("height"))]
    report.check(not no_size, f"images declare width and height ({len(no_size)} without)", "warn")

    if not private:
        print("\nStructured data")
        if not page.json_ld:
            report.ok("no JSON-LD (fine when there are no real facts to describe)")
        for index, block in enumerate(page.json_ld, 1):
            try:
                json.loads(block)
                report.ok(f"JSON-LD block {index} is valid JSON")
            except ValueError as error:
                report.fail(f"JSON-LD block {index} is not valid JSON ({error})")

        print("\nSharing")
        for key in ("og:title", "og:description", "og:image", "og:url", "og:type"):
            report.check(bool(meta.get(key)), key)
        for key in ("og:site_name", "og:locale", "og:image:alt"):
            report.check(bool(meta.get(key)), key, "warn")
        width, height = meta.get("og:image:width"), meta.get("og:image:height")
        report.check(width == "1200" and height == "630", f"og:image declared as 1200x630 ({width or '?'}x{height or '?'})", "warn")
        report.check(meta.get("twitter:card") == "summary_large_image", f"twitter:card summary_large_image ({meta.get('twitter:card') or 'missing'})", "warn")

    print("\nIcons")
    rels = [r for l in page.links for r in rel_values(l)]
    report.check("icon" in rels, "favicon link")
    report.check("apple-touch-icon" in rels, "apple-touch-icon", "warn")
    report.check("manifest" in rels, "web app manifest", "warn")
    report.check(bool(meta.get("theme-color")), "theme-color", "warn")

    print("\nAnalytics")
    ga_ids = sorted(set(re.findall(r"G-[A-Z0-9]{6,12}", body)))
    loaders = [s for s in page.scripts if "googletagmanager.com/gtag/js" in s or "googletagmanager.com/gtm.js" in s]
    if not ga_ids and not loaders:
        report.warn("no Google Analytics installation found (fine if the site uses another tool)")
    else:
        report.check(len(loaders) <= 1, f"single analytics loader ({len(loaders)} found)")
        report.ok(f"measurement IDs found: {', '.join(ga_ids) or 'none inline'}")

    print("\nCrawling")
    origin = f"{urlparse(final_url).scheme}://{urlparse(final_url).netloc}"
    robots_status, _, _, robots_body = fetch(origin + "/robots.txt")
    sitemap_status, _, _, sitemap_body = fetch(origin + "/sitemap.xml")
    if private:
        listed = final_url.rstrip("/") in sitemap_body or url.rstrip("/") in sitemap_body
        report.check(not listed, "private URL is not listed in sitemap.xml")
    else:
        report.check(robots_status == 200, f"robots.txt ({robots_status})")
        report.check("sitemap" in (robots_body or "").lower(), "robots.txt references the sitemap", "warn")
        report.check(sitemap_status == 200, f"sitemap.xml ({sitemap_status})")
        report.check(final_url.rstrip("/") in sitemap_body or url.rstrip("/") in sitemap_body, "page is listed in sitemap.xml", "warn")

    print(f"\n{report.failures} failure(s), {report.warnings} warning(s).")
    print("Manual items remain: share image quality, keyboard and focus, real conversions and form delivery.")
    sys.exit(1 if report.failures else 0)


if __name__ == "__main__":
    main()
