---
name: "coalition-and-partnership-games"
description: "Analyses partnership structures, cofounder equity splits, and alliance formation using coalitional game theory. Applies Shapley Value for contribution-based allocation, imputation sets and the core for stability testing, and coalition disintegration models to predict breakups. Use when splitting equity among cofounders, structuring joint ventures, negotiating alliance terms, evaluating vendor partnerships, diagnosing why a partnership is failing, or determining fair cost-sharing among unequal participants."
version: "1.0.0"
category: "game-theory"
complexity: "advanced"
stage:
  - idea
  - validation
  - early-traction
  - growth
  - scale
tags:
  - coalitions
  - partnerships
  - equity-split
  - shapley-value
  - alliances
  - cofounder
  - game-theory
  - fair-allocation
related_skills:
  - negotiation-game-theory
  - evolutionary-strategy
  - win-win-negotiation
  - trust-equation
  - thomas-kilmann-conflict
author: "Fatih Guner"
---

# Coalition and Partnership Games

Three cofounders sit across a table, dividing equity. The technical founder built the prototype. The business founder brought the first paying customer. The third contributed the initial capital. They settle on equal thirds -- the path of least resistance, the conflict-avoidant default, and, according to the mathematics of cooperative game theory, almost certainly the wrong answer. Equal splits assume equal contribution, equal replaceability, and equal outside options. These conditions virtually never hold. The Shapley Value, developed by Lloyd Shapley in 1953 (work that earned him the Nobel Prize in Economics in 2012), offers a mathematically rigorous alternative: allocate based on each player's average marginal contribution across every possible ordering of the coalition. The calculation is not intuitive, but its logic is unassailable -- and it transforms equity conversations from emotional negotiations into structured analyses.

---

## The Framework

### Coalitions: Why They Form and Why They Matter

A coalition is any group of players who agree to coordinate their actions for mutual benefit. In business, coalitions take many forms: cofounder teams, strategic alliances, joint ventures, supplier consortia, investor syndicates. The fundamental question is always the same -- does the group produce more value together than its members would separately?

Game theory distinguishes three types of coalitions based on their value properties:

| Coalition Type | Test | Business Meaning | Implication |
|---------------|------|------------------|-------------|
| **Superadditive** | Combined value exceeds sum of individual values | The partnership creates genuine synergy | Coalition should form; the question is how to split the surplus |
| **Additive** | Combined value equals sum of individual values | No synergy; partnership is neutral | No compelling reason to partner; equal split is the only stable allocation |
| **Subadditive** | Combined value is less than sum of individual values | Partnership destroys value (internal conflict, coordination overhead) | Coalition should not form; members are better off alone |

The first task in any partnership analysis is determining which type applies. Many failed partnerships are subadditive coalitions that should never have formed -- the coordination costs and internal friction exceed whatever synergies the partners imagined.

### The Grand Coalition and Sub-Coalitions

The **grand coalition** includes all players. A three-person startup where all cofounders work together is a grand coalition. Sub-coalitions are any subset: two of the three cofounders forming a side agreement, or a faction within a larger alliance.

The grand coalition is desirable when it is superadditive -- when everyone working together produces more than any combination of sub-groups. But its stability depends on whether any sub-coalition can credibly defect and do better on its own. This is where the mathematics becomes practically important.

Consider a five-person founding team evaluating whether to bring in all five partners. The potential annual payoff of the full team is $1M. Two of the five discover they can generate $450K on their own. The remaining three can only produce $250K without the departing pair. The grand coalition's $1M is less than $450K + $250K = $700K... wait. That arithmetic actually favours the grand coalition. But the two-person sub-coalition's $450K exceeds the $400K they would receive under equal distribution ($200K each vs. $225K each). The defection is rational for those two players, even though it destroys collective value. This is the core tension of coalitional game theory.

### The Shapley Value: Fair Allocation Based on Marginal Contribution

The Shapley Value answers the question: given that the coalition has formed, what is the fair share for each player?

