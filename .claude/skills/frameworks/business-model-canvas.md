---
name: "business-model-canvas"
description: "Structures and evaluates business models using Osterwalder's nine-block Business Model Canvas: Customer Segments, Value Propositions, Channels, Customer Relationships, Revenue Streams, Key Resources, Key Activities, Key Partnerships, and Cost Structure. Use when designing a new venture, comparing business model alternatives, stress-testing assumptions, planning pivots, exploring revenue model options, or identifying hidden dependencies between business model components."
version: "1.0.0"
category: "frameworks"
complexity: "basic"
stage:
  - idea
  - validation
  - early-traction
  - growth
  - scale
tags:
  - business-model
  - value-proposition
  - startup-design
  - strategy
  - lean-methodology
related_skills:
  - blue-ocean-strategy
  - porters-five-forces
  - value-proposition-design
  - unit-economics
author: "Fatih Guner"
---

# Business Model Canvas

Business plans fail. Not occasionally -- systematically. Research from the Kauffman Foundation and others consistently demonstrates that the traditional 40-page business plan, once the mandatory admission ticket for venture funding, bears almost no correlation with startup success. The plans take months to write, become obsolete within weeks, and optimize for the wrong outcome: a polished document rather than a validated business. Alexander Osterwalder and Yves Pigneur, in *Business Model Generation* (2010), proposed a replacement: a single-page visual map that captures the nine essential building blocks of any business model. The Business Model Canvas (BMC) does not ask "how do we plan the business?" -- it asks "how does this business actually create, deliver, and capture value?" The shift from narrative to architecture, from plan to model, has reshaped how entrepreneurs think about building companies.

---

## The Framework

### The Nine Building Blocks

The Canvas divides any business model into nine interdependent blocks, arranged spatially to reveal relationships:

```
┌──────────────┬───────────────┬───────────────┬───────────────┬──────────────┐
│              │               │               │               │              │
│   KEY        │   KEY         │   VALUE       │  CUSTOMER     │  CUSTOMER    │
│   PARTNERS   │   ACTIVITIES  │   PROPOSITIONS│  RELATIONSHIPS│  SEGMENTS    │
│              │               │               │               │              │
│  Who are our │  What key     │  What value   │  What type of │  For whom    │
│  key         │  activities   │  do we        │  relationship │  are we      │
│  partners    │  does our     │  deliver?     │  does each    │  creating    │
│  and         │  value prop   │               │  segment      │  value?      │
│  suppliers?  │  require?     │               │  expect?      │              │
│              ├───────────────┤               ├───────────────┤              │
│              │               │               │               │              │
│              │   KEY         │               │   CHANNELS    │              │
│              │   RESOURCES   │               │               │              │
│              │               │               │  Through      │              │
│              │  What key     │               │  which        │              │
│              │  resources    │               │  channels do  │              │
│              │  does our     │               │  our segments │              │
│              │  value prop   │               │  want to be   │              │
│              │  require?     │               │  reached?     │              │
│              │               │               │               │              │
├──────────────┴───────────────┴───────┬───────┴───────────────┴──────────────┤
│                                      │                                      │
│           COST STRUCTURE             │          REVENUE STREAMS             │
│                                      │                                      │
│  What are the most important costs   │  For what value are customers        │
│  inherent in our business model?     │  willing to pay?                     │
│                                      │                                      │
└──────────────────────────────────────┴──────────────────────────────────────┘
```

### Block-by-Block Guide

**1. Customer Segments** -- The distinct groups of people or organizations the business serves. Segments differ when they require distinct value propositions, are reached through different channels, require different types of relationships, yield different profitability profiles, or are willing to pay for different aspects of the offering. The decision of which segments to serve -- and which to ignore -- is the most consequential strategic choice on the canvas.

**2. Value Propositions** -- The bundle of products and services that create value for a specific customer segment. Value may derive from newness, performance, customization, design, brand/status, price, cost reduction, risk reduction, accessibility, or convenience. The value proposition is the reason a customer chooses one company over another.

