# Brief to Production Standard

Takes a screen, page or feature from the briefing to production, with a decision gate at every stage: briefing and assumptions, design system first, a quick HTML prototype to validate understanding, the build in the project's stack, a pull request on the agreed branch, and launch.

[![Download brief-to-production-standard.zip](https://img.shields.io/badge/download-brief--to--production--standard.zip-1f6feb?style=for-the-badge)](https://github.com/maikerobert/skills/releases/latest/download/brief-to-production-standard.zip)

## Why

The most expensive mistake when building with an AI agent is building the wrong thing well. This standard puts understanding first: the agent summarizes the briefing, makes sure a design system exists, shows a prototype you can open on your phone, and only then writes production code.

## The flow

| Stage | What happens | Gate |
|---|---|---|
| 1. Briefing | Context, rules, goals and references become a one-screen summary with assumptions and open questions | With gate 1 |
| 2. Design system | Reuse the project's design system, or create a minimum one before any screen | Gate 1 |
| 3. Prototype | Quick HTML prototype inside the design system, designed from the subject and mobile first (Interface Standard), with real copy reviewed by the Humanizer | Gate 2 |
| 4. Build | The approved prototype rebuilt in the project's stack, following the Portable Code Standard, checked for accessibility and motion and delivered with a ranked review (Interface Standard) | Gate 3 |
| 5. Git | Commits on the agreed branch and a pull request, never straight to main | After gate 3 |
| 6. Production | Launch with the Web Launch Standard, only when requested | Gate 4 |

At every gate the agent shows the result, lists the decisions as numbered questions with a recommended answer, and waits.

## Works with

Each works on its own; together they cover the whole path.

- [Interface Standard](../interface-standard/) at the prototype and before the build is approved.
- [Portable Code Standard](../portable-code-standard/) for the build and the commits.
- [Web Launch Standard](../web-launch-standard/) for the launch.
- [Humanizer PT-BR](../humanizer-pt-br/) for Portuguese copy.

## Install

[Download the .zip](https://github.com/maikerobert/skills/releases/latest/download/brief-to-production-standard.zip) and upload it in the Skills area of Claude or ChatGPT, or unzip it into `~/.claude/skills/` (Claude Code) or `~/.agents/skills/` (Codex). Then describe what you want to build, or paste the notes from the meeting.

## Em português

Leva uma tela, página ou funcionalidade do briefing até a produção, com uma aprovação sua em cada etapa: resumo do briefing, design system antes de tudo, protótipo em HTML para validar o entendimento, a tela na stack do projeto, pull request na branch combinada e, quando for o caso, o lançamento. Baixe o `.zip` pelo botão acima.

## License

MIT. By [Maike Robert](https://github.com/maikerobert). Part of the [Maike Robert skills collection](https://github.com/maikerobert/skills).
