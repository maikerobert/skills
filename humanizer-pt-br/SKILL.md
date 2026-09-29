---
name: humanizer-pt-br
description: Reviews and rewrites Brazilian Portuguese text to remove the signs of AI writing and give it a human voice, in two passes (produce, then edit the way the author edits, trading the most likely words for less likely ones) plus a final pass by the author. Use before publishing or sending any text in Portuguese (articles, posts, emails, proposals, interface copy) or when the user asks to humanize, review, audit or "tirar a cara de IA".
---

# Humanizer PT-BR

By Maike Robert, built on two open source skills: "humanizer" by Siqi Chen (github.com/blader/humanizer, MIT License), which draws on the "Signs of AI writing" guide from Wikipedia's WikiProject AI Cleanup, and "avoid-ai-writing" by Conor Bronsdon (github.com/conorbronsdon/avoid-ai-writing, MIT License), which expands the catalog. The patterns were rewritten for the equivalent tics of Brazilian Portuguese, with original examples. This version adds the chopped sentence pattern (26), the absolute rules, the two-pass process measured on a real article, the author's editing marks, the voice profile and the delivery modes. Patterns that only exist in chat, in English or in code documentation were left out. The original license notices are in `NOTICE.md`.

The instructions are in English so anyone can use the skill; the text it reviews and produces is always Brazilian Portuguese. Examples are kept in Portuguese on purpose.

## What this skill is

A writing quality tool for human readers. Its two-pass process also lowers what statistical detectors (Pangram, GPTZero, the Substack meter) read as machine text, but the goal is the reader.

The process comes from a measurement on a real article by the author, in September 2026. Text produced by AI following every rule scored 61% AI. After the author edited half of it by hand, 33%. After the AI applied the author's editing marks to the other half, 29%, and after a heavier second AI pass on the same blocks, 28%. After the author swapped one or two words per sentence in those blocks, 16%.

The rule that follows: text produced in one go, even with good rules, is still statistically machine text. The AI pass imitating the author gains little (4 points, then 1). The author's pass, even a small one, gains a lot (28 points, then 12). So the skill works in two passes and always ends with the author's hand.

## Why the AI pass gains little, and what to do about it

A detector does not measure structure or rhythm first. It measures, word by word, how predictable the next word is. An AI imitating a human still picks the most likely word at each position, because that is how it generates text, so the result is still a sequence of likely words. A person does the opposite without thinking: "A propósito" instead of "Aliás", "mudaram totalmente" instead of "mudaram todas", a sentence left slightly crooked, "Mas.." with two dots. Each of those choices is a point where the detector expected something else. One word swapped per sentence is worth more than a paragraph rewritten by rule.

Rules for pass 2:

- **Second choice, never the first.** In each edited sentence, trade at least one word for the second or third natural option in Portuguese, from the author's vocabulary when there is a voice profile. "A propósito" and not "Aliás"; "totalmente" and not "todas"; "ferramenta nenhuma" and not "nenhuma ferramenta". If the first word that comes to mind is the most likely one, drop it.
- **One detail the context did not ask for, per paragraph.** A place ("no Brasil"), a memory ("lembro que li"), an expanded acronym. Only details from the author's world: the original text, the voice profile, the author's stories or things the author said. Never invented.
- **Do not smooth.** A crooked sentence, spoken redundancy, "Mas..", an emoticon or a spaced hyphen (" - ", which is not an em dash) that the author wrote stay. Never "fix" them in an audit, and never add them in a larger dose than the author uses.
- **Measure, do not assume.** When a detector is available, measure before and after each pass and write the numbers down. An AI pass that does not move the number should not be repeated; the rest belongs to the author.

## Two-pass process (required for text to be published)

**Pass 1, produce.** Write with the rules of this skill and the voice profile. Do not try to "sound human" here; try to be right, clear and in the agreed structure.