**3. Channels** -- How the company communicates with and reaches its customer segments to deliver value. Channels include direct (sales force, web, stores) and indirect (partner stores, wholesalers). The channel question is not just "how do we reach customers?" but "how do customers want to be reached?"

**4. Customer Relationships** -- The type of relationship established with each segment: personal assistance, dedicated personal assistance, self-service, automated services, communities, or co-creation. The relationship type affects customer acquisition cost, retention rate, and lifetime value.

**5. Revenue Streams** -- The cash generated from each customer segment. Revenue model types include asset sales, usage fees, subscription fees, licensing, brokerage fees, and advertising. Two fundamental pricing mechanisms exist: fixed (list prices, feature-dependent, segment-dependent) and dynamic (negotiation, yield management, real-time market pricing).

**6. Key Resources** -- The most important assets required to make the business model work: physical, intellectual (patents, proprietary knowledge, data), human, or financial. Key resources are those without which the value proposition cannot be delivered.

**7. Key Activities** -- The most important things the company must do to make the business model work. Categories include production (designing, making, delivering), problem solving (consulting, engineering), and platform/network management (maintaining and developing the platform).

**8. Key Partnerships** -- The network of suppliers and partners that make the business model work. Partnership motivations include optimization and economy of scale, reduction of risk and uncertainty, and acquisition of particular resources and activities.

**9. Cost Structure** -- All costs incurred to operate the business model. Two broad classes: cost-driven (minimizing cost wherever possible) and value-driven (focused on value creation with less concern for cost). Key cost characteristics to identify: fixed vs. variable, economies of scale, and economies of scope.

### The Canvas as a System

The nine blocks are not independent -- they form a system of interdependencies. The left side of the canvas (partners, activities, resources, costs) represents the infrastructure of value creation. The right side (segments, relationships, channels, revenue) represents value delivery and capture. The value proposition sits at the center, connecting creation to delivery.

A change in any block ripples across the canvas. Adding a new customer segment may require new channels, different relationships, additional resources, and altered cost structure. This systemic view is the canvas's greatest strength: it makes hidden dependencies visible.

### Canvas Patterns

Osterwalder and Pigneur identify recurring business model patterns:

- **Unbundled**: Separating product innovation, customer relationship management, and infrastructure into distinct models
- **Long Tail**: Selling less of more -- many niche products rather than a few bestsellers
- **Multi-Sided Platform**: Connecting two or more interdependent customer groups (e.g., buyers and sellers)
- **Free/Freemium**: At least one segment receives value for free, subsidized by another segment or revenue stream
- **Open**: Collaborating with external partners to create or capture value

---

## Prompts

**Prompt 1 -- Complete Canvas Build:**
> Help me build a complete Business Model Canvas for my venture. My concept is [describe your business idea, target market, and core offering]. For each of the nine blocks, provide specific, actionable content -- not generic descriptions. Challenge my assumptions: where am I making implicit choices that should be explicit? Where are there dependencies between blocks that I might be overlooking? Present the completed canvas as a structured document with each block clearly defined.

**Prompt 2 -- Canvas Comparison (Current vs. Target):**
> I want to compare my current business model with a target business model. Here is my current canvas: [describe or paste current model]. Here is where I want to be in 18 months: [describe target state]. Map both canvases side by side and identify: (1) Which blocks need to change? (2) What is the sequence of changes -- which block moves first? (3) What are the riskiest transitions? (4) What are the dependencies that could block the transition?

**Prompt 3 -- Canvas Stress Test:**
> Stress-test my Business Model Canvas. My current canvas is: [describe or paste]. For each block, identify the riskiest assumption -- the one that, if wrong, would break the model. Then prioritize these assumptions by impact and uncertainty. Finally, recommend the cheapest experiment I could run to test each of the top 3 riskiest assumptions.

**Prompt 4 -- Revenue Model Exploration:**
> My value proposition is [describe] serving [customer segment]. Explore alternative revenue models using the Canvas framework. For each model (subscription, usage-based, freemium, transaction fee, licensing, advertising, data monetization), assess: (1) Fit with my value proposition, (2) Customer willingness to pay, (3) Impact on other canvas blocks (channels, relationships, costs), (4) Long-term scalability. Recommend the top 2-3 revenue models with rationale.

