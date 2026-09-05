---
name: "strategy-hook"
description: "Captures intent related to strategic direction, focus problems, pivot decisions, planning paralysis, and market-shift responses"
trigger_patterns:
  - "lost our strategy"
  - "should I pivot?"
  - "doing too many things"
  - "no focus"
  - "don't know our direction"
  - "keep changing plans"
  - "strategy isn't working"
  - "we need to rethink everything"
  - "market shifted under us"
routes_to:
  diagnostics:
    - strategic-drift-diagnosis
    - decision-paralysis-diagnosis
  skills:
    - scenario-planning
    - swot-pest-analysis
    - systems-thinking
    - defining-and-exploring-problems
  playbooks:
    - pivot-playbook
    - strategy-reset-playbook
priority: "high"
author: "Fatih Guner"
---

# Strategy Hook

## Trigger Patterns

Strategic uncertainty is among the most disorienting founder experiences. The language ranges from crisp analytical questioning to formless anxiety about direction.

- "We've lost our strategy -- if we ever had one"
- "Should I pivot or keep pushing?"
- "We're doing too many things and none of them well"
- "There's no focus in this company"
- "I don't know what direction to take"
- "We keep changing the plan every quarter"
- "Our strategy clearly isn't working"
- "We need to rethink everything from scratch"
- "The market shifted and our plan is obsolete"
- "I can't tell if we should double down or change course"
- "We have too many opportunities and can't choose"
- "The team doesn't understand where we're going"
- "Every board meeting someone questions our strategy"
- "We're spreading ourselves too thin"
- "I've been going back and forth on this decision for months"

## Intent Classification

| Pattern Cluster | Classified Intent | Confidence |
|---|---|---|
| Lost strategy, no direction, team doesn't understand | Strategic absence | High |
| Should I pivot, double down or change, rethink everything | Pivot deliberation | High |
| Too many things, no focus, spreading thin, too many opportunities | Focus crisis | High |
| Keep changing plans, back and forth for months | Decision paralysis | High |
| Market shifted, plan obsolete, strategy not working | Strategy obsolescence | Medium |

## Routing Logic

**Strategic absence** -- Route to `strategic-drift-diagnosis`. Companies without a clear strategy often have one buried under accumulated tactical decisions. The diagnostic unearths it or confirms its absence. From there, the `strategy-reset-playbook` provides the reconstruction process. The `swot-pest-analysis` skill grounds the reset in market reality.

**Pivot deliberation** -- Route to `strategic-drift-diagnosis` first. Pivot impulses are often reactions to short-term pain rather than genuine strategic misalignment. The diagnostic separates "this strategy needs more time" from "this strategy is fundamentally wrong." If a pivot is warranted, escalate to `pivot-playbook`.

**Focus crisis** -- Route to `decision-paralysis-diagnosis`. Lack of focus is a decision failure: the founder has not committed to a direction. The `defining-and-exploring-problems` skill helps structure the choice. If focus loss stems from organizational sprawl rather than decision avoidance, re-route to `strategic-drift-diagnosis`.

**Decision paralysis** -- Route to `decision-paralysis-diagnosis` directly. Extended indecision has compounding costs. The diagnostic identifies what is blocking the decision -- information gaps, fear of irreversibility, or stakeholder disagreement -- and prescribes accordingly.

**Strategy obsolescence** -- Route to `strategic-drift-diagnosis` with a market-shift flag. The `scenario-planning` skill helps founders map possible futures when the current map has proven unreliable. If the obsolescence is confirmed, escalate to `strategy-reset-playbook`.

## Disambiguation

This hook overlaps with `competition-hook` when strategic uncertainty is triggered by competitive moves. If "we need to rethink everything" follows a competitor's action, the competition-hook should take first pass. Overlap with `product-hook` occurs when "should I pivot?" means "should I change the product?" rather than "should I change the business direction?" If the questioning centers on product features and user feedback, defer to `product-hook`. Overlap with `leadership-hook` occurs when "I don't know our direction" is really "I don't know what I'm doing." If the uncertainty is personal rather than organizational, defer to `leadership-hook`.

## Example Conversations

**Example 1: Pivot question**
Entrepreneur says: "We've been at this for eighteen months with mediocre traction. Part of me says keep pushing, part of me says try something new."
Hook classifies as: Pivot deliberation.
Routes to: `strategic-drift-diagnosis` to assess whether the current path has unrealized potential or is genuinely misaligned with market demand.

**Example 2: Focus collapse**
Entrepreneur says: "We started as a B2B SaaS tool, then added a marketplace, then a services arm. Now nothing is growing because we can't give anything enough attention."
Hook classifies as: Focus crisis.
Routes to: `decision-paralysis-diagnosis` to break the multi-front commitment, likely escalating to `strategy-reset-playbook` for consolidation.

**Example 3: Market disruption**
Entrepreneur says: "AI just made our core product irrelevant. Our three-year roadmap is worthless."
Hook classifies as: Strategy obsolescence.
Routes to: `strategic-drift-diagnosis` with urgency, then `scenario-planning` to map new trajectories, potentially into `pivot-playbook` for execution.
