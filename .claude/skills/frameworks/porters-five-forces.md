---
name: "porters-five-forces"
description: "Analyzes competitive industry dynamics using Porter's Five Forces framework. Evaluates threat of new entrants, supplier power, buyer power, substitution threats, and competitive rivalry. Use when assessing market entry decisions, developing competitive strategy, evaluating industry attractiveness, or analyzing pricing power."
version: "1.0.0"
category: "frameworks"
complexity: "intermediate"
stage:
  - idea
  - validation
  - early-traction
  - growth
  - scale
tags:
  - competitive-analysis
  - industry-structure
  - strategy
  - market-entry
  - profitability
related_skills:
  - blue-ocean-strategy
  - swot-analysis
  - art-of-war
  - business-model-canvas
  - scenario-planning
author: "Fatih Guner"
---

# Porter's Five Forces

Most people use Porter's Five Forces wrong. They fill in the five boxes, label each force as "high," "medium," or "low," and conclude that they have performed strategic analysis. They have not. Michael Porter's framework, introduced in his 1979 *Harvard Business Review* article "How Competitive Forces Shape Strategy" and elaborated in *Competitive Strategy* (1980), is not a checklist. It is a theory of profitability -- an explanation of why some industries are structurally profitable and others are not, and why positioning within an industry matters more than operational excellence. The five forces determine the profit potential of an industry. Understanding them determines whether a startup is entering a gold mine or a tar pit. Misunderstanding them -- which is the norm -- produces strategies that fight industry structure rather than leveraging it.

---

## The Framework

### The Five Forces

Porter's model identifies five competitive forces that collectively determine the intensity of competition and, therefore, the profit potential of any industry.

```
                    ┌───────────────────────┐
                    │   THREAT OF NEW       │
                    │   ENTRANTS            │
                    └───────────┬───────────┘
                                │
                                ▼
┌──────────────┐    ┌───────────────────────┐    ┌──────────────┐
│ BARGAINING   │───▶│   INDUSTRY RIVALRY    │◀───│ BARGAINING   │
│ POWER OF     │    │   (among existing     │    │ POWER OF     │
│ SUPPLIERS    │    │    competitors)        │    │ BUYERS       │
└──────────────┘    └───────────┬───────────┘    └──────────────┘
                                │
                                ▼
                    ┌───────────────────────┐
                    │   THREAT OF           │
                    │   SUBSTITUTES         │
                    └───────────────────────┘
```

### Force 1: Threat of New Entrants

New entrants bring new capacity, new resources, and the desire to gain market share. The seriousness of the threat depends on barriers to entry:

| Barrier | Description | Startup Implication |
|---------|-------------|---------------------|
| Economies of scale | Incumbents produce at lower per-unit cost | Niche focus can circumvent scale requirements |
| Capital requirements | Large upfront investment needed | SaaS and asset-light models reduce this barrier |
| Switching costs | Cost to customers of changing providers | Building switching costs early creates defensibility |
| Access to distribution | Incumbents control channels | Direct-to-customer and platform strategies bypass traditional distribution |
| Regulatory barriers | Licenses, certifications, compliance | Can be a moat if the startup achieves compliance first |
| Network effects | Value increases with user count | The most powerful barrier when achieved; nearly insurmountable |

For startups: you are the new entrant. The barriers you overcome to enter are the same barriers that will protect you once inside -- if you build them.

### Force 2: Bargaining Power of Suppliers

Suppliers are powerful when they are concentrated, provide differentiated inputs, face low switching costs for their own business, or can credibly threaten forward integration. Powerful suppliers capture value by charging higher prices or reducing quality.

For startups: key suppliers include cloud providers, payment processors, talent pools, and API providers. A startup dependent on a single API provider whose pricing can change unilaterally faces significant supplier power. Diversification, commoditization of inputs, and building proprietary alternatives are defensive strategies.

### Force 3: Bargaining Power of Buyers

Buyers are powerful when they are concentrated (few large customers), purchase large volumes, face low switching costs, or can credibly threaten backward integration (building the product themselves). Powerful buyers capture value by demanding lower prices or higher quality.

For startups: customer concentration is the most common buyer power trap. A startup where one customer represents 40% of revenue has granted that customer enormous leverage. The strategic response is to diversify the customer base as early as possible and to create switching costs through integration depth, data lock-in, or workflow embedding.

### Force 4: Threat of Substitutes

A substitute is not a direct competitor -- it is a different product that serves the same need. The threat is highest when the substitute offers an attractive price-performance trade-off and when switching costs are low.

For startups: the most dangerous substitute is often "doing nothing" or "doing it manually." A project management tool competes not just with other tools but with spreadsheets, email chains, and whiteboards. Understanding the true substitutes -- especially non-consumption -- prevents strategic myopia.

### Force 5: Industry Rivalry

Rivalry is intense when competitors are numerous and roughly equal in size, industry growth is slow, fixed costs are high, products are undifferentiated, and exit barriers prevent competitors from leaving. Intense rivalry drives down prices and profitability for all participants.