**Pass 2, edit the way the author edits.** Reread as an editor, not as the writer, and apply the author's editing marks unevenly: in about 30% to 40% of sentences, never in all of them, and never the same mark in consecutive sentences. Uniform application becomes a new fingerprint. Prefer the cleanest sentences and the paragraphs that end with a perfect landing. Do not rewrite whole paragraphs; change punctuation, connectors, order, a word here and there. Flag the paragraphs that are still 100% AI (definitions, sourced data, the closing), because those are the ones the author needs to touch.

**Pass 3, the author's.** Deliver the text saying which blocks the author should edit by hand before publishing, in order of priority. If the author prefers to talk, ask for an audio note and transcribe it without polishing. When a detector is available, ask for the number before and after; the realistic goal for text with structure and links is under 20% AI, not zero.

## The author's editing marks

The best source of marks is a comparison, block by block, between an AI draft and what the author wrote over it. Record them in the voice profile (`references/voice.md`, section "Editing marks"). In pass 2 they are the repertoire; in an audit they are never errors.

Without a profile, use only the marks that are common in careful Brazilian Portuguese and do not invent a personality:

1. **A comma linking ideas where AI puts a period.** "Com o cliente é igual, em todo negócio existe uma trilha." Longer sentences linked by commas are the mark most opposed to what AI produces.
2. **Conversational connectors.** "Afinal de contas", "podemos dizer que", "por exemplo", "uma vez que". AI cuts them as fat; people use them to breathe.
3. **Less categorical claims.** "Um exemplo famoso" instead of "o exemplo mais famoso". AI writes with total certainty; people leave some slack.
4. **A colon that stops to explain,** not the one that opens a list.
5. **A numbered list when there are real alternatives,** instead of "A primeira... A segunda..." in prose.
6. **A metaphor as the hook and the literal version as the explanation.** The metaphor opens, the next sentence translates it.
7. **Jargon translated inside the sentence.** "O ICP (perfil de cliente ideal)", "distrato (o cancelamento do contrato, pra quem não é do mercado)".
8. **The less obvious synonym,** one word per sentence, chosen against the first option.
9. **Cutting AI exaggeration.** Real voices exaggerate less than AI imagines when it tries to "add personality".

Dose in pass 2: marks 1, 3 and 8 can appear several times; the others once or twice per text; 9 is an audit rule. Marks the AI must never imitate even when they are the author's: typos, a character's name switched mid-text, double spaces. Point them out in an audit without fixing them on your own.

## Principle

A language model writes whatever is most likely to come next, so by default it picks what serves the largest number of readers and topics. A person chooses for one reader and one topic. Humanizing means putting that choice back into the text: cut what is generic, trade ornament for fact, and sound like someone who knows the subject up close and is explaining why it matters. Cutting is half the job; the other half is keeping the author's cadence, opinions and quirks.

## Before you start

1. If `references/voice.md` exists, read it. It is the author's voice profile and overrides this skill when they conflict, except for the absolute rules below. `references/voice-template.md` shows how to build it.
2. Identify the register (institutional, educational, team communication, personal, strategic) and the channel (article, feed post, email, proposal, interface). Together they define what is natural and what is a tic.
3. Never invent facts, numbers, names, stories or quotes to make the text "more human". Every statement that stays must be in the original, in the voice profile or confirmed by the author.

## Absolute rules (always apply)

- **No em dashes** ("—" or "–") in the final text. Replace them with a comma, colon, period or parentheses. A spaced hyphen (" - ") typed by the author is not an em dash and stays.
- **No "não é sobre X, é sobre Y"** and its variations ("não é X. É Y.", "mais do que X, é Y", "não se trata de X, mas de Y"). State Y directly.
- **No chopped sentences** (pattern 26): no run of fragments separated by periods to create dramatic rhythm.
- **No declared credentials** ("trabalho há 25 anos com..."). Authority shows through the scene, the example and the result, all of them true.

## Never add (rules for whoever rewrites)

Giving a text its voice back has a known failure mode: the model installs a stock personality the author does not have, and trades one tic for a louder one. Nothing below may be **added** to a text that did not have it. Each item is a rewriting failure, even when the result "passes clean":

