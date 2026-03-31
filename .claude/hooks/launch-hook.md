---
name: "launch-hook"
description: "Hook for launch-hook intent classification and routing"
priority: "medium"
author: "Fatih Guner"
---

# Launch Hook

A launch is not an event. It is a campaign with a beginning, a middle, and — if done well — no end, only escalating momentum. Founders fixate on the announcement date while neglecting the months of positioning that precede it and the customer acquisition machinery that must outlast it. Whether entering a first market or a fifth, the failure modes are remarkably consistent: launching to nobody, launching everything at once, or launching before the value proposition can survive contact with real customers.

## Trigger Patterns

1. "Launching next month"
2. "Entering a new market"
3. "How do I launch?"
4. "Going international"
5. "New product launch"
6. "Market entry strategy"
7. "First launch ever"
8. "Expanding to Europe/Asia"
9. "GTM plan needed"
10. "Go-to-market strategy"
11. "Beta to general availability"
12. "Launch timeline is slipping"
13. "Don't know where to start with launch"

## Intent Classification

| Signal | Intent | Confidence |
|--------|--------|------------|
| First-time launch, debut product, general launch anxiety | `first-launch` | High |
| New market or geography, international expansion | `market-expansion` | High |
| GTM plan, go-to-market strategy requests | `gtm-strategy` | High |
| Launch timeline issues, slipping deadlines | `launch-execution` | Medium |
| Beta-to-GA transition, scaling from early users | `beta-transition` | Medium |
| New product line within existing company | `product-line-launch` | Medium |

## Routing Logic

```
IF intent == first-launch:
  → diagnostics/market-entry-diagnosis
  → playbooks/launch-playbook
  → playbooks/first-100-customers-playbook
  → skills/frameworks/business-model-canvas

IF intent == market-expansion:
  → diagnostics/market-entry-diagnosis
  → playbooks/international-expansion-playbook
  → skills/frameworks/porters-five-forces
  → skills/game-theory/first-mover-strategy

IF intent == gtm-strategy:
  → diagnostics/market-entry-diagnosis
  → playbooks/launch-playbook
  → skills/frameworks/business-model-canvas
  → skills/frameworks/value-proposition-canvas

IF intent == launch-execution:
  → playbooks/launch-playbook
  → skills/leadership/effective-execution
  → skills/thinking/self-control

IF intent == beta-transition:
  → diagnostics/market-entry-diagnosis
  → playbooks/first-100-customers-playbook
  → skills/frameworks/crossing-the-chasm
  → skills/frameworks/nps

IF intent == product-line-launch:
  → diagnostics/market-entry-diagnosis
  → playbooks/launch-playbook
  → skills/frameworks/ansoff-matrix
  → skills/frameworks/blue-ocean-strategy
```

**Priority:** Medium

## Disambiguation

Launch-related language intersects with product, sales, strategy, and growth concerns. The distinction often lies in the company's stage and the specificity of the request:

- **Product hook overlap:** If the founder is unsure whether the product is ready to launch — feature completeness, product-market fit concerns, retention issues — route to `product-hook`. The launch is premature until the product question is resolved.
- **Revenue hook overlap:** When "GTM plan" actually means "how do I sell this," and the product already exists in market, route to `revenue-and-sales-hook`. Launch implies market entry; sales implies market engagement.
- **Growth hook overlap:** Expansion that is about scaling existing operations (more of the same in more places) rather than entering a genuinely new market routes to `growth-hook`.
- **Strategy hook overlap:** "Entering a new market" may disguise a strategic direction question — the founder is not sure which market, not how to enter it. Route to `strategy-hook` if the target market is undefined.
- **Competition hook overlap:** Market entry into a heavily contested space may require competitive analysis before launch planning. Co-route with `competition-hook` when competitive density is the primary concern.

**Disambiguation prompt:** "Are you launching a new product for the first time, expanding an existing product to a new market, or scaling something that is already working?"

## Example Conversations

**Example 1: First launch**

> **Founder:** "We've been building for eight months and we're finally ready to launch. I have no idea where to start."
>
> **Foreman:** Eight months of building creates a dangerous attachment to features and a corresponding neglect of distribution. The product is ready; the question is whether your market is ready for it — meaning, do you have an audience primed to care on day one? A launch without a pre-built audience is a tree falling in an empty forest. Let me walk you through launch sequencing, starting with what should have begun two months ago and what you can still compress.
>
> *Routes to: market-entry-diagnosis → launch-playbook → first-100-customers-playbook*

**Example 2: International expansion**

> **Founder:** "We've saturated our home market. Looking at expanding to Europe but the regulatory landscape terrifies me."
>
> **Foreman:** Regulatory complexity is the visible barrier; the invisible ones — cultural adaptation, payment preferences, support expectations, local competition with home-field advantage — are often more lethal. European expansion is not one decision but twenty-seven, because the EU is not a market but a collection of markets with a shared trade agreement. Which specific countries are you considering, and what evidence do you have of demand there?
>
> *Routes to: market-entry-diagnosis → international-expansion-playbook → porters-five-forces*

**Example 3: GTM strategy**

> **Founder:** "We need a go-to-market strategy. Our product is great but we don't have a plan for getting it to customers."
>
> **Foreman:** A great product without a distribution strategy is a hobby, not a business. The GTM question has four components: who specifically you are selling to, how they currently solve the problem you address, where they congregate (physically and digitally), and what message will interrupt their current behaviour. Let me start with the first: describe your ideal first ten customers in enough detail that you could find them by name.
>
> *Routes to: market-entry-diagnosis → launch-playbook → business-model-canvas → value-proposition-canvas*
