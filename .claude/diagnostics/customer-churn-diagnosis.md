---
name: "customer-churn-diagnosis"
description: "Identifies the root cause of customer attrition by distinguishing between onboarding failures, value plateau, competitor displacement, price sensitivity, product regression, and champion departure. Use when an entrepreneur reports declining retention, rising cancellation rates, or unexplained customer loss."
entry_symptoms:
  - "Customers leaving"
  - "Renewal rates dropping"
  - "Can't figure out why they churn"
  - "Lost key accounts"
  - "Usage declining before cancellation"
possible_diagnoses:
  - onboarding-failure
  - value-plateau
  - competitor-displacement
  - price-sensitivity
  - product-regression
  - champion-departure
routes_to_skills:
  - net-promoter-score
  - four-ps-marketing
  - product-life-cycle
  - business-model-canvas
  - employee-engagement-retention
routes_to_templates:
  - quarterly-business-review
  - case-study-template
author: "Fatih Guner"
---

# Customer Churn Diagnosis

## Entry Symptoms

Customers are leaving, and the reasons remain opaque. The entrepreneur reports some combination of: "Renewal rates are dropping," "We lost three key accounts last quarter," "Usage declines and then they cancel," or "We just can't figure out why they churn." The instinct is to blame the product or the market — but churn is a symptom with at least six distinct underlying causes, and treating the wrong one accelerates the problem.

## Triage Questions

### Q1: When do customers churn relative to their lifecycle?

- **Within the first 30 days** — the customer never reached the value moment. Proceed to Q2. Likely diagnosis: **onboarding-failure**.
- **Between 3 and 6 months** — the customer found initial value but hit a ceiling. Proceed to Q3. Likely diagnosis: **value-plateau**.
- **After 12+ months, typically at renewal** — something shifted in the customer's context. Proceed to Q5 and Q6.

### Q2: Is churn voluntary or involuntary?

- **Voluntary (customer actively cancels)** — the product disappointed relative to expectations. Proceed to Q3.
- **Involuntary (payment failure, credit card expiry, procurement lapse)** — this is a billing infrastructure problem, not a strategic one. Fix payment recovery before diagnosing further.
- **Unclear — customers go silent and stop using** — usage data will reveal whether this is apathy (never activated) or abandonment (activated then disengaged). Proceed to Q4.

### Q3: What do exit interviews or cancellation surveys reveal?

- **"Too expensive for what we get"** — likely diagnosis: **price-sensitivity**. The value-to-cost equation broke down.
- **"We found a better alternative"** — likely diagnosis: **competitor-displacement**. Confirm with Q6.
- **"We got what we needed" or "Our needs changed"** — likely diagnosis: **value-plateau**. The product served a bounded purpose.
- **"The product got worse" or "Too many bugs/changes"** — likely diagnosis: **product-regression**. Confirm with Q4.
- **No exit data available** — this itself is a red flag. Instrument cancellation flows before proceeding.

### Q4: What does usage data show in the 60 days before cancellation?

- **Usage was never high — the customer barely activated** — likely diagnosis: **onboarding-failure**. They bought but never adopted.
- **Usage was strong then dropped sharply** — something broke. Either a product change (diagnosis: **product-regression**) or a personnel change at the customer (diagnosis: **champion-departure**). Proceed to Q5.
- **Usage declined gradually over months** — the product's utility wore thin. Likely diagnosis: **value-plateau**.

### Q5: Is churn concentrated in a specific segment, cohort, or account type?

- **Yes, concentrated in a segment (e.g., small accounts, a specific industry)** — the product may serve some segments well but fail others. Likely diagnosis: **price-sensitivity** (if small accounts) or **value-plateau** (if a segment has outgrown the product).
- **Yes, concentrated in a recent cohort** — something changed in onboarding, product, or positioning. Compare with earlier cohorts to isolate the variable.
- **No pattern — churn is distributed evenly** — proceed to Q6. The cause is likely systemic rather than segment-specific.

### Q6: Are churned customers going to competitors, building internally, or simply stopping?

- **Going to a named competitor** — likely diagnosis: **competitor-displacement**. Analyse the competitor's advantage: price, features, or positioning.
- **Building an internal solution or hiring for the capability** — likely diagnosis: **value-plateau**. Customers outgrew the product and can justify the investment to replace it.
- **Just stopping — no replacement** — the problem the product solved may have diminished in urgency. Likely diagnosis: **price-sensitivity** or a market-level shift.

## Diagnosis Map

| Diagnosis | Key Signals | Confirmation Path |
|-----------|------------|-------------------|
| **Onboarding failure** | Churn within 30 days, low activation, minimal usage from day one | Q1 shows early churn + Q4 shows no activation |
| **Value plateau** | Churn at 3-6 months, gradual usage decline, "got what we needed" in exit surveys | Q1 shows mid-lifecycle churn + Q3 confirms bounded value |
| **Competitor displacement** | Customers name an alternative, feature comparisons circulating, competitor gaining share | Q3 names competitor + Q6 confirms destination |
| **Price sensitivity** | Small accounts over-represented in churn, "too expensive" in surveys, discounting requests before cancellation | Q3 cites cost + Q5 shows segment concentration |
| **Product regression** | Churn correlates with product changes, sharp usage drops, "it got worse" feedback | Q3 cites quality + Q4 shows sudden usage cliff |
| **Champion departure** | Key contact left the customer organisation, usage drops immediately after personnel change | Q4 shows sharp drop + Q6 shows no competitive switch |

## Routing

**Onboarding failure:**
1. Apply `business-model-canvas` — re-examine the value proposition and whether marketing promises match product reality
2. Apply `net-promoter-score` — survey surviving early-stage customers to benchmark the onboarding experience
3. Output with `case-study-template` — document successful onboarding patterns for replication
**Value plateau:**
1. Apply `product-life-cycle` — determine whether the product needs extension, reinvention, or portfolio expansion
2. Apply `business-model-canvas` — identify adjacent value the product could deliver to extend utility
3. Output with `quarterly-business-review`
**Competitor displacement:**
1. Apply `four-ps-marketing` — audit positioning, pricing, and distribution against the named competitor
2. Apply `net-promoter-score` — quantify the loyalty gap between your retained customers and those who left
3. Output with `quarterly-business-review`
**Price sensitivity:**
1. Apply `four-ps-marketing` — reconstruct the price-to-value equation across segments
2. Apply `business-model-canvas` — explore packaging, tiering, or usage-based models that align price with delivered value
3. Output with `quarterly-business-review`
**Product regression:**
1. Apply `net-promoter-score` — measure sentiment across customer cohorts before and after product changes
2. Apply `product-life-cycle` — assess whether regression is a temporary setback or a structural decline
3. Output with `case-study-template` — document the regression and recovery plan
**Champion departure:**
1. Apply `employee-engagement-retention` (applied to customer relationships) — build multi-threaded relationships that survive personnel changes
2. Apply `net-promoter-score` — identify accounts with single-threaded dependencies before the champion leaves
3. Output with `quarterly-business-review`

## Red Flags

- **Churn rate exceeds 5% monthly with no exit data.** Flying blind at this velocity means the company is haemorrhaging customers without learning. Instrument cancellation flows and exit surveys before applying any framework.
- **The entrepreneur cannot produce cohort retention curves.** Without quantified retention by cohort, any diagnosis is guesswork. Establish measurement infrastructure first.
- **Net revenue retention is below 80%.** At this level, no amount of acquisition can sustain the business. The product itself must be interrogated.
- **The company has fewer than 50 customers and calls it "churn."** At small customer counts, individual losses are case studies, not statistical trends.
