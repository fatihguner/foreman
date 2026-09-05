---
name: "revenue-diagnosis"
description: "Identifies the root cause of revenue decline or stagnation by distinguishing between acquisition failures, retention breakdowns, pricing misalignment, and market-level shifts. Use when an entrepreneur reports dropping sales, stalled revenue growth, or inability to close deals."
entry_symptoms:
  - "Sales are dropping"
  - "Revenue isn't growing"
  - "We can't close deals"
  - "Customers aren't buying"
  - "Our pipeline dried up"
possible_diagnoses:
  - pricing-misalignment
  - high-churn
  - weak-product-market-fit
  - broken-go-to-market
  - market-contraction
  - sales-team-capability-gap
routes_to_skills:
  - porters-five-forces
  - four-ps-marketing
  - net-promoter-score
  - product-life-cycle
  - business-model-canvas
  - swot-pest-analysis
routes_to_templates:
  - strategic-analysis-one-pager
  - quarterly-strategic-review
  - unit-economics-snapshot
author: "Fatih Guner"
---

# Revenue Diagnosis

## First-response contract

Until comparable revenue components are available, the result is **cause not established**. If the only acquisition evidence is that new customers still arrive, explicitly tell the founder that this does not establish whether acquisition revenue is improving or deteriorating. Customer counts, customer quality, conversion and realized price can move differently.

Build the opening answer around the revenue bridge, with unknown components marked unknown: opening revenue + new revenue + expansion - contraction - churn = closing revenue. Ask for the previous and current period's new revenue and lost/contracted existing revenue. Keep acquisition, retention and pricing hypotheses open until those measurements distinguish them. Do not label the cause "existing customers" merely because acquisition is nonzero. Do not invent a universal churn target, NPS threshold, or ideal rate.

Recommend collecting or reconciling these measurements as the first action. A channel shutdown, pricing reversal, or product change requires additional evidence. Once the measurements exist, use the triage below and explain which observation supports the selected branch.

## Entry Symptoms

The entrepreneur says some version of: "Sales are dropping," "We can't close deals anymore," "Revenue has flatlined," or "Our pipeline dried up." The complaint centres on money not coming in — but the underlying cause could be anything from a broken pricing model to a dying market.

## Triage Questions

Treat the branches below as hypotheses to investigate. Start with a revenue bridge over one consistent period: opening revenue + new customer revenue + expansion - contraction - churn = closing revenue. Ask for the missing components before excluding a cause. New customers can still arrive while acquisition volume, conversion, customer quality, or average deal size deteriorates.

### Q1: Is the revenue problem coming from new customers or existing customers?

- **New customer revenue is below the comparable baseline** — investigate acquisition and conversion in Q2
- **Existing customer revenue is below the comparable baseline** — investigate churn, contraction and expansion in Q4
- **Both** — proceed to Q2, then Q4; the diagnosis will compound
- **Unknown, or only customer counts are available** — request new and existing revenue, customer counts and average revenue for the same periods. Keep both acquisition and retention hypotheses open.

### Q2: What does your sales pipeline look like right now?

- **Pipeline is full but deals aren't closing** — the problem sits at conversion. Proceed to Q3.
- **Pipeline is thin — fewer leads entering** — the problem sits at awareness or channel reach. Likely diagnosis: **broken-go-to-market**. Confirm with Q6.
- **Pipeline looks normal but average deal size is shrinking** — likely diagnosis: **pricing-misalignment**. Confirm with Q3.

### Q3: Has your pricing, packaging, or discounting changed in the last 6 months?

- **Yes, we changed pricing** — investigate **pricing-misalignment**. Compare conversion, realized prices and churn before and after the change; timing alone does not establish causation.
- **No, pricing is unchanged but competitors undercut us** — likely diagnosis: **market-contraction** or competitive pressure. Proceed to Q6.
- **No, and we're discounting more just to close** — the product's perceived value is eroding. Likely diagnosis: **weak-product-market-fit**. Proceed to Q5.

### Q4: What does your churn data show?

