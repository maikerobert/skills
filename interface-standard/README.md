# Interface Standard

Five checks between the briefing and the screen the user sees: design from the subject instead of a template, adapt to the device and the input method, prove accessibility with evidence, keep motion short and useful, and deliver a ranked review the team can act on.

[![Download interface-standard.zip](https://img.shields.io/badge/download-interface--standard.zip-1f6feb?style=for-the-badge)](https://github.com/maikerobert/skills/releases/latest/download/interface-standard.zip)

## Why

Left alone, an AI agent produces the same screen every time: a template layout, a decorative gradient, three identical cards, an error message that apologizes and says nothing. It looks finished and it is generic. This standard makes the agent decide from the product and the user, and then prove the result.

## The five blocks

| Block | What it settles |
|---|---|
| 1. Design from the subject | Token plan, one bold element, hierarchy, type, interface copy, the AI clichés to avoid |
| 2. Adapt to the context | Mobile first, breakpoints from content, touch without hover, safe areas, no hidden content |
| 3. Accessibility by evidence | Keyboard, focus, native elements, labels, contrast, reduced motion; audit, fix, audit again |
| 4. Motion that serves | Under 300 ms, transform and opacity only, feedback on pointer-down, nothing blocks input |
| 5. Ranked review | Blocking, important, polish; what, why, fix; every finding names its rule; a landing page lens (first screen, one primary action, proof next to the claim) |

## Before and after

> A hero with a purple gradient, three cards with icons ("Fast", "Secure", "Seamless"), a "Get started" button, and on the phone the cards stack into a two-screen scroll.

> The screen opens with the one number the user came for, a single action named by what it does, the secondary content below the fold, 44 px targets, and a focus ring on every control. The review lists two blocking items with the fix for each.

## Install

[Download the .zip](https://github.com/maikerobert/skills/releases/latest/download/interface-standard.zip) and upload it in the Skills area of Claude or ChatGPT, or unzip it into `~/.claude/skills/` (Claude Code) or `~/.agents/skills/` (Codex). Then ask the agent to "review this screen", "make it responsive" or "check accessibility", or build a screen with the Brief to Production Standard and it runs on its own.

## Works with

- [Brief to Production Standard](../brief-to-production-standard/) runs it at the prototype stage and before the build is approved.
- [Web Launch Standard](../web-launch-standard/) keeps the launch QA on the public URL.
- [Portable Code Standard](../portable-code-standard/) for the code.

## Em português

Cinco verificações entre o briefing e a tela que o usuário vê: desenhar a partir do assunto e não de um template, adaptar ao aparelho e ao tipo de entrada, provar a acessibilidade com evidência, manter o movimento curto e útil, e entregar uma revisão ranqueada que o time consegue executar. Baixe o `.zip` pelo botão acima.

## Credits and license

MIT. By [Maike Robert](https://github.com/maikerobert). The method distills, in my own words, ideas from five open source skills: [frontend-design](https://github.com/anthropics/skills) by Anthropic, [accessibility](https://github.com/addyosmani/web-quality-skills) by Addy Osmani, [adapt](https://github.com/pbakaus/impeccable) by Paul Bakaus, [design-review](https://github.com/Superfuture/design-review) by Superfuture and [emil-design-eng](https://github.com/emilkowalski/skills) by Emil Kowalski. None of their text is reproduced. Part of the [Maike Robert skills collection](https://github.com/maikerobert/skills).
