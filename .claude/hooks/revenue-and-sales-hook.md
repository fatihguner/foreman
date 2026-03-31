---
name: "revenue-and-sales-hook"
description: "Captures intent related to revenue generation, sales performance, customer acquisition, deal closure, and pricing friction"
trigger_patterns:
  - "sales are dropping"
  - "can't close deals"
  - "revenue is flat"
  - "nobody's buying"
  - "pipeline is empty"
  - "customers won't pay"
  - "our conversion rate sucks"
  - "we're not making money"
  - "lost another deal"
  - "pricing pushback from customers"
routes_to:
  diagnostics:
    - revenue-diagnosis
    - pricing-diagnosis
    - customer-churn-diagnosis
  skills:
    - four-ps-marketing
    - cialdini-influence
    - balanced-scorecard
  playbooks:
    - first-100-customers-playbook
    - pricing-strategy-playbook
priority: "high"
author: "Fatih Guner"
---

# Revenue and Sales Hook

## Trigger Patterns

Revenue complaints surface in wildly different language depending on the founder's emotional state and business stage. The following patterns cover the spectrum.

- "Sales are dropping and I don't know why"
- "Can't close deals no matter what we try"
- "Revenue has been flat for three months"
- "Nobody is buying this thing"
- "Our pipeline is completely empty"
- "Customers love the demo but won't pay"
- "Conversion rate is terrible"
- "We're burning cash and not making money"
- "Lost another big deal this week"
- "Every customer pushes back on our pricing"
- "Our sales cycle is way too long"
- "Leads go cold before we can close them"
- "We're getting outpriced by competitors"
- "Churn is eating all our new revenue"
- "How do I get my first paying customers?"

## Intent Classification

| Pattern Cluster | Classified Intent | Confidence |
|---|---|---|
| Dropping sales, flat revenue, not making money | Revenue decline | High |
| Can't close, lost deal, leads go cold, sales cycle too long | Sales execution failure | High |
| Nobody buying, pipeline empty, first customers | Customer acquisition gap | High |
| Pricing pushback, outpriced, won't pay | Pricing misalignment | High |
| Conversion rate, churn eating revenue | Retention and conversion | Medium |

## Routing Logic

**Revenue decline** -- Route to `revenue-diagnosis`. The diagnostic will determine whether the cause is market, product, sales execution, or pricing. From there, it may escalate to `pricing-strategy-playbook` or `first-100-customers-playbook`.

**Sales execution failure** -- Route to `revenue-diagnosis` with a sales-execution flag. If the diagnostic reveals the problem is persuasion or positioning rather than product, escalate to the `cialdini-influence` or `four-ps-marketing` skills.

**Customer acquisition gap** -- Route to `first-100-customers-playbook` directly if the company is pre-traction. For post-traction companies, route to `revenue-diagnosis` first to separate acquisition from retention problems.

**Pricing misalignment** -- Route to `pricing-diagnosis`. If confirmed, escalate to `pricing-strategy-playbook`.

**Retention and conversion** -- Route to `customer-churn-diagnosis`. Churn masquerading as a sales problem is one of the most common misclassifications.

## Disambiguation

This hook overlaps with `competition-hook` when pricing pressure originates from a competitive threat rather than internal mispricing. If the entrepreneur mentions a specific competitor or market shift alongside pricing, defer to `competition-hook`. This hook also borders `product-hook` territory when "nobody's buying" actually means "nobody wants the product." If the diagnostic surfaces product-market fit gaps, re-route to `product-hook`.

## Example Conversations

**Example 1: Revenue decline**
Entrepreneur says: "Our MRR has been flat for four months. We keep adding customers but revenue won't move."
Hook classifies as: Revenue decline with possible churn offset.
Routes to: `revenue-diagnosis` to distinguish between acquisition stall, pricing cap, and hidden churn.

**Example 2: Pricing friction**
Entrepreneur says: "Every prospect says we're too expensive. I've already dropped the price twice."
Hook classifies as: Pricing misalignment.
Routes to: `pricing-diagnosis` to determine whether the issue is value communication, market positioning, or actual price-value mismatch.

**Example 3: Early-stage acquisition**
Entrepreneur says: "We launched two months ago and have three paying users. How do I get this moving?"
Hook classifies as: Customer acquisition gap (pre-traction).
Routes to: `first-100-customers-playbook` directly, bypassing deep diagnosis since the stage is clear.