- **Churn is rising — customers leave within 3-6 months** — investigate **high-churn**. Check cohort mix, expectations, onboarding, customer fit and value delivery before selecting an intervention.
- **Churn is stable but expansion revenue is flat** — examine monetisation and expansion opportunities while checking whether the stable churn level itself is sustainable. Pricing is one hypothesis; adoption and customer budget constraints are alternatives.
- **Churn is rising and NPS is falling simultaneously** — likely diagnosis: **weak-product-market-fit**. The original problem the product solved may no longer exist or matter.

### Q5: Is the product still solving the problem it was built to solve?

- **Yes, but customers have more alternatives now** — the market matured. Likely diagnosis: **market-contraction** or commoditisation.
- **The customer's problem has shifted** — likely diagnosis: **weak-product-market-fit**. The value proposition needs rebuilding.
- **We're not sure what problem customers think we solve** — likely diagnosis: **weak-product-market-fit** compounded by **broken-go-to-market**.

### Q6: Has the competitive landscape changed meaningfully in the past year?

- **New entrants appeared with lower prices or better features** — likely diagnosis: **market-contraction** (if industry-wide) or **broken-go-to-market** (if positioning failed to adapt).
- **No significant competitive change** — return to Q2 and Q5, and check demand, regulation and macroeconomic conditions. Absence of a new competitor does not prove an internal cause.
- **A major competitor exited, yet our sales still dropped** — investigate both shrinking market demand and ability to capture suitable buyers. A competitor exit alone does not establish a sales-team capability gap.

## Diagnosis Map

| Diagnosis | Key Signals | Confidence Threshold |
|-----------|------------|---------------------|
| **Pricing misalignment** | Deal sizes shrinking, heavy discounting, pricing recently changed, competitors undercut | Q3 confirms pricing shift + Q2 shows pipeline-to-close gap |
| **High churn** | Rising churn rate, declining NPS, customers leave within 6 months | Q4 shows churn data + Q5 shows product still relevant |
| **Weak product-market fit** | NPS falling, unclear value prop, customer problem shifted | Q5 confirms problem shift + Q4 shows churn + NPS decline |
| **Broken go-to-market** | Thin pipeline, low awareness, channels underperforming | Q2 shows thin pipeline + Q6 shows no competitive excuse |
| **Market contraction** | Industry-wide decline, new entrants commoditising, category maturation | Q6 confirms competitive shift + Q5 shows external cause |
| **Sales team capability gap** | Pipeline exists but close rates dropped, opportunity present but uncaptured | Q2 shows full pipeline + Q6 shows opportunity + Q3 shows no pricing issue |

## Routing

**Pricing misalignment:**
1. Apply `four-ps-marketing` — reconstruct the value-price equation
2. Apply `business-model-canvas` — stress-test the revenue model
3. Output with `unit-economics-snapshot`

**High churn:**
1. Apply `net-promoter-score` — quantify the loyalty gap
2. Apply `product-life-cycle` — determine where the product sits in its arc
3. Output with `quarterly-strategic-review`

**Weak product-market fit:**
1. Apply `business-model-canvas` — rebuild the value proposition from scratch
2. Apply `net-promoter-score` — measure current customer sentiment
3. Output with `strategic-analysis-one-pager`

**Broken go-to-market:**
1. Apply `four-ps-marketing` — audit all four dimensions
2. Apply `porters-five-forces` — understand channel and buyer power dynamics
3. Output with `strategic-analysis-one-pager`

**Market contraction:**
1. Apply `porters-five-forces` — map the full competitive structure
2. Apply `product-life-cycle` — confirm maturity stage
3. Output with `quarterly-strategic-review`

**Sales team capability gap:**
1. Apply `porters-five-forces` — confirm the opportunity is real
2. Apply `hackman-enabling-conditions` — assess team structure and support
3. Output with `team-health-check`

## Red Flags

- **Revenue dropped more than 40% in a single quarter with no obvious cause.** This may indicate fraud, data integrity issues, or a contractual event outside strategic diagnosis. Engage a forensic accountant or CFO-level review before applying frameworks.
- **The entrepreneur cannot produce any pipeline, churn, or revenue data.** Without baseline metrics, diagnostic accuracy is unreliable. Route to basic financial instrumentation before strategic analysis.
- **Cash runway is under 8 weeks.** Revenue diagnosis is irrelevant if the company cannot survive long enough to act on findings. Prioritise emergency fundraising or cost restructuring.
