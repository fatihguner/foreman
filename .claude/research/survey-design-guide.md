---
name: "survey-design-guide"
description: "Guides entrepreneurs through designing, distributing, and analyzing surveys for quantitative customer research. Covers question design, sample sizing, bias prevention, and statistical interpretation. Complements the customer-interview-guide for qualitative depth."
research_type: "customer"
feeds_into_skills:
  - net-promoter-score
  - product-market-fit-diagnosis
  - pricing-research-guide
  - four-ps-marketing
feeds_into_templates: []
estimated_time: "6-10 hours"
data_sources:
  - SurveyMonkey
  - Typeform
  - Google Forms
  - Qualtrics
  - Pollfish
  - Prolific
author: "Fatih Guner"
---

# Survey Design Guide

Surveys are seductive. They promise the comfort of numbers — percentages, averages, distributions — without the awkwardness of sitting across from a real human and hearing uncomfortable truths. That seduction is the danger. A poorly designed survey does not merely fail to produce insight; it produces false insight with the veneer of statistical credibility. The founder who ships a product because "73% of respondents said they'd buy it" has not validated demand. They have validated their ability to write a leading question.

This guide treats survey design as a research discipline, not a clerical task. The distance between a useful survey and a misleading one is measured in the precision of your questions, the representativeness of your sample, and the honesty of your interpretation.

---

## What You'll Learn

- When to use a survey versus an interview (and when to use both)
- How to write questions that produce unbiased, actionable data
- The minimum sample size needed for statistical confidence in your findings
- Which distribution channel matches your audience and budget
- How to calculate and interpret NPS, satisfaction scores, and preference rankings
- A framework for identifying and mitigating survey bias

---

## Data Sources

| Source | What It Provides | Free/Paid | Access |
|--------|-----------------|-----------|--------|
| Google Forms | Basic survey creation with branching logic and auto-charting | Free | forms.google.com |
| Typeform | Conversational survey format with higher completion rates | Freemium (10 responses free) | typeform.com |
| SurveyMonkey | Full survey platform with templates, logic, and analysis | Freemium (limited free) | surveymonkey.com |
| Qualtrics | Enterprise-grade survey with advanced logic, conjoint, and analytics | Paid (academic access often free) | qualtrics.com |
| Pollfish | Access to consumer survey panels with demographic targeting | Paid (per response) | pollfish.com |
| Prolific | Academic-quality participant panel with pre-screening | Paid (per response) | prolific.com |
| Hotjar | In-app surveys triggered by user behavior | Freemium | hotjar.com |
| Cint/Lucid | Programmatic access to survey panels at scale | Paid | cint.com |

---

## Research Protocol

**Step 1 — Define the Research Question**
Write one sentence describing what decision this survey will inform. Not "learn about our customers" but "determine whether price or feature set is the primary purchase barrier for mid-market prospects." Every question in the survey must serve this sentence.

**Step 2 — Choose Survey vs. Interview (or Both)**
Surveys provide breadth: patterns across many respondents. Interviews provide depth: the reasoning behind behavior. Use a survey when you need to quantify something you already understand qualitatively. If you cannot yet articulate the possible answers, start with interviews — then survey to measure frequency across a population.

**Step 3 — Design Questions (Maximum 10-12)**
Each question earns its place by directly serving your research question. Apply these rules:
- One concept per question (never double-barreled: "How satisfied are you with our price and quality?")
- Neutral wording (not "How much do you love our product?" but "How would you rate your experience?")
- Specific timeframes ("In the past 30 days..." not "Do you ever...")
- Balanced scales (5-point Likert with a neutral midpoint); demographics last; open-ended questions limited to 1-2

**Step 4 — Pilot with 5 People**
Send the draft to five people who resemble your target audience. Watch them take it (screen share or in person). Note where they hesitate, re-read, or misinterpret. Revise. A $0 pilot prevents a $5,000 wasted panel spend.

**Step 5 — Calculate Target Sample Size**
For a 95% confidence level with +/- 5% margin of error, you need roughly 385 responses regardless of population size (for populations above 10,000). For smaller populations, use the formula: n = (Z^2 * p * (1-p)) / e^2, where Z=1.96, p=0.5, e=0.05. Adjust for expected response rate — if you anticipate 20% response, you need to reach 5x your target sample.

