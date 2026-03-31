---
name: "team-rebuild-playbook"
description: "Guides founders through rebuilding a broken or dysfunctional team -- whether the problem is high turnover, toxic dynamics, trust collapse, or starting from scratch after a reset. Provides a structured path from diagnosis through team design, trust restoration, and alignment on shared objectives. Use when experiencing chronic turnover, interpersonal conflict, post-layoff morale collapse, or building a new team from the ground up."
version: "1.0.0"
category: "playbooks"
complexity: "intermediate"
stage:
  - idea
  - validation
  - early-traction
  - growth
  - scale
trigger_diagnostics:
  - team-dysfunction-diagnosis
  - hiring-diagnosis
  - culture-erosion-diagnosis
steps:
  - skill: "belbin-team-roles"
    purpose: "Audit the current team composition to identify which functional roles are present, missing, or over-represented"
    output: "Team role audit showing distribution, gaps, and redundancies across Belbin's nine roles"
  - skill: "psychological-safety"
    purpose: "Establish the foundational condition for trust -- the ability to speak honestly without fear of punishment"
    output: "Psychological safety assessment with specific interventions to raise safety levels"
  - skill: "tuckman-team-stages"
    purpose: "Understand where the team currently sits in its developmental arc and what it needs to progress"
    output: "Stage assessment with targeted actions to move the team toward performing"
  - skill: "hackman-enabling-conditions"
    purpose: "Set the structural conditions that allow teams to succeed regardless of individual personalities"
    output: "Enabling conditions audit with gaps identified and structural changes recommended"
  - skill: "giving-feedback"
    purpose: "Establish a feedback culture from day one so that problems surface early rather than fester"
    output: "Feedback framework with norms, cadence, and practical methods for the team"
  - skill: "smart-goals"
    purpose: "Align the rebuilt team on shared objectives that are concrete, measurable, and time-bound"
    output: "Goal set for the team's first 90 days with clear ownership and success criteria"
final_outputs:
  - team-health-check
  - hiring-scorecard
  - culture-values-document
  - action-plan
estimated_duration: "6-12 hours across 2-4 weeks"
author: "Fatih Guner"
---

# Team Rebuild Playbook

A broken team is not a people problem disguised as a business problem. It is a business problem, full stop. When trust has collapsed, when the best people are leaving, when meetings produce silence instead of ideas -- revenue follows culture downward, always. The instinct is to hire replacements and hope fresh faces fix stale dynamics. They will not. New people imported into a broken system become part of the broken system, typically within their first quarter. Rebuilding a team requires dismantling and reconstructing the conditions under which people work, not merely swapping the people.

---

## When to Use This Playbook

- Turnover exceeds 25% annually and exit interviews reveal cultural or leadership causes
- A key departure (or series of departures) has left the team structurally incomplete
- Interpersonal conflict is consuming management attention and reducing output
- A layoff, restructuring, or leadership change has shattered team trust
- The founder is building a team from scratch and wants to avoid the common mistakes
- Performance has declined without a clear operational or market explanation

## Prerequisites

- Honest assessment of whether the founder or leadership is part of the problem (if yes, this playbook still applies -- but self-awareness is non-negotiable)
- Commitment to completing the full sequence rather than cherry-picking comfortable steps
- Willingness to make personnel decisions if the diagnosis points to specific individuals
- Protected time for the team to engage in the process without it being squeezed into margins

---

## The Sequence

### Step 1: Belbin Team Roles -- Audit the Current Composition

Before fixing dynamics, understand the structural reality. Map every team member against Belbin's nine roles: who are the natural coordinators, the shapers, the implementers, the creative plants? A team overloaded with ideas people and missing finishers will produce different dysfunction than one with all executors and no strategic thinkers. The audit reveals whether the problem is compositional, interpersonal, or both.

**Checkpoint:** Role map completed. Gaps and over-concentrations identified. If rebuilding from scratch, this becomes the blueprint for hiring.

### Step 2: Psychological Safety -- Build the Foundation for Trust

Nothing else in this playbook works without this. Psychological safety -- the shared belief that the team is safe for interpersonal risk-taking -- is the single strongest predictor of team effectiveness, above individual talent, resources, or strategy. Assess the current level honestly: can people disagree with leadership without consequences? Can someone admit a mistake without career risk? If the answer is no, the remaining steps will produce compliance, not genuine teamwork.

**Checkpoint:** Safety assessment completed. At least three concrete interventions initiated (leader vulnerability, response to failure, explicit norm-setting).

---

