---
name: "unit-economics-snapshot"
description: "Produces a one-page unit economics dashboard with eight core metrics: CAC, LTV, LTV:CAC ratio, payback period, gross margin, contribution margin, churn rate, and expansion revenue. Each metric includes its formula, benchmark range, and the specific signals that trigger investor concern. Modeled on a16z's unit economics framework. Use when preparing for investor meetings, board reviews, or internal assessments of business model health."
audience: "investor"
applicable_skills:
  - balanced-scorecard
  - net-promoter-score
  - smart-goals
  - growth-share-matrix
format: "dashboard"
author: "Fatih Guner"
---

# Unit Economics Snapshot

Eight numbers determine whether a business model compounds wealth or incinerates capital. Fill every cell with actuals — not projections, not blended averages across dissimilar segments. Delete this paragraph before distribution.

**[Company Name]** | **Period:** [Month/Quarter, Year] | **Segment:** [All / Enterprise / SMB / Consumer]

---

| # | Metric | Your Value | Formula | Benchmark | Trend | Investor Red Flag |
|---|--------|-----------|---------|-----------|-------|-------------------|
| 1 | **CAC** | $[amount] | Total Sales & Marketing Spend / New Customers (same period) | SaaS B2B: $200-$2K (SMB), $5K-$50K+ (Enterprise) | [Rising / Stable / Declining] | CAC rising faster than revenue per customer; blended CAC hiding channel-level dysfunction; costs not fully loaded |
| 2 | **LTV** | $[amount] | (Avg Revenue Per Account x Gross Margin %) / Revenue Churn Rate | Varies by model; credible only with >12 months cohort data | [Rising / Stable / Declining] | LTV from projected retention, not observed cohorts; assumes zero churn after month 6; expansion baked in without data |
| 3 | **LTV:CAC** | [X]:1 | LTV / CAC | <1:1 destroying value; 1-3:1 early/inefficient; 3-5:1 healthy; >5:1 possibly under-investing | [Improving / Stable / Deteriorating] | Ratio >5:1 at early stage may signal under-spending on growth; projected LTV paired with actual CAC |
| 4 | **Payback Period** | [X] months | CAC / (Monthly Revenue Per Customer x Gross Margin %) | <12 mo strong; 12-18 acceptable at Series A; >24 requires justification | [Shortening / Stable / Lengthening] | Payback longer than average customer lifespan; calculated on gross revenue, not contribution margin |
| 5 | **Gross Margin** | [X]% | (Revenue - COGS) / Revenue x 100 | Software: 70-85%; Marketplace: 40-70%; Hardware: 30-60% | [Expanding / Stable / Compressing] | Excludes material delivery costs (CS headcount, usage-scaled infra); compression with no improvement path |
| 6 | **Contribution Margin** | [X]% | (Revenue - COGS - Variable S&M) / Revenue x 100 | Positive = minimum viability; >20% = model sustains fixed-cost leverage at scale | [Expanding / Stable / Compressing] | Negative post-seed with no timeline to positive; relies on undemonstrated scale economies |
| 7 | **Churn** | Logo: [X]%/mo Revenue: [X]%/mo NRR: [X]%/yr | Logo: Lost / Starting. Revenue: MRR Lost / Starting MRR. NRR: (Start - Churn + Expansion) / Start | Monthly logo <2% (SMB), <1% (Enterprise); NRR >100%; best-in-class 120-140% | [Improving / Stable / Worsening] | Reporting only logo churn when revenue churn differs; NRR <100% at Series A; no cohort analysis |
| 8 | **Expansion Revenue** | $[amount]/mo ([X]% of new MRR) | Expansion MRR / Total New MRR | >30% from expansion signals strong PMF; best: expansion alone exceeds churn | [Accelerating / Stable / Decelerating] | No expansion mechanism by Series A; driven by price increases, not usage; concentrated in 1-2 accounts |

---

## COGS Composition

<!-- Transparency on what is included in COGS builds credibility. Investors will ask. -->

| Cost Category | Monthly Amount | % of Revenue | Included in Gross Margin? |
|--------------|---------------|-------------|--------------------------|
| Hosting / Infrastructure | $[amount] | [X]% | Yes |
| Customer support labor | $[amount] | [X]% | [Yes / No — state reasoning] |
| Third-party APIs | $[amount] | [X]% | Yes |
| Payment processing | $[amount] | [X]% | Yes |
| [Other] | $[amount] | [X]% | [Yes / No] |

---

## Summary Dashboard

| Metric | Current | Prior Period | Benchmark | Status |
|--------|---------|-------------|-----------|--------|
| CAC | $[amount] | $[amount] | $[range] | [On track / Watch / Action needed] |
| LTV | $[amount] | $[amount] | $[range] | |
| LTV:CAC | [X]:1 | [X]:1 | 3-5:1 | |
| Payback | [X] mo | [X] mo | <18 mo | |
| Gross Margin | [X]% | [X]% | [range]% | |
| Contribution Margin | [X]% | [X]% | >20% | |
| Monthly Churn | [X]% | [X]% | <2% | |
| Net Revenue Retention | [X]% | [X]% | >100% | |

## Cohort Retention

| Cohort | Month 1 | Month 3 | Month 6 | Month 12 | Current |
|--------|---------|---------|---------|----------|---------|
| [Q1 20XX] | [%] | [%] | [%] | [%] | [%] |
| [Q2 20XX] | [%] | [%] | [%] | | |
| [Q3 20XX] | [%] | [%] | | | |

**Cohort narrative:** [Two sentences. Are newer cohorts retaining better? What changed — product, targeting, or pricing?]

---

## Methodology Notes

- **CAC fully loaded?** [Yes / No — if no, list excluded costs and rationale]
- **LTV cohort vintage:** [Oldest cohort used, months of observation data]
- **Churn measurement:** [Logo churn = customer count. Revenue churn = MRR-weighted. State which is primary.]
- **Segment breakout:** [If economics differ materially by segment, prepare separate snapshots. Blended metrics across SMB and Enterprise obscure more than they reveal.]

---

*Data as of [Date]. Methodology and raw calculations available in [data room / appendix]. Definitions follow a16z / SaaS Capital standards unless noted.*
