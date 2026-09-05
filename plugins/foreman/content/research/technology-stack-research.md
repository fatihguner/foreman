---
name: "technology-stack-research"
description: "Guides entrepreneurs through evaluating technology choices — build vs buy, framework selection, and infrastructure decisions. Produces scored comparisons, total cost of ownership calculations, and documented decision rationale for technical architecture."
research_type: "technical"
feeds_into_skills:
  - defining-and-exploring-problems
  - evaluating-and-deciding
feeds_into_templates:
  - decision-rationale-memo
  - new-initiative-brief
estimated_time: "6-12 hours"
data_sources:
  - StackOverflow Developer Survey
  - GitHub
  - G2
  - Capterra
  - ThoughtWorks Technology Radar
  - Hacker News
  - AWS/GCP/Azure Pricing Calculators
author: "Fatih Guner"
---

# Technology Stack Research

Every technology decision is a bet placed with borrowed time. Choose the wrong framework and you rewrite in eighteen months. Choose the wrong vendor and you discover lock-in only when you try to leave. Choose to build what you should have bought and your engineers spend a year recreating commodity infrastructure instead of building differentiation. The cost of a bad technology decision is rarely the sticker price -- it is the compounding drag on velocity that surfaces six quarters later, when reversing course is most expensive. Whether selecting a database, choosing between building in-house or licensing, or deciding which cloud provider anchors your infrastructure, the process remains the same: define requirements, enumerate options, score honestly, calculate total cost, and document the rationale.

---

## What You'll Learn

- A structured requirements matrix separating must-haves from nice-to-haves
- A scored comparison of build vs buy options against weighted criteria
- Total cost of ownership calculations covering license, infrastructure, maintenance, and opportunity cost
- A vendor lock-in risk assessment for each finalist
- Community and ecosystem health indicators for open-source options
- A documented decision rationale ready for stakeholder review

---

## Data Sources

| Source | What It Provides | Free/Paid | Access |
|--------|-----------------|-----------|--------|
| StackOverflow Developer Survey | Adoption rates, satisfaction scores, technology trends | Free | survey.stackoverflow.co |
| GitHub | Stars, commit activity, issue response time, contributor count, release cadence | Free | github.com |
| G2 / Capterra | User reviews, feature comparisons, pricing for SaaS tools | Free | g2.com / capterra.com |
| ThoughtWorks Technology Radar | Opinionated maturity assessment (Adopt, Trial, Assess, Hold) | Free | thoughtworks.com/radar |
| InfoQ Trends Reports | Technology adoption curves across architecture, DevOps, AI | Free | infoq.com/articles |
| Hacker News | Developer sentiment, critical reviews, undocumented gotchas | Free | Search via hn.algolia.com |
| AWS/GCP/Azure Pricing Calculators | Infrastructure cost modeling per workload | Free | calculator.aws / cloud.google.com/products/calculator |
| DB-Engines | Database popularity rankings and trend data | Free | db-engines.com |

---

## Research Protocol

**Step 1 -- Define Technical Requirements**
List every requirement the technology must satisfy. Classify each as Must-Have (non-negotiable) or Nice-to-Have (valued but tradeable). Common dimensions: performance thresholds, scalability ceiling, security certifications, integration points, team expertise, deployment model, and compliance constraints. Limit must-haves to 5-7; if everything is critical, nothing is.

**Step 2 -- Enumerate Options**
Always include a "build in-house" option alongside 3-5 buy/adopt alternatives. For open-source options, record the license type, governance model, and primary maintainer (company-backed vs community). For proprietary options, record pricing model, contract terms, and data portability provisions.

**Step 3 -- Score Against Requirements**
Build a weighted scoring matrix. Assign each must-have a weight of 3 and each nice-to-have a weight of 1. Score each option 0-3 per criterion (0 = does not meet, 1 = partially meets, 2 = meets, 3 = exceeds). Multiply scores by weights and sum. Any option scoring 0 on a must-have is eliminated regardless of total score.