The principle is elegant. Consider every possible order in which players might join the coalition. For each ordering, measure what each player adds when they arrive -- their marginal contribution at that point. Average each player's marginal contribution across all possible orderings. That average is their Shapley Value.

**A practical cofounder example:**

Three cofounders: Alice (technical), Bob (business), Carol (capital).

Value of each individual alone:
- Alice alone: $0 (can build product but has no distribution or funding)
- Bob alone: $0 (can sell but has no product or funding)
- Carol alone: $0 (has capital but no product or sales ability)

Value of pairs:
- Alice + Bob: $200K (product + distribution, but bootstrapped)
- Alice + Carol: $150K (funded product, but no go-to-market)
- Bob + Carol: $50K (funded sales team, but no product to sell)

Value of all three: $500K

There are six possible orderings (3! = 6). For each, track what each person adds:

| Order | Alice's Contribution | Bob's Contribution | Carol's Contribution |
|-------|--------------------|--------------------|---------------------|
| A, B, C | $0 (first, alone) | $200K ($200K - $0) | $300K ($500K - $200K) |
| A, C, B | $0 | $350K ($500K - $150K) | $150K ($150K - $0) |
| B, A, C | $200K ($200K - $0) | $0 (first, alone) | $300K ($500K - $200K) |
| B, C, A | $450K ($500K - $50K) | $0 (first, alone) | $50K ($50K - $0) |
| C, A, B | $150K ($150K - $0) | $350K ($500K - $150K) | $0 (first, alone) |
| C, B, A | $450K ($500K - $50K) | $50K ($50K - $0) | $0 (first, alone) |
| **Average** | **$208.3K (41.7%)** | **$158.3K (31.7%)** | **$133.3K (26.7%)** |

The Shapley Value suggests a 42/32/27 split -- not equal thirds. Alice's technical contribution is most critical to value creation (she appears in the highest-value pairings), so she receives the largest share. The mathematics captures what intuition often misses: contribution is not about effort or hours; it is about marginal impact on the coalition's output.

### Imputation, the Core, and Stability

An allocation is **individually rational** if every player receives at least what they could earn alone. An allocation is **collectively rational** if the total allocation equals the total coalition value (no surplus left on the table). Any allocation meeting both conditions is called an **imputation**.

But not every imputation keeps the coalition stable. A sub-coalition might still defect if its members collectively receive less than what they could generate on their own. The **core** is the set of allocations where no sub-coalition has incentive to break away.

**The stability test** for any proposed equity split:

For every possible sub-group, verify that the group's combined allocation from the grand coalition exceeds what they could earn independently. If any sub-group is underpaid relative to its standalone value, the coalition is unstable.

In the example above, the core requires:
- Alice + Bob together receive at least $200K (their pair value). Shapley gives them $366.6K. Satisfied.
- Alice + Carol together receive at least $150K. Shapley gives them $341.6K. Satisfied.
- Bob + Carol together receive at least $50K. Shapley gives them $291.6K. Satisfied.

The Shapley allocation sits within the core -- it is stable. Not every allocation method produces this result.

### The Landlord-Tenant Dynamic and Asymmetric Pairing

In many business relationships, one party holds a scarce, essential resource (the "landlord") while multiple parties hold a common, substitutable resource (the "tenants"). The landlord-tenant dynamic from cooperative game theory reveals a stark truth: when one side is essential and the other is replaceable, the essential party captures most of the value.

A startup with proprietary technology (the landlord) negotiating with multiple potential distribution partners (the tenants) holds enormous leverage -- not because of negotiation skill, but because of structural position. If the tenants cannot form a sub-coalition (a united front), the landlord can play them against each other, driving their individual allocations toward zero.

The counter-strategy is tenant coalition formation: potential partners banding together to negotiate collectively. This shifts the game from a one-vs-many asymmetry to a more balanced bilateral negotiation. Trade unions, purchasing cooperatives, and industry consortia all represent tenant coalitions responding to landlord-tenant asymmetry.

