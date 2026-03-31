---
name: "financial-modeling-guide"
description: "Guides entrepreneurs through gathering the inputs required to build a financial projection — revenue build-up, expense modeling, cash flow projection, break-even analysis, and scenario stress-testing. Produces the assumption set that drives a defensible financial model."
research_type: "financial"
feeds_into_skills:
  - unit-economics-snapshot
  - exit-scenario-analysis
feeds_into_templates:
  - fundraising-deck-outline
  - quarterly-strategic-review
estimated_time: "8-14 hours"
data_sources:
  - SEC EDGAR
  - Crunchbase
  - Glassdoor
  - Levels.fyi
  - Pave
  - Industry packs (Foreman)
  - Bureau of Labor Statistics
  - PitchBook
author: "Fatih Guner"
---

# Financial Modeling Guide

Every spreadsheet is an argument. The rows and columns present a thesis about how money will flow through a business over time — and like any argument, its persuasiveness depends entirely on the quality of its premises. Most founders fail not at the arithmetic but at the inputs: they guess at customer acquisition costs, invent salary figures, and wave vaguely at growth rates. The model then inherits these fabrications and presents them in crisp decimal precision, lending false confidence to false assumptions.

This guide addresses the upstream problem. Before you build a model, you must research its inputs. Revenue assumptions require data on customers, pricing, and growth trajectories. Expense projections demand real salary benchmarks, vendor costs, and infrastructure pricing. Scenario analysis needs historical volatility ranges from comparable companies. Gather the evidence first. The spreadsheet comes second.

---

## What You'll Learn

- A bottom-up revenue build: customers multiplied by ARPU multiplied by realistic growth rates
- An expense map distinguishing fixed from variable costs, with salary benchmarks by role and geography
- A monthly cash flow projection for your chosen time horizon (3-5 years)
- Break-even point expressed in both time and revenue
- Three scenarios (base, optimistic, pessimistic) with clearly stated divergence assumptions
- The top 3 sensitivity drivers — the assumptions that, if wrong, most change the outcome

---

## Data Sources

| Source | What It Provides | Free/Paid | Access |
|--------|-----------------|-----------|--------|
| SEC EDGAR | Public company financials: revenue mix, cost structures, margins by segment | Free | sec.gov/edgar |
| Crunchbase | Startup funding rounds, revenue estimates, employee counts, growth signals | Freemium | crunchbase.com |
| Glassdoor | Salary data by role, company, and geography | Free | glassdoor.com |
| Levels.fyi | Granular tech compensation data: base, stock, bonus by level | Free | levels.fyi |
| Pave | Real-time compensation benchmarks by stage, role, and geography | Freemium | pave.com |
| Carta Total Comp | Equity and cash compensation benchmarks for startups | Paid (free reports) | carta.com |
| PitchBook | Comparable company financials, valuation multiples, deal terms | Paid (library access) | pitchbook.com |
| Bureau of Labor Statistics | Employment cost trends, inflation data, occupational wage statistics | Free | bls.gov |
| Industry Packs (Foreman) | Sector-specific benchmarks: margins, CAC, LTV, churn, growth rates | Free (built-in) | `.claude/industry-packs/` |
| AWS/GCP/Azure Pricing Calculators | Infrastructure cost estimation | Free | Respective cloud provider sites |

---

## Research Protocol

**Step 1 — Define the Time Horizon**
Choose 3 or 5 years. Three years suits pre-seed and seed companies where visibility is limited. Five years applies to Series A and beyond where investors expect a longer trajectory. Record your choice and the rationale.

**Step 2 — Build Revenue Assumptions Bottom-Up**
Identify your revenue streams. For each stream, research: (a) the number of target customers you can reach per period, (b) the average revenue per user or contract value, (c) growth rate assumptions grounded in comparable company trajectories or your own historical data. Source customer counts from your pipeline, market sizing research, or industry benchmarks. Source ARPU from your pricing research or comparable public companies via SEC filings.

**Step 3 — Map Expense Categories**
Separate fixed costs (rent, insurance, base salaries) from variable costs (cloud infrastructure, payment processing, sales commissions). For each category, gather current actuals where available and benchmark data for projected hires or expenditures. Use Glassdoor, Levels.fyi, and Pave for salary benchmarking — record the 25th, 50th, and 75th percentile for each role you plan to hire.

**Step 4 — Project Monthly Cash Flow**
Lay out revenue minus expenses on a monthly basis. Account for payment timing: when do customers pay versus when do you recognize revenue? When do large expenses hit (annual contracts, tax payments, equipment purchases)? Identify months where cash goes negative.