**Step 4 -- Calculate TCO for Top 3**
For each finalist, estimate 3-year total cost of ownership across four categories: license/subscription fees, infrastructure costs, maintenance effort (engineering hours at loaded rate), and opportunity cost (what your team cannot build while integrating or maintaining this choice). The cheapest option by license is rarely cheapest by TCO.

**Step 5 -- Assess Vendor and Lock-in Risk**
For each finalist, evaluate: data export capabilities, API standard compliance (proprietary vs open standards), contractual exit terms, migration effort estimate, and the vendor's financial stability. Open-source mitigates some lock-in but introduces maintenance liability.

**Step 6 -- Prototype the Winner**
Spend 2-5 days building a minimal proof of concept with the top-scoring option. Test specifically against must-have requirements and integration points. A prototype reveals friction that documentation conceals.

**Step 7 -- Document the Decision**
Record what you chose, what you rejected, and the reasoning. Future engineers will inherit this decision; give them the context to understand it or challenge it intelligently.

---

## Data Collection Template

### Scoring Matrix

| Requirement | Weight | Build | Option A | Option B | Option C |
|-------------|--------|-------|----------|----------|----------|
| [Requirement] | | /3 | /3 | /3 | /3 |
| **Weighted Total** | | **__** | **__** | **__** | **__** |

### TCO Comparison (3-Year)

| Cost Category | Build | Option A | Option B |
|---------------|-------|----------|----------|
| License / subscription | $ | $ | $ |
| Infrastructure (compute, storage, network) | $ | $ | $ |
| Maintenance (engineering hours x rate) | $ | $ | $ |
| Opportunity cost estimate | $ | $ | $ |
| **3-Year Total** | **$** | **$** | **$** |

### Open-Source Health Check

| Indicator | Option A | Option B |
|-----------|----------|----------|
| GitHub stars / monthly contributors | | |
| Median issue response time | | |
| Last release date / corporate backer | | |
| License type | | |

---

## Interpretation Guide

**High score, low TCO -- straightforward choice.** When the weighted scoring leader also wins on total cost, the decision is clean. Document it and move.

**High score, high TCO -- value trade-off.** The best technical fit costs more. Quantify the premium and ask: does the capability gap justify 2-3x the cost? Sometimes it does, especially when the alternative requires engineering time that exceeds the price difference.

**Build wins on capability but loses on TCO.** Custom-built solutions score perfectly on requirements because you design them that way. The honest test: does maintenance drag over three years erode the initial fit advantage? Most startups underestimate maintenance by 3-5x.

**Community health is declining.** Decreasing contributors, lengthening issue response times, or stale releases signal a project entering maintenance mode. Adopting it now means inheriting future migration costs. Weight this heavily for infrastructure-level dependencies.

---

## Common Pitfalls

- **Optimizing for day-one fit over year-three cost.** The technology that is easiest to adopt today may be hardest to scale or migrate away from tomorrow. Always model the three-year horizon.
- **Ignoring opportunity cost.** "Build" options appear cheaper when you exclude the value of what engineers could have shipped instead. A senior engineer spending six months on internal tooling has a real opportunity cost exceeding most SaaS contracts.
- **Conflating popularity with suitability.** A technology's GitHub stars reflect general interest, not fitness for your specific requirements. Score against your matrix, not the community's enthusiasm.
- **Skipping the prototype.** Documentation describes the ideal case. A two-day prototype exposes the integration friction, edge-case behaviour, and developer experience that no vendor page will admit.
- **Undocumented decisions.** A technology choice made without recorded rationale becomes a mystery within two years. The next engineer cannot evaluate whether the original constraints still hold.

---

## Output

Package your technology evaluation for use in the following Foreman skills and templates:

- **Skills**: `defining-and-exploring-problems` (requirements matrix clarifies technical constraints), `evaluating-and-deciding` (scoring matrix and TCO feed structured decision frameworks)
- **Templates**: `decision-rationale-memo` (documented choice and rejected alternatives transfer directly), `new-initiative-brief` (technology selection informs feasibility and resourcing sections)

Transfer the scoring matrix, TCO comparison, vendor risk assessment, and prototype findings. Flag which assumptions carry the most uncertainty -- these become technical validation priorities.
