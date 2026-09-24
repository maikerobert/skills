---
name: humanizer-pt-br
description: Reviews and rewrites Brazilian Portuguese text to remove the signs of AI writing and give it a human voice. Use before publishing or sending any text in Portuguese (articles, posts, emails, proposals, interface copy) or when the user asks to humanize a text, review it or "tirar a cara de IA".
---

# Humanizer PT-BR

By Maike Robert, built on the open source skill "humanizer" by Siqi Chen (github.com/blader/humanizer, MIT License), which draws on the "Signs of AI writing" guide from Wikipedia's WikiProject AI Cleanup. The original 25 patterns were rewritten for the equivalent tics of Brazilian Portuguese, with original examples, and this version adds pattern 26 (chopped sentences), the absolute rules, the author's voice profile and the delivery modes. The original license notice is in `NOTICE.md`.

The instructions are in English so anyone can use the skill; the text it reviews and produces is always Brazilian Portuguese. Examples are kept in Portuguese on purpose.

## Principle

A language model writes whatever is most likely to come next, so by default it picks what serves the largest number of readers and topics. A person chooses for one reader and one topic. Humanizing means putting that choice back into the text: cut what is generic, trade ornament for fact, and sound like someone who knows the subject up close and is explaining why it matters.

## Before you start

1. If `references/voice.md` exists, read it. It is the author's voice profile and overrides this skill when they conflict, except for the absolute rules below. `references/voice-template.md` shows how to build that profile.
2. Identify the register (institutional, educational, team communication, personal, strategic). The register defines what sounds natural.
3. Never invent facts, numbers, names or quotes to make the text "more human". Every statement that stays must be in the original or confirmed by the author.

## Absolute rules (always apply)

- **No em dashes** ("—" or "–") in the final text. Replace them with a comma, colon, period or parentheses. Heavy em dash use is one of the most recognizable marks of AI writing.
- **No "não é sobre X, é sobre Y"** and its variations ("não é X. É Y.", "mais do que X, é Y", "não se trata de X, mas de Y"). State Y directly.
- **No chopped sentences** (pattern 26): no run of fragments separated by periods to create dramatic rhythm.
- **No declared credentials** ("trabalho há 25 anos com..."). Authority shows through the scene, the example and the result, all of them true.

## The 26 patterns

Strong pattern: fix it every time it appears. Weak pattern: act only when several appear together, because in isolation they also occur in human writing.

### A. Staging instead of stating

1. **Not X, but Y** (strong). "Não é só a batida, é a agressividade." becomes "A batida pesada deixa a música agressiva." Includes "mais do que uma funcionalidade..." and "não se trata de...".
2. **Punchline at the end of the paragraph** (strong). A loose line that repeats what was already said ("E essa é a verdadeira vitória.", "Simples, mas poderoso."). Merge it into the previous sentence or cut it. Exception: the quotable closing line of the whole piece, one per text.
3. **Almanac wisdom** (strong). "No fundo", "em sua essência", "a linguagem da confiança", "o DNA da empresa". Replace with the concrete detail.
4. **Announcement ramp** (strong). "Vamos mergulhar nisso", "Sinceramente?", "Aqui vai a verdade:", "Vou te contar um segredo". Deliver without announcing. Exception: a real scene as a hook ("Hoje, numa reunião com um cliente...") is fine, because it carries information.
5. **Arguing with nobody** (medium). "Não estou dizendo que documentação não importa". If nobody objected, cut it.

### B. Rhythm by rule

6. **Forced triad** (weak). Three adjectives or three items because three sounds good. Keep only the ones that exist.
7. **Same opening in a row** (medium). Several sentences starting with "Isso", "Além disso", "É", "Com". Restructure or merge.
8. **Em dash** (absolute, see the rules above).
9. **Stacked hedging** (medium). "Pode ser que talvez possivelmente". Keep only the hedge the source supports. Conviction without hedging: "acredito que" instead of "talvez".
10. **Buzzword compound** (weak). "Orientado a dados", "centrado no cliente", "de ponta a ponta" in every sentence. Say what it means in this case.
11. **Passive voice that hides the actor** (medium). "Foi realizada a análise", "é feita a validação", "se observa". Use the active voice with the real subject: "O time analisou".
26. **Chopped sentences** (absolute). Short fragments in a row, separated by periods, to create suspense or a script-like rhythm. Signs: a verbless sentence after a period ("No Evernote."), a list broken into periods, three or more sentences of up to five words in a row. Example: "Lembrava da conclusão. Não fazia ideia de onde ela tinha vindo. Procurei no Notion. No Evernote. Nas Notas do celular." becomes "Lembrava da conclusão, mas não fazia ideia de onde ela tinha vindo. Procurei no Notion, no Evernote, nas notas do celular." Rule of thumb: lists use commas; linked ideas go in the same sentence with a comma or conjunction; an isolated short sentence only when it is a complete idea that deserves weight, at most one per paragraph.

