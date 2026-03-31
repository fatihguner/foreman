---
name: "evaluating-options"
description: "Provides six independent evaluation techniques for choosing among alternatives once they have been generated: joint evaluation (comparing options side by side rather than in isolation), the structural weaknesses of pros-and-cons lists and how to compensate, the Even Swaps method for rational trade-offs across incommensurable objectives, decision-making with limited data using satisficing and recognition-primed models, the CARVER six-part risk assessment tool, and a three-condition framework for calibrating when intuition is trustworthy versus dangerous. Use when evaluating multiple options against competing criteria, when a pros-and-cons list feels insufficient for a high-stakes choice, when trade-offs involve incomparable dimensions, when data is scarce and a decision cannot wait, when assessing risk across multiple assets or initiatives, or when debating whether to trust a gut feeling."
version: "1.0.0"
category: "decisions"
complexity: "advanced"
stage:
  - idea
  - validation
  - early-traction
  - growth
  - scale
tags:
  - evaluation
  - trade-offs
  - even-swaps
  - joint-evaluation
  - risk-assessment
  - carver
  - intuition
  - pros-and-cons
  - satisficing
  - decision-quality
related_skills:
  - decision-traps-and-roles
  - generating-solutions
  - defining-and-exploring-problems
  - evaluating-and-deciding
  - thinking-fast-and-slow
  - decision-making-under-pressure
author: "Fatih Guner"
---

# Evaluating Options

PROS-CONS TRAP. The pros-and-cons list is the most widely used decision tool in the world -- and it is fundamentally misleading, because it treats all factors as equal and all items as comparable. Benjamin Franklin popularised the method in 1772, and the business world has not materially improved upon it in the intervening 250 years. A list that places "strong brand fit" next to "high implementation cost" as if both carry identical weight, and then counts items on each side like ballots, is not analysis. It is arithmetic applied to incommensurable quantities. High-stakes decisions -- the kind that determine whether a company enters a market, acquires a competitor, or pivots its product -- demand evaluation methods that account for unequal weights, incomparable dimensions, and the structural biases that distort human judgment even when the data is sound. This skill assembles six such methods, each designed for a different evaluation challenge.

---

## The Toolkit

### Tool 1: Joint Evaluation

Research by Basu and Savani demonstrates that people are, on average, twenty-two percent more likely to choose the objectively best option when they evaluate all alternatives simultaneously rather than one at a time. The effect is robust across simple consumer choices and complex managerial decisions.

The mechanism is straightforward: when options are presented side by side, the mind compares directly across dimensions. When options are presented sequentially, the mind forms a holistic impression of each and then attempts to compare impressions -- a lossy process that discards the dimensional detail where differences actually live.

**Practical application:**
- When evaluating job candidates, lay all resumes on the table simultaneously rather than reviewing one, forming an opinion, and moving to the next
- When comparing vendors or partners, use a spreadsheet that displays all options in columns with attributes in rows -- never evaluate a vendor in isolation
- When assessing strategic alternatives, present all options in a single consequences table before any discussion begins

The bias toward sequential evaluation is strong: in one survey, participants reported evaluating options one at a time in roughly half of all decisions. Companies reinforce this by designing product pages and internal reports that present one option per screen. Resist the format. Demand the side-by-side view.

### Tool 2: Beyond Pros and Cons

The pros-and-cons list has three genuine strengths and three fatal weaknesses. Understanding both prevents the tool from being either abandoned prematurely or trusted beyond its competence.

**Strengths:**
- *Rigour of enumeration.* The discipline of listing factors forces consideration of dimensions that might otherwise be overlooked
- *Emotional distance.* The act of writing creates what psychologists call a "self-distanced perspective," reducing the risk of an amygdala hijack during high-stakes decisions
- *Simplicity.* The method requires no computational or analytical expertise

