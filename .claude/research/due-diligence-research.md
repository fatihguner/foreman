---
name: "due-diligence-research"
description: "Pre-fundraising due diligence preparation protocol. Guides entrepreneurs through assembling the financial, legal, commercial, technical, and HR documentation that investors will request -- before they ask for it."
research_type: "financial"
feeds_into_skills:
  - due-diligence-checklist
  - fundraising-playbook
  - fundraising-deck-outline
  - unit-economics-snapshot
feeds_into_templates:
  - due-diligence-checklist
  - fundraising-deck-outline
  - unit-economics-snapshot
  - cap-table-summary
estimated_time: "20-40 hours"
data_sources:
  - internal-accounting-systems
  - crm-data
  - analytics-platforms
  - legal-counsel
  - ip-registry
  - cap-table-management-tools
author: "Fatih Guner"
---

# Due Diligence Research Guide

## Purpose

Investors do not reject companies during due diligence because the numbers are imperfect. They reject companies that cannot produce the numbers at all. This guide organises the full spectrum of documentation an institutional investor will request into a systematic preparation protocol. Complete it before your first partner meeting, and the diligence process becomes a demonstration of operational maturity rather than an exercise in damage control.

## What You'll Learn

- The five categories of due diligence and what each reveals to investors
- Exactly which documents to prepare and in what format
- How to identify and address red flags before investors discover them
- How to organise a virtual data room that signals professionalism
- The difference between "nice to have" and "deal-breaker" documentation gaps

## Data Sources

| Source | What It Provides | Access Method |
|--------|-----------------|---------------|
| Accounting system (QuickBooks, Xero) | P&L, balance sheet, cash flow, revenue breakdown | Export financial reports; generate 24-month trailing data |
| CRM (HubSpot, Salesforce) | Pipeline data, conversion rates, customer list, deal velocity | Export pipeline reports; segment by cohort |
| Analytics platform (Mixpanel, Amplitude, GA4) | Usage metrics, retention curves, engagement data | Export cohort analyses and key metric dashboards |
| Legal counsel | Corporate documents, contracts, IP assignments, compliance | Request organised file index from counsel |
| IP registry (USPTO, EPO) | Patent filings, trademark registrations | Search by company name and founder names |
| Cap table tool (Carta, Pulley, Captable.io) | Ownership structure, option pool, SAFE/convertible notes | Export fully diluted cap table and waterfall analysis |

## Research Protocol

### Category 1: Financial Due Diligence

**What investors will ask**: Monthly P&L for 24 months, revenue by customer, burn rate trajectory, cash runway, unit economics by cohort, financial projections with assumptions.

**Documents to prepare**: (a) Monthly income statements -- 24 months trailing, (b) Balance sheet -- current, (c) Cash flow statement -- 12 months trailing, (d) Revenue breakdown by customer, segment, and geography, (e) Accounts receivable aging report, (f) Three-year financial model with clearly labelled assumptions, (g) Bank statements -- 6 months.

**Red flags to address proactively**: Revenue concentration (any customer >25% of revenue), declining gross margins, inconsistencies between reported and bank-verified revenue, missing months in the data trail, GAAP vs. cash accounting discrepancies.

### Category 2: Legal Due Diligence

**What investors will ask**: Certificate of incorporation, board minutes, all equity agreements, IP assignments, material contracts, pending litigation, regulatory compliance documentation.

**Documents to prepare**: (a) Articles of incorporation and all amendments, (b) Bylaws, (c) Board meeting minutes and written consents, (d) All equity-related documents (SAFEs, convertible notes, stock purchase agreements, option grants), (e) IP assignment agreements for all founders and employees, (f) Material contracts (customer, vendor, partnership), (g) Employment agreements and offer letters, (h) Any litigation or threatened claims.

**Red flags to address proactively**: Missing IP assignments (especially from pre-incorporation work), unsigned board consents, founder vesting that has already fully vested, outstanding convertible instruments with conflicting terms, expired or unsigned employment agreements.

### Category 3: Commercial Due Diligence

**What investors will ask**: Customer list with revenue and tenure, churn data by cohort, NPS or satisfaction metrics, pipeline composition, sales cycle length, CAC by channel, LTV calculations.

**Documents to prepare**: (a) Customer roster with ARR, start date, contract term, (b) Monthly cohort retention curves, (c) NPS or CSAT survey results, (d) Sales pipeline report with stage definitions and conversion rates, (e) CAC calculation with channel-level breakdown, (f) LTV calculation methodology and results, (g) Three reference-ready customer contacts.