For startups: entering a market with intense rivalry among well-funded incumbents is the most common cause of startup failure-by-competition. The five forces analysis should prevent this by revealing unattractive industry structures before capital is committed.

### The Synthesis: Industry Attractiveness

The five forces collectively produce an industry attractiveness assessment:

- **Attractive industry**: High barriers to entry, weak supplier and buyer power, few substitutes, moderate rivalry. Incumbents earn above-average returns.
- **Unattractive industry**: Low barriers, powerful suppliers and buyers, many substitutes, intense rivalry. Even good companies earn below-average returns.

Porter's deepest insight: company strategy should begin with industry selection. Competing brilliantly in a structurally unattractive industry produces mediocre returns. Competing adequately in a structurally attractive industry produces superior returns. Industry structure trumps execution.

---

## Prompts

**Prompt 1 -- Full Five Forces Analysis:**
> Conduct a Porter's Five Forces analysis of my industry. I compete in [describe industry/market segment]. For each force, assess the intensity (Weak/Moderate/Strong) and identify the specific factors driving that assessment. Then provide an overall industry attractiveness rating and its implications for my startup's strategy. Present the analysis as both a summary table and a detailed narrative for each force.

**Prompt 2 -- Entry Barrier Assessment:**
> I am considering entering [describe market/industry]. Using Porter's framework, assess the barriers to entry I will face. For each barrier type (economies of scale, capital requirements, switching costs, distribution access, regulatory requirements, network effects, brand loyalty), rate the height of the barrier and my realistic ability to overcome it. Then assess: once I overcome these barriers, which ones will protect me from subsequent entrants? Identify the barriers I should actively build.

**Prompt 3 -- Competitive Position Optimization:**
> Given this Five Forces analysis of my industry [paste or describe analysis], help me design a competitive position that exploits the structure rather than fighting it. Where are the pockets of profitability? Which customer segments face the least buyer power? Which supplier relationships can be restructured? What positioning would reduce our exposure to rivalry? Frame the output as a strategic positioning recommendation.

**Prompt 4 -- Dynamic Forces Projection:**
> My industry's five forces are currently [describe current state]. Project how each force is likely to change over the next 3-5 years, considering these trends: [describe relevant technology, regulatory, demographic, or competitive trends]. Which forces are strengthening? Which are weakening? How should my strategy adapt to the evolving industry structure? Present as a current vs. future comparison for each force.

**Prompt 5 -- Substitute Threat Deep Dive:**
> Analyze the substitute threats to my product/service. My offering is [describe]. Go beyond direct competitors and identify ALL substitutes -- including non-consumption, manual alternatives, and products from adjacent industries that serve the same underlying need. For each substitute, assess: price-performance relative to my offering, switching costs from the substitute, and the conditions under which customers would prefer the substitute. Rank substitutes by threat level.

---

## Use Cases

**Idea-Stage Founder Evaluating Two Market Opportunities**
A technical founder with expertise in computer vision must choose between building a quality inspection product for manufacturing (Market A) and a visual search product for e-commerce (Market B). The Five Forces analysis reveals that Market A has moderate barriers to entry (domain expertise required), weak buyer power (fragmented customer base of thousands of factories), few substitutes (manual inspection is costly and error-prone), and moderate rivalry (three incumbents, none dominant). Market B has low barriers (many CV APIs available), strong buyer power (a few large e-commerce platforms dominate demand), strong substitutes (text search is free and familiar), and intense rivalry (dozens of startups, several well-funded). The structural analysis clearly favors Market A, independent of the founder's personal preference.

**Growth-Stage SaaS Company Experiencing Margin Pressure**
A $10M ARR vertical SaaS company faces declining margins despite growing revenue. The Five Forces analysis reveals the cause: buyer power has increased as three enterprise customers now represent 55% of revenue, and each is demanding volume discounts and custom features. Supplier power has also increased as the company's reliance on a single cloud provider and a single data vendor has deepened. The strategic response targets both forces: a customer diversification initiative to reduce concentration below 20% per customer, and a multi-cloud architecture initiative to restore supplier optionality.

**Scale-Stage Company Evaluating Vertical Integration**
A 1,000-person company evaluates whether to build an in-house capability currently provided by a supplier. The Five Forces lens reframes this decision: the supplier has strong bargaining power (proprietary technology, few alternatives, high switching costs). Vertical integration would eliminate this force entirely. The analysis also reveals that the in-house capability could become a new revenue line -- the company could become a supplier to its own competitors, converting a cost center into a profit center while simultaneously neutralizing a competitive force.

---

## Anti-Patterns

1. **Using Five Forces as a static snapshot.** Industry structure evolves. Technology shifts, regulatory changes, and new entrants alter the balance of forces continuously. An analysis conducted once and never updated becomes a historical artifact rather than a strategic tool. The framework must be reapplied at least annually, and whenever a significant structural change occurs.

