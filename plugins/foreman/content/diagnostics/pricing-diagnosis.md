---
name: "pricing-diagnosis"
description: "Performs deep-layer triage on pricing problems by distinguishing between cost-plus traps, competitor anchoring, value communication failures, wrong pricing models, missing segmentation, freemium leakage, and margin structure flaws. Use when a first-layer diagnostic surfaces pricing as the root issue, or when an entrepreneur reports inability to charge, convert free users, or maintain margins."
entry_symptoms:
  - "Don't know what to charge"
  - "Customers say we're too expensive"
  - "Can't raise prices without losing customers"
  - "Freemium isn't converting"
  - "Competitors undercut us on price"
  - "Margins are too thin to sustain the business"
possible_diagnoses:
  - cost-plus-trap
  - competitor-anchoring
  - value-communication-failure
  - wrong-pricing-model
  - missing-segmentation
  - freemium-leakage
  - margin-structure-flaw
routes_to_skills:
  - four-ps-marketing
  - business-model-canvas
  - porters-five-forces
  - net-promoter-score
  - information-asymmetry
  - blue-ocean-strategy
routes_to_templates:
  - unit-economics-snapshot
  - strategic-analysis-one-pager
author: "Fatih Guner"
---

# Pricing Diagnosis

## Entry Symptoms

Few decisions generate more anxiety and less rigour than pricing. The entrepreneur arrives with some variation of: "We don't know what to charge," "Everyone says we're too expensive," "Our freemium funnel leaks," or "Margins are killing us." Each complaint sounds like a pricing problem. Most of them are not — they are value problems, segmentation problems, or business model problems wearing pricing's disguise.

## Triage Questions

### Q1: How was the current price originally set?

- **Cost-plus (calculated costs, added a margin)** — likely diagnosis: **cost-plus-trap**. The price reflects internal accounting, not external value. Proceed to Q3 to confirm.
- **Competitor benchmarking (looked at what others charge, priced similarly or slightly below)** — likely diagnosis: **competitor-anchoring**. The business has outsourced its pricing logic to rivals. Proceed to Q4.
- **Value-based (researched willingness to pay, priced against perceived value)** — pricing methodology is sound; the problem likely sits elsewhere. Proceed to Q2 and Q5.
- **Gut feel or "we just picked a number"** — no pricing foundation exists. Start with Q2 and Q3 to build one.

### Q2: What is the customer's actual willingness to pay, and how do you know?

- **Tested through surveys, experiments, or pricing page A/B tests — data exists** — the price level may be calibrated; the issue is likely the model or packaging. Proceed to Q5.
- **Inferred from sales conversations ("they said it's too expensive")** — anecdotal signals are unreliable. Buyers negotiate; "too expensive" often means "convince me." Likely diagnosis: **value-communication-failure**. Proceed to Q3.
- **Unknown — never systematically tested** — pricing is untethered from demand. Any diagnosis is premature until willingness-to-pay data exists. Route to `four-ps-marketing` for price discovery before deeper triage.

### Q3: When you describe your product to a prospective customer, do they understand the value before they see the price?

- **Yes — they articulate the value themselves and the price still feels high** — the gap is quantitative, not conceptual. The customer grasps value but perceives it as smaller than the price. Likely diagnosis: **cost-plus-trap** or **margin-structure-flaw**.
- **No — they need extensive explanation to understand why it costs what it does** — likely diagnosis: **value-communication-failure**. The product may deliver genuine value that remains invisible until post-purchase.
- **They understand the value but compare immediately to cheaper alternatives** — likely diagnosis: **competitor-anchoring**. The product lacks differentiation sufficient to justify a premium.

### Q4: Is the problem the price level or the pricing model?

- **The price level — "it's just too much money"** — the complaint targets the number. But is it the number or the way it's charged? Confirm: would the same annual amount charged monthly feel different? If yes, likely diagnosis: **wrong-pricing-model**.
- **The pricing model — customers want a different structure (usage-based instead of flat, monthly instead of annual, per-seat instead of per-company)** — likely diagnosis: **wrong-pricing-model**. The value delivery pattern and the payment pattern are misaligned.
- **Both — the model feels wrong and the amount feels high** — likely diagnosis: **wrong-pricing-model** compounded by **value-communication-failure**. Address the model first; the level becomes testable once the structure is right.

### Q5: Do different customer segments respond differently to your pricing?