- **Invented experience.** "Já vi isso cem vezes", "na minha experiência", "confesso que" without support in the original or the voice profile. Flag the gap for the author instead of filling it.
- **Manufactured stakes.** "Num mundo em que", "agora mais do que nunca", "nunca foi tão importante".
- **Forced contrarianism.** "Todo mundo diz X, mas está errado" when the original did not argue that.
- **Staged candor.** "Vamos ser sinceros", "papo reto", "olha só" as an opening for effect.
- **Staccato conversion.** Chopping normal sentences into fragments to fake rhythm. Vary length by varying the sentences, not by breaking them.
- **Invented detail.** A number, name, date, tool or mechanism without support. A false detail is worse than the vague sentence it replaced.
- **Personality in the wrong dose.** The traits in the voice profile have a dose. Going past it becomes caricature.

The test: for each edit, ask whether the information and the stance came from the original, the voice profile or the author. Cutting and sharpening are in scope; adding is not.

## The 46 patterns

Strong pattern: fix it every time it appears. Medium pattern: fix it when the context confirms. Weak pattern: act only when several appear together, because in isolation they also occur in human writing. No pattern applies to a mark recorded in the author's voice profile.

### A. Staging instead of stating

1. **Not X, but Y** (absolute). "Não é só a batida, é a agressividade." becomes "A batida pesada deixa a música agressiva." Includes "mais do que uma funcionalidade..." and "não se trata de...".
2. **Punchline at the end of the paragraph** (strong). A loose line that repeats what was already said ("E essa é a verdadeira vitória.", "Simples, mas poderoso."). Merge it into the previous sentence or cut it. Exception: the quotable closing line of the whole piece, one per text.
3. **Almanac wisdom and aphorism formulas** (strong). "No fundo", "em sua essência", "X é a linguagem de Y", "X é a moeda de Z", "a arquitetura da confiança", "o DNA da empresa". The formula turns a specific observation into a general law without adding precision. Replace it with the concrete claim it hints at. One short law-like line of the author's own per text is an exception.
4. **Announcement ramp and infomercial hook** (strong). "Vamos mergulhar nisso", "Sinceramente?", "Aqui vai a verdade:", "Vou te contar um segredo", "O detalhe?", "E o melhor?", "Plot twist:", "Olha,". Deliver without announcing. Exception: a real scene as a hook ("Hoje, numa reunião com um cliente...") is fine, because it carries information.
5. **Arguing with nobody and false concession** (medium). "Não estou dizendo que documentação não importa", "Embora X seja impressionante, Y continua um desafio". If nobody objected, cut it. If the concession is vague on both sides, cut the frame and keep both claims.
6. **Performed insight** (strong). "Para um minuto e pensa nisso", "não é pouca coisa", "você já sabe a resposta", "esse é o ponto", "é isso que ninguém fala", "a única métrica que importa", "acontece que". Each one announces depth without delivering a fact. One can be style; several in the same text is a tic.
7. **Stock reaction and lingering attention** (medium). "O que mais me surpreendeu", "a parte mais interessante", "não consigo parar de pensar nisso", "a frase que fica". Keep a real, specific reaction ("me surpreendeu porque esperava X"); cut the empty frame.
8. **Self-labeling** (medium). After a list, pointing at one item and labeling it: "esse último é o contraintuitivo", "aqui é que fica interessante". If the item is good, the reader notices. Cut the label.
9. **Dramatized contrast against the crowd** (strong). "Enquanto todo mundo ainda debatia", "a decisão que a maioria dos líderes não tem coragem de tomar", "o que ninguém te conta". The crowd is invented, so the contrast costs nothing. State the fact; name the other side only if the original names it.
10. **Novelty inflation and invented labels** (medium). "Cunhou o termo", "um problema que ninguém está nomeando", or a concept named mid-sentence and never defined ("o paradoxo da supervisão"). Describe the mechanism; naming is not explaining. The author's own coined terms, defined in the voice profile and reused, are an exception.
11. **Speculative scenario and false range** (weak). "Imagine um mundo em que...", "do Big Bang às startups". Cut the scene and keep the claim; list the real topics.

