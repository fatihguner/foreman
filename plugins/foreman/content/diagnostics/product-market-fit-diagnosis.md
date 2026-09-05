---
name: "product-market-fit-diagnosis"
description: "Performs deep-layer triage on product-market fit problems by distinguishing between solution-problem mismatch, wrong customer segment, premature scaling, feature bloat, and pricing-value disconnect. Use when a first-layer diagnostic identifies weak PMF signals, or when an entrepreneur reports usage without enthusiasm, retention without growth, or interest without revenue."
entry_symptoms:
  - "Customers use it but don't love it"
  - "Retention is low despite good acquisition"
  - "Mixed signals from NPS"
  - "People say it's nice but don't pay"
  - "We have users but no fans"
possible_diagnoses:
  - solution-looking-for-a-problem
  - right-problem-wrong-solution
  - right-solution-wrong-segment
  - premature-scaling
  - feature-bloat-masking-weak-core
  - pricing-value-disconnect
routes_to_skills:
  - business-model-canvas
  - net-promoter-score
  - four-ps-marketing
  - blue-ocean-strategy
  - product-life-cycle
  - disruptive-innovation
routes_to_templates:
  - unit-economics-snapshot
  - strategic-analysis-one-pager
author: "Fatih Guner"
---

# Product-Market Fit Diagnosis

## Entry Symptoms

The entrepreneur describes a paradox: metrics suggest traction, yet the business feels hollow. "People use it but nobody raves about it." "We have decent acquisition but retention is anaemic." "NPS is a confusing spread — some love it, some shrug." These are the telltale signs of product-market fit that is close enough to be dangerous and far enough to be fatal.

## Triage Questions

### Q1: The Sean Ellis Test — If your product disappeared tomorrow, what percentage of users would be very disappointed?

- **Under 20%** — product-market fit does not exist in meaningful form. Proceed to Q2 to determine why.
- **20-40%** — a kernel of fit exists in a subset. Proceed to Q3 to identify which subset.
- **Over 40%** — fit likely exists but something else is blocking growth. Proceed to Q4 and Q5.

### Q2: Did the product start from a specific customer pain, or from a technology or idea the team found interesting?

- **From a pain point discovered through customer research or personal experience** — the problem is real, but the solution may not match it well. Likely diagnosis: **right-problem-wrong-solution**. Confirm with Q4.
- **From a technology capability, an intellectual interest, or a market trend** — likely diagnosis: **solution-looking-for-a-problem**. The team built something clever before verifying someone needed it.
- **From a combination — real pain observed, then heavily reinterpreted through the team's lens** — proceed to Q3. The problem often lives in the translation.

### Q3: Who are the users who do love the product, and do they resemble your target customer?

- **The enthusiasts are a different segment from the one you're targeting** — likely diagnosis: **right-solution-wrong-segment**. The product works, but the go-to-market aims at the wrong audience.
- **There are no clear enthusiasts — satisfaction is lukewarm across the board** — likely diagnosis: **right-problem-wrong-solution** or **feature-bloat-masking-weak-core**. Proceed to Q4.
- **The enthusiasts match the target, but they're a small minority** — the value proposition resonates narrowly. Proceed to Q5 to determine whether the barrier is awareness or pricing.

### Q4: Which features do engaged users actually use, and how often?

- **Users engage deeply with one or two core features and ignore the rest** — the core has value, but the product is cluttered. Likely diagnosis: **feature-bloat-masking-weak-core**. Strip back to what works.
- **Usage is shallow and spread across many features — nothing dominates** — the product lacks a gravitational centre. Likely diagnosis: **right-problem-wrong-solution**. The architecture may need rethinking, not iteration.
- **Users engage frequently but in short sessions with declining return visits** — the product creates initial curiosity without lasting habit. Likely diagnosis: **right-problem-wrong-solution** compounded by weak retention mechanics.

### Q5: What happens when you raise the price or ask free users to pay?

