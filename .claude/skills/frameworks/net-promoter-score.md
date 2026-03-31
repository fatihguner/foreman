---
name: "net-promoter-score"
description: "Designs and analyzes Net Promoter Score programmes for measuring customer loyalty through promoter, passive, and detractor classification. Covers NPS calculation, segmented analysis, closed-loop feedback processes, and revenue impact modelling. Use when measuring product-market fit, diagnosing retention problems, benchmarking customer satisfaction, building a customer feedback system, or connecting loyalty metrics to revenue growth."
version: "1.0.0"
category: "frameworks"
complexity: "basic"
stage:
  - validation
  - early-traction
  - growth
  - scale
tags:
  - customer-loyalty
  - customer-feedback
  - growth-metrics
  - retention
  - voice-of-customer
related_skills:
  - balanced-scorecard
  - product-life-cycle
  - systems-thinking
  - doblin-ten-types
author: "Fatih Guner"
---

# Net Promoter Score (NPS)

"On a scale of zero to ten, how likely are you to recommend us to a friend or colleague?" One question. That is the entirety of the instrument that Fred Reichheld introduced in a 2003 Harvard Business Review article titled "The One Number You Need to Grow." It became, within a decade, the most widely used customer loyalty metric in the world -- adopted by two-thirds of the Fortune 1000, embedded in the dashboards of startups and enterprises alike, and debated with a fervour usually reserved for religion and operating system preferences. Reichheld's research at Bain & Company had demonstrated a finding that was both intuitive and, at the time, poorly quantified: the willingness of customers to recommend a company to others correlated more strongly with revenue growth than any other single customer metric. Not satisfaction. Not repurchase intent. Recommendation intent -- the act of staking one's personal reputation on the quality of someone else's product.

The framework's elegance is its simplicity. Its peril is the same.

---

## The Framework

### The Calculation

NPS converts a single survey question into a score ranging from -100 to +100.

**Step 1: Ask the question.**

"On a scale of 0 to 10, how likely are you to recommend [Company/Product] to a friend or colleague?"

**Step 2: Classify respondents.**

| Score | Classification | Behaviour Profile |
|-------|---------------|-------------------|
| 9-10 | **Promoters** | Loyal enthusiasts who actively refer others; highest lifetime value; lowest churn |
| 7-8 | **Passives** | Satisfied but unenthusiastic; vulnerable to competitive offers; unlikely to refer |
| 0-6 | **Detractors** | Unhappy customers who may actively discourage others; highest churn risk; potential brand damage |

**Step 3: Calculate the score.**

```
NPS = (% Promoters) - (% Detractors)
```

Passives are excluded from the calculation but not from the analysis. They represent the swing population -- the customers who could become promoters with better experience or detractors with worse.

**Worked Example:**

A startup surveys 200 customers:
- 90 score 9-10 (Promoters): 45%
- 70 score 7-8 (Passives): 35%
- 40 score 0-6 (Detractors): 20%

NPS = 45% - 20% = **+25**

### Interpreting the Score

NPS benchmarks vary significantly by industry, geography, and business model. Absolute scores mean less than relative position and trend.

| NPS Range | General Interpretation |
|-----------|----------------------|
| 70+ | Exceptional -- world-class loyalty (Apple, USAA, Costco territory) |
| 50-69 | Excellent -- strong competitive advantage through customer advocacy |
| 30-49 | Good -- more promoters than detractors, but room for improvement |
| 0-29 | Adequate -- loyalty is not a competitive advantage |
| Below 0 | Problematic -- detractors outnumber promoters; growth is fighting an active headwind |

**The trend matters more than the number.** An NPS of +20 that has improved from +5 over four quarters signals a company moving in the right direction. An NPS of +50 that has declined from +65 signals trouble that the absolute score obscures.

### The Follow-Up: Where the Real Value Lives

The NPS question produces a number. The follow-up question produces insight.

"What is the primary reason for your score?"

This open-ended response is where NPS transitions from a metric to a management system. Coding and analysing the qualitative responses reveals:
- What promoters value most (your competitive advantage, in their words)
- What detractors resent (your most damaging failure points)
- What passives find missing (the gap between satisfaction and enthusiasm)