**Prompt 5 -- Partnership and Resource Gap Analysis:**
> Review my Business Model Canvas: [describe]. Identify gaps in key resources and key activities that I cannot fill internally. For each gap, recommend: (1) Build vs. partner vs. acquire, (2) Specific potential partners or providers, (3) Partnership structure (strategic alliance, joint venture, buyer-supplier, co-opetition), (4) Risks of dependency and how to mitigate them.

---

## Use Cases

**Idea-Stage Founder Testing Three Business Concepts**
A founder with domain expertise in healthcare logistics has three potential business ideas. Rather than writing business plans for each, she builds three canvases in a single afternoon. The canvas exercise reveals that Concept A requires a regulatory resource she does not have and cannot easily acquire. Concept B has strong value proposition-segment fit but no viable revenue stream at the target price point. Concept C has a clear path across all nine blocks, with the key risk concentrated in one testable assumption: whether hospital procurement departments will adopt a self-service purchasing tool. The canvas did not make the decision -- it made the decision visible.

**Validation-Stage Startup Discovering a Pivot**
A B2C fitness app with 10,000 free users and negligible paid conversion maps its current canvas and discovers that its actual value creation is concentrated in the community features (customer relationships block), not the workout content (value proposition block). The paying users pay for community, not content. The canvas pivot: shift the value proposition from "personalized workouts" to "accountability communities," change the revenue stream from subscription to cohort-based pricing, and redesign channels around referral rather than performance marketing. The canvas reveals that the business model the customers are buying is different from the one the founder is selling.

**Growth-Stage Platform Company Navigating Multi-Sided Economics**
A marketplace connecting freelance designers with small businesses maps its canvas and discovers an asymmetry: the value proposition for designers (access to clients) is strong, but the value proposition for businesses (access to quality design) is weakening as the platform grows and quality becomes inconsistent. The canvas highlights that the key activity of quality curation -- initially performed manually by the founder -- has not scaled. The solution: invest in the key activity of algorithmic quality matching, add a key resource of portfolio review capability, and create a new revenue stream (premium placement for top-rated designers) that aligns incentives with quality.

---

## Anti-Patterns

1. **Filling the canvas once and treating it as finished.** The Canvas is a living document that evolves as assumptions are tested and conditions change. A canvas completed at the idea stage should look materially different six months later. If it does not, either the business has stagnated or the canvas is not being used.

2. **Making the canvas too abstract.** "Our customer segment is SMBs" is not useful. "Our customer segment is marketing directors at B2B SaaS companies with 50-200 employees who currently manage campaigns in spreadsheets" is useful. Specificity in each block is what transforms the canvas from a strategy exercise into an operational guide.

3. **Ignoring the left side of the canvas.** Entrepreneurs obsess over value propositions, customers, and revenue -- the right side. The left side (resources, activities, partners, costs) is where execution lives. A brilliant right side with an unworkable left side produces a business that cannot be built.

4. **Assuming one canvas serves all segments.** Different customer segments often require different canvases. A freemium product has one canvas for free users and a different one for paying users. A marketplace has separate canvases for each side. Collapsing distinct models into a single canvas hides the structural differences that matter most.

5. **Treating the canvas as a replacement for financial modeling.** The canvas reveals the architecture of the business model; it does not quantify it. Revenue streams, cost structure, and unit economics require separate, rigorous financial analysis. The canvas tells you what to model; the financial model tells you whether the numbers work.

---

## By Stage

