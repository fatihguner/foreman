---
name: "data-collection-plan"
description: "General-purpose template for structuring data needs before collection begins. Guides entrepreneurs through identifying what data answers their question, where it exists, how to collect it, how to assess its quality, and when they have enough to act."
research_type: "market"
feeds_into_skills:
  - evaluating-and-deciding
  - defining-and-exploring-problems
feeds_into_templates: []
estimated_time: "2-4 hours (planning); varies (execution)"
data_sources:
  - Primary research (interviews, surveys, experiments)
  - Secondary research (reports, databases, filings)
  - Observational data
  - Public datasets
author: "Fatih Guner"
---

# Data Collection Plan

Frameworks without data are elaborate guessing games. A Porter's Five Forces analysis built on intuition produces confident-sounding fiction. A pricing strategy without willingness-to-pay data is a coin flip dressed in spreadsheet clothing. Yet the failure mode is rarely a shortage of frameworks — it is a shortage of the data those frameworks require. This template exists at the boundary between intention and evidence: it forces you to articulate what you need to know, where that knowledge lives, and how you will acquire it before you spend a single hour collecting.

The second failure mode is equally destructive: collecting data forever. Research feels productive. It has the texture of progress without the risk of action. This plan includes explicit stopping criteria to prevent analysis from becoming a substitute for decision-making.

---

## What You'll Learn

- A clear articulation of the specific questions your data must answer
- An inventory of data sources mapped to each question
- A collection timeline with milestones and responsibilities
- Quality criteria for evaluating whether your data is reliable enough to act on
- Explicit "good enough" thresholds that prevent research from becoming procrastination

---

## The Plan Framework

Every data collection effort answers six questions in sequence. Skipping any one of them leads to wasted effort or unreliable conclusions.

**1. What question am I trying to answer?**
Not "I need market data" but "What is the annual spend on inventory management software by mid-market e-commerce companies in North America?" Precision in the question determines efficiency in the search.

**2. What data would answer it?**
Define the ideal dataset — what fields, what granularity, what time period. Then define the minimum viable dataset — the least you need to make a confident-enough decision.

**3. Where does that data exist?**
Map each data need to specific sources. Some data exists in public databases; some requires primary collection; some does not exist and must be estimated from proxies.

**4. How will I collect it?**
Define the method for each source: download, API query, manual search, interview, survey, or observation. Estimate time per source.

**5. How will I know if it's reliable?**
Every data point carries uncertainty. Define your reliability criteria before collecting, so you are not rationalizing quality after the fact.

**6. When do I have "enough"?**
Define the stopping condition. What level of confidence in the answer permits you to move forward? Perfect data does not exist; sufficient data does.

---

## Data Source Taxonomy

### Primary Sources (You Collect It)

| Method | Best For | Time Cost | Reliability |
|--------|----------|-----------|-------------|
| Customer interviews | Problem validation, willingness to pay, behavior patterns | 1-2 hours each | High (if conducted properly) |
| Surveys | Quantitative validation across larger samples | 4-8 hours to design and deploy | Medium (response bias) |
| Experiments / A/B tests | Testing specific hypotheses with real behavior | Days to weeks | High (behavioral data) |
| Observation | Understanding current workflows and pain points | 2-4 hours per observation | High (unfiltered reality) |
| Expert interviews | Industry dynamics, regulatory landscape, technical feasibility | 30-60 minutes each | Medium-High (single perspective) |

### Secondary Sources (Someone Else Collected It)

| Source Type | Examples | Best For | Reliability Concern |
|-------------|----------|----------|-------------------|
| Industry reports | Statista, IBISWorld, Gartner, Forrester | Market sizing, trends, benchmarks | Methodology opaque; may be dated |
| Public filings | SEC EDGAR, Companies House, annual reports | Revenue, strategy, risk factors | Reliable but lagging indicators |
| Government data | Census, BLS, Eurostat, trade databases | Demographic, economic, employment data | Reliable but aggregated |
| News and press | TechCrunch, industry publications, PR wires | Funding, launches, partnerships, pivots | Survivorship bias; positive spin |
| Academic research | Google Scholar, SSRN, university repositories | Validated frameworks, empirical findings | Rigorous but often dated |
| Competitor data | Crunchbase, SimilarWeb, G2, app stores | Competitive intelligence, traction signals | Estimates; directionally useful |
| Social and community | Reddit, Twitter/X, forums, review sites | Unfiltered customer sentiment | Self-selection bias |

---

## Quality Assessment Checklist

Before relying on any data source, evaluate it against these five criteria:

| Criterion | Question to Ask | Red Flag |
|-----------|----------------|----------|
| Recency | When was this data collected or published? | More than 2 years old in a fast-moving market |
| Source credibility | Who produced this? What is their methodology? Do they have an incentive to skew results? | Vendor-produced "research" about their own market |
| Sample size | How many data points underlie this figure? | Market size from a survey of 50 respondents |
| Methodology | How was the data collected? Is the methodology described? | "Based on proprietary analysis" with no further detail |
| Bias indicators | Who funded the research? Who benefits from the conclusion? | Industry association claiming their sector is booming |

**Rule of thumb:** No single source should carry your entire analysis. Triangulate every critical data point from at least two independent sources. When sources agree, confidence rises. When they disagree, the disagreement itself is informative — investigate it.