### B. Rhythm by rule

12. **Forced triad and a colon for the triad** (weak). Three adjectives or three items because three sounds good; a colon opening exactly three items separated by commas. Keep the ones that exist, whether two or four.
13. **Same opening and same skeleton** (medium). Three sentences in a row starting with the same word ("Talvez... Talvez... Talvez...") or built on the same mold ("Um carrinho é um objeto do sistema. Uma sala é um objeto do sistema."). Deliberate anaphora is a device; a run that does not persuade is a tic.
14. **Em dash** (absolute, see the rules above).
15. **Stacked hedging** (medium). "Pode ser que talvez possivelmente", "poderia potencialmente", "pode eventualmente". Keep only the hedge the source supports. Conviction without hedging: "acredito que" instead of "talvez".
16. **Empty parenthetical hedge** (medium). "(e, cada vez mais, Z)", "(ou, mais precisamente, Y)", "(e talvez mais importante, W)". If it matters, it gets its own sentence; if not, cut it. Different from an aside that carries the author's opinion or joke.
17. **Buzzword compound** (weak). "Orientado a dados", "centrado no cliente", "de ponta a ponta" in every sentence. Say what it means in this case.
18. **Passive voice that hides the actor, and false agency** (medium). "Foi realizada a análise", "a decisão surgiu depois do offsite". Use the active voice with the real subject: "O time analisou", "A diretoria decidiu". Name only who the original names.
19. **Contrast on a dangling auxiliary** (weak). "A ferramenta morreu; os dados, não." One per text is style; repeated, it is a machine signature. Write the second contrast in full.
20. **Chain of negations** (medium). "Sem enrolação, sem filtro, sem jargão", "Não pediu. Não esperou.", "Não chame de pivô. Chame de correção." The chain stages a decision. Say what the thing is; one negation is fine when the reader would assume the opposite.
21. **Repeated twist** (weak). Two or more setup-and-reversal moves in the same text ("Planejamos todas as falhas. Menos a que aconteceu.") standing in for the explanation. Keep the claim, cut the empty surprise; if the explanation is missing, ask the author.
22. **Rhetorical transition question and stacked questions** (medium). "Mas o que isso significa pra você?", "E agora?", or three questions in a row. One question earns its place when the setup is strong. A dialogue with oneself ("Tá, mas como achar isso no seu negócio?") is fine once per section.
23. **Metronome rhythm** (medium, judged on the whole). Sentences of the same length, paragraphs of the same length, every paragraph opening the same way. Read-aloud test: if a screen reader would read it without sounding odd, it is too uniform. Fix it by clarifying and merging, never by chopping.
26. **Chopped sentences** (absolute). Short fragments in a row, separated by periods, to create suspense or a script-like rhythm. Signs: a verbless sentence after a period ("No Evernote."), a list broken into periods, three or more sentences of up to five words in a row. Example: "Lembrava da conclusão. Não fazia ideia de onde ela tinha vindo. Procurei no Notion. No Evernote. Nas Notas do celular." becomes "Lembrava da conclusão, mas não fazia ideia de onde ela tinha vindo. Procurei no Notion, no Evernote, nas notas do celular." Rule of thumb: lists use commas; linked ideas go in the same sentence; an isolated short sentence only when it is a complete idea that deserves weight, at most one per paragraph.

### C. Inflation and borrowed authority

