---
name: "partnership-playbook"
description: "Structures the evaluation, negotiation, and design of strategic partnerships, alliances, and joint ventures. Chains game-theoretic analysis, competitive impact assessment, cooperative negotiation design, trust building, and deal execution into a rigorous sequence. Use when a partnership opportunity has emerged and the founder must decide whether to pursue it, how to negotiate it, and how to structure it for mutual value creation."
version: "1.0.0"
category: "playbooks"
complexity: "intermediate"
stage:
  - early-traction
  - growth
  - scale
trigger_diagnostics:
  - partnership-diagnosis
steps:
  - skill: "coalition-and-partnership-games"
    purpose: "Apply game theory to understand the strategic logic of the alliance — who benefits, who pays, and what incentives govern each party's behaviour"
    output: "Partnership game analysis covering payoff structures, Nash equilibria, and defection risks"
  - skill: "porters-five-forces"
    purpose: "Assess how the partnership reshapes competitive dynamics — for better and for worse"
    output: "Competitive impact assessment showing how the alliance alters supplier power, buyer power, rivalry, and barriers to entry"
  - skill: "cooperative-negotiation"
    purpose: "Design the value-creation framework that makes the partnership worth more than its parts"
    output: "Negotiation architecture with interests mapped, value-creation opportunities identified, and trade space defined"
  - skill: "trust-equation"
    purpose: "Build the relational foundation without which no contract can sustain a partnership"
    output: "Trust assessment of the prospective partner covering credibility, reliability, intimacy, and self-orientation"
  - skill: "delivering-the-deal"
    purpose: "Close and structure the agreement with terms that protect both parties and anticipate failure modes"
    output: "Deal term sheet with governance structure, exit provisions, performance milestones, and dispute resolution mechanisms"
final_outputs:
  - partnership-memo
  - negotiation-prep-sheet
  - stakeholder-map
estimated_duration: "4-8 hours across 1-2 weeks"
author: "Fatih Guner"
---

# Partnership Playbook

Partnerships destroy more value than they create. That is not cynicism — it is the base rate. The graveyard of strategic alliances is vast: well-intentioned collaborations that consumed management attention, created dependencies without delivering leverage, and ended in acrimony or quiet dissolution. The partnerships that succeed share a common trait: both parties understood the game they were playing before they sat down at the table. This playbook exists to ensure that understanding.

---

## When to Use This Playbook

- A potential partner has approached with an alliance proposal, and the founder must evaluate it rigorously
- The company is considering initiating a strategic partnership to access a capability, market, or distribution channel
- An existing partnership is underperforming and needs restructuring before it consumes more value than it creates
- A joint venture or co-development agreement is on the table, with significant resource commitments from both sides
- The founder senses an imbalance in the partnership dynamic but cannot articulate precisely where the asymmetry lies

## Prerequisites

- Clarity on what the company needs from a partnership (capability, distribution, credibility, capital)
- Basic financial data to assess the partnership's economic value — not just the strategic narrative
- Willingness to walk away if the analysis reveals the partnership destroys more value than it creates
- At least a preliminary understanding of the prospective partner's incentives and constraints

---

## The Sequence

### Step 1: Coalition and Partnership Games — Understand the Game Theory

Before any negotiation begins, understand the game you are playing. Map the payoff structures for both parties under cooperation and defection. Identify whether this is a repeated game (ongoing relationship with future interactions) or a one-shot game (single transaction), because the strategic calculus differs fundamentally. Assess the Shapley Value — what each party uniquely contributes that the other cannot replicate independently.

**Checkpoint:** The game analysis reveals whether value creation is genuinely mutual or whether one party captures disproportionate value. If the latter, the negotiation strategy in Step 3 must account for this asymmetry.

---

### Decision Point: Need or Want?

This distinction reshapes everything that follows.

**Need partnership:** The company requires something it cannot build, buy, or replicate within the relevant timeframe. A distribution channel into an inaccessible market. A regulatory licence held by the partner. A technology capability that would take two years to develop internally. Need implies a weaker negotiating position because the alternative to agreement (BATNA) is poor.

- **If need:** Accept the asymmetry honestly. Steps 3 and 5 become critical — the negotiation must extract maximum value within the constraints, and the deal structure must include protections against exploitation of the dependency. Invest more time in Step 4 (trust) because dependence without trust is vulnerability.

**Want partnership:** The company would benefit from the partnership but has viable alternatives — including doing nothing or building the capability internally. Want implies a stronger negotiating position and more leverage to design terms that reflect genuine mutual value.