The discipline of "closing the loop" -- contacting detractors to understand and address their concerns, thanking promoters and asking for referrals, and nudging passives toward promoter territory -- transforms NPS from a survey into an operational process.

### The Economic Logic

Reichheld's research quantified what experienced entrepreneurs know intuitively:

- **Promoters** have 2-3x the lifetime value of detractors
- **Promoters** generate 80-90% of positive referrals
- **Detractors** generate 80-90% of negative word-of-mouth
- Companies with NPS leaders in their industry grow at **2x** the rate of the average competitor

The economic mechanism is straightforward: promoters buy more, stay longer, cost less to serve, and recruit new customers at zero acquisition cost. Detractors buy less, leave sooner, consume disproportionate support resources, and actively damage the brand through negative referrals.

### NPS as a System, Not a Score

Reichheld's later work, particularly *The Ultimate Question 2.0* (2011), emphasised that NPS as a metric is insufficient. NPS as a management system requires:

1. **Measurement** -- Regular, consistent surveying at key touchpoints (post-purchase, post-support, quarterly relationship surveys)
2. **Analysis** -- Segmentation of NPS by customer cohort, product line, geography, and channel to identify specific drivers
3. **Action** -- Operational processes that translate NPS insights into product, service, and experience improvements
4. **Accountability** -- NPS targets integrated into team and individual performance metrics
5. **Closed-Loop Feedback** -- Direct follow-up with detractors (within 24-48 hours) and promoters

---

## Prompts

**Prompt 1 -- NPS Programme Design:**
> "Design an NPS measurement programme for my business: [describe company, product, customer segments, and current feedback mechanisms]. Specify: (1) which customer touchpoints to survey, (2) survey frequency, (3) how to segment results for actionable insight, (4) the closed-loop process for detractors and promoters, and (5) how to integrate NPS into our existing metrics dashboard."

**Prompt 2 -- NPS Results Analysis:**
> "Analyse these NPS results: Overall NPS: [score]. Promoters: [%], Passives: [%], Detractors: [%]. Top reasons cited by promoters: [list]. Top reasons cited by detractors: [list]. Segment breakdown: [list NPS by segment]. Identify: (1) the highest-leverage improvement that would convert the most detractors, (2) the promoter insight we should amplify in marketing, (3) which customer segment requires the most urgent attention."

**Prompt 3 -- NPS-to-Revenue Modelling:**
> "Model the revenue impact of improving our NPS from [current score] to [target score]. Assume: average customer lifetime value of [$X], current customer count of [N], annual churn rate of [X%], and referral rate of [X%] among promoters. Calculate the expected impact on: (1) retained revenue from reduced churn, (2) new revenue from increased referrals, (3) reduced support costs from fewer detractors."

**Prompt 4 -- Competitive NPS Benchmarking:**
> "Benchmark our NPS of [score] against [industry/sector] standards. Identify where we stand relative to: (1) industry average, (2) industry leader, and (3) the NPS threshold that correlates with above-average growth in our sector. Based on the gap analysis, recommend three specific initiatives that companies in our sector have used to improve NPS by [target] points."

---

## Use Cases

**Validation-Stage Startup Measuring Product-Market Fit**

A B2B SaaS startup with 50 paying customers uses NPS as a product-market fit signal. Sean Ellis's "very disappointed" test (a close cousin of NPS) suggests that 40% "very disappointed" correlates with product-market fit; NPS provides a complementary lens. The startup's first NPS survey returns +12: 38% promoters, 36% passives, 26% detractors. The follow-up question reveals that promoters love the product's speed and simplicity, while detractors cite missing integrations and unreliable data exports. The NPS data provides a precise product roadmap: invest in integrations (converting detractors) before adding new features (which passives are not asking for). After two quarters of integration-focused development, NPS rises to +38, and the detractor-cited reasons shift from "missing features" to "wish it did more" -- a qualitatively different complaint that signals readiness to expand the product scope.

