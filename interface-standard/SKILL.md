---
name: interface-standard
description: Standard for designing, adapting, checking and reviewing web interfaces: design from the subject instead of a template, adapt to the device and the input method, prove accessibility with evidence, keep motion short and useful, and deliver a ranked review. Use when building or reviewing a screen, page or prototype, when asked to make something responsive or accessible, or when asked to critique a UI.
---

# Interface Standard

By Maike Robert. MIT License.

Left alone, an AI agent produces the same screen every time: a template layout, a decorative gradient, three identical cards in a row, an error message that apologizes and says nothing. It looks finished and it is generic. This standard puts five checks in the path between the briefing and the screen the user sees, and it ends with a review the user can act on.

It works on its own, for any screen, old or new. Inside the Brief to Production Standard it runs at the prototype stage and again before the build is approved.

## 1. Design from the subject

Before the first pixel, answer three questions in writing: what the product is, who uses it and what they need to get done on this screen. Every visual choice comes from those answers, not from a default.

- **Plan a compact token set** before building: 3 to 5 colors with their roles, one or two type families with a size scale, a spacing scale, radius and shadow values. When the project has a design system, this is the design system. When it does not, this is the minimum one, and it gets saved.
- **Spend boldness in one place.** One strong element per screen (a headline, a color block, an illustration, a number). Everything else stays quiet so that element can work.
- **Hierarchy is the layout.** The eye must find the first thing, then the second, without help. If two elements compete, one of them is wrong.
- **Type:** line length under 80 characters, body size never below 16 px on phones, headings sized for the content they carry, not for drama.
- **Write the interface** from the user's side, in active voice. Buttons say what happens ("Save changes", not "Submit"). Errors say what went wrong and what to do next, without apologizing. Empty states guide the first action instead of saying "nothing here".
- **Avoid the AI clichés:** purple-to-blue gradients on dark backgrounds, three equal cards with an icon on top, a hero with a stock illustration, decorative icons next to every heading, glassmorphism everywhere, emoji as bullets, "Welcome back!" headers, the word "seamless".
- **Motion that is not user-triggered is rare** and exists only to draw attention to one thing.

## 2. Adapt to the context

Adapting a screen is rethinking it for the new context, not scaling pixels.

- **Mobile first.** Base styles for the phone, then `min-width` queries add complexity. A desktop layout squeezed into a phone is a failure even when nothing overflows.
- **Breakpoints come from the content**, not from device names. Break where the layout stops working.
- **Screen size does not tell you the input method.** Touch has no hover: nothing essential lives behind a hover state. Touch targets are at least 44 by 44 px with space between them. Use pointer and hover media queries when the behavior differs.
- **Respect the device:** safe areas on notched phones (`env(safe-area-inset-*)`), the keyboard that covers half the screen, the thumb zone at the bottom.
- **Images and media** are responsive (`srcset`, `picture`, fixed aspect ratios so the layout does not jump).
- **Never hide content on mobile as a shortcut.** If something matters on desktop it matters on the phone; find the layout that fits it.
- **Test on the real thing:** a phone in the hand, both orientations, with the keyboard open, before calling it done.

## 3. Accessibility by evidence

Accessibility is checked, not assumed. The loop is: run the audit, fix the source, run the same audit again, and keep the result.

- **Keyboard for everything.** Every action reachable and operable with Tab, Enter, Space, Escape and the arrows, in a logical order.
- **Focus visible, never removed.** No `outline: none` without an equal or better replacement.
- **Native elements before ARIA.** A `<button>` is a button. ARIA is for what HTML cannot express, and a wrong ARIA role is worse than none.
- **Every field has a visible label** and every error is announced next to the field, saying what is wrong and how to fix it.
- **Contrast:** 4.5:1 for text, 3:1 for large text and for the parts of controls that carry meaning. Measure it; do not eyeball it.
- **Do not ask twice.** Information the user already gave in the session is not requested again.
- **Motion respects `prefers-reduced-motion`.** Animations shrink to a fade or disappear.
- **Language and structure:** `lang` on the document, one `h1`, headings in order, landmarks (`main`, `nav`) in place.
- **Evidence:** Lighthouse or axe before and after, plus one manual pass with the keyboard only and one with a screen reader on the critical flow. A score of 100 is not conformance; an issue list with zero items on the critical flow is the goal.

## 4. Motion that serves

- Interface animations stay under 300 ms; page transitions under 500 ms.
- Animate `transform` and `opacity` only. Never animate width, height, top or left.
- Ease-out for things that appear, ease-in-out for things that move; never ease-in for UI.
- Feedback starts on pointer-down, not on release.
- Actions started from the keyboard are not animated.
- Animation never blocks input. The user can interrupt anything.
- One stagger per screen at most, 30 to 50 ms between items.

## 5. Ranked review

Whether the input is a screenshot, a URL or a component file, the review has one format:

1. **Blocking:** the user cannot complete the task, or the screen breaks on a target device, or an accessibility failure on the critical flow.
2. **Important:** hierarchy, consistency with the design system, states (empty, loading, error, success), copy that misleads, responsive gaps.
3. **Polish:** spacing, alignment, motion, micro-copy.

Each finding has three lines: **What** (where, exactly), **Why** (the effect on the user, with evidence: a measurement, a rule, a screenshot), **Fix** (the specific change). Then a short list of **strengths**, so the good decisions are not undone in the next round.

Rules of the review: lead with the few findings that matter, usually five to seven; every finding names the rule it breaks, and a finding without a rule is a style preference, not a finding; if more than two findings come out as blocking, check the severity again, because a page with five blocking problems is usually a page with one or two; a short review or no findings is a valid result; the review changes nothing in the code unless the user asks for the fixes.

**Landing page lens.** When the screen is a landing page, the review also answers, in this order:

1. Does the first screen say what the product is, for whom, and what to do next, without scrolling?
2. Is there one primary action, repeated where the decision happens, with every other action visibly secondary?
3. Is the proof (numbers, logos, testimonials, real screenshots) next to the claims and the call to action it supports, not parked at the end?
4. Does each section answer the objection the visitor has at that point of the scroll?
5. Does the page still work on a 390 px phone, with the primary action reachable by the thumb?

Comparing a weak section with two or three strong pages of the same category helps to show the fix, but a comparison only supports a finding; it never creates one.

## Works with

- [Brief to Production Standard](../brief-to-production-standard/): runs this standard at the prototype stage (blocks 1 and 2) and before the build is approved (blocks 3, 4 and 5). Without it, use this standard alone on any screen.
- [Web Launch Standard](../web-launch-standard/): block 3 here is the long version of its accessibility block; the launch QA still runs on the public URL.
- [Portable Code Standard](../portable-code-standard/): the code that implements all of this follows it.

## Never

- Start a screen from a template or a previous project's layout without going through block 1.
- Hide content on mobile to make the layout fit.
- Remove focus outlines, or put an essential action behind hover.
- Ship a screen with placeholder copy, an apologetic error or an empty state that says nothing.
- Report a Lighthouse score as proof of accessibility.
- Pad a review to look thorough, or rewrite the user's design decisions as "findings".

## Credits

The method distills, in my own words and from my own practice, ideas from five open source skills: frontend-design by Anthropic (Apache 2.0), accessibility by Addy Osmani (MIT), adapt by Paul Bakaus (Apache 2.0), design-review by Superfuture (MIT) and emil-design-eng by Emil Kowalski (MIT). None of their text is reproduced here; read them for the full treatment of each topic.