**Weaknesses:**
- *Narrow framing.* A pros-and-cons list evaluates one option (do it vs. don't) rather than comparing multiple alternatives. It is inherently binary
- *Unweighted factors.* Every item on the list counts equally. A "con" worth $50,000 occupies the same visual space as a "con" worth $5 million
- *Vulnerability to cognitive bias.* Overconfidence, the illusion of control, and the framing effect all operate freely within the format. The simplicity that makes the list accessible is the same simplicity that leaves it undefended against distortion

**When to use it:** As a preliminary thinking aid -- a first pass that surfaces the dimensions worth analysing. Never as the final evaluation instrument for a consequential decision.

**How to strengthen it:** If a pros-and-cons list must be used, assign explicit weights (1-10) to each factor and multiply by a confidence estimate. This converts the list from a ballot count into a rough weighted scoring model. The result is still imperfect, but materially less misleading.

### Tool 3: The Even Swaps Method

Developed by Hammond, Keeney, and Raiffa, the Even Swaps method provides a rational mechanism for making trade-offs among objectives that use entirely different units of measurement -- money versus time versus market share versus risk. The core insight: if you can make two alternatives equivalent on one dimension, that dimension drops out of the decision. Eliminate enough dimensions, and a clear winner emerges.

**The process:**

**Step 1: Build a consequences table.** List objectives down the left side, alternatives across the top. In each cell, describe the consequence of that alternative for that objective, using consistent units within each row.

**Step 2: Eliminate dominated alternatives.** If Alternative A is better than Alternative B on some objectives and no worse on all others, B is dominated and can be removed. Use a ranking table (replace descriptions with ordinal ranks) to make dominance visible in complex matrices.

**Step 3: Make even swaps.** Select two alternatives and an objective where they differ. Ask: "What change in Objective X would compensate for the difference in Objective Y?" Adjust one alternative's consequence accordingly. Now both alternatives are equivalent on Objective Y, which can be eliminated from consideration.

**Step 4: Iterate.** Repeat until one alternative dominates all others or only one objective remains.

**Example:** A Brazilian cola company choosing between franchising (lower profit, higher market share) and not franchising (higher profit, lower market share) determines that a three-percent increase in market share compensates for $15 million in lost profit. Adjusting the non-franchising alternative by swapping $15M profit for 3% market share makes profit equivalent across both options. The decision reduces to market share alone -- and franchising wins.

The method's power lies in forcing explicit value judgments. Most decision-makers never articulate how much of one objective they would sacrifice for another. The Even Swaps method makes these trade-offs visible, discussable, and auditable.

### Tool 4: The CARVER Risk Assessment

CARVER is a six-criteria scoring system originally developed during World War II for targeting analysis, now widely adopted in corporate risk management and strategic planning. It converts qualitative risk judgments into a comparable numeric framework.

| Criterion | Assesses | Score 1 (low) | Score 5 (high) |
|-----------|----------|---------------|----------------|
| **C**riticality | How essential the asset/initiative is to operations | Loss would not affect operations | Loss would halt operations |
| **A**ccessibility | How exposed the asset is to threats or competition | Extremely difficult to access or replicate | Easily accessed or replicated |
| **R**ecoverability | How quickly operations recover after loss | Replaced immediately, no downtime | Extremely difficult to replace, long downtime |
| **V**ulnerability | How well the asset withstands attack or disruption | Highly resilient | Highly vulnerable |
| **E**ffect | Broader impact across the business if compromised | No unfavourable impact | Very high economic, political, or social impact |
| **R**ecognizability | How visible the asset is as a target to adversaries | Not recognisable as valuable | Immediately recognisable |

Each asset, initiative, or option is scored 1-5 on all six criteria. The sum (maximum 30) provides a comparable risk ranking. The framework is equally useful for offensive analysis (which competitor vulnerability to exploit, which market to enter) and defensive analysis (which asset to protect, which risk to mitigate first).

**Entrepreneurial applications:**
- Compare two market-entry strategies by scoring each on all six CARVER criteria
- Assess which product line is most vulnerable to competitive disruption
- Prioritise security and operational investments across multiple locations or business units
- Defend a budget request to a board by presenting the numeric scoring alongside the qualitative reasoning

### Tool 5: Deciding with Limited Data

Most entrepreneurial decisions are made under conditions of radical uncertainty -- limited data, ambiguous signals, and time pressure that forecloses extended analysis. Two models from decision science address this reality.

**Satisficing.** Herbert Simon's concept: rather than optimising (evaluating all options to find the best), establish minimum acceptable thresholds on key criteria and select the first option that meets all of them. The method is rational, not lazy -- it recognises that the cost of extended search often exceeds the marginal value of finding a marginally better option. A founder hiring a first engineer does not need the best engineer on earth; the founder needs an engineer who clears the threshold on technical skill, cultural fit, and availability within the next thirty days.

**Recognition-Primed Decision-Making (RPD).** Gary Klein's research on fire commanders, military officers, and emergency physicians revealed that experienced decision-makers rarely compare options at all. Instead, they recognise the current situation as similar to one they have encountered before, mentally simulate the first plausible course of action, and execute if the simulation does not reveal fatal flaws. RPD is fast because it leverages pattern recognition built through years of domain experience. It is dangerous when applied outside one's domain or in novel situations that merely resemble familiar ones.

**When each applies:**

| Condition | Preferred Model |
|-----------|----------------|
| Many options, moderate time pressure, clear minimum thresholds | Satisficing |
| Few options, severe time pressure, deep domain experience | Recognition-primed decision-making |
| Novel situation, no domain experience, sufficient time | Neither -- use structured analytical methods (Even Swaps, CARVER) |

### Tool 6: When to Trust Intuition

Connson Chou Locke's framework identifies three conditions that must hold simultaneously for intuition to be reliable. When any condition is absent, intuition is unreliable and analytical methods should take precedence.

**Condition 1: Domain expertise.** Roughly ten years of deliberate practice in the specific domain, with repetition and feedback, are required to develop accurate intuitive judgment. A financial history professor's expertise does not extend to financial investment decisions. A successful B2B founder's intuition about consumer products is untested and therefore untrustworthy.

**Condition 2: Unstructured problem.** Intuition excels on problems that lack clear decision rules or objective criteria -- aesthetic judgments, political judgments, interpersonal dynamics. Problems with abundant data and clear rules are better served by algorithms, which outperform even experienced doctors in medical diagnosis because the human brain, facing large datasets, defaults to heuristics that introduce error.

**Condition 3: Time scarcity.** When the decision window is narrow and information is sparse, intuition may perform as well as analysis because there is insufficient data for analysis to exploit its advantage. However, time pressure alone does not validate intuition -- it merely removes the option of thorough analysis.

**The danger zone:** Intuition feels equally confident regardless of whether the conditions are met. The factory foreman who has spent twenty years reading a production floor has earned the right to trust a gut feeling about safety. The first-time founder who "just knows" that consumers will pay $200 for an untested product has not. The subjective sensation is identical; the reliability is not.

**The synthesis:** Use intuition to narrow the field, then subject the shortlisted options to analytical evaluation. Or use analysis to identify a few equally strong options, then let informed intuition break the tie. The error is not in using intuition at all -- it is in using intuition as a substitute for analysis when the conditions for reliable intuition are absent.

---

## Prompts

**Prompt 1 -- Joint Evaluation Matrix:**
> "I am evaluating [number] options for [decision] at my [stage] [sector] company. The options are: [list]. The objectives I care about are: [list]. Build a consequences table with options as columns and objectives as rows. Identify any dominated alternatives. Then recommend whether the remaining options should be evaluated using Even Swaps, CARVER, or weighted scoring, and explain why."

**Prompt 2 -- Even Swaps Walkthrough:**
> "I am choosing between [Option A] and [Option B]. Option A is better on [objective 1] but worse on [objective 2]. Walk me through the Even Swaps method: What change in [objective 1] would compensate for the difference in [objective 2]? Make the swap explicit, eliminate the now-irrelevant objective, and identify which option dominates. If neither dominates, suggest the next swap."

**Prompt 3 -- CARVER Risk Scoring:**
> "I need to compare the risk profiles of [two or more options/assets/markets]. Score each on the six CARVER criteria (Criticality, Accessibility, Recoverability, Vulnerability, Effect, Recognizability) on a 1-5 scale. Explain each score. Identify which option has the highest total risk score and recommend mitigation strategies for the top-scoring criteria."

**Prompt 4 -- Intuition Calibration:**
> "I have a strong gut feeling about [decision]. Before I act on it, calibrate my intuition against Locke's three conditions: (1) Do I have genuine domain expertise (ten-plus years of relevant experience with feedback)? (2) Is this an unstructured problem or one with clear data and rules? (3) Is time genuinely scarce, or am I using urgency as an excuse to avoid analysis? Based on this calibration, recommend whether I should trust my intuition, override it, or use it alongside a structured method."

---

## Use Cases

**Series A SaaS Company Choosing Between Two Acquisition Targets**

A vertical SaaS company in the logistics space evaluates acquiring either a competitor (overlapping customer base, complementary product) or a data-analytics startup (different customer base, adjacent technology). A consequences table with seven objectives (revenue synergy, technology fit, integration complexity, cultural alignment, customer overlap, price, and time to close) reveals that the competitor dominates on four objectives and ties on one but loses on technology fit and price. The Even Swaps method asks: how much technology advantage would compensate for the competitor's price premium? The team determines that the competitor's existing customer relationships, which would take three years to build organically, are worth more than the $2M price difference. A swap of $2M in price for three years of customer acquisition time makes price equivalent. Technology fit becomes the sole remaining differentiator -- but applying the CARVER framework to the analytics startup reveals a Recoverability score of 5 (the three key engineers could leave post-acquisition, and the technology would be extremely difficult to maintain). The competitor wins.

**Pre-Seed Founder Deciding Whether to Trust a Market Intuition**

A founder with twelve years of experience in enterprise security "just knows" that mid-market companies will pay for an automated compliance tool. Applying the intuition calibration: (1) Domain expertise -- yes, twelve years in the specific domain with direct customer feedback. (2) Unstructured problem -- partially; the question of whether a market exists for a new product category has both quantitative indicators (market size, competitor revenue) and qualitative dimensions (buyer psychology, urgency of pain). (3) Time scarcity -- no; the founder has not yet committed capital and has time to validate. Recommendation: the founder's intuition is credible enough to warrant action but not sufficient to skip validation. Use the gut feeling to select the beachhead market, then subject the hypothesis to structured analysis (customer interviews, willingness-to-pay tests, competitive mapping) before committing significant resources.

**Growth-Stage E-Commerce Brand Comparing Three Fulfilment Strategies**

A D2C brand at $15M ARR evaluates three fulfilment options: build an in-house warehouse, partner with a third-party logistics provider, and a hybrid model. The team's default approach -- a pros-and-cons list for each option -- produces three lists of unweighted factors that are impossible to compare. Switching to joint evaluation (all three options in a single table) immediately reveals that the hybrid model is practically dominated by the 3PL option: it has similar costs, worse operational complexity, and only a marginal advantage in brand control. Eliminating the hybrid reduces the decision to two options. The Even Swaps method asks: how much brand control would compensate for the $800K annual cost difference between in-house and 3PL? The team determines that brand control matters only for the premium product line (30% of revenue). An Even Swap of $800K for brand control over 30% of SKUs makes cost equivalent. The remaining differentiator is speed of implementation -- and the 3PL can launch in six weeks versus nine months for in-house. The 3PL wins, with a contract clause preserving the option to bring premium fulfilment in-house within eighteen months.

---

## Anti-Patterns

**Using pros-and-cons lists as the final evaluation method for consequential decisions.** The list is a brainstorming aid, not a decision tool. When the stakes are high -- hiring a co-founder, entering a market, accepting investment terms -- the unweighted, unstructured format of the list creates exactly the conditions under which cognitive biases thrive.

**Evaluating options sequentially when joint evaluation is feasible.** Reviewing one candidate resume, forming an impression, and then reviewing the next is twenty-two percent less effective than reviewing all resumes simultaneously. The sequential approach feels thorough; it is measurably inferior.

**Applying Even Swaps without first building a consequences table.** The method requires explicitly defined objectives and clearly described consequences. Attempting Even Swaps from memory or from informal notes introduces precisely the imprecision the method is designed to eliminate.

**Trusting intuition in novel domains.** The first-time founder entering a market with no prior experience, the engineer making a marketing judgment, the operator making a financial projection -- all are applying intuition in domains where it has not been calibrated. The subjective confidence is indistinguishable from calibrated intuition; the accuracy is not.

**Over-engineering evaluation for reversible decisions.** A full CARVER analysis for a landing page design or a Slack channel name is a misallocation of analytical capacity. Reserve structured evaluation for decisions where the cost of choosing wrong exceeds the cost of choosing carefully. For two-way doors, satisficing is the appropriate model.

**Ignoring the intangible criteria in CARVER scoring.** The "Effect" criterion captures second-order consequences -- reputational damage, employee morale, regulatory exposure -- that rarely appear in financial models. Scoring Effect as a 1 because the impact is non-financial is a category error that systematically underweights the criteria that matter most in high-stakes decisions.

---

## By Stage

| Stage | Primary Evaluation Challenge | Recommended Tools |
|-------|------------------------------|-------------------|
| Idea | Few options, radical uncertainty, minimal data. The founder is evaluating whether to pursue the idea at all. | Intuition calibration (is the founder's domain expertise sufficient to trust the gut?), satisficing (does the opportunity clear minimum thresholds on market size, founder-market fit, and feasibility?). |
| Validation | Multiple MVP approaches, customer segments, or pricing strategies to evaluate. Data is emerging but thin. | Joint evaluation of alternatives in a single consequences table. Could-vs-should thinking from the generating-solutions skill feeds into structured comparison here. Recognition-primed decision-making applies if the founder has deep domain experience. |
| Early Traction | Hiring, partnership, and product-roadmap decisions multiply. Each involves trade-offs across dimensions that resist direct comparison. | Even Swaps for trade-off-heavy decisions (e.g., hire a generalist vs. a specialist -- what skill breadth compensates for depth, and vice versa?). CARVER for assessing operational risks as complexity increases. |
| Growth | Strategic decisions (market entry, acquisition, platform migration) with long time horizons and high irreversibility. Multiple stakeholders with competing objectives. | Full Even Swaps process with a formal consequences table. CARVER for risk-ranking initiatives across the portfolio. Joint evaluation is non-negotiable -- no strategic decision should be evaluated in isolation. |
| Scale | Decisions are made across the organisation by people distant from the original context. Evaluation frameworks must be communicable and auditable. | Institutionalised consequences tables and CARVER assessments that create a paper trail. The intuition calibration framework becomes a coaching tool: training managers to recognise when their gut is calibrated and when it is not. |

A pattern across stages: the ratio of intuition to analysis should shift as data accumulates. At the idea stage, intuition (if domain-calibrated) may be the most efficient tool. At scale, the volume and availability of data make analytical methods both feasible and superior. The founder who trusted intuition at inception and still trusts it at $100M ARR has not evolved with the business -- the business has outgrown the founder's pattern library.

---

## Output Template

```markdown
# Option Evaluation Record

**Decision:** [one-sentence description]
**Date:** [date]
**Evaluation method(s) used:** [joint evaluation / Even Swaps / CARVER / intuition calibration / satisficing / combination]

## Consequences Table (Joint Evaluation)

| Objective | Weight (1-10) | Option A | Option B | Option C |
|-----------|---------------|----------|----------|----------|
| [objective 1] | [weight] | [consequence] | [consequence] | [consequence] |
| [objective 2] | [weight] | [consequence] | [consequence] | [consequence] |
| [objective 3] | [weight] | [consequence] | [consequence] | [consequence] |

## Dominated Alternatives
- [Option X] dominated by [Option Y] because: [reasoning]

## Even Swaps (if applicable)
- **Swap 1:** Changed [Option A]'s [Objective X] from [value] to [value] to compensate for difference in [Objective Y]. Objective Y eliminated.
- **Swap 2:** [repeat as needed]
- **Remaining differentiator:** [the objective that determines the final choice]

## CARVER Risk Scores (if applicable)

| Option | C | A | R | V | E | R | Total |
|--------|---|---|---|---|---|---|-------|
| Option A | [1-5] | [1-5] | [1-5] | [1-5] | [1-5] | [1-5] | [sum] |
| Option B | [1-5] | [1-5] | [1-5] | [1-5] | [1-5] | [1-5] | [sum] |

## Intuition Check
- **Domain expertise present?** [yes/no -- years, specific domain]
- **Problem type:** [structured / unstructured / mixed]
- **Time pressure:** [genuine / artificial]
- **Intuition reliability verdict:** [trust / override / use alongside analysis]

## Decision
**Chosen option:** [X]
**Primary reasoning:** [which evaluation method drove the choice and why]
**Confidence level:** [low / moderate / high]
**Key risk to monitor:** [the highest-scoring CARVER criterion or the weakest Even Swap assumption]
```

---

## Related Skills

- **[Decision Traps and Roles](decision-traps-and-roles.md)** -- The cognitive traps (anchoring, confirming evidence, framing) that distort evaluation are catalogued here along with counter-routines to apply before and during any evaluation.
- **[Generating Solutions](generating-solutions.md)** -- The prerequisite: alternatives must be generated before they can be evaluated; this sibling skill covers brainstorming failure modes, BrainSwarming, and question bursts.
- **[Defining and Exploring Problems](../thinking/defining-and-exploring-problems.md)** -- The 3-Lens Principle complements the Even Swaps method by surfacing second-order consequences and hidden opportunity costs.
- **[Evaluating and Deciding](../thinking/evaluating-and-deciding.md)** -- Covers margin of safety, irreversibility tests, execution fail-safes, and decision journals -- the phases that follow option evaluation.
- **[Thinking, Fast and Slow](../frameworks/thinking-fast-and-slow.md)** -- Kahneman's prospect theory explains why the framing trap distorts evaluation and why loss aversion makes people risk-seeking in the domain of losses.
- **[Negotiation Game Theory](../game-theory/negotiation-game-theory.md)** -- When evaluation involves bilateral value division, the Nash Product Solution provides the mathematical framework for identifying optimal splits between parties.
