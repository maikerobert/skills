---
name: ad-campaign-standard
description: Builds, launches or reviews paid social campaigns that generate leads or sales, in order: business math, destination, structure, audience and retargeting, angles, creative, tracking, build, first week, iteration.
---

# Ad Campaign Standard

By Maike Robert. MIT License.

A paid campaign has one job: buy conversations or sales at a cost the business can afford, and learn which message brings them. Most campaigns fail before the first ad runs: a budget that cannot reach the goal, an objective that optimizes for clicks, a page that leaks, copy that reads like a machine wrote it, or no way to know which ad brought the sale. This standard works the chain in order, because each link depends on the one before it:

**business math → destination → structure → audience and retargeting → angles → creative → tracking → build → first week → iteration**

It is written for Meta Ads (Facebook and Instagram) lead and sales campaigns; the principles hold for other paid social platforms.

Two modes: **build** a campaign (blocks 1 to 10, in order, with a gate after block 1, another after block 6 and another before publishing) and **review** a running campaign (the same blocks as a checklist, delivered as ranked findings).

## 1. Business math, before any ad

- **Start from the goal:** sales per month, price, and who closes the sale (a person on chat, a call, a checkout).
- **Work the funnel backwards:** sales ÷ close rate = conversations needed; conversations × expected cost per conversation = budget needed. When no history exists, state the assumptions (a 10% conversation-to-sale rate is a sane start for considered B2B services) and mark them as assumptions.
- **Say it plainly when the budget cannot reach the goal,** with the numbers, and propose what the budget can buy instead: usually a test that finds the winning message and the real cost per conversation.
- **Confirm the account can run:** status, payment method, page and profile linked, pixel or dataset receiving events.

**Gate:** a one-screen plan with the goal, the funnel math, the budget and what it buys, the structure, the audience card from block 4, the angles, the conversion event and the retargeting plan (which audiences, when they turn on). Nothing is produced before it is approved, and no plan is approved without the audience card.

## 2. The destination converts before money flows

- **One action per destination:** a chat, a form, a call, a checkout. The ad, the page and the tracking all point to it.
- **The page passes the Landing Page Standard** before paid traffic. Paid traffic amplifies a page; it does not fix it.
- **Price policy is a decision:** for considered purchases, show the price on the page, after the value, not in the ad. Test the price in the ad only as a deliberate hypothesis.
- **Someone owns the response.** For chat or call funnels, name who answers and the target response time. A slow reply wastes the most expensive part of the funnel.

## 3. Structure: consolidate until the budget allows more

- **Objective = the business result** (leads, sales), optimized for the real conversion event fired on the action. Never optimize a sales campaign for traffic or reach.
- **Fewer ad sets, more data per ad set.** Each ad set needs roughly 50 conversions a week to leave the learning phase. Below that, one campaign with one ad set (budget at the campaign level) and several ads beats several starved ad sets.
- **The ads are the test.** With a small budget, test messages inside one ad set; split audiences into separate ad sets only when each can reach the learning threshold.
- **Name everything for the report:** `BRAND_Product_Objective`, `AS01_Geo_Audience_Event`, `AD01_Format_Angle`. The ad name travels into the tracking.

## 4. Audience and retargeting: broad, with signals, exclusions and a second touch

**Required: the audience card.** Every campaign carries a written audience card, approved at the gate in block 1 and kept next to the campaign. No audience setting exists without a reason on the card, and "the platform decides" is not a reason. The card has:

- **Who buys:** the buyer persona in one or two lines (role, size of business or life stage, what they use today), taken from the destination's buyer work, not invented for the ad.
- **Location:** where the business can serve and sell, and why (a local service draws a radius around the address; a national digital product covers the country, and the card says which regions are expected to convert best).
- **Age:** the minimum and the expected range, each with a reason tied to the persona (who has the problem and the money to solve it). State which limits are hard controls and which are only suggestions to the platform.
- **Gender, language and other hard limits:** only when the offer requires them, with the reason.
- **Signals:** the interests, behaviors or custom audiences given as suggestions, and why each one points to the persona.
- **Exclusions:** converters, customers, employees, and any group that clicks but cannot buy.
- **What we expect the platform to find,** and the check: on day 3 and day 7, break results down by age, gender and region and compare them with the card. When most conversions come from outside the persona, treat it as a warning about lead quality, not as a win, and check with whoever answers the conversations before trusting the cost.

**After publishing, open the ad set and confirm the live settings match the card** (part of the plan-to-live check in block 8). Platforms drop or reset suggestions and add placements on their own; a card nobody verified describes a campaign that does not exist.

- **Broad targeting with the platform's automatic audience** works better than narrow interest stacks for most budgets. Add interests or behaviors as suggestions, not limits; set only the hard limits the business needs (country, minimum age, language).
- **Exclude whoever already converted** (a custom audience of the conversion event over the last 30 to 60 days) from prospecting.
- **Create the retargeting audiences on day one,** so they fill while prospecting runs:
  - people who visited the destination page (30 days);
  - people who watched at least half of a video ad (60 days or more);
  - people who engaged with the profile on each network (90 days);
  - people who opened a form and did not submit it (30 days), for form funnels;
  - people who converted (60 days), to exclude.
