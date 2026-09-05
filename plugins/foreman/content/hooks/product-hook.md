---
name: "product-hook"
description: "Captures intent related to product-market fit uncertainty, user retention problems, product quality concerns, feature prioritization, and value delivery gaps"
trigger_patterns:
  - "product isn't resonating"
  - "users don't stick"
  - "low retention"
  - "nobody loves it"
  - "features aren't working"
  - "don't know what to build next"
  - "customers use it but don't pay"
  - "PMF feels far away"
  - "NPS is terrible"
routes_to:
  diagnostics:
    - product-market-fit-diagnosis
  skills:
    - net-promoter-score
    - business-model-canvas
    - disruptive-innovation
    - product-life-cycle
  playbooks:
    - product-market-fit-playbook
priority: "high"
author: "Fatih Guner"
---

# Product Hook

## Trigger Patterns

Product-market fit problems are uniquely corrosive because they undermine everything else. Founders describe them through user behavior observations, metric anxiety, and a nagging sense that something fundamental is off.

- "The product isn't resonating with anyone"
- "Users sign up but don't stick around"
- "Our retention numbers are awful"
- "Nobody seems to love this product"
- "We shipped the features they asked for and nothing changed"
- "I don't know what to build next"
- "Customers use the free version but won't pay"
- "Product-market fit feels like it's getting further away, not closer"
- "Our NPS is terrible"
- "Users say it's 'nice' but they don't need it"
- "We keep building features but engagement stays flat"
- "People sign up, poke around, and disappear"
- "I can't tell if the product is wrong or the market is wrong"
- "Feedback is all over the place -- everyone wants something different"
- "We have usage but no passion"

## Intent Classification

| Pattern Cluster | Classified Intent | Confidence |
|---|---|---|
| Not resonating, nobody loves it, nice but don't need it | Value proposition gap | High |
| Users don't stick, low retention, sign up and disappear | Retention failure | High |
| Don't know what to build, everyone wants something different | Feature direction confusion | High |
| Use it but don't pay, free version only | Monetization disconnect | Medium |
| PMF feels far, product or market wrong | Product-market fit absence | High |
| NPS terrible, usage but no passion | Weak product sentiment | Medium |

## Routing Logic

**Value proposition gap** -- Route to `product-market-fit-diagnosis`. When users acknowledge the product but do not need it, the gap is between what the product offers and what the market values. The `business-model-canvas` skill helps reframe the value proposition. The `disruptive-innovation` skill reveals whether the product is overshooting or undershooting market needs.

**Retention failure** -- Route to `product-market-fit-diagnosis` with a retention focus. Low retention is the clearest signal that product-market fit is absent or fragile. The `net-promoter-score` skill provides a measurement framework. If the diagnostic confirms PMF weakness, escalate to `product-market-fit-playbook`.

**Feature direction confusion** -- Route to `product-market-fit-diagnosis`. Scattered feedback and unclear build priorities usually indicate the founder has not identified the core user segment. The diagnostic narrows the segment before the playbook addresses feature strategy.

**Monetization disconnect** -- Route to `product-market-fit-diagnosis`. Free usage without payment signals one of three things: the product solves a real problem poorly, the product solves a trivial problem well, or the pricing model is wrong. The diagnostic differentiates these.

**Product-market fit absence** -- Route to `product-market-fit-playbook` if the founder has already done substantial self-diagnosis. Otherwise, start with `product-market-fit-diagnosis`. The playbook chains multiple frameworks for a systematic PMF pursuit.

**Weak product sentiment** -- Route to `product-market-fit-diagnosis`. The `net-promoter-score` skill quantifies sentiment and identifies promoter versus detractor patterns.

## Disambiguation

This hook overlaps with `revenue-and-sales-hook` when "customers won't pay" stems from sales execution rather than product gaps. The distinguishing signal: if customers do not see value, this hook applies. If customers see value but balk at price, route to `revenue-and-sales-hook`. Overlap with `strategy-hook` occurs when "I don't know what to build" reflects strategic confusion rather than product confusion. If the uncertainty extends beyond product to the entire business direction, defer to `strategy-hook`. Overlap with `growth-hook` emerges when retention problems cap growth. If the founder frames the problem as "we can't grow," route to `growth-hook` and let it discover the product root cause through its diagnostic.

## Example Conversations

**Example 1: Retention cliff**
Entrepreneur says: "We get decent signups -- about 200 a week -- but 90% are gone within two weeks. The ones who stay seem to like it."
Hook classifies as: Retention failure.
Routes to: `product-market-fit-diagnosis` to understand the gap between the 10% who stay and the 90% who leave, with `net-promoter-score` for structured feedback.

**Example 2: Feature confusion**
Entrepreneur says: "Every customer interview gives me a different answer about what they want. I've been building features for six months and none of them moved the needle."
Hook classifies as: Feature direction confusion.
Routes to: `product-market-fit-diagnosis` to identify the core segment, then `product-market-fit-playbook` for a structured approach to feature-market alignment.

**Example 3: Monetization wall**
Entrepreneur says: "We have 5,000 active users on the free plan. Twelve have upgraded to paid. The product works -- they just won't pay for it."
Hook classifies as: Monetization disconnect.
Routes to: `product-market-fit-diagnosis` to determine whether the value gap is real or the pricing model is misaligned with how users perceive the product's worth.
