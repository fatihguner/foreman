---
name: "team-hook"
description: "Captures intent related to team dysfunction, hiring struggles, employee turnover, morale collapse, interpersonal conflict, and culture decay"
trigger_patterns:
  - "team isn't working"
  - "people are leaving"
  - "morale is terrible"
  - "can't hire anyone good"
  - "too much conflict"
  - "nobody takes ownership"
  - "my best person just quit"
  - "team is burned out"
  - "toxic dynamic"
routes_to:
  diagnostics:
    - team-dysfunction-diagnosis
    - hiring-diagnosis
    - culture-erosion-diagnosis
  skills:
    - tuckman-team-stages
    - belbin-team-roles
    - psychological-safety
    - radical-candor
    - thomas-kilmann-conflict
  playbooks:
    - team-rebuild-playbook
priority: "high"
author: "Fatih Guner"
---

# Team Hook

## Trigger Patterns

Team problems are deeply personal for founders. The language mixes management observation with emotional exhaustion and, frequently, self-blame.

- "The team just isn't working together"
- "People keep leaving and I can't stop the bleeding"
- "Morale is at rock bottom"
- "I can't hire anyone good -- or anyone at all"
- "There's too much conflict between departments"
- "Nobody takes ownership of anything"
- "My best engineer just gave notice"
- "The whole team is burned out"
- "There's a toxic dynamic I can't fix"
- "I dread our team meetings"
- "Feels like I'm the only one who cares"
- "People are quiet-quitting"
- "We lost three people this month"
- "My co-founder and I can't agree on anything"
- "The culture we built is falling apart"

## Intent Classification

| Pattern Cluster | Classified Intent | Confidence |
|---|---|---|
| Team not working, conflict, toxic dynamic | Team dysfunction | High |
| People leaving, best person quit, three people this month | Retention crisis | High |
| Can't hire, nobody good available | Hiring failure | High |
| Morale, burned out, quiet-quitting, dread meetings | Morale collapse | High |
| Nobody owns anything, only one who cares | Accountability vacuum | Medium |
| Co-founder disagreement, culture falling apart | Foundational fracture | Medium |

## Routing Logic

**Team dysfunction** -- Route to `team-dysfunction-diagnosis`. Dysfunction has many root causes: unclear roles, mismatched working styles, absent feedback loops, or structural misalignment. The `tuckman-team-stages` and `belbin-team-roles` skills help map the team's current state. If conflict is the dominant symptom, `thomas-kilmann-conflict` provides the response framework.

**Retention crisis** -- Route to `culture-erosion-diagnosis`. Departures are lagging indicators; the diagnostic looks for the leading causes. If culture is intact and the problem is compensation or growth opportunity, the path differs from toxic-culture retention loss.

**Hiring failure** -- Route to `hiring-diagnosis`. Hiring problems divide into pipeline (not enough candidates), selection (wrong candidates), or closing (candidates decline offers). Each requires a different intervention.

**Morale collapse** -- Route to `team-dysfunction-diagnosis` with a morale flag. The `psychological-safety` skill assesses whether the environment permits honest expression. `radical-candor` provides the communication framework for rebuilding trust.

**Accountability vacuum** -- Route to `team-dysfunction-diagnosis`. Ownership gaps typically trace to unclear expectations, missing feedback, or misaligned incentives. The `hackman-enabling-conditions` framework from the skills library addresses structural enabling conditions.

**Foundational fracture** -- Co-founder conflict routes to `cofounder-conflict-diagnosis`. Culture disintegration routes to `culture-erosion-diagnosis`, then to `team-rebuild-playbook` if a reset is warranted.

## Disambiguation

This hook overlaps with `leadership-hook` when "the team isn't working" reflects the founder's own leadership gaps rather than team-level problems. The distinguishing signal: if the founder describes the team as broken, this hook applies. If the founder describes themselves as inadequate or overwhelmed, route to `leadership-hook`. Overlap with `growth-hook` occurs when team strain results from scaling. If "team can't keep up" is framed as a growth constraint, defer to `growth-hook`.

## Example Conversations

**Example 1: Retention spiral**
Entrepreneur says: "We've lost five people in two months. The ones who stay seem checked out."
Hook classifies as: Retention crisis with morale collapse.
Routes to: `culture-erosion-diagnosis` to identify whether departures stem from culture, leadership, compensation, or growth ceiling.

**Example 2: Hiring wall**
Entrepreneur says: "I've been trying to hire a senior developer for four months. Nobody good applies, and the ones who do turn us down."
Hook classifies as: Hiring failure.
Routes to: `hiring-diagnosis` to separate pipeline, selection, and closing problems.

**Example 3: Co-founder rift**
Entrepreneur says: "My co-founder and I haven't agreed on a major decision in months. Every conversation turns into an argument."
Hook classifies as: Foundational fracture.
Routes to: `cofounder-conflict-diagnosis` to assess whether the disagreement is tactical or existential.
