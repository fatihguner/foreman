---
name: "product-market-fit-playbook"
description: "Provides a systematic, iterative approach to searching for product-market fit -- from mapping assumptions through measuring signals, running rapid experiments, and establishing kill criteria for pivot-or-persist decisions. Use when pre-PMF, when retention is flat despite iterations, or when the founder suspects they are solving the wrong problem."
version: "1.0.0"
category: "playbooks"
complexity: "advanced"
stage:
  - idea
  - validation
trigger_diagnostics:
  - product-market-fit-diagnosis
  - revenue-diagnosis
steps:
  - skill: "business-model-canvas"
    purpose: "Map current assumptions about the business model -- every block is a hypothesis until validated by revenue"
    output: "Annotated Business Model Canvas with each block rated by evidence level: validated, partially validated, or assumption"
  - skill: "four-ps-marketing"
    purpose: "Define the initial value proposition and customer segment with enough precision to test"
    output: "Product-market hypothesis stating who the customer is, what the product does for them, and why they would pay"
  - skill: "net-promoter-score"
    purpose: "Design a measurement system for PMF signals -- retention, referral, and willingness to pay"
    output: "PMF measurement framework with NPS baseline, retention cohort design, and leading indicator dashboard"
  - skill: "creative-practice-and-habit"
    purpose: "Establish rapid experimentation habits that sustain through ambiguity and repeated failure"
    output: "Experimentation cadence with weekly rhythm, hypothesis format, minimum viable test criteria, and documentation practice"
  - skill: "defining-and-exploring-problems"
    purpose: "Ensure you are solving the RIGHT problem -- the one customers have, not the one the founder assumed"
    output: "Problem validation report with customer evidence distinguishing the stated problem from the actual problem"
  - skill: "evaluating-and-deciding"
    purpose: "Create kill criteria -- explicit conditions under which you pivot, persevere, or shut down"
    output: "Decision framework with pivot triggers, perseverance criteria, and a structured process for the pivot-or-persist call"
final_outputs:
  - new-initiative-brief
  - unit-economics-snapshot
  - decision-journal
estimated_duration: "Ongoing -- 2-4 hours per iteration cycle, multiple cycles"
author: "Fatih Guner"
---

# Product-Market Fit Playbook

Marc Andreessen described product-market fit as "the only thing that matters," then offered almost no systematic guidance on how to find it. The concept is easy to recognize in retrospect -- customers pulling the product out of your hands, growth that feels organic rather than forced, retention curves that flatten instead of declining to zero. Prospectively, the search for PMF is closer to archaeology than engineering: you know something is buried, you have a general map of the terrain, but every dig site requires a hypothesis, a careful excavation, and the intellectual honesty to recognize when you have found a potsherd rather than a palace.

This playbook does not promise product-market fit. It provides a systematic process for searching -- one that replaces the founder's default mode of building features and hoping with a disciplined cycle of hypothesizing, testing, measuring, and deciding.

---

## When to Use This Playbook

- Pre-revenue and searching for the initial value proposition that customers will pay for
- Post-launch but retention is flat -- users try the product and leave
- Revenue exists but comes from discounts, favors, or unsustainable sales effort rather than genuine demand
- The founder has iterated multiple times without clear progress toward PMF
- Customer feedback is polite but noncommittal -- "interesting" rather than "I need this"
- The team is building features without a clear hypothesis about which ones matter

## Prerequisites

- A product or prototype that can be put in front of real customers (even if minimal)
- Access to at least 10-20 potential customers for conversation and testing
- Honest acknowledgment that PMF has not been achieved -- the founder who believes they have PMF but lacks the metrics to prove it is the hardest case
- Sufficient runway for 3-6 iteration cycles (if runway is under 3 months, prioritize survival over experimentation)

---

## The Sequence

### Step 1: Business Model Canvas -- Map the Assumptions

Before testing anything, make the assumptions explicit. Every box on the Business Model Canvas represents a hypothesis: who the customer is, what value proposition resonates, which channels reach them, how revenue is generated. Most founders carry these assumptions implicitly, never written down, never challenged. This step forces them onto paper and rates each by evidence level. A block supported by customer data is "validated." A block supported by the founder's intuition is "assumption." The canvas becomes a map of what you know, what you think you know, and what you are guessing -- and the distinction matters enormously for deciding what to test first.

**Checkpoint:** Annotated canvas completed. At least three blocks honestly rated as "assumption." The highest-risk assumption identified as the first test target.

### Step 2: Four Ps Marketing -- Define the Hypothesis with Precision

A hypothesis that cannot be proven wrong cannot guide you. "Customers will like our product" is not a hypothesis. "Mid-market SaaS CFOs with 50-200 employees will pay $500/month for automated financial consolidation because they currently spend 15 hours per month doing it manually" is a hypothesis. This step forces precision about the customer segment, the specific value proposition, the price point, and the distribution channel. The Four Ps framework -- product, price, place, promotion -- provides the structure. Each P must be specific enough to design a test around it.

**Checkpoint:** Written product-market hypothesis with falsifiable predictions. The hypothesis should be uncomfortable in its specificity -- if it feels safe, it is too vague to test.

---

### Decision Point: Signal Check

After establishing the measurement system in Step 3, the playbook enters an iterative cycle. The decision point recurs after every 2-3 iteration cycles.

