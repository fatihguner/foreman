---
name: "churn-analysis-guide"
description: "Guides entrepreneurs through researching and diagnosing customer churn — calculating accurate churn metrics, building cohort retention curves, running exit surveys, correlating usage data with attrition, and synthesizing findings into actionable churn drivers."
research_type: "customer"
feeds_into_skills:
  - customer-churn-diagnosis
  - net-promoter-score
  - revenue-diagnosis
  - pricing-strategy-playbook
  - unit-economics-snapshot
feeds_into_templates:
  - unit-economics-snapshot
estimated_time: "8-16 hours"
data_sources:
  - Amplitude
  - Mixpanel
  - Stripe
  - Chargebee
  - Salesforce
  - Zendesk
  - Intercom
  - Delighted
author: "Fatih Guner"
---

# Churn Analysis Guide

Acquisition gets the headlines; retention determines the outcome. A SaaS company growing 10% monthly with 5% monthly churn is running on a treadmill -- each new cohort evaporates faster than the next one arrives. Yet most founders can cite their CAC to two decimal places while unable to state their net revenue retention with confidence. The asymmetry is dangerous: acquisition costs are visible on the P&L, while churn erodes the denominator quietly until unit economics collapse. This guide provides the research protocol for understanding not merely that customers leave, but why they leave, when the decision crystallises, and what signals predict departure before the cancellation event.

---

## What You'll Learn

- Accurate churn metrics: logo churn, revenue churn, and net revenue retention
- Cohort retention curves segmented by signup month, plan, and acquisition source
- Exit survey findings identifying top reasons customers leave
- Usage-to-churn correlations revealing which behaviours predict attrition
- A prioritised list of the top 3 churn drivers with evidence strength ratings

---

## Data Sources

| Source | What It Provides | Free/Paid | Access |
|--------|-----------------|-----------|--------|
| Amplitude / Mixpanel / Heap | Feature usage frequency, session depth, activation events, engagement trends | Paid (free tiers) | amplitude.com / mixpanel.com / heap.io |
| Stripe / Chargebee / Recurly | MRR movements: new, expansion, contraction, churn; cohort-level revenue | Paid (included with billing) | stripe.com / chargebee.com |
| Salesforce / HubSpot | Churn reason codes, customer health scores, renewal pipeline data | Paid | salesforce.com / hubspot.com |
| Zendesk / Intercom | Support ticket volume and categories, complaint patterns, CSAT per ticket | Paid | zendesk.com / intercom.com |
| Exit survey (Typeform / SurveyMonkey) | Self-reported churn reasons, satisfaction at cancellation, win-back signals | Paid (free tiers) | typeform.com / surveymonkey.com |
| Delighted / Wootric | NPS scores with open-text comments, detractor identification | Paid (free tiers) | delighted.com / wootric.com |
| Google Analytics / PostHog | Session behaviour, funnel drop-off, engagement decline patterns | Freemium | analytics.google.com / posthog.com |

---

## Research Protocol

**Step 1 -- Calculate Churn Rates Accurately**
Compute three metrics from your billing system. Logo churn: customers lost divided by starting count. Gross revenue churn: MRR lost divided by starting MRR. Net revenue retention: starting MRR plus expansion minus losses, divided by starting MRR. Report all three; never cite one in isolation.

**Step 2 -- Build Cohort Retention Curves**
Group customers by signup month and track what percentage remain active at month 1, 2, 3, 6, and 12. Healthy products show curves that flatten into a retained base. Products in trouble show curves that never flatten. Segment further by plan tier, acquisition channel, and persona.

**Step 3 -- Segment Churn by Dimension**
Break churn into sub-populations: by plan, persona, acquisition source, and tenure (first 90 days vs post-90 days). The aggregate number masks the signal. You may discover that one segment drives the headline rate -- and addressing it alone halves the problem.

**Step 4 -- Run Exit Surveys**
Deploy a 5-7 question survey at cancellation. Target 30+ responses. Core questions: reason for leaving, alternative chosen, what would have prevented it, and willingness to return. Keep under 2 minutes; incentivise if response rates fall below 20%.

