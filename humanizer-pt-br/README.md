# Humanizer PT-BR

Removes the signs of AI writing from Brazilian Portuguese text and gives it a human voice. 46 patterns, absolute bans on em dashes, "não é X, é Y" and chopped sentences, and a two-pass process that ends with the author's own hand.

[![Download humanizer-pt-br.zip](https://img.shields.io/badge/download-humanizer--pt--br.zip-1f6feb?style=for-the-badge)](https://github.com/maikerobert/skills/releases/latest/download/humanizer-pt-br.zip)

The instructions are in English, so anyone building for Brazil can use it. The text it reviews and writes is always Brazilian Portuguese.

## Before and after

> Lembrava da conclusão. Não fazia ideia de onde ela tinha vindo. Procurei no Notion. No Evernote. Nas Notas do celular.

> Lembrava da conclusão, mas não fazia ideia de onde ela tinha vindo. Procurei no Notion, no Evernote, nas notas do celular.

> Mais do que uma funcionalidade, o novo painel é um divisor de águas — reforçando nosso compromisso com a inovação.

> O novo painel mostra as vendas do dia em tempo real.

## Why two passes

A detector measures, word by word, how predictable the next word is. An AI imitating a person still picks the most likely word, so rules alone do not fix it. On a real article measured in September 2026, the text written by AI with every rule scored 61% AI. Two AI editing passes brought it down by 4 points and then 1. The author's own edits, sometimes just one or two words per sentence, brought it down by 28 points and then 12, to 16%.

So the skill writes (pass 1), edits the way the author edits, trading the most likely words for less likely ones (pass 2), and hands back a list of the blocks the author should still touch by hand (pass 3).

## What it catches

- **Staging instead of stating:** "não é X, é Y", punchlines at the end of each paragraph, aphorism formulas, announcement ramps, performed insight, an invented crowd to argue against.
- **Rhythm by rule:** forced triads, em dashes, stacked hedging, chopped sentences, chains of negations, metronome rhythm.
- **Inflation:** AI vocabulary in Portuguese ("vale ressaltar", "no cenário atual", "alavancar"), inflated importance, dangling gerunds, advertising tone, borrowed authority.
- **Formatting and leftovers:** decorative bold, dressed-up headings, bare noun lists, chatbot residue, guesses and placeholders, fake-casual feed posts.

It never invents facts, numbers, stories or quotes to make a text sound more human, never installs a stock personality, and keeps the author's thesis. With an optional voice profile (`references/voice-template.md`), including the marks the author leaves when editing, it rewrites in the author's own voice.

## Install

1. [Download the .zip](https://github.com/maikerobert/skills/releases/latest/download/humanizer-pt-br.zip).
2. **Claude app and Claude.ai:** upload it in the Skills area of the settings. **ChatGPT:** use "Create skill" on the Skills screen and upload it. **Claude Code:** unzip into `~/.claude/skills/`. **Codex:** unzip into `~/.agents/skills/` or install it from this folder's URL with the Skill Installer.
3. Ask: "humanize this text" or "tira a cara de IA deste texto".

## Em português

Tira a cara de IA de textos em português, com 46 padrões e vetos absolutos a travessão, a "não é X, é Y" e à frase picotada. Trabalha em duas passadas, escrever e depois editar do jeito que o autor edita, e termina com a lista dos trechos que o autor ainda precisa mexer com a própria mão, porque na medição foi essa a etapa que mais tirou a cara de IA. Baixe o `.zip` pelo botão acima e envie na área de Skills do Claude ou do ChatGPT. Com um perfil de voz opcional, reescreve do jeito de quem assina.

## Credits and license

Built by [Maike Robert](https://github.com/maikerobert) on two open source skills: [humanizer](https://github.com/blader/humanizer) by Siqi Chen (MIT), which draws on Wikipedia's "Signs of AI writing" guide, and [avoid-ai-writing](https://github.com/conorbronsdon/avoid-ai-writing) by Conor Bronsdon (MIT). The patterns were rewritten for Brazilian Portuguese with original examples, plus pattern 26, the absolute rules, the two-pass process, the editing marks, the voice profile and the delivery modes. Original license notices in [NOTICE.md](NOTICE.md). MIT License.

Part of the [Maike Robert skills collection](https://github.com/maikerobert/skills).
