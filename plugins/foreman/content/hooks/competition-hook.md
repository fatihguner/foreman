---
name: "competition-hook"
description: "Captures intent related to competitive threats, market share erosion, price wars, new entrants, and differentiation struggles"
trigger_patterns:
  - "competitors are crushing us"
  - "price war"
  - "big player entered our space"
  - "losing market share"
  - "being commoditized"
  - "can't differentiate"
  - "they copied our product"
  - "race to the bottom"
routes_to:
  diagnostics:
    - competitive-threat-diagnosis
  skills:
    - porters-five-forces
    - blue-ocean-strategy
    - disruptive-innovation
    - art-of-war
  playbooks:
    - competitive-response-playbook
priority: "high"
author: "Fatih Guner"
---

# Competition Hook

## Trigger Patterns

Competitive anxiety ranges from strategic concern to existential dread. Founders articulate it through market observations, customer loss stories, and raw frustration.

- "Competitors are crushing us on price"
- "We're in a price war and losing"
- "A big player just entered our market"
- "We're losing market share every quarter"
- "Our product is being commoditized"
- "Can't differentiate from the competition"
- "They copied our entire feature set"
- "It's a race to the bottom and we can't win"
- "Amazon / Google / Microsoft just launched something like ours"
- "A well-funded competitor is undercutting us"
- "Customers keep comparing us to cheaper alternatives"
- "Our moat disappeared overnight"
- "We used to be unique but now everyone does what we do"
- "How do I compete against someone with ten times our budget?"
- "New startups keep entering our space every month"

## Intent Classification

| Pattern Cluster | Classified Intent | Confidence |
|---|---|---|
| Price war, race to bottom, undercutting | Price-based competition | High |
| Big player, well-funded competitor, Amazon entering | Asymmetric threat | High |
| Losing market share, commoditized, moat disappeared | Differentiation erosion | High |
| Copied product, everyone does what we do | Feature parity threat | Medium |
| New startups entering, crowded market | Market saturation | Medium |

## Routing Logic

**Price-based competition** -- Route to `competitive-threat-diagnosis`. Price wars are symptoms; the diagnosis determines whether the root cause is undifferentiation, cost structure, or market dynamics. The `porters-five-forces` skill maps the competitive landscape. If the founder needs a strategic response, escalate to `competitive-response-playbook`.

**Asymmetric threat** -- Route to `competitive-threat-diagnosis` with urgency. When a dramatically larger player enters the market, the response framework differs from peer competition. `blue-ocean-strategy` helps identify uncontested spaces. `art-of-war` provides asymmetric response patterns.

**Differentiation erosion** -- Route directly to `competitive-response-playbook` if the founder has a clear picture of the competitive landscape. Otherwise, start with `competitive-threat-diagnosis`. The `disruptive-innovation` skill can reveal whether the founder should move upmarket or down.

**Feature parity threat** -- Route to `competitive-threat-diagnosis`. When competitors replicate features, the real question is whether the founder's advantage was ever defensible. `porters-five-forces` evaluates structural defensibility.

**Market saturation** -- Route to `competitive-threat-diagnosis` for landscape mapping, then consider `blue-ocean-strategy` for category creation.

## Disambiguation

This hook overlaps with `revenue-and-sales-hook` when competitive pressure manifests as lost deals or pricing pushback. The distinguishing signal: if the entrepreneur frames the problem around a specific competitor or market dynamic, this hook applies. If they frame it around their own sales numbers without reference to external forces, route to `revenue-and-sales-hook`. Overlap with `strategy-hook` occurs when competitive pressure triggers strategic questioning. If "competitors are crushing us" leads to "maybe we should pivot," the strategy-hook should take over.

## Example Conversations

**Example 1: Price war**
Entrepreneur says: "A VC-backed competitor dropped their price to zero for the first year. Our customers are switching."
Hook classifies as: Price-based competition with asymmetric funding.
Routes to: `competitive-threat-diagnosis` to assess sustainability of the threat, then `competitive-response-playbook` for counter-strategy.

**Example 2: Differentiation collapse**
Entrepreneur says: "Three years ago we were the only ones doing this. Now there are twelve competitors and they all look the same."
Hook classifies as: Differentiation erosion.
Routes to: `competitive-threat-diagnosis`, likely escalating to `blue-ocean-strategy` for category redefinition.

**Example 3: Giant enters the market**
Entrepreneur says: "Microsoft just announced a feature that does exactly what our entire product does."
Hook classifies as: Asymmetric threat.
Routes to: `competitive-threat-diagnosis` with urgency, then `art-of-war` for asymmetric positioning and `disruptive-innovation` for niche defense.
