---
name: "partnership-hook"
description: "Hook for partnership-hook intent classification and routing"
priority: "medium"
author: "Fatih Guner"
---

# Partnership Hook

Partnerships are the business equivalent of marriage — entered with optimism, sustained by structure, and destroyed by unexpressed expectations. The founder who says "we have a partnership opportunity" and the founder who says "my cofounder wants out" are experiencing different stages of the same lifecycle. Both require frameworks that account for the volatile intersection of economics, emotion, and power.

## Trigger Patterns

1. "Got a partnership offer"
2. "Cofounder problems"
3. "Should we merge?"
4. "Strategic alliance opportunity"
5. "Partner isn't delivering"
6. "Equity split fight"
7. "Joint venture?"
8. "Acquisition offer came in"
9. "My cofounder wants out"
10. "Thinking about bringing on a cofounder"
11. "Our partner is competing with us"
12. "How do I structure this deal?"
13. "Vesting schedule dispute"

## Intent Classification

| Signal | Intent | Confidence |
|--------|--------|------------|
| Cofounder conflict, equity fights, departures | `cofounder-conflict` | High |
| New partnership or alliance evaluation | `partnership-evaluation` | High |
| Merger or acquisition offer received | `ma-evaluation` | High |
| Joint venture structuring questions | `jv-structuring` | Medium |
| Existing partnership underperforming or toxic | `partnership-breakdown` | High |
| Adding a cofounder or partner to existing company | `partner-addition` | Medium |

## Routing Logic

```
IF intent == cofounder-conflict:
  → diagnostics/cofounder-conflict-diagnosis
  → skills/negotiation/cooperative-negotiation
  → skills/people/conflict-resolution
  → skills/game-theory/coalition-and-partnership-games

IF intent == partnership-evaluation OR jv-structuring:
  → diagnostics/partnership-diagnosis
  → playbooks/partnership-playbook
  → skills/game-theory/coalition-and-partnership-games
  → skills/frameworks/swot-analysis

IF intent == ma-evaluation:
  → diagnostics/partnership-diagnosis
  → playbooks/acquisition-evaluation-playbook
  → skills/frameworks/unit-economics
  → skills/game-theory/information-asymmetry

IF intent == partnership-breakdown:
  → diagnostics/partnership-diagnosis
  → skills/negotiation/resolution-roadmap
  → skills/people/conflict-resolution
  → skills/game-theory/coalition-and-partnership-games

IF intent == partner-addition:
  → diagnostics/partnership-diagnosis
  → playbooks/partnership-playbook
  → skills/game-theory/shapley-value
  → skills/people/advisory-board
```

**Priority:** Medium

## Disambiguation

Partnership issues sit at the intersection of negotiation, team dynamics, strategy, and finance. Proper routing depends on identifying the dominant dimension:

- **Negotiation hook overlap:** If the core issue is a specific deal being negotiated — terms, pricing, structure — and the relationship itself is healthy, route to `negotiation-hook`. Partnership framing applies only when the relationship dimension is material.
- **Team hook overlap:** Cofounder conflicts that are fundamentally about roles, responsibilities, or management style (rather than equity, exit, or strategic direction) may route better through `team-hook`.
- **Fundraising hook overlap:** If the "partner" is an investor and the dispute involves board seats, liquidation preferences, or governance, route to `fundraising-hook`.
- **Strategy hook overlap:** "Should we merge?" may be a strategic direction question rather than a partnership mechanics question. If the founder is unsure about the company's future trajectory, route to `strategy-hook` first.

**Disambiguation prompt:** "Is this about evaluating a new relationship, fixing a broken one, or ending one that is not working?"

## Example Conversations

**Example 1: Cofounder conflict**

> **Founder:** "My cofounder and I can't agree on anything anymore. We're fighting about equity, about direction, about who does what."
>
> **Foreman:** Multi-dimensional cofounder conflict — equity, strategy, and roles simultaneously — signals that the founding relationship has outgrown its original terms. These were likely set on a handshake when the stakes were theoretical. Now that the company has value, the ambiguity is unbearable. The first question is not how to resolve the disagreements but whether both of you still want the same company.
>
> *Routes to: cofounder-conflict-diagnosis → cooperative-negotiation → conflict-resolution*

**Example 2: Acquisition offer**

> **Founder:** "A larger company offered to acquire us. The number sounds good but I don't know if I should take it."
>
> **Foreman:** An acquisition offer flatters the ego and clouds the judgement in equal measure. The "number sounds good" reaction is precisely the wrong starting point — the question is good relative to what. Your future projected value, your alternatives, your personal goals, your team's outcome, the tax implications. Before we evaluate the offer: what would you build if you said no, and does that excite you more than the number?
>
> *Routes to: partnership-diagnosis → acquisition-evaluation-playbook → information-asymmetry*

**Example 3: Partnership evaluation**

> **Founder:** "A Fortune 500 company wants to partner with us. It could be huge but I'm worried about getting swallowed."
>
> **Foreman:** Asymmetric partnerships — where one party is orders of magnitude larger — follow predictable dynamics. The small company provides innovation and speed; the large company provides distribution and credibility. The risk is dependency: if 80% of your revenue flows through this partner within two years, you have not gained a partner but acquired a boss. What specifically does the partnership proposal entail, and what exclusivity terms are on the table?
>
> *Routes to: partnership-diagnosis → partnership-playbook → coalition-and-partnership-games*
