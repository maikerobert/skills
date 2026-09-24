---
name: web-launch-standard
description: Launch checklist for websites, landing pages and web apps, covering scope, technical SEO, images, social sharing and icons, Google Analytics 4, accessibility, performance, forms, safe deploy and public QA in production. It first classifies the page as public or private and applies only what fits. Use when building, reviewing or publishing any web page, and before declaring a page ready.
---

# Web Launch Standard

By Maike Robert. MIT License.

A page is ready when it works in production for real visitors, search engines, social previews and analytics, not when the local build passes. This standard is the checklist that closes that gap, and it adapts to the kind of page being launched.

## Step 1: classify the page

Before anything else, decide which profile the page has. If it is not clear from the request, ask.

| Profile | Examples | What changes |
|---|---|---|
| **Public** | Website, landing page, blog, public product page | Full checklist: SEO, structured data, social sharing, sitemap and Search Console. |
| **Private** | Dashboard, logged-in area, admin panel, internal tool | Search and sharing items are skipped. The goal flips: keep the page out of search results and behind authentication. |
| **Staging** | Preview or test environment | Treated as private until it is promoted, so test versions never get indexed. |

For private and staging pages:

- Authentication is the real protection. Add `<meta name="robots" content="noindex, nofollow">` or the `X-Robots-Tag: noindex` header as a second layer.
- Keep private URLs out of the sitemap. Do not rely on `robots.txt` alone: a `Disallow` rule does not remove a page from results, it only stops crawlers from reading it (and from seeing the `noindex`), and it publicly lists the paths you wanted to hide.
- Skip Open Graph images, social cards, structured data and Search Console. Keep a clear `<title>`, the favicon and everything in blocks 5 to 10.

## Step 2: apply the 10 blocks

The table shows where each block applies. ✓ applies, ○ applies in part, ✗ does not apply.

| Block | Public | Private or staging |
|---|---|---|
| 1. Scope and assumptions | ✓ | ✓ |
| 2. Technical SEO | ✓ | ✗ (noindex only) |
| 3. Images | ✓ | ○ (performance and alt) |
| 4. Sharing and icons | ✓ | ○ (favicon, title, theme-color) |
| 5. Analytics | ✓ | ○ (product usage events, no marketing conversions) |
| 6. Accessibility | ✓ | ✓ |
| 7. Performance | ✓ | ✓ |
| 8. Forms | ✓ | ✓ |
| 9. Versioning and deploy | ✓ | ✓ |
| 10. Launch QA in production | ✓ | ✓ (without search and sharing items) |

### 1. Scope and assumptions

- Build what was asked. Pages, sections and copy that were not part of the request stay exactly as they are.
- Never rewrite approved copy to "improve" it. Suggest changes separately.
- Record every assumption (missing copy, undefined conversion, provider not chosen) in the delivery notes and ask when it changes the result.

### 2. Technical SEO

- One `<link rel="canonical">` per page, pointing to the preferred absolute URL.
- `sitemap.xml` with every public URL and only public URLs, and a `robots.txt` that references it.
- Semantic structure: one `<h1>` per page, headings in order without skipping levels, landmarks (`header`, `nav`, `main`, `footer`).
- Language: `<html lang="...">` on every page. For multilingual sites, `hreflang` between versions and one URL per language.
- Duplicate content prevention: a single protocol and host (HTTPS, with or without `www`, redirecting the others with 301), consistent trailing slashes, and canonical on pages reachable by more than one URL (filters, tracking parameters).
- `<title>` and `<meta name="description">` unique per page.
- Structured data (JSON-LD, schema.org) only when real facts support it. Never invent ratings, reviews, prices, offers or availability. Validate it before launch.
- Search Console: verify the property and submit the sitemap at launch.

### 3. Images

- File names describe the content with hyphens (`corretor-app-dashboard.webp`, not `IMG_2034.png`).
- Compressed, in modern formats (WebP or AVIF) with a fallback when the audience needs one.
- Explicit `width` and `height` (or `aspect-ratio`) to avoid layout shift, and responsive sizes with `srcset`/`sizes` when the image changes size by breakpoint.
- `loading="lazy"` below the fold; the main image of the first screen loads eagerly, with `fetchpriority="high"`.
- Useful `alt` that describes what matters in the image for that context. Decorative images use `alt=""`.

### 4. Sharing and icons

