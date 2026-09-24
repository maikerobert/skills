# Humanizer PT-BR

Removes the signs of AI writing from Brazilian Portuguese text and gives it a human voice. 26 patterns, with absolute bans on em dashes, "não é X, é Y" and chopped sentences.

[![Download humanizer-pt-br.zip](https://img.shields.io/badge/download-humanizer--pt--br.zip-1f6feb?style=for-the-badge)](https://github.com/maikerobert/skills/releases/latest/download/humanizer-pt-br.zip)

The instructions are in English, so anyone building for Brazil can use it. The text it reviews and writes is always Brazilian Portuguese.

## Before and after

> Lembrava da conclusão. Não fazia ideia de onde ela tinha vindo. Procurei no Notion. No Evernote. Nas Notas do celular.

> Lembrava da conclusão, mas não fazia ideia de onde ela tinha vindo. Procurei no Notion, no Evernote, nas notas do celular.

> Mais do que uma funcionalidade, o novo painel é um divisor de águas — reforçando nosso compromisso com a inovação.

> O novo painel mostra as vendas do dia em tempo real.

## What it catches

- **Staging instead of stating:** "não é X, é Y", punchlines at the end of each paragraph, almanac wisdom, announcement ramps.
- **Rhythm by rule:** forced triads, em dashes, stacked hedging, chopped sentences, passive voice that hides the actor.
- **Inflation:** AI vocabulary in Portuguese ("vale ressaltar", "no cenário atual", "alavancar"), inflated importance, advertising tone, borrowed authority.
- **Formatting and leftovers:** decorative bold, dressed-up headings, chatbot residue, guesses presented as facts.

It never invents facts, numbers or quotes to make a text sound more human, and it keeps the author's thesis. With an optional voice profile (`references/voice-template.md`), it rewrites in the author's own voice.

## Install

1. [Download the .zip](https://github.com/maikerobert/skills/releases/latest/download/humanizer-pt-br.zip).
2. **Claude app and Claude.ai:** upload it in the Skills area of the settings. **ChatGPT:** use "Create skill" on the Skills screen and upload it. **Claude Code:** unzip into `~/.claude/skills/`. **Codex:** unzip into `~/.agents/skills/` or install it from this folder's URL with the Skill Installer.
3. Ask: "humanize this text" or "tira a cara de IA deste texto".

## Em português

Tira a cara de IA de textos em português, com 26 padrões e vetos absolutos a travessão, a "não é X, é Y" e à frase picotada. Baixe o `.zip` pelo botão acima e envie na área de Skills do Claude ou do ChatGPT. Com um perfil de voz opcional, reescreve do jeito de quem assina.

## Credits and license

Built by [Maike Robert](https://github.com/maikerobert) on the open source skill [humanizer](https://github.com/blader/humanizer) by Siqi Chen (MIT), which draws on Wikipedia's "Signs of AI writing" guide. The patterns were rewritten for Brazilian Portuguese with original examples, plus pattern 26, the absolute rules, the voice profile and the delivery modes. Original license notice in [NOTICE.md](NOTICE.md). MIT License.

Part of the [Maike Robert skills collection](https://github.com/maikerobert/skills).