---

## Data Collection Plan Template

Fill one row per data need. Start from your questions, not from available sources.

| # | Question to Answer | Data Needed | Source(s) | Collection Method | Timeline | Responsible | Quality Check | Status |
|---|-------------------|-------------|-----------|------------------|----------|-------------|---------------|--------|
| 1 | | | | | | | | Not started |
| 2 | | | | | | | | Not started |
| 3 | | | | | | | | Not started |
| 4 | | | | | | | | Not started |
| 5 | | | | | | | | Not started |

Status values: Not started / In progress / Collected / Verified / Insufficient

### Priority Matrix

Not all data is equally urgent. Rank your data needs:

| Priority | Data Need | Why This Priority | Deadline |
|----------|-----------|-------------------|----------|
| P1 — Blocks decisions | | | |
| P2 — Improves decisions | | | |
| P3 — Nice to have | | | |

Collect P1 data first. Start P2 in parallel if resources allow. Defer P3 until P1 and P2 are complete or until a specific decision requires it.

---

## "Good Enough" Criteria

Research is a means to decisions, not an end in itself. Define your stopping conditions before you start collecting.

**For market sizing:** Two independent approaches (top-down and bottom-up) that agree within 2-3x. You do not need exact numbers — you need the right order of magnitude.

**For competitor analysis:** Deep profiles on 5-8 competitors with consistent data across all. You do not need every competitor — you need the ones that matter to your target customer's decision.

**For customer validation:** 5-8 interviews per segment showing a clear pattern (4+ of 5 mentioning the same pain point). You do not need statistical significance — you need pattern recognition.

**For pricing:** Willingness-to-pay signals from at least 10 potential customers, with a clustering around a price range. You do not need a precise price — you need a defensible range.

**The diminishing returns test:** After each research session, ask: "Did I learn something that changes my plan?" If three consecutive sessions yield no new insight, you have enough. Act.

---

## Integration with Foreman

Research data feeds every layer of Foreman's system. Here is where each type of data goes:

| Data Type | Feeds Into (Skills) | Feeds Into (Templates) | Feeds Into (Diagnostics) |
|-----------|-------------------|----------------------|------------------------|
| Market size | business-model-canvas, blue-ocean-strategy | fundraising-deck-outline, market-opportunity-summary | market-fit-diagnosis |
| Competitor intelligence | porters-five-forces, blue-ocean-strategy, swot-pest-analysis | competitive-landscape-brief | competitive-position-diagnosis |
| Customer interviews | business-model-canvas, net-promoter-score, four-ps-marketing | customer-discovery-summary | product-market-fit-diagnosis |
| Financial data | unit-economics, balanced-scorecard | unit-economics-snapshot, financial-model-summary | burn-rate-diagnosis |
| Technical feasibility | build-vs-buy, technology-stack-assessment | technical-architecture-brief | technical-debt-diagnosis |
| Regulatory landscape | porters-five-forces (barriers to entry) | regulatory-compliance-brief | market-entry-diagnosis |

---

## Common Pitfalls

- **Analysis paralysis.** Researching until certainty arrives — it never does. Every additional data point has declining marginal value. Set a time limit and honor it. The cost of delay often exceeds the cost of imperfect data.
- **Anchoring on first data found.** The first number you encounter becomes the reference point against which all subsequent data is judged. Counter this by recording the first figure alongside the search that produced it, then actively seeking contradictory data before forming a conclusion.
- **Confusing correlation with causation.** Two trends moving together does not mean one causes the other. Ice cream sales and drowning rates both rise in summer — selling ice cream does not cause drowning. Apply this standard to every market trend you observe.
- **Ignoring inconvenient data.** When a data point contradicts your thesis, the temptation is to question the data's quality. Sometimes the data is genuinely poor. But sometimes your thesis is wrong. Develop the discipline to treat disconfirming evidence with the same rigor as confirming evidence.
- **Over-investing in secondary research when primary data is available.** Reading ten industry reports about a customer segment is less informative than five conversations with actual customers. Secondary research frames the landscape; primary research reveals the truth within it.
- **No plan at all.** The most common pitfall. Founders open Google, search for an hour, find some numbers, and call it research. Without a structured plan, collection is haphazard, quality is unassessed, and gaps are invisible.

---

## Output

This template produces a structured data collection plan — not the data itself. The plan serves as a project management tool for research and a quality assurance framework for the data you gather.

Once data is collected:

- **For diagnostics:** Validated data replaces assumptions in diagnostic triage answers. A diagnostic answered with real data produces more accurate routing than one answered with guesses.
- **For playbooks:** Data-backed inputs at each playbook step yield outputs that reflect reality rather than aspiration. The playbook runner agent can reference specific data points in its guidance.
- **For skills:** Every framework in Foreman becomes sharper when fed with actual data. The skill executor agent should note where data is missing and recommend returning to this plan.
- **For evaluating-and-deciding:** Decision quality is bounded by data quality. This plan ensures the entrepreneur knows the confidence level of the data underlying each decision.
- **For defining-and-exploring-problems:** Problem definition without data is assumption. This plan structures the evidence-gathering that transforms a hunch into a validated problem statement.

Revisit and update this plan as your venture progresses. Questions change as you move from idea to validation to traction. The plan is a living document, not a one-time exercise.