**Growth-Stage E-Commerce Company Identifying a Service Failure**

An e-commerce company with 10,000 monthly orders has an overall NPS of +42, which appears healthy. Segmented analysis tells a different story: NPS among first-time buyers is +55, but NPS among repeat buyers is +18 and declining. The follow-up responses from repeat-buyer detractors cluster around two themes: inconsistent delivery times and a loyalty programme that feels "pointless." The segmentation reveals a retention crisis invisible in the aggregate score. The company redesigns its logistics partnerships (addressing delivery consistency) and replaces its points-based loyalty programme with a tier-based system offering tangible benefits (free shipping, early access). Within two quarters, repeat-buyer NPS rises to +39, and the cohort-level analysis shows that the company had been unknowingly operating two different businesses -- one excellent (acquisition) and one mediocre (retention).

**Scale-Stage Platform Embedding NPS in Operational Governance**

A marketplace platform with 500,000 active users implements NPS as a core governance metric across the organisation. Each product team owns a touchpoint NPS: onboarding NPS (product team A), transaction NPS (product team B), support NPS (customer experience team), and overall relationship NPS (executive team). Monthly NPS reviews surface anomalies: a sudden 15-point drop in transaction NPS among a specific user segment leads to the discovery of a payment processing bug that affected 3% of transactions but generated outsized negative sentiment. The bug was invisible in aggregate metrics but immediately visible in segmented NPS. Resolution within 48 hours, followed by closed-loop outreach to affected users, recovers the score within one month.

---

## Anti-Patterns

**Score Worship.** Obsessing over the NPS number while ignoring the qualitative data and the closed-loop process. The score is a thermometer; it tells you the temperature but not the disease. Companies that celebrate NPS milestones without acting on the underlying feedback have built a vanity metric, not a management system.

**Survey Fatigue.** Surveying customers after every interaction, every transaction, and every support ticket. Over-surveying depresses response rates, biases results toward people with strong opinions (both positive and negative), and annoys the very customers you aim to delight. Survey at the moments that matter; leave the rest alone.

**Gaming the Score.** Instructing frontline staff to ask only happy customers for feedback, or designing the survey flow to nudge toward higher scores. NPS gaming is organisationally corrosive because it destroys the metric's diagnostic value. When the score stops reflecting reality, leadership loses its most important feedback channel precisely when it needs it most.

**Ignoring Passives.** The NPS formula excludes passives, which leads many companies to ignore them operationally. This is a strategic error. Passives are the largest swing group: converting even a fraction of passives to promoters has a larger impact on NPS (and revenue) than converting detractors, because the conversion effort is typically smaller and the base is larger.

**Using NPS as the Only Customer Metric.** NPS measures loyalty intent, not loyalty behaviour. Customer satisfaction (CSAT), customer effort score (CES), churn rate, expansion revenue, and referral attribution each capture dimensions that NPS cannot. NPS works best as the keystone metric in a broader measurement system, not as a standalone indicator.

---

## By Stage

| Stage | Focus | Key Difference |
|-------|-------|----------------|
| Validation | Signal for product-market fit | NPS above +30 with a small, representative sample is a strong PMF indicator |
| Early Traction | Identify the highest-impact product improvements | Detractor feedback is the most efficient product roadmap input at this stage |
| Growth | Build the NPS management system | Transition from periodic measurement to continuous, segmented, closed-loop operations |
| Scale | Embed NPS in organisational governance | NPS by team, touchpoint, segment, and geography drives accountability and surfaces problems at scale |

At the validation stage, NPS should be measured with small samples (30-50 responses are sufficient for directional signal) and analysed primarily for qualitative patterns. The score matters less than what promoters and detractors say about why they scored as they did.

During growth, the critical transition is from NPS as a metric (measured quarterly, reported to the board) to NPS as a system (measured continuously, segmented by touchpoint, with closed-loop processes for detractors and promoters). Companies that make this transition early build a structural advantage in customer retention that compounds over time.

At scale, NPS becomes a governance instrument. Product teams own their touchpoint NPS. Executives own the relationship NPS. The gap between touchpoint scores and relationship score reveals the systemic issues that no single team can diagnose alone.