**Step 5 — Calculate Break-Even**
Determine the revenue level at which monthly income covers monthly expenses. Express this as both a revenue figure and a customer count. Then estimate the month in which you reach it, given your growth assumptions.

**Step 6 — Stress-Test with Three Scenarios**
Build three variants. Base case uses your best-estimate assumptions. Optimistic case improves growth rate by 30-50% and reduces churn. Pessimistic case cuts growth by 30-50%, increases churn, and delays key hires. For each scenario, note the cash runway implication and the break-even shift.

**Step 7 — Identify Top 3 Sensitivity Drivers**
Vary each major assumption independently by +/- 20% and observe the impact on cash runway and break-even timing. Rank the assumptions by impact magnitude. The top three are your sensitivity drivers — these are where additional research effort pays the highest return.

---

## Data Collection Template

### Revenue Build-Up

| Revenue Stream | Customers (Month 1) | Monthly Growth Rate | ARPU | Source for Growth Rate | Source for ARPU |
|---------------|---------------------|--------------------| -----|----------------------|----------------|
| | | % | $ | | |
| | | % | $ | | |
| **Total Monthly Revenue (Month 1)** | | | **$** | | |

### Expense Map

| Category | Type (Fixed/Variable) | Monthly Cost | Source/Benchmark | Scaling Trigger |
|----------|-----------------------|-------------|-----------------|----------------|
| Engineering salaries | Fixed | $ | Levels.fyi (50th pctl) | Per hire |
| Cloud infrastructure | Variable | $ | AWS calculator | Per 1K users |
| Sales commissions | Variable | $ | Industry standard | Per deal closed |
| Office/rent | Fixed | $ | Market rate | Lease terms |
| | | $ | | |

### Scenario Summary

| Metric | Pessimistic | Base | Optimistic |
|--------|------------|------|-----------|
| Monthly revenue growth rate | % | % | % |
| Monthly churn rate | % | % | % |
| Months to break-even | | | |
| Cash runway (months) | | | |
| Total funding needed | $ | $ | $ |

---

## Interpretation Guide

**Revenue realism check:** Compare your projected Year 2 revenue to comparable startups at the same stage. If your model shows $10M ARR by Year 2 for a pre-seed company, the burden of proof is on you. The median Series A company reaches $1-2M ARR.

**Expense ratio benchmarks:** Software companies at scale spend roughly 60-70% of revenue on operating expenses. Early-stage companies routinely exceed 100% (hence the need for funding). If your model shows profitability in Year 1 without explaining why, skeptics will find the gap.

**Sensitivity hierarchy:** If a 20% change in customer acquisition cost shifts your break-even by six months but a 20% change in office rent shifts it by two weeks, your research priority is clear. Allocate diligence proportionally to sensitivity.

**Scenario spread:** If your pessimistic and optimistic scenarios differ by less than 2x in terminal revenue, your range is too narrow. Real uncertainty is wider than founders prefer to admit.

---

## Common Pitfalls

- **Hockey-stick without mechanism.** Projecting exponential growth without identifying the specific channel, campaign, or product trigger that produces it. Growth curves need causal stories, not faith.
- **Forgetting the hiring ramp.** Modeling ten engineers at full productivity from Day 1 when the actual timeline involves recruiting, onboarding, and ramping — each adding months and cost before output materializes.
- **Benchmarking salaries to the wrong market.** San Francisco salaries applied to a distributed team hiring in lower-cost markets inflates expenses. The reverse — using low-cost benchmarks when competing for Bay Area talent — makes offers uncompetitive.
- **Ignoring cash timing.** Revenue recognized is not cash received. Enterprise contracts with net-60 payment terms mean your P&L looks healthy while your bank account bleeds.
- **Single-scenario conviction.** Presenting only the base case signals either naivety or dishonesty. Sophisticated stakeholders want to see what breaks the model.

---

## Output

Package your financial research inputs for use in the following Foreman components:

- **unit-economics-snapshot** — ARPU, CAC, LTV, and margin data feed directly into the unit economics framework. The bottom-up revenue build provides the numerator; the expense map provides the denominator.
- **fundraising-deck-outline** — The "Financial Projections" and "Use of Funds" slides draw from your scenario summary, break-even analysis, and expense map.
- **exit-scenario-analysis** — Terminal revenue projections and growth rates from your scenarios feed the exit valuation models. The sensitivity analysis identifies which assumptions most affect exit outcomes.
- **quarterly-strategic-review** — Actuals-versus-projection comparisons require the projection baseline you build here. Update the model quarterly as assumptions get validated or invalidated.

Transfer the assumption table, scenario summary, and sensitivity ranking. Flag which assumptions remain unvalidated — these become the research agenda for the next quarter.