- **If want:** The negotiation has more room for creativity. Steps 2 and 3 can focus on designing novel value-creation structures rather than protecting against downside risk. The deal in Step 5 can be more ambitious because walking away remains a credible option.

Document the honest assessment. Founders who tell themselves they "want" a partnership they actually "need" negotiate from a fantasy position and sign disadvantageous terms.

---

### Step 2: Porter's Five Forces — Assess Competitive Impact

A partnership does not exist in a vacuum — it restructures the competitive landscape. Map how the alliance changes each of the five forces. Does it increase buyer power by creating a larger combined entity? Does it reduce rivalry by aligning with a competitor? Does it raise barriers to entry for others or lower them for the partner? The forces analysis reveals second-order effects that the partnership's proponents often ignore in their enthusiasm.

**Checkpoint:** The analysis identifies at least one competitive risk created by the partnership — not just the benefits. Every alliance that strengthens one force weakens the company's independent position in another.

### Step 3: Cooperative Negotiation — Design the Value-Creation Framework

Move from positions to interests. Map what each party actually needs (not what they initially demand), identify the trade space where creative solutions exist, and design a negotiation architecture that expands the pie before dividing it. The cooperative framework does not mean being soft — it means being intelligent about where value can be created that neither party could access alone.

**Checkpoint:** The value-creation framework identifies at least two opportunities beyond the obvious transaction. If the partnership offers only a single axis of value, it is fragile.

### Step 4: Trust Equation — Build the Relationship Foundation

Contracts govern behaviour at the margin. Trust governs behaviour in the spaces between clauses. Assess the prospective partner across the four dimensions of the trust equation: credibility (do they have the expertise they claim?), reliability (do they follow through consistently?), intimacy (is candid communication possible?), and self-orientation (are they primarily serving their own interests?). Low trust in any dimension is not a deal-breaker — but it must be addressed in the deal structure.

**Checkpoint:** The trust assessment produces a specific action plan for building trust in the weakest dimension before the deal closes. If self-orientation scores high and the other three score low, reconsider the partnership entirely.

### Step 5: Delivering the Deal — Close and Structure

Structure the agreement with terms that anticipate success and failure. Define governance (who decides what), economics (how value and costs are shared), performance milestones (how progress is measured), exit provisions (how the partnership ends gracefully), and dispute resolution (how disagreements are handled before they become lawsuits). The deal structure should make it easy to succeed together and possible to separate without destruction.

**Checkpoint:** The term sheet passes the "adversarial board member" test. A sceptical advisor reviewing the terms should find them defensible, balanced, and clear.

---

## Final Deliverable

| Output | Template | Audience |
|--------|----------|----------|
| Partnership Memo | `partnership-memo` | Board, investors, leadership team |
| Negotiation Prep Sheet | `negotiation-prep-sheet` | Founder, negotiation team (internal) |
| Stakeholder Map | `stakeholder-map` | Founder, project lead |

## Common Pitfalls

1. **Partnering for credibility rather than capability.** Announcing a partnership with a recognizable name creates a press release, not a strategic advantage. If the partnership does not change the company's competitive position or operational capability, it is marketing — not strategy.
2. **Ignoring the game theory.** Founders who skip Step 1 discover the incentive misalignment after signing. Understanding the payoff structures before negotiating is not academic — it is the difference between a partnership that lasts and one that collapses at the first stress test.
3. **Underweighting exit provisions.** Every partnership ends. The question is whether it ends by mutual agreement with clear terms or by slow deterioration and legal dispute. Design the exit before you need it.
4. **Assuming alignment is permanent.** The partner's strategy will evolve. Their leadership will change. Their priorities will shift. Build review mechanisms into the agreement that allow both parties to renegotiate as circumstances change.
5. **Negotiating the deal before understanding the game.** Founders who jump directly to term sheets without completing Steps 1-3 optimize for closing speed at the expense of deal quality.

## Adaptation Notes

- **Early-traction stage:** Partnerships at this stage often involve trading equity or exclusivity for access. Be especially rigorous about the game theory — small companies frequently give up more than they receive because the partner's brand feels validating.
- **Growth stage:** The company has more leverage and more to lose. Competitive impact analysis (Step 2) becomes critical because partnerships at scale can inadvertently create competitors or surrender strategic optionality.
- **Scale stage:** Partnerships here resemble corporate development. The trust equation matters less (institutional relationships replace personal ones) and deal structure matters more. Invest disproportionately in governance design and exit provisions.
- **Cross-border partnerships** add regulatory complexity, cultural distance, and enforcement risk. Extend the timeline and involve legal counsel earlier than you think necessary.
