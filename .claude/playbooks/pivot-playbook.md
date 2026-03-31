---
name: "pivot-playbook"
description: "Used when a founder suspects the current direction has stalled and is weighing whether to pivot, what to pivot toward, and how to communicate the change. Chains diagnosis, strategic analysis, model redesign, scenario testing, decision-making, and narrative framing into a single engagement."
trigger_diagnostics:
  - growth-stall-diagnosis
  - product-market-fit-diagnosis
  - decision-paralysis-diagnosis
steps:
  - skill: "product-market-fit-diagnosis"
    purpose: "Validate whether product-market fit is genuinely broken or merely underperforming"
    output: "PMF assessment with evidence: retention curves, activation rates, qualitative signal analysis"
  - skill: "swot-pest-analysis"
    purpose: "Map the current position with brutal honesty before designing alternatives"
    output: "SWOT matrix and PEST scan revealing structural vs. tactical weaknesses"
  - skill: "business-model-canvas"
    purpose: "Redesign the business model around validated assumptions"
    output: "Revised canvas with highlighted changes from the current model"
  - skill: "scenario-planning"
    purpose: "Stress-test three distinct pivot scenarios against plausible futures"
    output: "Three scenario narratives with probability-weighted outcomes"
  - skill: "evaluating-and-deciding"
    purpose: "Make the pivot/stay/adjust decision with a margin of safety"
    output: "Decision rationale with reversibility assessment and kill criteria"
  - skill: "storytelling-for-leaders"
    purpose: "Frame the pivot narrative for team alignment and investor confidence"
    output: "Pivot narrative arc with audience-specific messaging"
final_outputs:
  - decision-rationale-memo
  - action-plan
estimated_duration: "4-8 hours across 1-2 weeks"
complexity: "advanced"
stage:
  - validation
  - early-traction
author: "Fatih Guner"
---

# The Pivot Playbook

## When to Use This Playbook

Growth has flatlined. The metrics that once trended upward now move sideways or worse. Customers churn faster than they arrive. The founder senses something structural is wrong but cannot distinguish between a product problem, a market problem, and a model problem. The temptation is to change everything at once or change nothing at all. Both instincts are wrong.

This playbook applies when the question is genuinely "should we pivot?" -- not "should we optimize?" If the core product works but distribution is broken, the answer is probably operational, not strategic. The diagnostic steps that follow will make that distinction explicit.

## Prerequisites

- At least 3-6 months of operating data (revenue, retention, activation, NPS)
- Honest founder willingness to hear that the current model may be dead
- Access to at least 5-10 recent customer conversations or churn interviews
- A clear picture of current runway (the clock disciplines the analysis)

## The Sequence

### Step 1: Product-Market Fit Diagnosis
- **Purpose:** Before redesigning anything, confirm the diagnosis. Most founders who say "we need to pivot" are actually experiencing a distribution or pricing problem dressed up as a PMF failure. This step forces evidence-based assessment.
- **Key questions:** Do retained customers love the product? Is churn driven by the wrong customers or the wrong product? Where does the activation funnel break?
- **Input:** Retention data, NPS scores, churn interviews, activation metrics
- **Output:** PMF assessment with a clear verdict: broken, weak, or misdiagnosed
- **Time:** 1-2 hours
- **Checkpoint:** If PMF is intact but underperforming, the problem may be execution rather than direction. Pause before proceeding.

### Step 2: SWOT-PEST Analysis
- **Purpose:** Map the full strategic landscape. A pivot made without understanding external forces is just a guess in a new direction. PEST reveals macro-tailwinds and headwinds; SWOT reveals internal capability gaps.
- **Key questions:** Which weaknesses are fixable? Which threats are structural? Are there external shifts that change the opportunity space?
- **Input:** PMF assessment from Step 1, market data, competitive intelligence
- **Output:** Combined SWOT-PEST matrix with color-coded severity
- **Time:** 1-1.5 hours
- **Checkpoint:** The matrix must be honest. If every box is filled with optimism, start over with a skeptic in the room.

## Decision Point

After completing Steps 1 and 2, the founder faces a fork:

**Is this a pivot problem or an execution problem?**

- If the SWOT reveals that strengths are strong, the product retains users who find it, and PEST shows favorable conditions -- this is an execution problem. Exit this playbook. Route to `operational-chaos-diagnosis` and focus on distribution, pricing, or team capacity.
- If the evidence shows genuine PMF failure, structural market headwinds, or a business model that cannot reach unit economics -- continue to Step 3.