2. **Confusing competitors with substitutes.** Direct competitors offer similar products. Substitutes serve the same need through different means. Mistaking one for the other leads to strategic myopia -- fighting feature wars with competitors while a substitute captures the market from an entirely different direction.

3. **Treating all five forces as equally important.** In any given industry, one or two forces dominate the profitability equation. A rigorous analysis identifies which forces matter most and focuses strategic energy accordingly. Equal weighting across all five forces produces unfocused strategy.

4. **Ignoring the force of complementors.** Porter's original model does not explicitly include complementary products and services, though later scholars (notably Brandenburger and Nalebuff) have argued that "complementors" constitute a sixth force. For technology startups, the strength of the ecosystem of complementary products often determines competitive dynamics as much as the five traditional forces.

5. **Using the framework to justify inaction.** An unattractive industry structure does not mean "do not enter." It means "enter with a strategy designed for that structure." Some of the most successful startups have entered structurally challenging industries with positioning strategies that neutralized the most powerful forces. The analysis informs strategy; it does not replace it.

---

## By Stage

| Stage | Focus | Key Difference |
|-------|-------|----------------|
| Idea | Industry selection | The most consequential use of Five Forces: evaluating which industry to enter. At this stage, you have maximum flexibility and should choose structural attractiveness over personal enthusiasm. A mediocre product in an attractive industry outperforms a brilliant product in a structurally hostile one. |
| Validation | Barrier identification | With the industry chosen, identify which barriers to entry you must overcome and which you can circumvent. Begin building the barriers that will protect you: switching costs, integration depth, network effects, data advantages. |
| Early Traction | Buyer power management | As revenue grows, monitor customer concentration obsessively. The easiest time to diversify is when you have multiple prospects; the hardest is when a single customer dominates. Also, begin reducing supplier power through diversification and alternative development. |
| Growth | Rivalry positioning | Competition intensifies. Use Five Forces to choose where to compete and, critically, where not to. Differentiation strategies that reduce rivalry (serving a distinct segment, creating switching costs) are more valuable than operational excellence that merely matches competitors. |
| Scale | Industry shaping | At scale, the company has enough influence to shape industry structure rather than merely respond to it. Acquisitions, platform strategies, and standards-setting can alter barriers to entry, supplier power, and rivalry dynamics in the company's favor. |

---

## Output Template

```markdown
# Porter's Five Forces Analysis

**Industry/Market:** [Description]
**Company:** [Name]
**Date:** [Date]

## Forces Summary

| Force | Intensity | Key Drivers | Strategic Implication |
|-------|-----------|-------------|---------------------|
| Threat of New Entrants | [Weak/Moderate/Strong] | [Top 2-3 drivers] | [What this means for us] |
| Supplier Power | [Weak/Moderate/Strong] | [Top 2-3 drivers] | [What this means for us] |
| Buyer Power | [Weak/Moderate/Strong] | [Top 2-3 drivers] | [What this means for us] |
| Threat of Substitutes | [Weak/Moderate/Strong] | [Top 2-3 drivers] | [What this means for us] |
| Industry Rivalry | [Weak/Moderate/Strong] | [Top 2-3 drivers] | [What this means for us] |

## Overall Industry Attractiveness: [Attractive / Moderate / Unattractive]

## Dominant Forces
The forces with greatest impact on profitability in this industry are:
1. [Force] -- because [reason]
2. [Force] -- because [reason]

## Strategic Recommendations
Given this industry structure, the optimal positioning strategy is:
1. [Recommendation targeting dominant force]
2. [Recommendation targeting secondary force]
3. [Barrier-building priority]

## Monitoring Plan
| Force | Key Indicator to Watch | Review Frequency |
|-------|----------------------|-----------------|
| [Force] | [Indicator] | [Quarterly/Annual] |
```

---

## Related Skills

- **[Blue Ocean Strategy](blue-ocean-strategy.md)** -- If Five Forces reveals an unattractive industry, Blue Ocean Strategy provides the methodology for creating a new market space where the forces are more favorable.
- **[SWOT & PEST Analysis](swot-pest-analysis.md)** -- Five Forces analyzes external industry structure; SWOT combines this with internal capability assessment to produce a complete strategic picture.
- **[Business Model Canvas](business-model-canvas.md)** -- Once Five Forces identifies the structural dynamics, the Canvas designs the business model that navigates them effectively.
- **[Scenario Planning](scenario-planning.md)** -- Combines with Five Forces to project how industry structure might evolve under different scenarios, enabling preemptive strategic adaptation.
- **[Disruptive Innovation](disruptive-innovation.md)** -- Disruption reshapes all five forces simultaneously; Christensen's framework explains how new entrants can neutralize incumbent advantages that Porter's model identifies.
- **[Strategic Thinking and Alignment](../leadership/strategic-thinking-and-alignment.md)** -- Five Forces analysis provides the external intelligence that strategic thinking translates into organizational direction and resource allocation decisions.