### Why Coalitions Disintegrate

Coalition disintegration stems from two forces:

**Individual rationality undermining collective outcomes.** The Prisoner's Dilemma applies within coalitions: each member's individually rational choice (maximise personal payoff) leads to collectively worse outcomes. A cofounder who secretly negotiates a side deal, a partner who free-rides on shared resources, an alliance member who shares proprietary information selectively -- these are all defections driven by individual rationality.

**Small coalition rationality.** Sub-groups discover they can do better alone. Two of five cofounders realise their combined skills command a higher market value than their proportional share of the grand coalition. A regional alliance member discovers it can form a more profitable bilateral deal. The grand coalition fractures not because of betrayal, but because of rational calculation.

**Confrontation and counter-confrontation cycles.** An allocation that satisfies one sub-group often dissatisfies another. Player 1 proposes a reallocation that benefits Players 1 and 3 at the expense of Player 2. Player 2 responds with a counter-proposal benefiting 2 and 3. The cycle continues until either a stable allocation is found or the coalition collapses.

---

## Prompts

**Prompt 1 -- Cofounder Equity Split:**
> We are [number] cofounders starting [describe company]. Each founder's contribution is: [list each founder and their specific contribution -- technical skills, business relationships, capital, domain expertise, time commitment]. Using the Shapley Value approach, help me calculate a fair equity split. For each founder, estimate their standalone value, the value of every possible pair and sub-group, and the full team value. Then compute each founder's average marginal contribution across all orderings to determine the mathematically fair allocation.

**Prompt 2 -- Partnership Stability Audit:**
> We have an existing partnership among [describe parties and structure]. The current allocation of value/equity/revenue is [describe current split]. Each party's standalone alternative is approximately [describe what each could earn alone]. Using the core stability test from coalitional game theory, evaluate whether any sub-coalition of our partners could credibly defect. Identify which groups are underpaid relative to their coalition value and recommend reallocation to stabilise the partnership.

**Prompt 3 -- Alliance Formation Decision:**
> We are considering forming an alliance with [describe potential partners]. Our standalone annual value is [amount]. The proposed alliance would generate [combined amount]. Using coalitional game theory, help me determine: (1) Is this coalition superadditive, additive, or subadditive? (2) What is the fair split using Shapley Value principles? (3) Are there any sub-coalitions that could destabilise the alliance? (4) What structural mechanisms (contracts, vesting, governance) should we implement to prevent rational defection?

**Prompt 4 -- Diagnosing Partnership Failure:**
> Our partnership is showing signs of strain. The parties involved are [describe]. The original value allocation was [describe]. Recent developments: [describe tensions]. Using the coalition disintegration framework, help me diagnose: Is this individual rationality undermining collective outcomes? Is a sub-coalition forming? Is the current allocation outside the core? What reallocation or structural change could restabilise the coalition?

---

## Use Cases

**Idea-Stage: Three Cofounders Splitting Equity**

A machine learning engineer, a healthcare-industry sales executive, and a physician with domain expertise decide to build a health-tech startup. The engineer argues for equal thirds. The sales executive -- who already has warm introductions to three hospital systems -- believes her contribution warrants more. The physician has the clinical credibility that no regulatory pathway can succeed without.

Applying the Shapley Value framework, they estimate standalone and combination values. The engineer alone has near-zero startup value (ML skills are available for hire). The sales executive alone can consult but not build a product. The physician alone lacks both technical and commercial capability. But the engineer-physician pair can build a credible prototype worth $300K in grant funding. The sales-physician pair can secure pilot agreements worth $200K. The engineer-sales pair can build and distribute a generic product worth $150K. The full trio can raise a $2M seed round and secure three hospital pilots.

The Shapley calculation produces a 38/33/29 split favouring the engineer (whose technical contribution amplifies every combination most). The conversation shifts from "who deserves what" to "who contributes what marginal value" -- a far less emotional framework.

