---
name: brief-to-production-standard
description: Takes a screen, page or feature from briefing to production with approval gates: briefing and assumptions, design system first, a quick HTML prototype to validate understanding, the build in the project's stack, a pull request on the agreed branch, and launch. Use when the user describes something to build, shares a briefing or meeting notes, or asks for a prototype.
---

# Brief to Production Standard

By Maike Robert. MIT License.

The most expensive mistake when building with an AI agent is building the wrong thing well. A polished screen that misread the briefing costs more than a rough one, because everyone has to unlearn it before fixing it.

This standard puts understanding first. The agent turns the briefing into a short summary, makes sure a design system exists, shows a quick prototype, and only then writes production code. Each stage ends at a gate where the user decides, and nothing moves forward without that decision.

## The flow

| Stage | What happens | Gate |
|---|---|---|
| 1. Briefing | Context, rules, goals and references become a one-screen summary with assumptions and open questions | Together with gate 1 |
| 2. Design system | Reuse the project's design system, or create a minimum one before any screen | **Gate 1** |
| 3. Prototype | A quick HTML prototype, inside the design system, with real copy | **Gate 2** |
| 4. Build | The approved prototype rebuilt in the project's stack | **Gate 3** |
| 5. Git | Commits on the agreed branch and a pull request for review | After gate 3 |
| 6. Production | Launch with the Web Launch Standard, only when requested | **Gate 4** |

At every gate: show the result, list the decisions needed as numbered questions with a recommended answer for each, and stop. Move on only after an explicit approval ("approved", "ok", "go ahead", "pode seguir"). A change request means edit, show again and wait again.

Facts are the agent's job and decisions are the user's. Look up anything that can be looked up (files, repository, notes, earlier conversations) before asking, and ask only about what changes the result.

## Stage 1: Briefing

**Input.** Whatever the user sends: the briefing, business rules, scenario, audience, goals, constraints, deadlines, visual references (optional) and notes from meetings. When the user mentions a meeting, search the connected knowledge base (notes vault, Notion, drive) for its transcript and notes before asking anything.

**Output.** A summary that fits on one screen:

- Problem and audience: who uses it and what they need to get done.
- Goal and main conversion: what counts as success.
- Scope: what is in and what is explicitly out.
- Business rules and constraints.
- Page profile: public (site, landing page), private (dashboard, logged-in area, admin) or staging. It decides what the launch stage checks later.
- Target: prototype only, the project's repository, or production.
- Assumptions made to fill gaps, each one marked as an assumption.
- Open questions, numbered, each with a recommended answer.

If an open question blocks the design system or the prototype, ask it now. Otherwise present the summary together with gate 1.

## Stage 2: Design system first (gate 1)

No screen is built before the design system is settled.

1. **Ask and check.** Ask whether the project has a design system, and look for one in the repository (token files, theme, CSS variables, component library, documentation site) and in the knowledge base.
2. **If the product is live but the design system is not documented,** extract it from the live site before anything else: colors, type scale, spacing, radius, shadows and the main components, written to a `DESIGN.md` with the real values measured from the pages. Confirm it with the user; from then on it counts as the existing design system.
3. **If it exists,** list what the screen will reuse (tokens and components) and any gap the screen needs filled. New pieces follow the existing naming and style.
4. **If it does not exist,** ask for the logo, brand colors, fonts, references the user likes and anything the brand already uses. Then create a minimum design system:
   - Colors: brand, neutrals and semantic colors (success, warning, error, info), with text contrast checked.
   - Typography: families, weights and a size scale.
   - Spacing scale, border radius, shadows and breakpoints.
   - Components with their states: buttons, inputs (including error), selects, cards and alerts.
   - A reference page that shows every token and component, saved in the project.
5. Token and component names are in English (`color-primary`, `space-4`, `button-secondary`).
6. **Gate 1:** the briefing summary plus the design system (what is reused or what was created).

## Stage 3: Prototype to validate understanding (gate 2)

The prototype answers one question: did the agent understand what the user imagined?

