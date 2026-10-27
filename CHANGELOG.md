# Changelog

This project follows [semantic versioning](https://semver.org/).

## 1.5.0 (2026-10-27)

- **Landing Page Standard** (new): ten blocks worked in order (buyer and awareness stage, first screen, proof at least as strong as the promise, objections in order, calls to action, pricing, signup flow, visual, speed, measurement), with a gate on the message architecture before any design and a review mode with ranked findings.
- **Brief to Production Standard:** points to the Landing Page Standard when the screen is a landing page.

## 1.4.0 (2026-10-27)

- **Web Launch Standard:** new "Share image" section: the image is written as an HTML canvas in the brand's colors and font (`assets/share-template.html`) and rendered by `scripts/render-share-image.mjs`, which saves a 2400×1260 JPG, warns about text outside the canvas or near the edges, long headlines, missing fonts or images and heavy files, and prints the Open Graph and X tags. Block 4 now asks to generate the image instead of reusing a logo or a cropped screenshot.
- **Interface Standard:** the ranked review now requires every finding to name the rule it breaks and to recheck severity when more than two findings are blocking, plus a landing page lens (first screen, one primary action, proof next to the claim, objections by section, the page on a 390 px phone).
- **Brief to Production Standard:** stage 2 extracts the design system from the live site into a `DESIGN.md` when it exists but is not documented; stage 3 explores three to five directions side by side when the direction is open, before building the prototype.

## 1.3.0 (2026-10-10)

- **Brief to Production Standard** (new): briefing summary with assumptions, design system first, quick HTML prototype to validate understanding, build in the project's stack, pull request on the agreed branch, and launch, with a decision gate at every stage.
- **Interface Standard** (new): design from the subject, adapt to the context, accessibility by evidence, motion that serves, and a ranked review. Works alone and inside the Brief to Production Standard. Credits to five open source skills in the README.
- The release now also ships `maikerobert-skills.zip` with the whole collection.

## 1.2.0 (2026-10-08)

- **Humanizer PT-BR:** new pass 2b, swap words: one or two words per sentence in about half the sentences, second or third natural option in Portuguese, nothing else touched, delivered as a numbered list for the author to veto. Measured on a real article: 98% AI after production, 95% after pass 2 (restructuring), 88% after the word-swap pass alone, 2% after the author's own pass. Eight new editing marks observed in that author's pass (splitting instead of merging, "etc…", operational detail, looser register, complicit parenthesis, one-sentence law, digits, block quotes). Delivery now ends by comparing the author's version with the AI version to record new marks.

## 1.1.0 (2026-09-29)

- **Humanizer PT-BR:** two-pass process (produce, then edit the way the author edits) plus a final pass by the author, based on a detector measurement of a real article; rules for pass 2 (second choice instead of the most likely word, one real detail per paragraph, do not smooth the author's marks, measure before repeating); editing marks as a section of the voice profile; a "Never add" list against stock personality; catalog expanded from 26 to 46 patterns with strength levels and P0 to P2 priorities, drawing also on avoid-ai-writing by Conor Bronsdon (MIT, notice added to `NOTICE.md`). Patterns were renumbered: em dash is now 14, AI vocabulary 24.

## 1.0.1 (2026-09-24)

- Each skill folder now has its own README with a before and after example, install steps and a download button, so a skill can be shared on its own.

## 1.0.0 (2026-09-24)

- **Portable Code Standard:** 6 rules (neutral authorship, platform independence, secrets out of the code, English in the code, clean repository and automated checks), a portability check script, `pre-commit` and `commit-msg` hooks, an optional GitHub Actions workflow and an `AGENTS.md` block.
- **Web Launch Standard:** page profile (public, private or staging) and 10 launch blocks, from scope to QA in production, including Search Console, plus a Python check for live pages.
- **Humanizer PT-BR:** 26 patterns of AI writing in Brazilian Portuguese, absolute rules, an optional voice profile and delivery modes.