The discipline to exit a playbook mid-sequence is more valuable than the discipline to complete it.

### Step 3: Business Model Canvas
- **Purpose:** Redesign the model from the ground up. The canvas forces explicit choices about value proposition, customer segments, channels, and revenue streams -- the four areas where pivots actually happen.
- **Key questions:** Which canvas block is most broken? Can you pivot one block without rebuilding everything? What assumptions does the new model rest on?
- **Input:** SWOT-PEST output, PMF failure analysis, competitive gaps identified
- **Output:** Revised Business Model Canvas with changes highlighted against the current model
- **Time:** 1-2 hours
- **Checkpoint:** The revised canvas must contain at least one falsifiable assumption. If it cannot be proven wrong within 30 days, it is not a pivot hypothesis -- it is wishful thinking.

### Step 4: Scenario Planning
- **Purpose:** A single pivot direction is a bet. Three scenarios with probability-weighted outcomes transform a bet into a strategy. This step stress-tests the revised model against optimistic, baseline, and adverse futures.
- **Key questions:** What happens if the new market is smaller than estimated? What if a competitor moves first? What does the adverse scenario look like at current burn rate?
- **Input:** Revised Business Model Canvas, PEST macro-factors, runway data
- **Output:** Three scenario narratives with financial implications and trigger points for each
- **Time:** 1-1.5 hours
- **Checkpoint:** If the adverse scenario leads to company death within 3 months, the pivot must be sequenced more conservatively or the founder must secure bridge funding first.

### Step 5: Evaluating and Deciding
- **Purpose:** Synthesize all preceding analysis into a single, defensible decision. This step applies margin-of-safety thinking -- the decision must survive being partially wrong.
- **Key questions:** What is the cost of being wrong? Is this decision reversible? What kill criteria will trigger a second pivot?
- **Input:** Scenario outputs, canvas comparison, PMF verdict
- **Output:** Written decision rationale with explicit kill criteria and 90-day milestones
- **Time:** 0.5-1 hour
- **Checkpoint:** The decision rationale must be presentable to a skeptical board member. If it cannot survive five minutes of adversarial questioning, it is not ready.

### Step 6: Storytelling for Leaders
- **Purpose:** A pivot that the team does not understand is a pivot that fails in execution. This step crafts the narrative -- not spin, but a coherent story that connects the old direction, the evidence, the decision, and the new path.
- **Key questions:** What is the honest story of why the old direction failed? What gives the team confidence that the new direction is grounded in evidence rather than panic?
- **Input:** Decision rationale, scenario analysis, PMF evidence
- **Output:** Pivot narrative with versions for team (motivational but honest) and investors (evidence-driven with financial clarity)
- **Time:** 0.5-1 hour
- **Checkpoint:** Read the narrative aloud. If it sounds like corporate spin, rewrite it. The team will detect insincerity faster than any investor will.

## Final Deliverable

| Template | Audience | Purpose |
|----------|----------|---------|
| `decision-rationale-memo` | Investors, board | Evidence-based case for the pivot with financial projections and kill criteria |
| `action-plan` | Team | 90-day execution plan with milestones, owners, and dependencies |

## Common Pitfalls

1. **Pivoting away from traction.** Some founders pivot because the business is not growing fast enough, even when a loyal customer segment exists. Confirm that retention is genuinely broken before abandoning ship.
2. **Confusing a pivot with a rebrand.** Changing the name, website, and messaging without changing the value proposition or customer segment is not a pivot. The canvas must show structural changes.
3. **Running the playbook alone.** The founder who decides to pivot in isolation and then announces it has already lost the team. Involve at least one co-founder or senior team member in Steps 3-5.
4. **Skipping the kill criteria.** A pivot without defined failure conditions becomes an infinite runway of hope. Set explicit 90-day checkpoints before executing.
5. **Over-communicating certainty.** The pivot narrative should convey conviction grounded in evidence, not omniscience. Teams respect honesty about uncertainty more than false confidence.

## Adaptation Notes

- **Validation stage:** The pivot may be a model pivot (same problem, different solution) or a customer pivot (same solution, different segment). At this stage, pivots should be fast and cheap -- weeks, not months.
- **Early-traction stage:** Pivots here carry higher stakes because real customers and revenue exist. The communication step (Step 6) becomes disproportionately important. Expect investor conversations to be harder.
- At either stage, runway is the binding constraint. Every step in this playbook should be calibrated against the time remaining, not the time desired.
