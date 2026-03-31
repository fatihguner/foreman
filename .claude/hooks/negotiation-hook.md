---
name: "negotiation-hook"
description: "Hook for negotiation-hook intent classification and routing"
priority: "medium"
author: "Fatih Guner"
---

# Negotiation Hook

Negotiations fail for predictable reasons, yet founders persist in treating each stalled deal as a unique crisis. The patterns repeat: anchoring too early, conceding too fast, confusing positions with interests, or mistaking aggression for leverage. Recognising which pattern is at play determines whether the conversation needs competitive tactics, cooperative reframing, or simply better preparation.

## Trigger Patterns

1. "Deal is stuck"
2. "Can't agree on terms"
3. "They won't budge"
4. "Getting a bad deal"
5. "How do I negotiate this?"
6. "Term sheet makes no sense"
7. "Partner wants too much"
8. "Contract negotiation"
9. "They're playing hardball"
10. "I keep giving in"
11. "Vendor is squeezing us"
12. "Salary negotiation with a key hire"
13. "Licensing terms are unfair"

## Intent Classification

| Signal | Intent | Confidence |
|--------|--------|------------|
| Deal described as stalled, stuck, or going nowhere | `negotiation-deadlock` | High |
| Feeling exploited, outmatched, or losing ground | `weak-position-negotiation` | High |
| Term sheet confusion, clause-specific complaints | `term-comprehension` | Medium |
| Partner or vendor demanding disproportionate terms | `power-asymmetry` | High |
| General "how do I negotiate" without specifics | `negotiation-skill-gap` | Medium |
| Repeated concessions, pattern of giving in | `concession-pattern` | High |

## Routing Logic

```
IF intent == negotiation-deadlock:
  → diagnostics/negotiation-stuck-diagnosis
  → skills/negotiation/cooperative-negotiation
  → skills/negotiation/resolution-roadmap

IF intent == weak-position-negotiation OR power-asymmetry:
  → diagnostics/negotiation-stuck-diagnosis
  → skills/negotiation/competitive-negotiation
  → skills/game-theory/credible-commitment

IF intent == term-comprehension:
  → skills/negotiation/negotiation-preparation
  → playbooks/negotiation-playbook

IF intent == negotiation-skill-gap:
  → diagnostics/negotiation-stuck-diagnosis
  → playbooks/negotiation-playbook
  → skills/negotiation/competitive-negotiation
  → skills/negotiation/cooperative-negotiation

IF intent == concession-pattern:
  → diagnostics/negotiation-stuck-diagnosis
  → skills/negotiation/purposeful-concessions
  → skills/negotiation/competitive-negotiation
```

**Priority:** Medium

## Disambiguation

Negotiation language surfaces across multiple domains. Precise routing requires distinguishing the negotiation context:

- **Fundraising hook overlap:** If the negotiation involves investor term sheets, valuation disputes, or equity allocation with VCs, route to `fundraising-hook` as primary. Negotiation skills become secondary support.
- **Partnership hook overlap:** When the counterparty is a cofounder, strategic partner, or acquisition target, route to `partnership-hook` first — the relationship dimension outweighs pure negotiation tactics.
- **Team hook overlap:** Salary negotiations, equity grants for employees, or compensation disputes belong to `team-hook` with negotiation skills as supplementary.
- **Revenue hook overlap:** If the negotiation is a sales deal or pricing discussion with a customer, route to `revenue-and-sales-hook`.

**Disambiguation prompt:** "Who is on the other side of this negotiation — an investor, a partner, a customer, an employee, or a vendor?"

## Example Conversations

**Example 1: Deadlocked deal**

> **Founder:** "We've been going back and forth on this partnership deal for three months. Neither side will move."
>
> **Foreman:** Three months of positional stalemate usually means both parties are negotiating terms when they should be negotiating interests. The positions are incompatible; the underlying needs may not be. First question: what does the other side actually need from this deal — not what they are asking for, but what outcome they require?
>
> *Routes to: negotiation-stuck-diagnosis → cooperative-negotiation → resolution-roadmap*

**Example 2: Power asymmetry**

> **Founder:** "Our biggest client is renegotiating the contract and basically threatening to leave if we don't cut our price by 30%."
>
> **Foreman:** A client who represents outsized revenue knows they hold leverage — and they are using it. The question is whether you have alternatives they do not know about, or whether the dependency is as absolute as it feels. Before we talk tactics: what percentage of your revenue does this client represent, and how quickly could you replace them?
>
> *Routes to: negotiation-stuck-diagnosis → competitive-negotiation → credible-commitment*

**Example 3: Skill gap**

> **Founder:** "I'm terrible at negotiating. I always end up agreeing to terms I regret."
>
> **Foreman:** Consistent regret after negotiations signals a preparation problem, not a personality flaw. Most founders who describe themselves as poor negotiators have simply never been taught the mechanics — anchoring, concession strategy, BATNA development. The good news: negotiation is a learnable skill with high return on modest investment. Let me walk you through a structured approach.
>
> *Routes to: negotiation-stuck-diagnosis → negotiation-playbook → competitive-negotiation + cooperative-negotiation*
