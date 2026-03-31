---
name: "team-dysfunction-diagnosis"
description: "Identifies the root cause of team dysfunction by distinguishing between psychological safety deficits, unclear roles, culture erosion, leadership style mismatches, burnout, and hiring mistakes. Use when an entrepreneur reports low morale, high turnover, persistent conflict, or a general sense that the team is broken."
entry_symptoms:
  - "The team isn't working"
  - "Morale is low"
  - "People are leaving"
  - "Too much conflict"
  - "Nobody takes ownership"
  - "We used to work well together"
possible_diagnoses:
  - psychological-safety-deficit
  - unclear-roles
  - culture-erosion
  - leadership-style-mismatch
  - burnout-epidemic
  - hiring-mistakes
routes_to_skills:
  - tuckman-team-stages
  - hackman-enabling-conditions
  - psychological-safety
  - belbin-team-roles
  - organisational-culture
  - situational-leadership
routes_to_templates:
  - team-health-check
  - feedback-360-template
  - culture-values-document
author: "Fatih Guner"
---

# Team Dysfunction Diagnosis

## Entry Symptoms

The entrepreneur describes breakdown in human terms: "The team isn't working," "Morale is terrible," "People keep leaving," or "Nobody takes ownership." These complaints are almost always symptoms, not causes. A team that "isn't working" could be suffering from a dozen different ailments — and the wrong treatment makes most of them worse.

## Triage Questions

### Q1: When did the dysfunction start?

- **After a specific event (a firing, a reorganisation, a failed project, a funding round)** — the dysfunction is reactive. Proceed to Q3 to assess structural fallout.
- **It built gradually over months** — the dysfunction is systemic. Proceed to Q2.
- **It has always been this way** — the team may have been poorly constructed from the start. Likely diagnosis: **hiring-mistakes**. Confirm with Q5.

### Q2: Is the dysfunction affecting the whole team or concentrated in specific individuals or groups?

- **The whole team — pervasive low energy, disengagement, or frustration** — this points to environmental causes. Proceed to Q4.
- **Specific individuals or a subgroup** — this points to interpersonal or role-based causes. Proceed to Q3.
- **It shifts depending on the project or week** — the team lacks stable operating norms. Likely diagnosis: **unclear-roles**. Confirm with Q3.

### Q3: Are roles, responsibilities, and decision rights clear to everyone on the team?

- **No — people overlap, compete for territory, or don't know who decides what** — likely diagnosis: **unclear-roles**. The most common cause of team friction that founders mislabel as "personality conflict."
- **Roles are clear on paper, but people don't feel empowered to act** — likely diagnosis: **psychological-safety-deficit**. People know their role but fear consequences of exercising it.
- **Roles are clear, people act on them, but there's still conflict** — proceed to Q4. The issue sits deeper.

### Q4: Do people feel safe to speak up, disagree, admit mistakes, and ask for help?

- **No — dissent is punished or ignored, mistakes are hidden, meetings are performative** — likely diagnosis: **psychological-safety-deficit**. This is the foundational issue and must be addressed before other interventions can take hold.
- **People speak up but nothing changes — leadership doesn't act on feedback** — likely diagnosis: **leadership-style-mismatch**. The leader's approach is misaligned with what the team needs.
- **People are too exhausted to care — they've stopped engaging entirely** — likely diagnosis: **burnout-epidemic**. Proceed to Q6 for confirmation.

### Q5: Looking at the last 5 hires, how many are performing at the level expected when they were hired?

- **Fewer than half** — likely diagnosis: **hiring-mistakes**. The team's composition is the root problem, not its dynamics.
- **Most are performing well individually, but the team doesn't gel** — the issue is relational, not individual. Return to Q3 and Q4 for structural and psychological causes.
- **Performance was strong initially but has degraded over time** — the environment is eroding capability. Likely diagnosis: **culture-erosion** or **burnout-epidemic**. Proceed to Q6.

### Q6: What does the leader's typical week look like in relation to the team?

- **The leader is in every meeting, makes most decisions, and is the bottleneck** — likely diagnosis: **leadership-style-mismatch** (over-centralised). The team has learned helplessness.
- **The leader is absent — travelling, fundraising, or focused elsewhere** — likely diagnosis: **culture-erosion**. Without active leadership presence, norms decay.
- **The leader is present but the team seems to work around them** — likely diagnosis: **leadership-style-mismatch**. The leader has lost the team's trust or respect.
- **The leader is working 80-hour weeks and expects the same from the team** — likely diagnosis: **burnout-epidemic**, driven from the top.

## Diagnosis Map

| Diagnosis | Key Signals | Confirmation Path |
|-----------|------------|-------------------|
| **Psychological safety deficit** | Silence in meetings, hidden mistakes, fear of dissent, performative agreement | Q4 confirms fear + Q3 shows roles clear but unused |
| **Unclear roles** | Territory disputes, duplicated work, decision paralysis, "that's not my job" | Q3 confirms ambiguity + Q2 shows shifting dysfunction |
| **Culture erosion** | Gradual disengagement, "it used to be different," leader absent, norms inconsistent | Q1 shows gradual onset + Q6 shows leadership absence |
| **Leadership style mismatch** | Feedback ignored, leader bottlenecks decisions, team works around leader | Q4 shows feedback futility + Q6 shows centralisation or disconnect |
| **Burnout epidemic** | Exhaustion, disengagement, cynicism, high absenteeism, leader overworking | Q4 shows apathy + Q6 shows unsustainable pace from top |
| **Hiring mistakes** | Persistent underperformance, cultural misfit, team never cohered | Q1 shows "always this way" + Q5 confirms performance gaps |

## Routing

**Psychological safety deficit:**
1. Apply `psychological-safety` — build the diagnostic framework and intervention plan
2. Apply `tuckman-team-stages` — assess whether the team regressed to an earlier stage
3. Output with `team-health-check`

**Unclear roles:**
1. Apply `belbin-team-roles` — map natural role preferences and identify gaps or overlaps
2. Apply `hackman-enabling-conditions` — establish the structural conditions for clarity
3. Output with `team-health-check` and `role-description-template`

**Culture erosion:**
1. Apply `organisational-culture` — diagnose the current culture versus the desired culture
2. Apply `tuckman-team-stages` — assess team developmental regression
3. Output with `culture-values-document`

**Leadership style mismatch:**
1. Apply `situational-leadership` — match leadership style to team maturity and context
2. Output with `feedback-360-template` and `one-on-one-template`

**Burnout epidemic:**
1. Apply `leader-resilience-and-wellbeing` — address the leader's own burnout first
2. Apply `hackman-enabling-conditions` — redesign workload and support structures
3. Output with `team-health-check`

**Hiring mistakes:**
1. Apply `belbin-team-roles` — understand what the team actually needs versus what it has
2. Apply `hackman-enabling-conditions` — determine if the right people are in the wrong structure
3. Output with `hiring-scorecard` and `team-health-check`

## Red Flags

- **An employee has made a formal harassment, discrimination, or safety complaint.** This is a legal and HR matter that requires professional investigation, not a framework exercise. Engage employment counsel immediately.
- **The entrepreneur describes the dysfunction but refuses to consider that they might be the cause.** Every diagnostic path in this system includes the possibility that leadership is the root issue. If the founder categorically rejects this, the diagnostic cannot function honestly.
- **Turnover exceeds 40% annually and the company has fewer than 20 people.** At this scale and rate, the organisation is in existential staffing crisis. Stabilise before diagnosing culture.