**Growth-Stage: Vendor Alliance Showing Cracks**

A SaaS company formed a three-way integration alliance with a CRM platform and a payments processor. The original revenue-share was equal thirds. Two years later, the CRM platform's customer base has grown fivefold, making it the primary distribution channel. The payments processor's technology has become commoditised, with four viable alternatives. The SaaS company's product remains differentiated but is no longer the only option in its category.

The CRM platform's standalone value to the alliance has increased dramatically; the payments processor's has decreased. The current equal-thirds allocation no longer sits within the core -- the CRM platform could form a bilateral deal with either partner and capture more value. The alliance is unstable.

Resolution requires reallocation: increasing the CRM platform's share to reflect its new marginal contribution, or restructuring the alliance with contractual lock-in provisions that make defection costly. Without adjustment, the CRM platform will rationally exit the coalition within one to two renewal cycles.

**Scale-Stage: Acquisition Consortium**

Three mid-market companies consider pooling resources to jointly acquire a competitor. Company A contributes $20M in capital, Company B contributes distribution infrastructure worth $15M, and Company C contributes the management team that will run the acquired entity. The acquisition target generates $50M in annual revenue. Alone, none can complete the acquisition. The Shapley Value framework determines that Company A (capital) receives the largest share because capital is the bottleneck -- without it, neither distribution nor management creates value. The framework also reveals that Companies B and C should form a sub-coalition agreement to prevent Company A from renegotiating terms post-acquisition, when the capital has already been deployed and A's leverage diminishes.

---

## Anti-Patterns

1. **The Equal Split Reflex.** Defaulting to equal allocation because it avoids difficult conversations. Equal splits are mathematically correct only when all players have identical standalone values, identical marginal contributions in every sub-coalition, and identical outside options. This combination is so rare that assuming it is almost always a form of intellectual laziness disguised as fairness.

2. **Ignoring Standalone Value.** Evaluating contributions only within the context of the coalition, without assessing what each player could achieve independently. A cofounder who can earn $300K as a senior engineer at a major technology company has a high standalone value. Their participation in a startup that pays them nothing for two years represents a real sacrifice -- one that the equity allocation should reflect.

3. **Static Allocation in a Dynamic Game.** Setting equity or revenue-sharing terms at formation and never revisiting them. Marginal contributions change as the company evolves. The technical founder's contribution is enormous at the prototype stage and may diminish relative to the sales founder's contribution at growth stage. Vesting schedules and periodic reallocation mechanisms address this, but only if the coalition anticipates the problem at formation.

4. **Conflating Effort with Marginal Contribution.** A partner who works 80-hour weeks on activities that any hired employee could perform has high effort but low marginal contribution. The Shapley Value measures what the coalition loses if a specific player is removed -- not how many hours they logged. This distinction is essential and frequently misunderstood.

5. **Neglecting Sub-Coalition Threats.** Assuming the grand coalition is stable because everyone agreed to the terms. Rational players continuously evaluate their alternatives. If two of four partners discover they generate 70% of value but receive 50% of allocation, the sub-coalition threat is real regardless of what the partnership agreement says. Contracts slow defection; they do not eliminate the incentive.

---

## By Stage

| Stage | Focus | Key Difference |
|-------|-------|----------------|
| Idea | Cofounder equity allocation | Standalone values are speculative and pair values are hypothetical. Use the Shapley framework to structure the conversation, but acknowledge that estimates are rough. Build in reallocation mechanisms (vesting, milestone-based adjustments) to account for uncertainty. |
| Validation | Early partnership structuring | First external partnerships form: pilot customers, technology partners, advisors. Apply the superadditivity test before committing -- many early partnerships are additive at best. Only partner when the combined value genuinely exceeds the sum of parts. |
| Early Traction | Revenue-sharing and alliance management | Revenue begins flowing, making marginal contributions measurable rather than estimated. Revisit initial allocations against actual data. The core stability test becomes practical: identify whether any partner is receiving less than their demonstrated contribution. |
| Growth | Complex multi-party alliances | Coalitions expand to include investors, distribution partners, integration partners. Sub-coalition dynamics become critical. Monitor for small coalition rationality -- subgroups that might defect. Structural safeguards (exclusivity clauses, joint IP, shared infrastructure) increase switching costs. |
| Scale | M&A, consortia, and ecosystem governance | The company becomes a coalition of coalitions. Acquisition targets, joint ventures, and industry consortia all involve nested coalition dynamics. Shapley-based allocation principles inform earnout structures, joint venture governance, and consortium voting rights. |