**Red flags to address proactively**: Cohort retention that degrades with each new cohort, high logo churn masked by expansion revenue, LTV/CAC ratio below 3:1, sales pipeline inflated with stale opportunities, no systematic customer feedback mechanism.

### Category 4: Technical Due Diligence

**What investors will ask**: Architecture overview, tech stack rationale, scalability assessment, security practices, deployment frequency, uptime history, technical debt inventory.

**Documents to prepare**: (a) System architecture diagram, (b) Tech stack summary with rationale for key choices, (c) Infrastructure and hosting overview (cloud provider, regions, redundancy), (d) Security practices document (authentication, encryption, data handling), (e) Deployment pipeline description, (f) Uptime and incident history -- 12 months, (g) Technical debt register with severity ratings, (h) Open-source licence compliance audit.

**Red flags to address proactively**: Single points of failure in architecture, no automated testing, manual deployment processes, security practices that do not meet industry baseline, technical debt that blocks feature velocity.

### Category 5: HR Due Diligence

**What investors will ask**: Org chart, key person risk, compensation benchmarks, equity allocation, employee agreements, contractor classifications.

**Documents to prepare**: (a) Current org chart with reporting lines, (b) Key person analysis -- who is irreplaceable and why, (c) Compensation summary (base, bonus, equity) by role level, (d) Equity allocation summary (option pool size, grants made, grants remaining), (e) Employee handbook or policy documents, (f) Contractor agreements and classification analysis, (g) Planned hires for next 12 months with budget.

**Red flags to address proactively**: Key person dependencies with no succession plan, contractor misclassification risk, option pool exhausted before next funding round, compensation significantly above or below market benchmarks, missing non-compete or non-solicitation agreements for key roles.

## Data Collection Template

```
DATA ROOM READINESS CHECKLIST
Financial:    [ ] P&L 24mo  [ ] Balance sheet  [ ] Cash flow  [ ] Revenue breakdown  [ ] Model
Legal:        [ ] Incorporation  [ ] Bylaws  [ ] Board minutes  [ ] All equity docs  [ ] IP assignments
Commercial:   [ ] Customer list  [ ] Cohort retention  [ ] NPS data  [ ] Pipeline  [ ] CAC/LTV
Technical:    [ ] Architecture  [ ] Security  [ ] Uptime log  [ ] Tech debt register
HR:           [ ] Org chart  [ ] Comp summary  [ ] Equity allocation  [ ] Key person analysis

RED FLAGS IDENTIFIED
1. _______________  Severity: High / Medium / Low  Remediation plan: _______________
2. _______________  Severity: High / Medium / Low  Remediation plan: _______________
3. _______________  Severity: High / Medium / Low  Remediation plan: _______________

DATA ROOM STRUCTURE
/01-Corporate  /02-Financial  /03-Commercial  /04-Technical  /05-HR  /06-Legal
```

## Interpretation Guide

**Investor-ready**: All five categories have complete documentation, identified red flags have remediation plans in place, and the data room is organised with a clear index. Diligence requests can be fulfilled within 48 hours.

**Needs work**: Documentation exists but is scattered, incomplete, or outdated. Allocate 2-3 weeks to fill gaps before entering active fundraising conversations.

**Not ready**: Multiple categories have missing foundational documents (no IP assignments, no cap table, no monthly financials). Address these structural gaps before any investor outreach -- they signal operational immaturity that cannot be papered over.

## Common Pitfalls

- **Last-minute assembly**: Scrambling to produce documents after receiving a term sheet creates errors, delays closing, and erodes investor confidence.
- **Selective disclosure**: Hiding known issues (pending litigation, customer concentration) backfires when discovered -- and it is always discovered.
- **Inconsistent numbers**: Revenue figures that differ between your deck, your financials, and your CRM destroy credibility faster than any single bad metric.
- **Ignoring the cap table**: Unmodelled SAFEs, forgotten advisor shares, and miscalculated dilution create closing-threatening surprises.
- **Over-engineering the data room**: A cleanly organised folder structure with clear naming conventions beats an elaborate virtual data room platform with empty folders.

## Output

This research feeds directly into the following Foreman components:

- **Skills**: `due-diligence-checklist`, `fundraising-playbook`, `fundraising-deck-outline`
- **Templates**: `due-diligence-checklist` (data room structure), `fundraising-deck-outline` (financial slides), `unit-economics-snapshot` (metrics), `cap-table-summary` (ownership data)
- **Playbooks**: `fundraising-playbook` (uses this data as pre-work for Step 1)