- **Yes — enterprises accept it, SMBs reject it (or vice versa)** — likely diagnosis: **missing-segmentation**. A single price cannot serve markets with fundamentally different value perceptions and budget constraints.
- **Free users love the product but refuse to convert to paid** — likely diagnosis: **freemium-leakage**. The free tier delivers too much value, eliminating the conversion incentive.
- **All segments push back equally** — the issue is not segmentation. Return to Q3 for value communication or Q1 for pricing foundation.

### Q6: What do your unit economics look like at the current price?

- **Gross margins are healthy (>60%) but customers still complain about price** — the business is viable; the problem is perception. Likely diagnosis: **value-communication-failure** or **competitor-anchoring**.
- **Gross margins are thin (<40%) and the business can't lower prices further** — likely diagnosis: **margin-structure-flaw**. The cost structure, not the price, is the constraint. Pricing cannot fix a fundamentally expensive delivery model.
- **Unit economics are negative — each customer costs more to serve than they pay** — likely diagnosis: **margin-structure-flaw** compounded by **cost-plus-trap**. The business model is structurally broken at the unit level.

## Diagnosis Map

| Diagnosis | Key Signals | Confirmation Path |
|-----------|------------|-------------------|
| **Cost-plus trap** | Price set from costs; no demand-side input; value exceeds price perception | Q1 shows cost-plus origin + Q2 shows no WTP data |
| **Competitor anchoring** | Price mirrors competitors; no differentiation premium; race to bottom | Q1 shows competitor-based + Q3 shows immediate comparison |
| **Value communication failure** | Product delivers value but customers don't perceive it pre-purchase | Q3 shows explanation needed + Q2 shows anecdotal WTP |
| **Wrong pricing model** | Model-structure complaints; payment rhythm mismatches usage rhythm | Q4 shows model objections + Q5 shows segment-varied response |
| **Missing segmentation** | One price for diverse segments; some accept, others reject identically | Q5 shows segment divergence + Q4 shows level-not-model issue |
| **Freemium leakage** | Free tier overserves; conversion near zero; high free engagement | Q5 shows free-to-paid gap + product usage data shows free sufficiency |
| **Margin structure flaw** | Thin or negative unit economics; price floor above market tolerance | Q6 shows margin data + Q1 shows pricing already at cost-plus floor |

## Routing

**Cost-plus trap:**
1. Apply `four-ps-marketing` — rebuild pricing from value delivered, not cost incurred
2. Apply `business-model-canvas` — ensure the revenue model reflects customer value
3. Output with `unit-economics-snapshot`

**Competitor anchoring:**
1. Apply `porters-five-forces` — understand the competitive dynamics creating the price anchor
2. Apply `blue-ocean-strategy` — explore differentiation paths that escape the comparison frame
3. Output with `strategic-analysis-one-pager`

**Value communication failure:**
1. Apply `net-promoter-score` — identify what existing customers value most
2. Apply `information-asymmetry` — the buyer lacks data the seller possesses
3. Output with `strategic-analysis-one-pager`

**Wrong pricing model:**
1. Apply `business-model-canvas` — redesign the revenue stream to match value consumption patterns
2. Apply `four-ps-marketing` — align pricing structure with buyer psychology
3. Output with `unit-economics-snapshot`

**Missing segmentation:**
1. Apply `four-ps-marketing` — develop segment-specific pricing and positioning
2. Apply `business-model-canvas` — evaluate whether each segment warrants its own value proposition
3. Output with `unit-economics-snapshot`

**Freemium leakage:**
1. Apply `business-model-canvas` — redraw the line between free value and paid value
2. Apply `information-asymmetry` — users never discover paid value when the free tier overserves
3. Output with `unit-economics-snapshot`

**Margin structure flaw:**
1. Apply `porters-five-forces` — determine if the cost structure is industry-wide or company-specific
2. Apply `business-model-canvas` — explore structural changes to shift the cost base
3. Output with `unit-economics-snapshot`

## Red Flags

- **The entrepreneur is competing purely on price with no differentiation strategy.** Price competition without structural cost advantage is a death spiral. Before optimising pricing, determine whether the product has any defensible differentiation at all.
- **Revenue depends on a single pricing tier with no expansion path.** Without upsell, cross-sell, or usage-based growth, customer lifetime value is capped at acquisition. The pricing architecture — not the price point — is the constraint.
- **The company has never tested a price change.** Pricing anxiety that prevents experimentation is more dangerous than wrong pricing. A business that has never raised prices has never learned what its market will bear.