### Decision Point: People or System?

This is the critical diagnostic question. The first two steps should reveal whether the dysfunction originates from **specific individuals** (toxic behavior, values misalignment, persistent underperformance) or from **systemic conditions** (poor structure, unclear roles, absent feedback mechanisms, leadership failures).

**If specific individuals are the problem:** Address the personnel issue directly before proceeding. No amount of structural improvement compensates for a toxic team member whose behavior undermines psychological safety. This may mean difficult conversations, performance management, or separation. Do this before Step 3.

**If the system is the problem:** Proceed sequentially through Steps 3-6. The individuals are likely capable -- they are operating in conditions that prevent them from performing.

In many cases, the answer is both. Handle the personnel issues first, then rebuild the system for the remaining and incoming team members.

---

### Step 3: Tuckman Team Stages -- Locate the Team on the Development Arc

Every team moves through forming, storming, norming, and performing -- and most rebuilt teams are back at forming whether they acknowledge it or not. A team that recently lost members, gained new ones, or survived a crisis should not be treated as a mature unit. Identify the current stage honestly, design interventions appropriate to that stage, and resist the temptation to rush through storming. Conflict handled well at this stage builds the foundation for performing later.

**Checkpoint:** Stage identified with consensus from the team. Development plan aligned to the specific needs of that stage.

### Step 4: Hackman Enabling Conditions -- Set Structural Foundations

Individual goodwill cannot compensate for structural deficiency. Apply Hackman's five conditions: is this a real team with clear boundaries? Does it have a compelling direction? Is the structure enabling (right size, right skills, clear norms)? Is the organizational context supportive (resources, information, rewards)? Is there access to expert coaching? Address every gap. These conditions are the architecture within which culture forms.

**Checkpoint:** All five conditions assessed. Structural changes implemented or scheduled with owners and deadlines.

### Step 5: Giving Feedback -- Establish the Communication Culture

Broken teams almost always have broken feedback loops. Either feedback does not exist (problems fester in silence), or it exists only as criticism (people learn to hide mistakes). Establish the norms, methods, and cadence for constructive feedback from day one of the rebuild. This includes upward feedback to leadership -- if people cannot tell the founder what is not working, the rebuild will stall.

**Checkpoint:** Feedback norms documented and practiced. At least one round of structured feedback completed with the team.

### Step 6: SMART Goals -- Align on Shared Objectives

A rebuilt team needs a shared win. Define goals for the first 90 days that are specific, measurable, achievable, relevant, and time-bound. The goals should be team goals, not individual targets -- the purpose is to rebuild the experience of collective accomplishment. Choose objectives that are ambitious enough to require genuine collaboration but achievable enough to restore confidence.

**Checkpoint:** Goal set published. Every team member can articulate the team's objectives and their individual contribution to them.

---

## Final Deliverable

Upon completing all six steps, compile the following outputs:

| Output | Template | Audience |
|--------|----------|----------|
| Team Health Check | `team-health-check` | Founder, leadership team |
| Hiring Scorecard | `hiring-scorecard` | Hiring managers (if rebuilding) |
| Culture and Values Document | `culture-values-document` | Entire team |
| Team Rebuild Action Plan | `action-plan` | Leadership team |

## Common Pitfalls

- **Skipping the diagnosis.** Jumping to team-building exercises without understanding the root cause is organizational theatre. It feels productive and changes nothing.
- **Tolerating toxic individuals for their output.** One high-performing person who destroys psychological safety costs more than their output generates. The math is never close.
- **Declaring the rebuild complete too early.** Trust rebuilds slowly. A good week does not mean the team is fixed. Sustain the process for the full duration.
- **Treating team-building as separate from real work.** The rebuild should happen through the work, not alongside it. Offsites and workshops supplement; they do not substitute.

## Adaptation Notes

- **Post-layoff teams** require disproportionate investment in Step 2 (psychological safety). Survivor guilt and job insecurity suppress honest communication -- address this directly before proceeding.
- **Founding teams** (co-founders) experiencing conflict should prioritize the decision point honestly. Co-founder breakups are among the most common startup killers, and this playbook cannot fix fundamental values misalignment between founders.
- **Remote teams** need more explicit structure in Steps 4 and 5. Physical distance amplifies ambiguity -- compensate with over-communication of norms, roles, and feedback mechanisms.
- **Rapidly growing teams** absorbing many new hires simultaneously should run Steps 1-3 as a recurring cycle, not a one-time exercise. Every significant hiring wave resets the team's developmental stage.
