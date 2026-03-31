---
name: "pricing-research-guide"
description: "Structured research protocol for validating pricing assumptions through quantitative and qualitative methods. Covers Van Westendorp Price Sensitivity Meter, Gabor-Granger technique, competitor pricing analysis, willingness-to-pay interviews, and price elasticity estimation."
research_type: "customer"
feeds_into_skills:
  - four-ps-marketing
  - pricing-diagnosis
  - pricing-strategy-playbook
  - unit-economics-snapshot
feeds_into_templates:
  - unit-economics-snapshot
  - market-opportunity-summary
estimated_time: "8-15 hours"
data_sources:
  - competitor-websites
  - g2-capterra-pricing-pages
  - customer-interviews
  - survey-tools
  - pricing-page-analytics
author: "Fatih Guner"
---

# Pricing Research Guide

## Purpose

Pricing is the only lever that directly converts product value into captured revenue -- and yet most founders set prices by copying a competitor or guessing. This guide provides a rigorous, multi-method protocol for determining what your market will actually pay, where price sensitivity inflects, and how to structure tiers that maximize both adoption and revenue per customer.

## What You'll Learn

- How to measure price sensitivity across a population using the Van Westendorp model
- How to estimate demand at specific price points via Gabor-Granger
- How to map and interpret competitor pricing architectures
- How to conduct willingness-to-pay interviews that yield honest answers
- How to synthesize findings into defensible pricing tiers

## Data Sources

| Source | What It Provides | Access Method |
|--------|-----------------|---------------|
| Competitor websites | Published pricing, tier structures, feature gating | Manual audit of pricing pages |
| G2 / Capterra | Pricing transparency scores, user-reported costs, plan comparisons | Search by category; filter by pricing |
| Customer interviews (5-8) | Willingness-to-pay signals, value perception, switching costs | Semi-structured 30-min interviews |
| Survey tools (Typeform, SurveyMonkey) | Van Westendorp and Gabor-Granger quantitative data | 30+ respondent survey, 5-8 min length |
| Pricing page A/B tests | Conversion rates at different price points | Optimizely, VWO, or native tooling |
| Industry benchmarks | Category-specific pricing norms and ARPU ranges | Analyst reports, OpenView SaaS benchmarks |

## Research Protocol

### Step 1: Map the Competitor Pricing Landscape

Audit 8-12 direct and indirect competitors. For each, record: number of tiers, price per tier, billing frequency, feature differentiation between tiers, any usage-based components, free tier availability, and published enterprise pricing. Organize findings in a comparison matrix. Identify the price floor (cheapest viable alternative) and price ceiling (most expensive comparable offering).

### Step 2: Conduct Van Westendorp Price Sensitivity Meter

Survey 30+ respondents from your target segment. Present a clear description of your product's core value proposition, then ask four questions in sequence:

1. At what price would this be **so cheap** you would question its quality?
2. At what price would this feel like a **bargain** -- great value for money?
3. At what price would this start to feel **expensive** -- you'd have to think carefully?
4. At what price would this be **too expensive** -- you'd never consider it?

Plot cumulative frequency distributions. The intersection of "too cheap" and "too expensive" identifies the optimal price point. The range between "bargain" and "expensive" intersections defines the acceptable price band.

### Step 3: Run 5-8 Willingness-to-Pay Interviews

Recruit participants who match your ICP. Structure each 30-minute session around three phases: (a) understand their current spending on the problem you solve, (b) explore perceived value of your solution's key capabilities, (c) probe price thresholds without anchoring. Never open with a number. Ask "what would you expect to pay?" before revealing any pricing. Record the exact phrases they use to describe value -- these become pricing page copy.

### Step 4: Calculate the Acceptable Price Range

Synthesize Van Westendorp intersections, interview thresholds, and competitor positioning. Identify the range where survey data, interview data, and competitive positioning overlap. This convergence zone is your defensible pricing territory.

### Step 5: Design Pricing Tiers

Using the data, construct 2-4 tiers that reflect genuine usage segments -- not arbitrary feature gating. Each tier should correspond to a distinct buyer persona or usage intensity. The gap between tiers should reflect measurable value increments. Validate tier logic against interview verbatims: can you explain each upgrade in terms customers used themselves?

## Data Collection Template

```
COMPETITOR PRICING MATRIX
Competitor:        _______________
Tier 1 (name):     $___/mo | Features: _______________
Tier 2 (name):     $___/mo | Features: _______________
Tier 3 (name):     $___/mo | Features: _______________
Billing options:   Monthly / Annual (___% discount)
Free tier:         Yes / No | Limits: _______________

VAN WESTENDORP RESULTS (n = ___)
Too cheap threshold:     $___
Bargain/value point:     $___
Expensive threshold:     $___
Too expensive ceiling:   $___
Optimal price point:     $___
Acceptable range:        $___ to $___

INTERVIEW SYNTHESIS (n = ___)
Current spend on problem:          $___ to $___/mo
Expected price for our solution:   $___ to $___/mo
Most-cited value driver:           _______________
Price objection triggers:          _______________
```

## Interpretation Guide

**Strong signal**: Van Westendorp optimal point falls within competitor mid-range and aligns with interview expectations. You have pricing permission from the market.

**Warning signal**: Acceptable range is narrow (less than 20% spread), suggesting high price sensitivity. Consider usage-based pricing to reduce upfront commitment friction.

**Red flag**: Interview willingness-to-pay falls below your unit economics floor. Either the value proposition needs strengthening, the target segment needs shifting, or the cost structure requires rework.

## Common Pitfalls

- **Anchoring bias in interviews**: Showing your price before asking about willingness-to-pay contaminates every subsequent answer. Always ask open-ended value questions first.
- **Survey sample bias**: Surveying only existing users or newsletter subscribers skews toward people who already value your product. Include cold prospects.
- **Competitor mimicry**: Matching a competitor's price signals equivalent value. If your product delivers more, pricing below them devalues your positioning.
- **Ignoring the "too cheap" floor**: Products priced below the quality-doubt threshold generate suspicion rather than conversion.
- **Skipping tier validation**: Tiers designed around internal feature bundles rather than customer usage patterns create confusion and reduce upgrade rates.

## Output

This research feeds directly into the following Foreman components:

- **Skills**: `four-ps-marketing` (Price element), `pricing-diagnosis`, `pricing-strategy-playbook`
- **Templates**: `unit-economics-snapshot` (ARPU and pricing inputs), `market-opportunity-summary` (TAM pricing assumptions)
- **Playbooks**: `pricing-strategy-playbook` (uses this data as Step 1 input)