- **Build the main retargeting audience as one audience:** visited the page and did not convert (visitors in the window minus converters), restricted to the campaign's page URL. Named for what it is, it can be read on the dashboard and reused without rebuilding the exclusion every time.
- **Retargeting waits for volume.** Below about 1,000 people an audience does not deliver and steals budget from prospecting. Until then, broad prospecting already reaches part of these people.

## 5. Angles: one buyer situation and one pain per ad

- **Map buyer situations to pains:** who buys, what they use today, what hurts, what makes them hesitate. Each row becomes one angle.
- **One angle per ad,** five or six angles in the first round, so the result says which pain sells, not only which picture.
- **Explain the offer for someone who has never heard of it.** Cold traffic does not know the product, the category term or the brand.
- **Write down why each ad exists** (persona, pain, format) before producing it. That note is what the review in block 10 compares against.

## 6. Creative and copy

**The hook**

- **It works in the first two seconds, without sound:** a fixed headline on screen stating the pain or the outcome, and a face or the product from the first frame. Never open on a logo.
- **Formats that carry considered offers:** a founder or expert talking to camera (cut into short versions, one angle each), a founder letter as a static, a real result with a precise number, a single strong statement. Formats that underperform for cold traffic: dense mock interfaces (chat or notes screenshots with everything at the same weight), carousels in the first round, stock imagery.

**Producing the pieces**

