# Web Launch Standard

The checklist to run before any website, landing page or web app goes live: scope, technical SEO, images, social sharing, Google Analytics 4, accessibility, performance, forms, safe deploy and QA on the public URL. It first classifies the page as public, private or staging, so a dashboard never gets an Open Graph image or a Search Console entry.

[![Download web-launch-standard.zip](https://img.shields.io/badge/download-web--launch--standard.zip-1f6feb?style=for-the-badge)](https://github.com/maikerobert/skills/releases/latest/download/web-launch-standard.zip)

## Public or private first

| Profile | Examples | What changes |
|---|---|---|
| Public | Website, landing page, blog | Full checklist, including SEO, structured data, social sharing, sitemap and Search Console. |
| Private | Dashboard, logged-in area, admin | Search and sharing items are skipped; the page gets `noindex`, stays out of the sitemap and behind login. |
| Staging | Preview or test environment | Treated as private until promoted. |

## The 10 blocks

1. Scope and assumptions
2. Technical SEO (canonical, sitemap, robots, headings, language, duplicate content, honest JSON-LD, Search Console)
3. Images (names, compression, modern formats, dimensions, useful `alt`)
4. Sharing and icons (Open Graph 1200×630, X card, favicon, Apple touch icon, manifest, `theme-color`)
5. Analytics (single GA4 install, `snake_case` events, one main conversion)
6. Accessibility (keyboard, focus, contrast, labels, errors, `prefers-reduced-motion`)
7. Performance (mobile first, Core Web Vitals, fonts, third-party scripts, animations)
8. Forms (validation, states, duplicate submission protection, documented delivery)
9. Versioning and deploy (backup, permissions, rollback, no secrets)
10. Launch QA in production, the only point where a page can be called ready

## Check a live page

```bash
python3 scripts/check-page.py https://your-site.com/
python3 scripts/check-page.py https://app.your-site.com/ --private
```

```text
Sharing
  PASS  og:title
  PASS  og:image
  WARN  og:image declared as 1200x630 (?x?)
Crawling
  PASS  robots.txt (200)
  PASS  sitemap.xml (200)
0 failure(s), 1 warning(s).
```

Python 3 only, no extra packages. It covers the automatable part of block 10; keyboard use, share image quality and real conversions stay in the manual list.

## Install

[Download the .zip](https://github.com/maikerobert/skills/releases/latest/download/web-launch-standard.zip) and upload it in the Skills area of Claude or ChatGPT, or unzip it into `~/.claude/skills/` (Claude Code) or `~/.agents/skills/` (Codex). Then ask the agent to "launch" or "review" a page.

## Em português

O checklist para colocar qualquer site, landing page ou aplicação web no ar, em 10 blocos, do escopo ao QA na URL pública. Começa classificando a página como pública, privada ou de teste, porque um dashboard não precisa de imagem de compartilhamento nem de Search Console. Baixe o `.zip` pelo botão acima.

## License

MIT. By [Maike Robert](https://github.com/maikerobert). Part of the [Maike Robert skills collection](https://github.com/maikerobert/skills).
