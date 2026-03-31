---
name: "growth-hook"
description: "Captures intent related to growth plateaus, scaling constraints, operational limits, and the structural challenges of moving from one stage to the next"
trigger_patterns:
  - "growth has stalled"
  - "we hit a ceiling"
  - "can't scale"
  - "stuck at this level"
  - "team can't keep up"
  - "everything breaks when we grow"
  - "we need to 10x but can't"
  - "outgrew our processes"
routes_to:
  diagnostics:
    - growth-stall-diagnosis
    - operational-chaos-diagnosis
  skills:
    - systems-thinking
    - kaizen-bpr
    - balanced-scorecard
  playbooks:
    - scaling-playbook
priority: "high"
author: "Fatih Guner"
---

# Growth Hook

## Trigger Patterns

Growth stalls are felt viscerally before they are understood analytically. Founders describe the sensation in operational, emotional, and structural terms.

- "Growth has stalled and I can't figure out why"
- "We hit a ceiling around $2M ARR and can't break through"
- "Can't scale past this point"
- "We're stuck at the same level we were six months ago"
- "The team can't keep up with demand"
- "Everything breaks when we try to grow"
- "We need to 10x but the business won't hold"
- "We outgrew our processes months ago"
- "Adding people isn't making us faster"
- "Our infrastructure can't handle more customers"
- "Growing is actually making things worse"
- "We plateaued and nothing we try changes it"
- "The org chart makes no sense anymore"
- "We're scaling chaos, not the business"
- "How do I get to the next stage?"

## Intent Classification

| Pattern Cluster | Classified Intent | Confidence |
|---|---|---|
| Stalled, plateau, stuck, same level | Growth plateau | High |
| Everything breaks, scaling chaos, infrastructure | Operational strain | High |
| Team can't keep up, adding people not helping | Organizational scaling failure | High |
| Need to 10x, next stage, break through ceiling | Stage transition challenge | Medium |
| Outgrew processes, org chart broken | Structural misfit | Medium |

## Routing Logic

**Growth plateau** -- Route to `growth-stall-diagnosis`. The root cause could be market saturation, product-market fit erosion, channel exhaustion, or pricing ceiling. The diagnostic teases these apart before selecting the right playbook.

**Operational strain** -- Route to `operational-chaos-diagnosis`. When the infrastructure (technical, human, or process) cannot absorb growth, the problem is structural. If confirmed, escalate to `scaling-playbook` with a process-first orientation. The `kaizen-bpr` skill provides tactical process redesign.

**Organizational scaling failure** -- Route to `growth-stall-diagnosis` with an organizational flag. Headcount growing faster than output is a classic symptom. The `systems-thinking` skill helps founders see the feedback loops that create this dynamic.

**Stage transition challenge** -- Route to `scaling-playbook` directly when the entrepreneur articulates the gap between current and target state clearly. For vague articulations, start with `growth-stall-diagnosis`.

**Structural misfit** -- Route to `operational-chaos-diagnosis`. Org charts, reporting lines, and process design that worked at one stage become liabilities at the next.

## Disambiguation

This hook borders `strategy-hook` when "growth stalled" actually means "we lost strategic direction." The distinguishing signal: if the entrepreneur knows what they want to achieve but cannot execute it, this hook applies. If they are uncertain about what to pursue, route to `strategy-hook`. Overlap with `team-hook` occurs when scaling failures manifest as people problems. If the entrepreneur leads with team frustration rather than growth metrics, defer to `team-hook`.

## Example Conversations

**Example 1: Revenue plateau**
Entrepreneur says: "We got to $1.5M ARR really fast, but we've been stuck here for eight months."
Hook classifies as: Growth plateau.
Routes to: `growth-stall-diagnosis` to determine whether the ceiling is market, product, channel, or pricing.

**Example 2: Operational breaking point**
Entrepreneur says: "Every time we onboard a new batch of customers, something breaks. Support tickets spike, the team scrambles, and we lose half of them within a month."
Hook classifies as: Operational strain.
Routes to: `operational-chaos-diagnosis`, likely escalating to `scaling-playbook` and `kaizen-bpr`.

**Example 3: Stage transition**
Entrepreneur says: "We're a 30-person company trying to operate like a 10-person startup. It's not working."
Hook classifies as: Structural misfit.
Routes to: `operational-chaos-diagnosis` to map the structural gaps, then `scaling-playbook` for the redesign.