- Build it as static HTML, CSS and JS in separate files, even when the project uses another stack. It is faster to see and to change, and it keeps the conversation on the product instead of on the code.
- Use the design system from stage 2. No new colors, fonts or components outside it without saying so.
- Design from the subject and adapt to the context, following blocks 1 and 2 of the Interface Standard: one bold element, hierarchy first, no AI clichés, mobile first with breakpoints from the content and nothing behind hover. Without that standard installed, this sentence is the rule.
- Mobile first, with the desktop version in the same prototype.
- Write real copy in the product's language. Run it through the Humanizer (Humanizer PT-BR for Brazilian Portuguese). No lorem ipsum, no invented numbers, testimonials or claims; mark any copy that needs business confirmation.
- Include the states that matter for the flow: empty, loading, error and success.
- Publish it where the user can open it from any device, such as a private page (a Claude artifact or similar) with a link. A local file is the fallback.
- Iterate until approved, and keep a short list of what changed in each round.

**When the direction is open,** explore before converging. For the section that carries the decision (usually the first screen, pricing or the main flow), show three to five distinct directions side by side on one comparison page, each with a one-line thesis ("proof first", "calculator up front", "comparison table"), built with the real content and inside the design system, never with placeholder text. The user picks one, or combines two, and only that direction becomes the prototype. Skip this when the briefing or a reference already fixes the direction.

**When a visual reference must be reproduced faithfully,** build it in layers and compare side by side with the reference at each one: structure first, then background and surfaces, then typography, then images and icons. Measure colors, spacing and sizes from the reference instead of guessing.

**Gate 2:** the prototype link, the list of changes and any open decision.

## Stage 4: Build in the project's stack (gate 3)

The approved prototype is the specification.

- If the project has a stack, follow it: its conventions, components, routing, state management and tests. Reuse design system components before creating new ones. Ask before adding a dependency or a framework.
- If there is no stack, the prototype's HTML, CSS and JS become the production code, cleaned up.
- Follow the Portable Code Standard: English identifiers, comments and commits; no AI branding; no lock-in to embedded platform services; secrets out of the code.
- Change only what the screen needs and match the existing style of the codebase.
- Any difference from the approved prototype is flagged, never introduced silently.
- Before the gate, check: it runs locally, the build and tests pass, the layout holds on phone and desktop, keyboard and focus work, and it matches the prototype.
- Run blocks 3, 4 and 5 of the Interface Standard: accessibility with evidence (audit, fix, audit again), motion under 300 ms on transform and opacity only, and a ranked review of the screen. Without that standard installed, do the keyboard walk and the contrast check by hand and list what you found.

**Gate 3:** screenshots or a preview link, the list of changed files, how to test, and the ranked review (blocking, important, polish).

## Stage 5: Git

- Use the branch agreed for the project. Read it from the project's `AGENTS.md` or `README`; if it is not written anywhere, ask once and record the answer there.
- Never commit directly to the main or production branch.
- Commits in English, one purpose each, with no AI trailer. Run the portability check before committing when it is installed.
- Push and open a pull request with the briefing summary, what changed, screenshots, how to test and what is still pending.

## Stage 6: Production (gate 4, only when requested)

- Apply the Web Launch Standard with the page profile from stage 1.
- Ask for the server details that are missing (host, access method, domain, environment variables). Secrets go into environment variables or the host's secret store, never into the repository, the pull request or the conversation summary.
- Deploy with a backup and a tested rollback path.
- Run the launch QA on the public URL. Report the page as live only after it passes.

**Gate 4:** the public URL, the QA result and anything that still needs a decision.

## Works with

Each of these works on its own; together they cover the whole path. Without one of them, the one-line summary in the stage above is the rule.

- Interface Standard: blocks 1 and 2 at the prototype, blocks 3 to 5 before gate 3.
- Portable Code Standard: the build and the commits.
- Web Launch Standard: the launch.
- Landing Page Standard: when the screen is a landing page, its message architecture is the briefing and its ten blocks guide the prototype.
- Humanizer PT-BR: Portuguese copy.

## Never

- Write production code before the prototype is approved.
- Build screens before the design system is settled.
- Use placeholder text, invented data or claims nobody confirmed.
- Skip a gate or deliver two stages in one turn.
- Push to the main or production branch.
- Add a framework, library or paid service without asking.