- **Silence — no complaints, no conversions, people simply leave** — the product is valued at zero. Likely diagnosis: **pricing-value-disconnect** or **solution-looking-for-a-problem**.
- **Vocal resistance — "too expensive" — but users keep using the free version** — likely diagnosis: **pricing-value-disconnect**. The value exists but the pricing model fails to capture it.
- **Healthy conversion with minimal friction** — pricing is not the problem. Return to Q1 and Q3; the fit issue sits in audience reach or positioning, not value delivery.

### Q6: Is your growth organic (word of mouth, referrals) or entirely paid?

- **Almost entirely paid — turn off ads and growth stops** — the product lacks natural pull. Likely diagnosis: **premature-scaling**. The business is pouring fuel on a fire that has not yet caught.
- **Some organic growth but it plateaued early** — a ceiling exists. Likely diagnosis: **right-solution-wrong-segment** or **feature-bloat-masking-weak-core**.
- **Strong organic growth** — product-market fit likely exists. The problem sits elsewhere (pricing, ops, market size). Route to `revenue-diagnosis` or `pricing-diagnosis` for further triage.

## Diagnosis Map

| Diagnosis | Key Signals | Confirmation Path |
|-----------|------------|-------------------|
| **Solution looking for a problem** | Built from technology, not pain; Ellis test under 20%; users leave when asked to pay | Q1 shows low disappointment + Q2 shows idea-first origin |
| **Right problem, wrong solution** | Real pain identified but shallow/scattered usage; lukewarm satisfaction | Q2 shows pain-first origin + Q4 shows shallow engagement |
| **Right solution, wrong segment** | Enthusiasts exist but don't match target customer; messaging mismatch | Q3 shows segment divergence + Q1 shows partial fit |
| **Premature scaling** | Growth entirely paid; unit economics negative; team scaling ahead of demand | Q6 shows no organic pull + Q1 shows sub-40% disappointment |
| **Feature bloat masking weak core** | Deep usage on 1-2 features, rest ignored; product complexity rising | Q4 shows concentrated usage + Q3 shows diluted satisfaction |
| **Pricing-value disconnect** | Users stay on free tier; vocal price resistance; high engagement but no revenue | Q5 shows conversion failure + Q4 shows genuine usage |

## Routing

**Solution looking for a problem:**
1. Apply `business-model-canvas` — rebuild from customer segment and value proposition, not from product features
2. Apply `blue-ocean-strategy` — explore whether the solution creates value in a space the team has not considered
3. Output with `strategic-analysis-one-pager`

**Right problem, wrong solution:**
1. Apply `net-promoter-score` — identify what users actually value versus what the product delivers
2. Apply `business-model-canvas` — reconstruct the solution around validated pain points
3. Output with `unit-economics-snapshot`

**Right solution, wrong segment:**
1. Apply `four-ps-marketing` — realign positioning and channels to the segment that responds
2. Apply `blue-ocean-strategy` — determine if the responding segment represents a viable market
3. Output with `strategic-analysis-one-pager`

**Premature scaling:**
1. Apply `product-life-cycle` — confirm the product's actual maturity stage versus assumed stage
2. Apply `business-model-canvas` — stress-test whether the business model justifies current burn rate
3. Output with `unit-economics-snapshot`

**Feature bloat masking weak core:**
1. Apply `net-promoter-score` — isolate what drives loyalty from what creates noise
2. Apply `disruptive-innovation` — assess whether stripping down could unlock a focused value proposition
3. Output with `strategic-analysis-one-pager`

**Pricing-value disconnect:**
1. Apply `four-ps-marketing` — reconstruct the price-value equation
2. Apply `business-model-canvas` — evaluate alternative revenue models (subscription, usage-based, tiered)
3. Output with `unit-economics-snapshot`

## Red Flags

- **The founder has pivoted the value proposition more than three times in the past year without running structured experiments.** This pattern suggests reactive thrashing, not iterative learning. Before running another pivot, apply disciplined experiment design.
- **The company has raised significant capital and scaled the team ahead of product-market fit evidence.** Capital creates an illusion of progress. Premature scaling with venture funding is the leading cause of startup death — the runway masks the absence of pull.
- **NPS scores show extreme bipolarity (many 9-10s alongside many 1-3s, with little in between).** This often indicates two distinct products serving two distinct segments under one roof. The company may need to choose which product it actually is.