- **Video cuts from long recordings:** transcribe with word-level timestamps, choose the segments that make one argument, keep 15 to 35 seconds, burn in captions or keep the original ones legible, and crop away lower-thirds and side cards.
- **Statics built from code** (HTML with the brand's fonts, colors and logo, rendered to image) instead of hand-made one by one: they stay on brand, are easy to vary and pass the Interface Standard.
- **Motion pieces** (animated statement, product in motion) rendered by code when a static is not enough.
- **AI-generated variations** come through an ad-creative generator as reserve creative, finished to the brand (logo, safe zones, both formats), and only when they show nothing false (no invented customers, no fake screens, no fake numbers).
- **Every ad in 4:5 for feeds and 9:16 for stories and reels,** with text inside the safe zones of both.

**The words**

- **The caption complements the image,** never repeats it: the image stops the scroll, the caption gives the reason to click.
- **Every word the buyer reads passes the humanizer before review:** primary text, headline, description, the headline burned into the image or video, captions and the pre-filled chat message. Copy that reads like a machine wrote it costs trust before the click. For Brazilian Portuguese, use Humanizer PT-BR; when the ad speaks in a founder's own voice, use that person's voice profile.

**Gate:** a review page showing each ad as it will appear (feed and stories), with its text, headline and the reason it exists. The creative and the copy are approved there, before the build.

## 7. Tracking: know which ad brought each sale

- **The conversion event fires on the action itself** (the chat button, the form submit), in the platform pixel and in analytics, with the same name everywhere.
- **Dynamic UTMs on every ad:** `utm_source`, `utm_medium=paid_social`, `utm_campaign`, `utm_content={{ad.name}}`, `utm_term={{adset.name}}`, set in the ad's URL parameters field, with a clean destination URL.
- **Carry the ad name into the conversation.** For chat funnels, the page appends the ad name to the pre-filled message, so whoever answers sees which ad brought the person without asking.
- **Log what the platform cannot see:** a simple conversation log (date, hour, ad, became a meeting, closed, value). It is the only source for cost per sale.

## 8. Account readiness and the build

- **New accounts have hidden requirements:** a payment method, a confirmed page and a verified phone. Check them before the build, or every ad fails at publish.
- **A restricted account rarely comes back;** create a new account in the business portfolio and reattach the pixel instead of waiting.
- **Platform AI enhancements off by default** (auto-generated text, images, video, stickers, music). They change the approved creative; turn them on only as a deliberate test.
- **Assign placements per format:** the 4:5 file for feeds, the 9:16 file for stories and reels.
- **Verify every ad's preview before publishing,** in feed and stories: the right media, the right text, no stray characters. Duplicated ads keep the last media used.
- **Leave everything in draft and get explicit approval to publish.** Publishing spends money.

**Required: the plan-to-live check.** A plan that was approved but not applied is the most expensive mistake in this standard, because the report keeps describing a campaign that is not running. After publishing, and again after every later edit, open the live campaign, ad set and ads and tick each approved item against what the platform actually saved, with the live value written next to the planned one:

- objective, conversion location, dataset and conversion event;
- budget, budget level, schedule and bid strategy;
- every line of the audience card: locations, age (and whether each limit is a hard control or a suggestion), gender, languages, interests and behaviors, custom audiences included and excluded;
- placements, including the ones the platform added on its own;
- platform AI enhancements and dynamic creative, as approved;
- each ad: media per placement, text, headline, call to action, destination URL and URL parameters.

Any item that does not match is fixed before anything else, or reported to the owner the same day. The check is saved with the campaign's history of changes (date, item, planned, live, fixed), so the next review starts from what is really running.

When operating the ads manager through browser automation:

- Upload buttons open the operating system's file picker, which automation cannot drive. Find the page's own file input and set the file on it directly; files must be in a folder the agent can read and under the platform's size limit.
- The Escape key can close the whole editor; edits survive as a draft. Never click empty space near the footer, where discard buttons sit.
- When a dropdown ignores clicks by position, open it and select the option by its role and text.
- When the publish review flags every item, publish one ad from its editor to read the real error.
- Collapsed sections hide settings (audience suggestions sit behind "show suggestions", placements behind "show more settings"). Expand every section before reading a value, and never report a setting as missing from a collapsed view.
- Changing placements makes the platform rewrite each ad's placement groups as drafts. Review those drafts and publish them with the ad set, or the ads keep the old placement setup.

**Gate:** the person who pays approves the drafts and the budget. Only then publish.

## 9. The first week

- **Do not touch for seven days,** or until each ad has enough spend to judge (about two to three times the target cost per conversation). Every edit restarts learning.
- **Watch only for breakage:** ads rejected in review, spend not starting, the conversion event not firing, the chat or form not receiving.
- **Answer every conversation fast and log it.**
- **Keep a history of changes:** every edit to the campaign (date, what changed, why, what we expect, when to review, whether it restarts learning) goes into a change log next to the dashboard. The review compares results before and after each entry; a result nobody can tie to a change teaches nothing.

## 10. Read and iterate

- **A dashboard for people who are not media buyers:** a status for the week, one line on what to do now, the funnel (spend, reach, clicks, conversations, meetings, sales) with cost per step, the health of each ad against its ranges, when people convert (day of week by hour), who is converting (age, gender, region) against the audience card, and the size of each retargeting audience with whether it is ready to run.
- **Ranges to judge ads by** (adjust to the market): hook rate (3-second views ÷ impressions) ≥ 25%, link click-through rate ≥ 1%, frequency ≤ 2.5, cost per conversation within the target from block 1, conversation-to-sale rate around the assumption.
- **Weekly decisions, one hypothesis at a time:** pause ads below the ranges and above the target cost, replace them with reserve creative on the winning angle, and write down what was learned.
- **Scale what works gradually** (about 20% budget steps); open a second ad set only when two angles tie and the budget lets both reach the learning threshold.
- **Judge by sales, not by cost per lead.** A cheap lead that never buys is the most expensive one.

**Turning on retargeting**

- **Turn it on when the main audience passes about 1,000 people** (the dashboard flags it), as a separate ad set or campaign with 10% to 20% of the budget, optimized for the same conversion event.
- **Include** page visitors who did not convert, video viewers and profile engagers; **exclude** the converters. Prospecting keeps excluding the converters too.
- **Answer what stopped them, never repeat the hook they already saw:** proof (a real result, a testimonial with a name), the main objection, the guarantee, the price next to the value, a founder letter. Carousels that fail cold work here, because these people already know the offer.
- **Start with a 30-day window;** split into shorter windows (7 and 30 days) only when each one passes the volume threshold.
- **Read it apart from prospecting.** Retargeting is cheaper per conversion by nature; do not move budget to it beyond what the audience size supports. When frequency passes 4 a week, rotate the creative or widen the window.

## Review mode

Run the ten blocks as a checklist against the live campaign, its page and its numbers, and deliver the findings in the ranked format of the Interface Standard (blocking, important, polish; what, why, fix; every finding names the block and rule it breaks), followed by what is working. Blocking means the campaign cannot reach its job: the budget cannot buy the goal, the objective is not the business result, the conversion event does not fire, nobody can tell which ad brought a sale, there is no audience card, or the live campaign does not match the approved plan (the plan-to-live check was skipped or found differences nobody fixed).

## How to deliver

- Start with the funnel math and what the budget buys.
- Report by block: done, skipped and why, pending.
- Anything that needs the owner (payment, approvals, phone verification, publishing) goes as a numbered list at the end.

## Works with

- Landing Page Standard: the destination (block 2).
- Web Launch Standard: analytics events, the conversion key event, the launch QA of the page and of the reporting dashboard (private profile).
- Interface Standard: the visual craft of statics and the ranked review format.
- Humanizer PT-BR: every text the buyer reads, including the words on the creative (block 6).

## Never

- Optimizing for traffic or reach when the goal is leads or sales.
- Splitting a small budget into ad sets that cannot leave the learning phase.
- Invented numbers, invented testimonials, fake customer faces or fake screens, in copy or in AI-generated creative.
- Copy or on-screen text that skipped the humanizer.
- False scarcity, fake countdowns or promises the offer does not keep.
- Publishing, spending or changing the budget without the owner's explicit approval.
- Editing a campaign during its first week to react to one day of data.
- Judging the campaign by cost per lead without knowing cost per sale.
- Running retargeting before the audience can deliver, or showing people who already converted the same ads again.
- Launching with audience settings that nobody can explain, or calling a campaign a success while its conversions come from outside the persona.
- Reporting on a plan without checking that it is what is running, or changing a campaign without writing the change in its history.