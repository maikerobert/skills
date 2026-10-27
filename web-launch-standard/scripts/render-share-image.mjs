#!/usr/bin/env node
// Renders a 1200x630 HTML canvas into a share image (JPG at 2x by default)
// and checks the result before it goes to Open Graph.
//
// Usage:
//   node scripts/render-share-image.mjs og-home.html [out.jpg] [--scale 2] [--quality 85]
//        [--url https://example.com/og-home.jpg] [--alt "Image description"]
//
// Needs Node 18+ and playwright-core, plus Google Chrome or Playwright's Chromium:
//   npm install --no-save playwright-core && npx playwright install chromium
//
// Exit codes: 0 clean, 3 warnings to fix before publishing, 1 error.

import { existsSync, statSync } from "node:fs";
import { resolve, extname } from "node:path";
import { pathToFileURL } from "node:url";

const WIDTH = 1200;
const HEIGHT = 630;
const SAFE_MARGIN = 40;
const MAX_BYTES = 1024 * 1024;

function parseArgs(argv) {
  const opts = { scale: 2, quality: 85, url: "", alt: "" };
  const positional = [];
  for (let i = 0; i < argv.length; i++) {
    const arg = argv[i];
    if (arg === "--scale") opts.scale = Number(argv[++i]);
    else if (arg === "--quality") opts.quality = Number(argv[++i]);
    else if (arg === "--url") opts.url = argv[++i] || "";
    else if (arg === "--alt") opts.alt = argv[++i] || "";
    else if (arg === "-h" || arg === "--help") opts.help = true;
    else positional.push(arg);
  }
  opts.input = positional[0];
  opts.output = positional[1];
  return opts;
}

async function launchBrowser() {
  let pw;
  try {
    pw = await import("playwright-core");
  } catch {
    console.error("playwright-core not found. Run: npm install --no-save playwright-core");
    process.exit(1);
  }
  const { chromium } = pw;
  const attempts = [];
  if (process.env.CHROME_PATH) attempts.push({ executablePath: process.env.CHROME_PATH });
  attempts.push({ channel: "chrome" }, {});
  for (const options of attempts) {
    try {
      return await chromium.launch(options);
    } catch {
      // try the next option
    }
  }
  console.error("No browser found. Install Google Chrome, set CHROME_PATH, or run: npx playwright install chromium");
  process.exit(1);
}

async function main() {
  const opts = parseArgs(process.argv.slice(2));
  if (opts.help || !opts.input) {
    console.log("Usage: node render-share-image.mjs <canvas.html> [out.jpg] [--scale 2] [--quality 85] [--url <absolute image url>] [--alt <text>]");
    process.exit(opts.help ? 0 : 1);
  }
  const input = resolve(opts.input);
  if (!existsSync(input)) {
    console.error(`File not found: ${input}`);
    process.exit(1);
  }
  const output = resolve(opts.output || input.replace(extname(input), ".jpg"));

  const browser = await launchBrowser();
  const page = await browser.newPage({
    viewport: { width: WIDTH, height: HEIGHT },
    deviceScaleFactor: opts.scale,
  });
  const failedRequests = [];
  page.on("requestfailed", (req) => failedRequests.push(req.url()));
  await page.goto(pathToFileURL(input).href, { waitUntil: "networkidle" });

  const findings = await page.evaluate(
    async ({ width, height, margin }) => {
      await document.fonts.ready;
      const out = [];
      const doc = document.documentElement;
      if (doc.scrollWidth > width || doc.scrollHeight > height) {
        out.push(`Content larger than the canvas (${doc.scrollWidth}x${doc.scrollHeight}).`);
      }
      const textNodes = [...document.body.querySelectorAll("*")].filter(
        (el) => !el.closest("[data-bleed]") && [...el.childNodes].some((n) => n.nodeType === 3 && n.textContent.trim())
      );
      for (const el of textNodes) {
        const r = el.getBoundingClientRect();
        if (r.width === 0 || r.height === 0) continue;
        const label = `"${el.textContent.trim().slice(0, 40)}"`;
        if (r.left < 0 || r.top < 0 || r.right > width || r.bottom > height) {
          out.push(`Text outside the canvas: ${label}.`);
        } else if (r.left < margin || r.top < margin || r.right > width - margin || r.bottom > height - margin) {
          out.push(`Text closer than ${margin}px to the edge: ${label}.`);
        }
        if (el.scrollWidth > el.clientWidth + 1 && getComputedStyle(el).overflow !== "visible") {
          out.push(`Text clipped inside its box: ${label}.`);
        }
      }
      const headline = document.querySelector('[data-role="headline"]') || document.querySelector("h1");
      if (headline) {
        const style = getComputedStyle(headline);
        const lineHeight = parseFloat(style.lineHeight) || parseFloat(style.fontSize) * 1.2;
        const lines = Math.round(headline.getBoundingClientRect().height / lineHeight);
        if (lines >= 3) out.push(`Headline wraps to ${lines} lines; keep it to two.`);
        const words = headline.textContent.trim().split(/\s+/).length;
        if (words > 8) out.push(`Headline has ${words} words; eight or fewer reads at thumbnail size.`);
      } else {
        out.push('No headline found (mark it with data-role="headline").');
      }
      for (const face of document.fonts) {
        if (face.status === "error") out.push(`Font failed to load: ${face.family}.`);
      }
      const usedFamily = getComputedStyle(headline || document.body).fontFamily.split(",")[0].replace(/["']/g, "").trim();
      const generic = ["serif", "sans-serif", "monospace", "system-ui", "cursive", "fantasy"];
      if (usedFamily && !generic.includes(usedFamily) && !document.fonts.check(`16px "${usedFamily}"`)) {
        out.push(`Font "${usedFamily}" is not available; the image would fall back to another font.`);
      }
      for (const img of document.images) {
        if (!img.complete || img.naturalWidth === 0) out.push(`Broken image: ${img.getAttribute("src")}.`);
      }
      return out;
    },
    { width: WIDTH, height: HEIGHT, margin: SAFE_MARGIN }
  );

  for (const url of failedRequests) findings.push(`Asset failed to load: ${url}.`);

  await page.screenshot({ path: output, type: "jpeg", quality: opts.quality, clip: { x: 0, y: 0, width: WIDTH, height: HEIGHT } });
  await browser.close();

  const bytes = statSync(output).size;
  if (bytes > MAX_BYTES) findings.push(`File has ${(bytes / 1024).toFixed(0)} KB; keep it under 1 MB (lower --quality).`);

  console.log(`Image: ${output} (${WIDTH * opts.scale}x${HEIGHT * opts.scale}, ${(bytes / 1024).toFixed(0)} KB)`);
  if (findings.length) {
    console.log("\nFix and render again:");
    for (const f of findings) console.log(`  WARN  ${f}`);
  } else {
    console.log("Checks: no warnings.");
  }

  const imageUrl = opts.url || "https://example.com/og-image.jpg";
  const alt = opts.alt || "Describe the image";
  console.log(`\nMeta tags:
<meta property="og:image" content="${imageUrl}">
<meta property="og:image:width" content="${WIDTH}">
<meta property="og:image:height" content="${HEIGHT}">
<meta property="og:image:alt" content="${alt}">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:image" content="${imageUrl}">`);
  if (!opts.url) console.log("(Replace the example URL with the image's absolute URL on your domain.)");

  process.exit(findings.length ? 3 : 0);
}

main().catch((err) => {
  console.error(err.message || err);
  process.exit(1);
});