**Are NPS and retention signals trending upward?** If yes, continue iterating within the current hypothesis space. The signal suggests the general direction is correct; the task is refinement. Proceed through Steps 4-6 and return to Step 2 with an updated hypothesis.

**Are signals flat after 3 iterations?** Flat signals after genuine experimentation -- not cosmetic changes but structural variations in the value proposition, customer segment, or pricing -- indicate a deeper problem. The hypothesis may be wrong at its foundation. Consider invoking the `pivot-playbook` to evaluate whether the entire direction requires rethinking.

**Are signals declining?** Declining signals after iterations suggest active misalignment between the product and the market. Stop iterating on the current hypothesis. Return to Step 5 (problem definition) to re-examine whether the problem itself is real, urgent, and underserved.

The discipline to read signals honestly -- neither inflating modest results into validation nor interpreting noise as failure -- is the central skill of the PMF search.

---

### Step 3: Net Promoter Score -- Build the Measurement System

You cannot find what you cannot measure, and most pre-PMF startups measure the wrong things. Revenue is a lagging indicator. Feature usage is ambiguous. The measurement system for PMF requires three components: a retention cohort analysis (are users from month one still active in month three?), an NPS or willingness-to-recommend metric (would customers be disappointed if the product disappeared?), and a leading indicator dashboard that the team reviews weekly. Design the system before running experiments so that every iteration produces data rather than anecdotes.

**Checkpoint:** Measurement framework operational. Baseline metrics captured. The team can answer "are we closer to PMF than last month?" with data rather than feelings.

### Step 4: Creative Practice and Habit -- Establish the Experimentation Rhythm

The search for PMF is a sustained creative effort, not a single heroic sprint. Most founders run one or two experiments, get ambiguous results, and then either give up on experimentation or retreat into feature-building. This step designs an experimentation cadence that survives discouragement: weekly hypothesis generation, rapid test design (minimum viable tests that produce signal within days, not months), disciplined documentation of results, and structured reflection on what was learned. The rhythm matters more than any single experiment.

**Checkpoint:** Experimentation rhythm established with a weekly cadence. First three experiments designed with clear hypotheses, test methods, and success criteria.

### Step 5: Defining and Exploring Problems -- Validate the Problem

The most dangerous assumption in any startup is that the problem is real. Founders fall in love with solutions and work backwards to justify the problem they solve. This step forces a return to the customer: does this problem actually exist in the way you imagine? Is it urgent enough that people seek solutions rather than tolerate the pain? Is it underserved -- or are existing solutions adequate and the market is not waiting for yours? The problem validation uses structured customer interviews, not the kind where the founder pitches the product and interprets polite interest as validation, but the kind where the founder listens for evidence of pain, urgency, and willingness to act.

**Checkpoint:** Problem validation report distinguishing founder assumptions from customer evidence. If the problem is real but the solution is wrong, return to Step 2. If the problem itself is misidentified, return to Step 1 and rebuild the canvas.

### Step 6: Evaluating and Deciding -- Set Kill Criteria

The search for PMF can consume a company. Without explicit criteria for when to persist, when to pivot, and when to stop, the founder's optimism bias extends the search well past the point of diminishing returns. This step creates a decision framework: what metrics, at what thresholds, after how many iterations, trigger each decision? Define the kill criteria before the emotions of the search cloud judgment. A startup that pivots with runway remaining has options. A startup that persists until the money runs out has none.

**Checkpoint:** Kill criteria documented with specific metrics, thresholds, and timelines. Decision journal initiated to track the reasoning behind each persist-or-pivot call.

---

## Final Deliverable

Upon completing each iteration cycle, compile and update the following outputs:

| Output | Template | Audience |
|--------|----------|----------|
| Experiment Brief | `new-initiative-brief` | Team, advisors |
| Unit Economics Snapshot | `unit-economics-snapshot` | Founders, investors |
| Decision Journal | `decision-journal` | Founders (internal reference) |

## Common Pitfalls

- **Confusing customer interest with product-market fit.** "That sounds interesting" is not validation. Revenue, retention, and referral are validation. Everything else is politeness.
- **Iterating on features instead of hypotheses.** Adding features without a clear hypothesis about which problem they solve and for whom produces a bloated product that pleases no one deeply.
- **Measuring activity instead of outcomes.** Signups, page views, and downloads are vanity metrics. Retention, NPS, and willingness to pay are PMF metrics. Measure what matters.
- **Refusing to talk to customers.** Building in isolation because customer conversations are uncomfortable is the most expensive form of avoidance in entrepreneurship.
- **Moving kill criteria when they are triggered.** Kill criteria exist to override the founder's optimism bias at the moment when that bias is strongest. Changing the goalposts because the data is unfavorable defeats the purpose entirely.

## Adaptation Notes

- **Idea-stage founders** should spend disproportionate time on Steps 1, 2, and 5 -- the hypothesis and problem validation. At this stage, writing code is often premature. Talk to fifty customers before building anything substantial.
- **Validation-stage founders** with a product in market should weight Steps 3 and 4 -- measurement and experimentation rhythm. The product exists; the question is whether it generates pull. Let the data guide iterations, not the roadmap.
- At both stages, the single greatest risk is the sunk cost fallacy: continuing to invest in a direction because of what has already been spent rather than what the evidence suggests. The decision journal in Step 6 exists specifically to counteract this.
