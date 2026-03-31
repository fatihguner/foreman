---
name: "leadership-hook"
description: "Captures intent related to personal leadership struggles, founder burnout, impostor syndrome, isolation, delegation failure, and identity crises"
trigger_patterns:
  - "I feel like a fraud"
  - "burning out"
  - "can't keep up"
  - "I'm so isolated"
  - "don't know what I'm doing"
  - "losing confidence"
  - "should I even be CEO?"
  - "I'm the bottleneck"
  - "can't delegate"
routes_to:
  diagnostics:
    - leadership-crisis-diagnosis
  skills:
    - leader-resilience-and-wellbeing
    - delegation-and-empowerment
    - emotional-courage
    - leader-self-reflection
    - senior-leadership-transition
  playbooks:
    - founder-transition-playbook
priority: "high"
author: "Fatih Guner"
---

# Leadership Hook

## Trigger Patterns

Leadership distress is the most intimate category of founder communication. It surfaces as self-doubt, exhaustion, identity questioning, and a particular loneliness that comes from having no peers inside the organization.

- "I feel like a fraud and everyone's going to find out"
- "I'm burning out -- I can't sustain this pace"
- "I can't keep up with everything that's expected of me"
- "I'm so isolated -- nobody understands what this is like"
- "I honestly don't know what I'm doing anymore"
- "I'm losing confidence in my own decisions"
- "Should I even be the CEO? Maybe someone else should lead"
- "I'm the bottleneck for every decision in this company"
- "I can't delegate -- nobody does it right"
- "I haven't taken a day off in eight months"
- "I'm making decisions I'm not qualified to make"
- "The job outgrew me"
- "Everyone depends on me and I'm cracking"
- "I used to love this and now I dread it"
- "I don't know who to talk to about any of this"

## Intent Classification

| Pattern Cluster | Classified Intent | Confidence |
|---|---|---|
| Fraud, losing confidence, not qualified | Impostor syndrome | High |
| Burning out, can't sustain, no day off, dread it | Founder burnout | High |
| Isolated, nobody understands, who to talk to | Leadership isolation | High |
| Bottleneck, can't delegate, nobody does it right | Control and delegation failure | High |
| Should I be CEO, job outgrew me | Role-identity crisis | Medium |
| Don't know what I'm doing, cracking | Overwhelm | Medium |

## Routing Logic

**Impostor syndrome** -- Route to `leadership-crisis-diagnosis`. Impostor syndrome in founders is frequently rational -- the role genuinely expands beyond prior experience. The diagnostic separates skill gaps (addressable) from psychological spirals (different intervention). The `emotional-courage` and `leader-self-reflection` skills provide grounding frameworks.

**Founder burnout** -- Route to `leadership-crisis-diagnosis` with urgency. Burnout impairs every decision the founder makes, which means every other business problem becomes worse. The `leader-resilience-and-wellbeing` skill provides the recovery framework. Structural causes (over-centralized authority, no delegation) route to `delegation-and-empowerment`.

**Leadership isolation** -- Route to `leadership-crisis-diagnosis`. Isolation is both a symptom and a cause. The diagnostic determines whether the founder needs peer networks, advisory structures, or internal trust-building.

**Control and delegation failure** -- Route to `leadership-crisis-diagnosis`, then to the `delegation-and-empowerment` skill. Founders who cannot delegate face a hard ceiling. If the delegation failure connects to a broader organizational redesign, the `founder-transition-playbook` applies.

**Role-identity crisis** -- Route to `leadership-crisis-diagnosis`. "Should I be CEO?" is a question that deserves serious inquiry, not automatic reassurance. The `senior-leadership-transition` skill addresses the mechanics of role evolution. If the answer is genuinely "step aside," the `founder-transition-playbook` provides the path.

**Overwhelm** -- Route to `leadership-crisis-diagnosis`. Overwhelm is the broadest signal and requires the diagnostic to decompose it into addressable components.

## Disambiguation

This hook overlaps with `team-hook` when leadership frustration manifests as team complaints. The distinguishing signal: if the founder says "the team isn't performing," route to `team-hook`. If the founder says "I can't lead this team," route here. Overlap with `strategy-hook` occurs when "I don't know what I'm doing" reflects strategic confusion rather than personal crisis. If the uncertainty is about business direction, defer to `strategy-hook`. If the uncertainty is about personal capacity, this hook applies.

## Example Conversations

**Example 1: Burnout**
Entrepreneur says: "I'm working 80-hour weeks, I haven't seen my family in months, and I'm starting to make mistakes I never would have made a year ago."
Hook classifies as: Founder burnout.
Routes to: `leadership-crisis-diagnosis` with urgency, likely surfacing `leader-resilience-and-wellbeing` and structural delegation needs.

**Example 2: Delegation failure**
Entrepreneur says: "I hired a VP of Engineering to take things off my plate, but I keep jumping in because the quality drops when I step back."
Hook classifies as: Control and delegation failure.
Routes to: `leadership-crisis-diagnosis`, then `delegation-and-empowerment` to build a sustainable handoff framework.

**Example 3: Identity crisis**
Entrepreneur says: "The company needs a real CEO now -- someone with experience running a 200-person org. That's not me."
Hook classifies as: Role-identity crisis.
Routes to: `leadership-crisis-diagnosis` to determine whether this is growth-driven impostor syndrome or a genuine transition point, with `senior-leadership-transition` on standby.
