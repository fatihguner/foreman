---
name: "innovation-hook"
description: "Hook for innovation-hook intent classification and routing"
priority: "medium"
author: "Fatih Guner"
---

# Innovation Hook

Creativity is not a personality trait that some teams possess and others lack. It is a condition — one that requires specific environmental inputs and degrades predictably when those inputs are removed. Risk aversion, process calcification, and the quiet tyranny of "what worked before" suffocate innovation more reliably than any external threat. The diagnosis matters because the remedies for a team that has never been creative differ fundamentally from those for a team that has forgotten how.

## Trigger Patterns

1. "No new ideas"
2. "Everything feels stale"
3. "Team plays it safe"
4. "We're stuck in a rut"
5. "Innovation dried up"
6. "Same old approaches"
7. "Need fresh thinking"
8. "How do I get creative again?"
9. "We're not experimenting enough"
10. "Nobody takes risks anymore"
11. "Our product hasn't evolved in months"
12. "Competitors are out-innovating us"
13. "Brainstorming sessions produce nothing useful"

## Intent Classification

| Signal | Intent | Confidence |
|--------|--------|------------|
| Stale ideas, creative drought, repetitive thinking | `creativity-drought` | High |
| Risk aversion, safety-seeking, fear of failure | `risk-aversion` | High |
| Experimentation cited as insufficient or absent | `experimentation-gap` | Medium |
| Competitive innovation pressure, being outpaced | `competitive-innovation-lag` | High |
| Brainstorming or ideation process failing | `ideation-process-failure` | Medium |
| Personal creative block, founder feels stuck | `founder-creative-block` | Medium |

## Routing Logic

```
IF intent == creativity-drought OR founder-creative-block:
  → diagnostics/innovation-drought-diagnosis
  → skills/creative/creative-identity-and-permission
  → skills/creative/obstacles-and-blocks
  → skills/decisions/generating-solutions

IF intent == risk-aversion:
  → diagnostics/innovation-drought-diagnosis
  → skills/thinking/enemies-of-clear-thinking
  → skills/creative/practice-and-habit
  → playbooks/innovation-sprint-playbook

IF intent == experimentation-gap:
  → diagnostics/innovation-drought-diagnosis
  → playbooks/innovation-sprint-playbook
  → skills/frameworks/business-model-canvas
  → skills/frameworks/doblin-ten-types

IF intent == competitive-innovation-lag:
  → diagnostics/innovation-drought-diagnosis
  → skills/frameworks/doblin-ten-types
  → skills/frameworks/blue-ocean-strategy
  → skills/frameworks/disruptive-innovation

IF intent == ideation-process-failure:
  → diagnostics/innovation-drought-diagnosis
  → skills/decisions/generating-solutions
  → skills/decisions/brainswarming
  → skills/creative/collaboration-and-context
```

**Priority:** Medium

## Disambiguation

Innovation complaints overlap with several adjacent problem domains. Surface-level "we need new ideas" can conceal quite different root causes:

- **Product hook overlap:** If the innovation concern is specifically about the product roadmap — features, retention, market fit — route to `product-hook`. Innovation framing is secondary to the product-specific diagnosis.
- **Strategy hook overlap:** "Stuck in a rut" may describe strategic drift rather than creative deficit. If the founder cannot articulate where the company is heading, route to `strategy-hook`.
- **Competition hook overlap:** When "competitors are out-innovating us" is the primary concern, the problem may be competitive intelligence rather than internal creativity. Route to `competition-hook` if the threat is external.
- **Culture hook overlap:** Risk aversion across the entire organisation often signals a culture problem — fear of punishment for failure — rather than an innovation process gap. Route to `culture-hook` if the aversion is systemic.
- **Leadership hook overlap:** A founder's personal creative block may stem from burnout or decision fatigue. Route to `leadership-hook` if the individual, not the team, is depleted.

**Disambiguation prompt:** "Is this about your team not producing new ideas, the company not taking enough risks, or you personally feeling creatively stuck?"

## Example Conversations

**Example 1: Creativity drought**

> **Founder:** "We used to have great ideas constantly. Now every brainstorm produces the same recycled concepts."
>
> **Foreman:** Recycled ideas are a symptom of recycled inputs. Creative output is directly proportional to the diversity of stimuli a team absorbs — and teams in execution mode progressively narrow their information diet. The fix is not a better brainstorming technique; it is deliberately re-expanding the input funnel. When was the last time your team encountered a genuinely unfamiliar perspective — a different industry, a different customer segment, a different discipline entirely?
>
> *Routes to: innovation-drought-diagnosis → creative-identity-and-permission → generating-solutions*

**Example 2: Risk aversion**

> **Founder:** "My team won't try anything new. Every proposal gets killed by 'what if it fails' objections."
>
> **Foreman:** Risk aversion in teams is almost never about the team's character — it is about the incentive structure. If failure is punished (even subtly) and safe execution is rewarded, rational people will choose safety every time. The question is not how to make your team braver but how to make experimentation cheaper and less career-threatening. What happened the last time someone on your team tried something that did not work?
>
> *Routes to: innovation-drought-diagnosis → enemies-of-clear-thinking → innovation-sprint-playbook*

**Example 3: Ideation process failure**

> **Founder:** "Brainstorming sessions are a waste of time. We sit in a room, people throw out random ideas, nothing sticks."
>
> **Foreman:** Traditional brainstorming has decades of research demonstrating its ineffectiveness — yet it persists as the default ideation ritual. The problem is structural: groupthink, anchoring to the first idea spoken, and social pressure suppress the divergent thinking brainstorming was meant to enable. There are better methods. Let me walk you through alternatives that actually produce usable output.
>
> *Routes to: innovation-drought-diagnosis → generating-solutions → brainswarming → collaboration-and-context*