---

## Output Template

**Target Audience: Customer Experience Team / VP Customer Success**

```markdown
# NPS Report: [Company Name]
## Period: [Date Range]

### Score Summary
- **Overall NPS:** [Score] (Previous period: [Score], Change: [+/- N])
- **Promoters:** [N] ([X%])
- **Passives:** [N] ([X%])
- **Detractors:** [N] ([X%])
- **Response rate:** [X%] (from [N] surveys sent)

### Trend
| Period | NPS | Promoters % | Passives % | Detractors % |
|--------|-----|-------------|------------|--------------|
| [Period -3] | [Score] | [%] | [%] | [%] |
| [Period -2] | [Score] | [%] | [%] | [%] |
| [Period -1] | [Score] | [%] | [%] | [%] |
| [Current] | [Score] | [%] | [%] | [%] |

### Segmented NPS
| Segment | NPS | Sample Size | Change | Alert? |
|---------|-----|-------------|--------|--------|
| [Segment 1] | [Score] | [N] | [+/- N] | [Y/N] |
| [Segment 2] | [Score] | [N] | [+/- N] | [Y/N] |
| [Segment 3] | [Score] | [N] | [+/- N] | [Y/N] |

### Key Drivers
**Why Promoters Promote (Top 3):**
1. [Theme] -- cited by [N]% of promoters
2. [Theme] -- cited by [N]% of promoters
3. [Theme] -- cited by [N]% of promoters

**Why Detractors Detract (Top 3):**
1. [Theme] -- cited by [N]% of detractors -- Owner: [Team] -- Status: [Action taken]
2. [Theme] -- cited by [N]% of detractors -- Owner: [Team] -- Status: [Action taken]
3. [Theme] -- cited by [N]% of detractors -- Owner: [Team] -- Status: [Action taken]

### Closed-Loop Status
- Detractors contacted within 48 hours: [X%]
- Detractors with resolved issues: [X%]
- Promoters thanked and asked for referral: [X%]

### Revenue Impact Estimate
- Estimated revenue at risk from detractors: [$X] (based on [churn rate] and [LTV])
- Estimated referral revenue from promoters: [$X] (based on [referral rate] and [LTV])
- Net loyalty-driven revenue impact: [+/- $X]

### Priority Actions
1. [Action] -- Target: Convert [X]% of [segment] detractors -- Owner: [Name] -- Deadline: [Date]
2. [Action] -- Target: Shift [X]% of passives to promoters -- Owner: [Name] -- Deadline: [Date]
3. [Action] -- Target: Amplify promoter advocacy through [channel] -- Owner: [Name] -- Deadline: [Date]
```

---

## Related Skills

- **[Balanced Scorecard](balanced-scorecard.md)** -- NPS is the most common metric in the Customer perspective of the Balanced Scorecard; the scorecard provides the strategic context for how NPS connects to financial outcomes through the causal chain.
- **[Product Life Cycle](product-life-cycle.md)** -- NPS behaves differently across product lifecycle phases; introduction-phase NPS is volatile, growth-phase NPS typically rises, maturity-phase NPS stabilises, and decline-phase NPS deteriorates.
- **[Systems Thinking](systems-thinking.md)** -- NPS operates within a system of feedback loops; promoters drive referrals that bring new promoters (reinforcing loop), while detractors drive negative word-of-mouth that deters potential customers.
- **[SMART Goals](smart-goals.md)** -- NPS targets must be SMART to drive action; "improve NPS" is a wish, while "increase enterprise NPS from +25 to +40 by Q3 through onboarding redesign" is an actionable commitment.
- **[Reader Psychology](../writing/reader-psychology.md)** -- The follow-up question that produces qualitative NPS insight depends on how you frame and present the survey; reader psychology principles improve response rates and data quality.
- **[Tipping Point](tipping-point.md)** -- Promoters are the engine of Gladwell's social epidemics; NPS identifies and quantifies the advocacy base whose word-of-mouth drives organic growth past the tipping point.