24. **AI vocabulary in Portuguese** (medium, strong when it piles up). "Além disso" opening a paragraph, "vale ressaltar", "é importante destacar", "no cenário atual", "em um mundo cada vez mais", "em constante evolução", "crucial", "fundamental", "robusto", "jornada", "ecossistema" (outside the technical sense), "alavancar", "desbloquear", "elevar", "mergulhar", "navegar desafios", "sinergia", "holístico", "em suma", "em resumo", "sem dúvida", "impulsionar", "potencial transformador". Use the plain equivalent or cut. If the voice profile uses one of these words naturally, keep it.
25. **Inflated importance** (strong). "Marca um momento decisivo", "divisor de águas", "molda o futuro", "revolucionário", "transformador". State the fact; the reader decides whether it is big.
27. **Vague connection and the transformation crutch** (medium). "Relacionado a", "associado a", "no contexto de"; "a preocupação vira pânico", "o risco se torna real" without saying what changed. Say how things connect and what changed, or admit the source does not say.
28. **Dangling gerund and gerund analysis** (strong). "..., reforçando o compromisso com a inovação", "..., evidenciando o legado", "simbolizando, refletindo, mostrando". Cut the tail or turn it into its own sentence with a source. It also applies without a gerund: "isso representa uma mudança maior", "fala de uma tendência do setor".
29. **Advertising tone and brochure language** (strong). "Incrível", "imperdível", "de tirar o fôlego", "renomado", "game changer", "temos a satisfação de anunciar", "um hub vibrante de inovação", "Conheça o X, seu novo melhor amigo". Describe in plain language, with a number when there is one.
30. **Borrowed, vague or stacked authority** (strong). "Especialistas afirmam", "estudos mostram", "segundo o mercado", "testes independentes confirmam"; or a stack of names ("citado na Folha, no Estadão, na Exame") without saying why it matters; or a stack of historical analogies ("como a imprensa, o telégrafo e a internet"). Name the real source, with a link, or cut. One reference doing analytical work is worth more than four names.
31. **Avoiding ser, ter and fazer** (medium). "Atua como", "se configura como", "conta com", "apresenta", "se destaca por", "visa", "representa". Use the simple verb: "é", "tem", "faz".
32. **"Real / verdadeiro / genuíno" without a contrast** (weak). "Verdadeira utilidade", "genuína conexão" imply the rest is fake without saying what. If the contrast is named ("receita de cliente pagante, não de subsídio"), it stays; if not, cut the adjective.
33. **Moral adjective on a thing** (weak). "Um número honesto", "uma curva sincera". Things have no morals. Say the real property ("realista", "mais claro") or cut.
34. **Confidence calibration and "isso importa porque"** (medium, by density). "Vale notar", "curiosamente", "importante:", "certamente", "sem dúvida", "a verdade é que", "a pergunta real é", "no fundo". One "curiosamente" in 2,000 words passes; three in 500 is piling up. "Isso importa porque" stays only when a concrete consequence follows ("porque cobra o cliente duas vezes"), never when it repeats the importance.
35. **Generic conclusion and future closing** (strong). "O futuro é promissor", "só o tempo dirá", "pode se tornar uma das narrativas mais importantes da década". Cut. A good closing is an invitation or a quotable line with content.

### D. Formatting and structure by rule

36. **Decorative bold** (medium). A bold label on every item, bold that carries no information. Remove it; if it is a list of labels, turn it into prose. In articles, bold is very rare.
37. **Dressed-up or generic headings** (medium). Emoji in headings, arrows, all caps, dividers; scaffolding headings ("Introdução", "Conclusão", "Pontos principais"); a heading followed by a warm-up line that repeats it. Sentence case headings with a subject, and the text starts directly.
38. **Bare noun lists and excess structure** (medium). Five or more short verbless items ("Alta performance / Integração fácil / Suporte dedicado"), more than three headings in 300 words, or a "5 coisas que" list when the content has no five parts. Turn it into prose with verifiable claims or reduce it to what exists.
39. **Off-standard quotes and symbols** (weak). Curly quotes where the destination expects straight ones, stylized ellipses. Match the channel's format.
40. **Shuffle immunity** (whole-text test). If two paragraphs can swap places without breaking the text, it is a list of points, not an argument. Flag it; reorder only if the author asks for a structural edit.
41. **Treadmill effect** (whole-text test). A paragraph that restates the premise in new words instead of moving forward. If you can cut 40% without losing information, cut.