**Step 5 -- Correlate Usage Data with Churn**
Compare analytics for churned vs retained customers over the 30 days preceding cancellation: login frequency, feature breadth, core action depth, support tickets. The 2-3 metrics that most sharply distinguish cohorts become early-warning indicators.

**Step 6 -- Map NPS to Actual Churn**
Match NPS responses to subsequent retention outcomes. Calculate churn rates among promoters, passives, and detractors over 6 months. If detractors churn at 4x the rate of promoters, NPS becomes a reliable leading indicator.

**Step 7 -- Synthesise the Top 3 Churn Drivers**
Triangulate exit surveys, usage correlations, NPS detractor comments, and support ticket patterns. A driver confirmed across three sources is actionable; one supported by a single source remains a hypothesis. Rank by impact and addressability.

---

## Data Collection Template

### Churn Metrics Dashboard

| Metric | Current Month | Prior Month | 3-Month Average | Benchmark |
|--------|--------------|-------------|-----------------|-----------|
| Logo churn rate (monthly) | % | % | % | SaaS: 3-7% |
| Gross revenue churn (monthly) | % | % | % | SaaS: 1-3% |
| Net revenue retention (annual) | % | % | % | Best-in-class: >120% |

### Cohort Retention Table

| Cohort | Month 1 | Month 3 | Month 6 | Month 12 |
|--------|---------|---------|---------|----------|
| [Month A] | % | % | % | % |
| [Month B] | % | % | % | % |

### Exit Survey Summary (n = ___)

| Reason | % of Responses | Verbatim Theme |
|--------|---------------|----------------|
| | | |
| Alternative chosen | % moving to: ___ | |
| Would return if | ___% yes | Top condition: ___ |

### Usage-to-Churn Correlation

| Metric | Churned Avg (30d) | Retained Avg | Predictive? |
|--------|-------------------|-------------|-------------|
| Logins per week | | | Y / N |
| Core action frequency | | | Y / N |
| Support tickets filed | | | Y / N |

---

## Interpretation Guide

**Retention curve flattens above 40% at month 12 -- healthy.** The product has a retained core. Focus on expanding that base and improving early-lifecycle activation.

**Retention curve never flattens -- product-market fit is incomplete.** Every cohort trending toward zero is a product problem, not a churn optimisation problem. Pause growth spending; fix the core experience.

**One segment drives most churn -- targeted intervention.** When 60% of churn comes from a single plan or persona, fix that segment's experience, reposition away from it, or adjust pricing.

**Exit surveys and usage data disagree -- trust behaviour.** Customers rationalise departure in surveys while usage data reveals the real story. When self-report and behavioural data conflict, behaviour is more reliable.

---

## Common Pitfalls

- **Conflating logo churn with revenue churn.** Losing 10 small accounts while expanding 2 enterprise accounts produces terrible logo churn but healthy revenue retention. Report both; act on what matters for your model.
- **Surveying too few churned customers.** Fewer than 30 responses produce anecdotes, not patterns. Extend the collection window rather than drawing conclusions from 8 responses.
- **Ignoring involuntary churn.** Failed credit cards account for 20-40% of SaaS churn. Separate voluntary from involuntary before diagnosing product problems.
- **Optimising retention before activation.** Customers who never reach the "aha moment" churn regardless. Fix activation first.
- **Treating churn as a single initiative.** Churn has multiple root causes. A project addressing one driver while ignoring others produces marginal improvement.

---

## Output

Package your churn analysis for use in the following Foreman skills and templates:

- **Skills**: `customer-churn-diagnosis` (metrics and drivers feed the triage), `net-promoter-score` (NPS-to-churn mapping), `revenue-diagnosis` (gross churn and NRR), `pricing-strategy-playbook` (price sensitivity data), `unit-economics-snapshot` (churn rate feeds LTV)

Transfer the churn dashboard, cohort table, exit survey synthesis, and usage correlations. Flag the most addressable churn driver -- this becomes the first intervention target.