| Stage | Focus | Key Difference |
|-------|-------|----------------|
| Idea | Hypothesis generation | Every block is an assumption. The canvas at this stage is a hypothesis document, not a description of reality. The goal is to identify the riskiest assumptions and sequence experiments to test them. Multiple canvases for different concepts enable rapid comparison. |
| Validation | Assumption testing | Systematically validate each block through customer discovery, prototypes, and landing page tests. The canvas evolves as assumptions are confirmed or refuted. Focus on the value proposition and customer segment blocks first -- these determine whether the other seven blocks matter. |
| Early Traction | Model refinement | Product-market fit is emerging. The canvas shifts from hypothesis to documented reality: which segments are actually buying, through which channels, at what price. Gaps between the planned canvas and the actual canvas reveal where the model needs adjustment. |
| Growth | Scaling infrastructure | The left side of the canvas becomes critical. Key resources, activities, and partnerships must scale to support growing demand. Cost structure optimization begins. The canvas helps identify which blocks are scaling smoothly and which are bottlenecks. |
| Scale | Model extension and defense | New customer segments, geographies, or product lines each require canvas extensions or entirely new canvases. The framework helps evaluate whether extensions leverage existing blocks or require building new ones. Defensive canvases map how the current model would respond to competitive or market disruptions. |

---

## Output Template

```markdown
# Business Model Canvas

**Venture:** [Name]
**Version:** [v1.0 / v2.0 / etc.]
**Date:** [Date]
**Stage:** [Current stage]

## Customer Segments
- **Primary:** [Specific description]
- **Secondary:** [Specific description]

## Value Propositions
- **For [Segment 1]:** [Specific value delivered]
- **For [Segment 2]:** [Specific value delivered]

## Channels
- **Awareness:** [How customers discover us]
- **Evaluation:** [How customers evaluate our offering]
- **Purchase:** [How customers buy]
- **Delivery:** [How we deliver value]
- **After-sales:** [How we provide post-purchase support]

## Customer Relationships
- **[Segment 1]:** [Relationship type and description]
- **[Segment 2]:** [Relationship type and description]

## Revenue Streams
- **[Stream 1]:** [Model type] -- [Pricing mechanism] -- [Expected contribution %]
- **[Stream 2]:** [Model type] -- [Pricing mechanism] -- [Expected contribution %]

## Key Resources
- **Physical:** [If applicable]
- **Intellectual:** [Patents, data, brand, proprietary knowledge]
- **Human:** [Key roles and expertise]
- **Financial:** [Funding, credit lines]

## Key Activities
1. [Critical activity for value delivery]
2. [Critical activity for value delivery]
3. [Critical activity for value delivery]

## Key Partnerships
- **[Partner type]:** [Who and why]
- **[Partner type]:** [Who and why]

## Cost Structure
- **Fixed costs:** [List major items]
- **Variable costs:** [List major items]
- **Cost model:** [Cost-driven / Value-driven]

## Riskiest Assumptions
1. [Assumption] -- Block: [Which block] -- Test: [How to validate]
2. [Assumption] -- Block: [Which block] -- Test: [How to validate]
3. [Assumption] -- Block: [Which block] -- Test: [How to validate]
```

---

## Related Skills

- **[Blue Ocean Strategy](blue-ocean-strategy.md)** -- The ERRC Grid reshapes the value proposition block; the Canvas maps the complete business model required to deliver the blue ocean strategy.
- **[Porter's Five Forces](porters-five-forces.md)** -- Five Forces reveals the industry structure the business model must navigate; the Canvas designs the model while Five Forces evaluates the competitive terrain it operates in.
- **[Four Ps of Marketing](four-ps-marketing.md)** -- The Canvas's right side (segments, channels, relationships, revenue) expands into the full marketing mix of Product, Price, Place, and Promotion for go-to-market execution.
- **[SWOT & PEST Analysis](swot-pest-analysis.md)** -- PEST identifies macro forces that constrain or enable the Canvas's assumptions, while SWOT reveals which blocks represent genuine competitive advantages.
- **[Disruptive Innovation](disruptive-innovation.md)** -- Christensen's theory explains when a Canvas designed for underserved segments can grow to challenge incumbents whose business models cannot adapt.
- **[Ambidexterity](ambidexterity.md)** -- Exploration units should build separate canvases from the core business, making the two-canvas approach a practical tool for structurally ambidextrous organizations.