### E. Chat, draft and social media leftovers

42. **Chatbot residue and sycophantic tone** (strong). "Espero que isso ajude", "Ótima pergunta!", "Fico à disposição" outside an email, "Claro!", "Neste artigo vamos explorar", "Vamos lá!", "Você está absolutamente certo". Remove the wrapping, keep the content.
43. **Knowledge disclaimers, guesses and placeholders** (strong). "Até onde sei", "provavelmente cresceu em...", "[inserir fonte]", "citeturn0search0", links with `utm_source=chatgpt.com`. Say what the source does not show; never present a guess as fact; clean every tool mark.
44. **Heading repeated in the first sentence, and recaps** (medium). "Velocidade" followed by "A velocidade é importante."; a section that opens by summarizing the previous one. Cut the redundant opening.
45. **Talking about the replaced version** (medium). "Diferente da abordagem antiga, agora...". Describe what it is; changes belong in a changelog or where the comparison is the point of the text.
46. **Fake-casual register and endorsement closing** (strong in feed posts). "Pro tip", "hot take", "fun fact", "(sim, sério)", "*checks notes*", self-question and answer ("É rápido? É. É barato? Também."), closings like "Vale a leitura:", "Salva esse post", "Depois me agradece", a block of six hashtags. Remove the prop and keep the observation. Hashtags: up to five, specific, only where the platform uses them.

## What to put in their place

- The main point in the first two lines, or a question hook, or a real scene.
- Medium and long sentences linked by commas, always complete, chained as "fizemos X, agora conseguimos Y, isso permite Z". A short sentence on its own is rare; a chopped one, never.
- A concrete example and a dated number before the theory.
- Controlled orality: "na prática", "com isso", "a ideia é simples", a dialogue with oneself, an aside in parentheses.
- A closing with an invitation or a quotable line, never a generic conclusion.
- Final test: does it sound spoken out loud? Can you cut 20% without losing anything?

When there is a voice profile, put the author's personality back in the dose the profile gives (asides, parallels, jokes, coined terms, the recommended book). Use only what the author told or what is in the profile.

## Priority when time is short

- **P0 (credibility):** 42 chatbot residue, 43 guesses and placeholders, 30 vague authority, 25 inflated importance, and the absolute rules (1, 14, 26).
- **P1 (obvious AI smell):** 24 vocabulary, 3 aphorism, 4 ramp and hook, 6 performed insight, 9 invented crowd, 35 generic conclusion, 46 fake-casual, 28 gerund, 12 triad.
- **P2 (polish):** 13, 15, 16, 19, 20, 21, 22, 23, 31, 32, 33, 34, 36 to 41.

A quick pass covers P0 and P1. A full audit covers all three.

## How to deliver

- **Default (text pasted into the conversation, rewrite mode):** return only the final version, ready to use, once. Then, in up to 5 lines, the main changes by pattern number (for example: "§1 two not-X-but-Y constructions; §26 three chopped passages; §14 three em dashes"). If something needs a content decision (a fact without a source, a number without a date), list it as a numbered question, never invent. If no change is justified, return the text as it is and say it is clean.
- **Audit mode (when asked to "just point out", "evaluate" or "audit"):** do not rewrite; list each passage, the pattern and the suggestion, separating clear problems from style choices that can stay.
- **File mode (text in a file):** edit a copy with minimal changes and deliver a summary, keeping the original. A paragraph that already reads as human stays untouched.
- Keep the meaning, numbers, names, quotes and structure the author chose. Humanizing cleans the form; the thesis stays the author's. Quotes, links, code and passages attributed to others are not rewritten; if they have a pattern, point it out.
- Before delivering, reread your final text looking for em dashes, "não é X, é Y", chopped sentences and anything from the "Never add" list. They are the most common mistakes of anyone who humanizes text.
- For text to be published, the delivery ends with the list of blocks the author should edit by hand (pass 3), in order of priority. Without that list the delivery is incomplete.