### C. Inflation and borrowed authority

12. **AI vocabulary in Portuguese** (medium, strong when it piles up). "Além disso" opening a paragraph, "vale ressaltar", "é importante destacar", "no cenário atual", "em um mundo cada vez mais", "em constante evolução", "crucial", "fundamental", "robusto", "jornada", "ecossistema" (outside the technical sense), "alavancar", "desbloquear", "elevar", "mergulhar", "navegar desafios", "sinergia", "holístico", "em suma", "em resumo", "sem dúvida". Use the plain equivalent or cut. If the author's voice profile uses one of these words naturally, keep it.
13. **Inflated importance** (strong). "Marca um momento decisivo", "divisor de águas", "molda o futuro", "revolucionário", "transformador". State the fact; the reader decides whether it is big.
14. **Vague connection** (medium). "Relacionado a", "associado a", "no contexto de". Say how things connect, or admit the source does not say.
15. **Dangling gerund** (strong). "..., reforçando o compromisso com a inovação", "..., evidenciando o legado". Cut the tail or turn it into its own sentence with a source.
16. **Advertising tone** (strong). "Incrível", "imperdível", "de tirar o fôlego", "renomado", "game changer", "temos a satisfação de anunciar". Describe in plain language, with a number when there is one.
17. **Borrowed authority** (strong). "Especialistas afirmam", "estudos mostram", "segundo o mercado". Name the real source or cut the claim.
18. **Avoiding ser, ter and fazer** (medium). "Atua como", "se configura como", "conta com", "apresenta", "se destaca por", "visa". Use the simple verb: "é", "tem", "faz".

### D. Formatting by rule

19. **Decorative bold** (medium). A bold label on every item, bold that carries no information. Remove it; if it is a list of labels, turn it into prose. In articles, bold is very rare.
20. **Dressed-up headings** (medium). Emoji in headings, arrows, all caps, dividers. Sentence case headings without ornament. Emoji only sparingly and with a function in the body.
21. **Off-standard quotes and symbols** (weak). Curly quotes where the destination expects straight ones, stylized ellipses. Match the channel's format.

### E. Chat and draft leftovers

22. **Chatbot residue** (strong). "Espero que isso ajude", "Ótima pergunta!", "Fico à disposição para qualquer dúvida" in text that is not an email, "Claro!". Remove the wrapping, keep the content.
23. **Knowledge disclaimers and guesses** (strong). "Até onde sei", "provavelmente cresceu em...". Say what the source does not show; never present a guess as fact.
24. **Heading repeated in the first sentence** (medium). "Velocidade" followed by "A velocidade é importante." Cut the redundant opening.
25. **Talking about the replaced version** (medium). "Diferente da abordagem antiga, agora...". Describe what it is; changes belong in a changelog or where the comparison is the point of the text.

## What to put in their place

- The main point in the first two lines, or a question hook, or a real scene.
- Short or medium sentences, always complete and linked ("fizemos X, agora conseguimos Y, isso permite Z"). Short does not mean chopped: each sentence has a subject, a verb and a whole idea.
- A concrete example and a dated number before the theory.
- Controlled orality: "na prática", "com isso", "a ideia é simples".
- A closing with an invitation or a quotable line, never a generic conclusion.
- Final test: does it sound spoken out loud? Can you cut 20% without losing anything?

## How to deliver

- **Default (text pasted into the conversation):** return only the final version, ready to use. Then, in up to 5 lines, the main changes by pattern number (for example: "§1 two not-X-but-Y constructions; §26 three chopped passages; §8 three em dashes"). If something needs a content decision (a fact without a source, a number without a date), list it as a numbered question, never invent.
- **Audit mode (when asked to "just point out" or "evaluate"):** do not rewrite; list each passage, the pattern and the suggestion.
- **File mode (text in a file):** edit a copy and deliver a summary of the changes, keeping the original.
- Keep the meaning, numbers, names and structure the author chose. Humanizing cleans the form; the thesis stays the author's.
- Before delivering, reread your final text looking for em dashes, "não é X, é Y" and chopped sentences. If you find any, fix them. They are the most common mistakes of anyone who humanizes text.