**Step 6 — Distribute**
Match channel to audience:
- **Email list:** High trust, moderate response rate (15-30%). Best for existing customers.
- **In-app prompt:** High relevance, captures active users. Risk of annoying power users.
- **Social media:** Broad reach, self-selection bias. Useful for awareness-stage research.
- **Panel (Pollfish/Prolific):** Representative samples on demand. Cost: $1-5 per response.

**Step 7 — Analyze Results**
Wait until you reach your target sample before analyzing. For Likert scales, report both the mean and the distribution (a mean of 3.5 with bimodal clustering at 1 and 5 tells a different story than a tight cluster at 3-4). Cross-tabulate by key demographics. Flag any question with more than 15% non-response — it likely confused respondents.

**Step 8 — Cross-Validate with Qualitative Data**
Survey numbers answer "how many" but not "why." Pair surprising findings with 3-5 follow-up interviews targeting respondents who gave unexpected answers. This prevents the most common survey mistake: confident misinterpretation.

---

## Data Collection Template

### Survey Blueprint

| # | Question Text | Type | Purpose (What Decision It Informs) |
|---|--------------|------|-----------------------------------|
| 1 | | Likert / MC / Open / NPS | |
| 2 | | Likert / MC / Open / NPS | |
| 3 | | Likert / MC / Open / NPS | |
| ... | | | |

### Distribution Plan

| Channel | Audience Segment | Expected Reach | Expected Response Rate | Target Responses |
|---------|-----------------|---------------|----------------------|-----------------|
| | | | % | |
| | | | % | |
| **Total** | | | | |

### Results Summary

| Question | n (responses) | Mean / Top Answer | Distribution Pattern | Notable Segment Differences |
|----------|--------------|------------------|---------------------|-----------------------------|
| | | | Normal / Skewed / Bimodal | |
| | | | Normal / Skewed / Bimodal | |

---

## Interpretation Guide

**NPS interpretation:** Net Promoter Score ranges from -100 to +100. Above 0 is acceptable, above 30 is strong, above 70 is exceptional. More valuable than the score itself is the segmentation: which customer types are promoters versus detractors, and what distinguishes them?

**Likert scale patterns:** A mean of 4.2 on a 5-point scale with low variance indicates genuine satisfaction. A mean of 3.0 with high variance indicates a polarized audience — two distinct groups with opposing views. The second scenario demands segmentation, not averaging.

**Statistical significance:** With 385 responses, a 10-percentage-point difference between two groups is statistically significant. A 3-percentage-point difference is not. Resist the temptation to build strategy on noise.

**Response rate as data:** A 5% response rate from a customer email is itself a finding — your customers may not be engaged enough to spend 3 minutes on a survey. Consider what non-response tells you before fixating on what responders said.

---

## Common Pitfalls

- **Leading questions.** "Don't you agree that our product saves time?" produces affirmative data that reflects the question's bias, not the respondent's belief. Write questions a stranger could answer without knowing your preferred outcome.
- **Survivorship bias in distribution.** Surveying only active customers about satisfaction excludes the people who were dissatisfied enough to leave. If churn is your concern, you need to reach churned users — a fundamentally different distribution challenge.
- **Survey fatigue inflation.** A 25-question survey with a 12% completion rate produces self-selected data from the most patient (or most opinionated) respondents. Keep surveys under 5 minutes.
- **Treating ordinal data as interval.** A "4" on a Likert scale is not twice a "2." Report medians and distributions alongside means.

---

## Output

Package your survey research for use in the following Foreman components:

- **net-promoter-score** — NPS question results feed directly into the NPS framework. Include the score, the promoter/passive/detractor breakdown, and segment-level differences.
- **product-market-fit-diagnosis** — The Sean Ellis question ("How disappointed would you be if you could no longer use this product?") is a single-question survey. Results above 40% "very disappointed" indicate product-market fit.
- **pricing-research-guide** — Van Westendorp or Gabor-Granger pricing questions from your survey feed the pricing sensitivity analysis. Transfer the acceptable price range and willingness-to-pay distribution.
- **four-ps-marketing** — Customer preference data, satisfaction drivers, and channel effectiveness findings inform the Product, Price, Place, and Promotion dimensions.

Transfer response counts, key distributions, and the cross-tabulation tables. Note the confidence interval for each major finding and flag any result where sample size was below your target.
