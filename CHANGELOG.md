# Changelog

This project follows [semantic versioning](https://semver.org/).

## 1.1.0 (2026-09-29)

- **Humanizer PT-BR:** two-pass process (produce, then edit the way the author edits) plus a final pass by the author, based on a detector measurement of a real article; rules for pass 2 (second choice instead of the most likely word, one real detail per paragraph, do not smooth the author's marks, measure before repeating); editing marks as a section of the voice profile; a "Never add" list against stock personality; catalog expanded from 26 to 46 patterns with strength levels and P0 to P2 priorities, drawing also on avoid-ai-writing by Conor Bronsdon (MIT, notice added to `NOTICE.md`). Patterns were renumbered: em dash is now 14, AI vocabulary 24.

## 1.0.1 (2026-09-24)

- Each skill folder now has its own README with a before and after example, install steps and a download button, so a skill can be shared on its own.

## 1.0.0 (2026-09-24)

- **Portable Code Standard:** 6 rules (neutral authorship, platform independence, secrets out of the code, English in the code, clean repository and automated checks), a portability check script, `pre-commit` and `commit-msg` hooks, an optional GitHub Actions workflow and an `AGENTS.md` block.
- **Web Launch Standard:** page profile (public, private or staging) and 10 launch blocks, from scope to QA in production, including Search Console, plus a Python check for live pages.
- **Humanizer PT-BR:** 26 patterns of AI writing in Brazilian Portuguese, absolute rules, an optional voice profile and delivery modes.