---

## Output Template

```markdown
# Coalition Analysis: [Partnership/Alliance Name]

## Players and Standalone Values
| Player | Role/Contribution | Estimated Standalone Value | Outside Option |
|--------|-------------------|---------------------------|----------------|
| [Player 1] | [Description] | [Value alone] | [Best alternative] |
| [Player 2] | [Description] | [Value alone] | [Best alternative] |
| [Player 3] | [Description] | [Value alone] | [Best alternative] |

## Coalition Value Assessment
- **Grand coalition value:** [Total value of all players together]
- **Coalition type:** [Superadditive / Additive / Subadditive]
- **Synergy surplus:** [Grand coalition value minus sum of standalone values]

## Sub-Coalition Values
| Sub-Coalition | Combined Value | Sum of Members' Standalone Values | Superadditive? |
|---------------|---------------|-----------------------------------|----------------|
| [Players 1+2] | [Value] | [Sum] | [Yes/No] |
| [Players 1+3] | [Value] | [Sum] | [Yes/No] |
| [Players 2+3] | [Value] | [Sum] | [Yes/No] |

## Shapley Value Allocation
| Player | Average Marginal Contribution | Percentage Share | Proposed Allocation |
|--------|------------------------------|------------------|---------------------|
| [Player 1] | [Amount] | [%] | [Equity/Revenue share] |
| [Player 2] | [Amount] | [%] | [Equity/Revenue share] |
| [Player 3] | [Amount] | [%] | [Equity/Revenue share] |

## Core Stability Check
| Sub-Coalition | Coalition Value | Members' Combined Allocation | Stable? |
|---------------|----------------|------------------------------|---------|
| [Players 1+2] | [Value] | [Sum of allocations] | [Yes/No] |
| [Players 1+3] | [Value] | [Sum of allocations] | [Yes/No] |
| [Players 2+3] | [Value] | [Sum of allocations] | [Yes/No] |

## Defection Risks
- [Identify any sub-coalition whose standalone value exceeds their combined allocation]

## Structural Safeguards
- [Vesting provisions, exclusivity, shared IP, or other mechanisms to raise defection costs]
```

---

## Related Skills

- **[Negotiation Game Theory](negotiation-game-theory.md)** -- Once coalition membership is established, the Nash Product Solution determines optimal allocation terms between parties with differing utility functions.
- **[Evolutionary Strategy](evolutionary-strategy.md)** -- Market-level coalition behaviour follows evolutionary dynamics; the Hawk-Dove game explains when competitors cooperate versus compete.
- **[Win-Win Negotiation](../frameworks/win-win-negotiation.md)** -- Fisher and Ury's principled negotiation provides the relational framework for conducting the conversations that coalition game theory structures analytically.
- **[Trust Equation](../frameworks/trust-equation.md)** -- Coalition stability depends not only on mathematical allocation but on the trust between partners; the trust equation diagnoses relational factors that mathematical models assume away.
- **[Game Theory Fundamentals](game-theory-fundamentals.md)** -- Provides the prerequisite concepts of Nash equilibrium and payoff analysis that coalitional models extend into multi-player settings.
- **[Delivering the Deal](../negotiation/delivering-the-deal.md)** -- Coalition agreements must be closed and sustained; the preparation checklists and satisfaction engineering techniques address post-formation deal durability.