- Complete Open Graph: `og:title`, `og:description`, `og:image`, `og:url`, `og:type`, `og:site_name` and `og:locale`.
- Share image at 1200×630, well composed (legible text, important content away from the edges), with absolute URL, `og:image:width`, `og:image:height` and `og:image:alt`.
- X (Twitter) card: `twitter:card` set to `summary_large_image`, with title, description and image.
- Favicon (SVG or ICO plus PNG), Apple touch icon at 180×180, `manifest.webmanifest` with icons at 192 and 512, and `theme-color`.
- Validate the social preview with a debugger or a real share before launch.

### 5. Analytics (Google Analytics 4)

- One single installation (gtag or Google Tag Manager, never both firing the same measurement ID).
- Event names in `snake_case`. Prefer GA4 recommended events when one fits (`generate_lead`, `sign_up`, `purchase`) and do not duplicate events that enhanced measurement already collects (`scroll`, `file_download`, `video_start`, outbound clicks).
- One main conversion defined before launch and marked as a key event.
- Event plan written down: navigation, CTA clicks (`cta_click` with `cta_id` and `cta_location`), form start, submit and error, downloads, video, plan selection, contact and activation.
- Parameters without personal data (no email, phone or name in event payloads).
- Private pages track product usage only, never marketing conversions.

### 6. Accessibility

- Everything works with the keyboard, in a logical order, with no keyboard traps.
- Visible focus on every interactive element.
- Text contrast of at least 4.5:1 (3:1 for large text and interface components).
- Every field has a real `<label>`; errors are announced in text next to the field, not only with color.
- Animations respect `prefers-reduced-motion`.
- Buttons are `<button>`, links are `<a>`, and icons without text have an accessible name.

### 7. Performance

- Mobile first: design and test on a mid-range phone and network before desktop.
- Core Web Vitals targets: LCP under 2.5 s, INP under 200 ms, CLS under 0.1.
- Fonts: few families and weights, `font-display: swap`, preload only the critical one, self-hosted when possible.
- Scripts: `defer` or `async`, no unused libraries, third-party scripts (chat, pixels, widgets) loaded only when they earn their cost.
- Animations: only `transform` and `opacity`, nothing that blocks the first render or shifts layout.

### 8. Forms

- Validation in the browser and on the server, with messages that say how to fix the error.
- Clear loading, success and error states.
- Protection against duplicate submission (disable the button while sending, idempotency on the server) and basic spam protection (honeypot or rate limit).
- The receiving service is documented: where submissions go, how to activate it, who receives them and how to test it.

### 9. Versioning and deploy

- Code versioned in Git with a README that explains how to run, build and publish.
- Secrets never go into the repository (see the Portable Code Standard in this collection).
- Remote backup, correct file permissions on the server and a tested rollback path before the first deploy.
- Deploys are repeatable (documented command or pipeline), not manual file copies.

### 10. Launch QA in production

Run on the public URL, never only on the local build. The page is declared ready only after this pass.

- Every route loads with status 200; old URLs redirect with 301; a missing URL returns 404.
- No console errors and no failed requests in the Network tab (assets, fonts, APIs).
- Responsive check on phone, tablet and desktop.
- Metadata: title, description, canonical, `lang`, robots (and `noindex` on private pages).
- Public pages: social preview, favicon, `robots.txt`, `sitemap.xml` and structured data validated.
- Analytics: fire the main conversion and the key events on the live page and confirm the real payloads (GA4 DebugView or the Network tab).
- Forms: send a real submission and confirm it reached its destination.

## Automated check (free)

`scripts/check-page.py` checks the automatable part of block 10 on a live URL. It needs only Python 3, with no extra packages.

```bash
python3 scripts/check-page.py https://example.com/           # public page
python3 scripts/check-page.py https://app.example.com/ --private  # private page
```

It checks HTTPS and status, `lang`, title, description, canonical, a single `<h1>`, images without `alt` or without dimensions, JSON-LD syntax, Open Graph and X card tags, the 1200×630 image declaration, favicon, Apple touch icon, manifest, `theme-color`, `robots.txt`, `sitemap.xml` and a duplicated analytics installation. With `--private`, it requires `noindex` and flags a page listed in the sitemap. Anything it cannot see (visual quality of the share image, keyboard use, real conversions) stays in the manual list above.

## How to deliver

- Start the delivery with the page profile (public, private or staging) and the assumptions made.
- Report the checklist by block, marking what was done, what was skipped because of the profile and what is pending.
- Say "ready" only after block 10 has run on the public URL.
