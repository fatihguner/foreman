---
name: "decision-hook"
description: "Hook for decision-hook intent classification and routing"
priority: "medium"
author: "Fatih Guner"
---

# Decision Hook

The cost of a wrong decision is almost always lower than the cost of no decision. Founders know this intellectually and ignore it instinctively — cycling through options, gathering more data, polling more advisors, waiting for certainty that will never arrive. Decision paralysis is not a thinking problem. It is a fear problem wearing an analytical disguise.

## Trigger Patterns

1. "Can't decide"
2. "Analysis paralysis"
3. "Every option seems risky"
4. "Going back and forth"
5. "What should I do?"
6. "Too many options"
7. "Afraid of making the wrong call"
8. "Team can't agree on direction"
9. "Need a framework for this decision"
10. "Been debating this for weeks"
11. "Don't have enough information to decide"
12. "Every advisor says something different"
13. "Flip-flopping on this constantly"

## Intent Classification

| Signal | Intent | Confidence |
|--------|--------|------------|
| Explicit paralysis, inability to choose, cycling | `decision-paralysis` | High |
| Fear language — wrong call, risky, afraid | `fear-driven-indecision` | High |
| Team disagreement on direction, no consensus | `collective-indecision` | High |
| Request for frameworks, structured approaches | `decision-framework-need` | Medium |
| Information insufficiency cited as the blocker | `information-gap-excuse` | Medium |
| Conflicting advice from multiple sources | `advisor-confusion` | Medium |

## Routing Logic

```
IF intent == decision-paralysis OR fear-driven-indecision:
  → diagnostics/decision-paralysis-diagnosis
  → skills/thinking/enemies-of-clear-thinking
  → skills/decisions/evaluating-and-deciding
  → output-templates/team/decision-journal

IF intent == collective-indecision:
  → diagnostics/decision-paralysis-diagnosis
  → skills/decisions/tough-decision-situations
  → skills/decisions/consensus-and-commitment
  → skills/thinking/enemies-of-clear-thinking

IF intent == decision-framework-need:
  → skills/decisions/evaluating-and-deciding
  → skills/decisions/generating-solutions
  → skills/decisions/even-swaps
  → output-templates/team/decision-journal

IF intent == information-gap-excuse:
  → diagnostics/decision-paralysis-diagnosis
  → skills/thinking/enemies-of-clear-thinking
  → skills/decisions/evaluating-and-deciding
  → skills/decisions/seventy-percent-rule

IF intent == advisor-confusion:
  → diagnostics/decision-paralysis-diagnosis
  → skills/thinking/self-accountability
  → skills/decisions/evaluating-and-deciding
  → skills/decisions/tough-decision-situations
```

**Priority:** Medium

## Disambiguation

Decision paralysis is one of the most common presenting symptoms across all problem domains. The decision itself often reveals which hook should be primary:

- **Strategy hook overlap:** If the decision is about company direction — pivot, market, business model — route to `strategy-hook`. The paralysis is a symptom; the strategic question is the disease.
- **Product hook overlap:** Feature prioritisation deadlocks and build-vs-buy decisions route to `product-hook` with decision frameworks as supplementary tools.
- **Fundraising hook overlap:** "Should we raise?" or "Which term sheet?" decisions belong in `fundraising-hook`.
- **Partnership hook overlap:** "Should we take this deal?" involving partnerships, M&A, or cofounders routes to `partnership-hook`.
- **Leadership hook overlap:** When a founder's decision paralysis is chronic and pervasive — affecting all domains — the root cause may be burnout, impostor syndrome, or confidence erosion. Route to `leadership-hook`.

**Disambiguation prompt:** "What specifically is the decision you are stuck on — and how long have you been deliberating?"

## Example Conversations

**Example 1: Classic paralysis**

> **Founder:** "I've been going back and forth on whether to expand to a second city for two months. I keep making spreadsheets and never pulling the trigger."
>
> **Foreman:** Two months of spreadsheets means the data is not the problem — the decision criteria are. More analysis will not resolve this because you have not defined what "good enough" looks like. The spreadsheets are a procrastination mechanism that feels productive. Let me help you identify what is actually driving the hesitation, because the answer is rarely in the numbers.
>
> *Routes to: decision-paralysis-diagnosis → enemies-of-clear-thinking → evaluating-and-deciding → decision-journal*

**Example 2: Collective indecision**

> **Founder:** "My leadership team has been arguing about our pricing model for three weeks. Everyone has a strong opinion and nobody will compromise."
>
> **Foreman:** Three weeks of circular debate means the team is arguing about the wrong thing. Pricing disagreements are rarely about price — they are about customer strategy, competitive positioning, and risk tolerance. The individuals are right about different subproblems and wrong about insisting their subproblem is the whole problem. What are the two or three main positions, and what assumption does each one rest on?
>
> *Routes to: decision-paralysis-diagnosis → tough-decision-situations → consensus-and-commitment*

**Example 3: Information gap excuse**

> **Founder:** "I don't have enough data to make this call. I need to run more customer interviews before I can decide."
>
> **Foreman:** The pursuit of more data before deciding is one of the most seductive forms of avoidance. There is a point — and you have likely passed it — where additional information changes the confidence level by fractions of a percent while the delay costs real opportunity. Jeff Bezos aims to decide at 70% certainty. What percentage would you estimate you are at now, and what specific data point would change your answer?
>
> *Routes to: decision-paralysis-diagnosis → enemies-of-clear-thinking → evaluating-and-deciding → seventy-percent-rule*
