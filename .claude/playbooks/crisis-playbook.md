---
name: "crisis-playbook"
description: "Used when a company faces acute crisis -- revenue collapse, team fractures, morale failure, or all three simultaneously. Chains financial diagnosis, team assessment, Stoic clarity, cognitive debiasing, and hard-decision frameworks into a compressed engagement designed for speed under pressure."
trigger_diagnostics:
  - revenue-diagnosis
  - team-dysfunction-diagnosis
  - leadership-crisis-diagnosis
steps:
  - skill: "revenue-diagnosis"
    purpose: "Identify the financial root cause with diagnostic precision"
    output: "Revenue failure analysis with causal tree and severity assessment"
  - skill: "team-dysfunction-diagnosis"
    purpose: "Assess team damage -- who is leaving, who has already checked out, where trust is broken"
    output: "Team health assessment with dysfunction categories and flight risk map"
  - skill: "stoic-control-and-clarity"
    purpose: "Separate what the founder can control from what they cannot -- the first prerequisite for sound crisis decisions"
    output: "Control/influence/accept matrix applied to the specific crisis"
  - skill: "enemies-of-clear-thinking"
    purpose: "Identify which cognitive defaults -- emotion, ego, social pressure, inertia -- are distorting the founder's judgment"
    output: "Default audit with specific safeguards for each identified trap"
  - skill: "tough-decision-situations"
    purpose: "Make the hard calls with structured frameworks for bad-option scenarios"
    output: "Decision matrix for crisis actions with trade-off analysis and sequencing"
final_outputs:
  - action-plan
  - investor-update-email
  - weekly-ceo-review
estimated_duration: "2-4 hours"
complexity: "advanced"
stage:
  - early-traction
  - growth
  - scale
author: "Fatih Guner"
---

# The Crisis Playbook

## When to Use This Playbook

Revenue is dropping and nobody can agree on why. The best engineer just quit and two more are interviewing elsewhere. The all-hands meeting felt like a eulogy. The founder is making decisions at 2 AM that they reverse by 9 AM.

This is not a strategy problem. This is a crisis -- a convergence of financial, organizational, and psychological pressure that demands a fundamentally different approach than normal operations. Crises punish deliberation and reward structured speed. This playbook is designed to be completed in hours, not weeks.

The most dangerous moment in a crisis is not the crisis itself but the founder's first instinct. Panic produces either paralysis or frantic activity, both of which accelerate the decline. This playbook interposes structure between the crisis and the response.

## Prerequisites

- Honest acknowledgment that the company is in crisis (the hardest prerequisite)
- Access to current financial data: revenue, burn rate, runway, pipeline
- Willingness to make decisions that will be unpopular
- A block of 2-4 uninterrupted hours (crises do not accommodate fragmented calendars)
- At minimum one trusted advisor or co-founder available for a gut-check

## The Sequence

### Step 1: Revenue Diagnosis
- **Purpose:** Financial crisis and emotional crisis feel the same from inside. The numbers tell the truth that feelings obscure. This step runs the revenue diagnostic within the playbook itself -- not as a pre-requisite routing step, but as the opening analytical move. The goal is to locate the causal root: is revenue falling because of churn, failed acquisition, pricing collapse, market contraction, or a single customer concentration?
- **Key questions:** Where exactly is revenue declining? Is this a demand problem or a retention problem? When did the trend begin and what changed? How many months of runway remain at current burn?
- **Input:** Revenue data by segment, cohort retention, pipeline data, burn rate, cash position
- **Output:** Revenue failure analysis with causal hierarchy (root cause, contributing factors, symptoms)
- **Time:** 30-60 minutes
- **Checkpoint:** The root cause must be specific. "Revenue is down" is not a diagnosis. "Enterprise churn increased 40% after Q2 price increase while SMB acquisition held steady" is a diagnosis. Do not proceed until the cause is named.

### Step 2: Team Dysfunction Diagnosis
- **Purpose:** Financial crises and people crises feed each other in a vicious cycle. Declining revenue creates fear; fear drives departures; departures increase workload on survivors; overwork produces more mistakes; mistakes accelerate revenue decline. This step breaks the cycle by mapping the human damage with clinical precision.
- **Key questions:** Who has already mentally departed? Where has trust broken down -- between founders, between leadership and team, or both? Which departures would be existential and which would be survivable? Is the team dysfunction a cause or a consequence of the financial crisis?
- **Input:** Attrition data, 1:1 notes, skip-level feedback, Slack sentiment (if available), recent exit interview themes
- **Output:** Team health map with dysfunction categories, flight risk assessment, and trust-break identification
- **Time:** 30-60 minutes
- **Checkpoint:** Distinguish between recoverable and terminal team damage. If the entire senior leadership layer is disengaged, the crisis response must prioritize retention before strategy.

## Decision Point

After completing Steps 1 and 2, the crisis reveals its nature:

**Is this a financial crisis, a people crisis, or both?**

- **Primarily financial (revenue root cause is clear, team is stressed but intact):** Proceed through Steps 3-5 with emphasis on financial decision-making. The team needs communication and direction, not intervention.
- **Primarily people (revenue is declining as a consequence of team dysfunction, not a cause):** Reweight the remaining steps. Step 3 (Stoic clarity) and Step 4 (enemies of clear thinking) apply directly to the founder's leadership posture. Step 5 (tough decisions) focuses on people decisions: who stays, who goes, how to rebuild trust.
- **Both (the common case):** Run all remaining steps fully. Sequence financial decisions first (they are more reversible than people decisions), then address team stabilization. Do not attempt to solve both simultaneously -- serial execution under crisis conditions outperforms parallel flailing.

### Step 3: Stoic Control and Clarity
- **Purpose:** Crisis amplifies the founder's illusion of control over uncontrollable factors and, paradoxically, their sense of helplessness over factors they can actually influence. The Stoic dichotomy of control is not philosophy for philosophy's sake -- it is a triage tool. What can you act on today? What must you accept and stop spending emotional capital on?
- **Key questions:** Which elements of this crisis are within your direct control? Which can you influence but not determine? Which must you accept as given constraints? Where are you spending energy on things you cannot change?
- **Input:** Revenue diagnosis, team assessment, founder's current emotional state (honestly assessed)
- **Output:** Control/Influence/Accept matrix specific to this crisis, with action items only in the "Control" column
- **Time:** 20-30 minutes
- **Checkpoint:** The "Control" column should contain no more than 5-7 items. If it contains 15, the founder has not been honest about what they can actually control. If it contains 1, they have retreated into learned helplessness.

### Step 4: Enemies of Clear Thinking
- **Purpose:** Under crisis pressure, four cognitive defaults hijack decision-making. The emotion default produces panic-driven decisions. The ego default prevents admitting the severity of the situation. The social default leads to consensus-seeking when decisive action is needed. The inertia default perpetuates the status quo when change is urgent. This step identifies which defaults are active and installs specific safeguards.
- **Key questions:** Which decisions in the past 48 hours were driven by fear rather than analysis? Where is ego preventing honest assessment? Are you seeking consensus to distribute blame? What obvious actions are you avoiding because they require change?
- **Input:** Recent decision log, control matrix from Step 3, honest self-assessment
- **Output:** Default audit identifying active traps, with specific countermeasures for each
- **Time:** 20-30 minutes
- **Checkpoint:** This step requires radical honesty. If the founder completes it and finds no active defaults, they have not completed it -- they have performed it. Every human under crisis pressure is subject to at least two of the four defaults. Name them or they will name you.

### Step 5: Tough Decision Situations
- **Purpose:** The preceding steps provided clarity. This step demands action. Crisis decisions typically involve choosing between bad options -- layoffs vs. runway exhaustion, bridge round vs. down round, product cuts vs. quality collapse. The framework structures these choices so the founder selects the least-bad option deliberately rather than the most-comfortable one by default.
- **Key questions:** What are the 2-3 decisions that must be made within 48 hours? What are the second-order consequences of each option? Which decisions are reversible and which are permanent? What is the 70% threshold -- the point at which waiting for more information costs more than acting on incomplete data?
- **Input:** Revenue diagnosis, team assessment, control matrix, default audit
- **Output:** Decision matrix with options ranked by reversibility, time-sensitivity, and impact magnitude, plus a sequenced 48-hour action plan
- **Time:** 30-60 minutes
- **Checkpoint:** Each decision must have an owner and a deadline. Decisions without deadlines in a crisis are decisions not to decide. If any decision lacks a clear owner, the founder is the owner by default.

## Final Deliverable

| Template | Audience | Purpose |
|----------|----------|---------|
| `action-plan` | Founder, leadership team | Immediate 48-hour crisis response plan with owners, deadlines, and decision sequencing |
| `investor-update-email` | Investors | Transparent crisis communication: what happened, what you know, what you are doing, what you need |
| `weekly-ceo-review` | Founder (self) | Operational tracking template for the 4-8 weeks following the crisis response |

## Common Pitfalls

1. **Moving too slowly.** The instinct to gather more data before acting is sound in normal operations and destructive in crisis. The 70% rule applies: if you have 70% of the information you need, act. The remaining 30% will cost more to acquire than the improvement in decision quality is worth.
2. **Communicating too late.** Investors, team members, and customers will learn about the crisis whether or not the founder tells them. Controlled, honest disclosure preserves trust. Delayed disclosure destroys it. Send the investor update within 48 hours of completing this playbook.
3. **Making all decisions simultaneously.** Crisis decisions interact. A layoff changes the product roadmap. A product cut changes the revenue forecast. A bridge round changes the equity structure. Sequence decisions so that each one informs the next. The action plan must specify order, not just content.
4. **Confusing activity with progress.** Under crisis pressure, founders often launch a dozen initiatives to feel productive. The control matrix from Step 3 and the decision framework from Step 5 exist to prevent this. Fewer actions, better executed, with clear ownership.
5. **Ignoring the founder's own state.** The Stoic clarity step is not optional self-help. A founder operating on three hours of sleep, driven by fear, making ego-defensive decisions will produce worse outcomes than a founder who takes four hours to run this playbook with a clear mind. The playbook's compressed timeline accounts for this -- 2-4 hours of focused work, not 2-4 hours stolen between emergencies.

## Adaptation Notes

- **Early-traction stage:** The crisis is likely existential. Runway is short, the team is small, and losing one person may be losing 20% of capacity. Step 5 decisions tend toward binary: pivot hard, seek a bridge, or wind down. The investor update is particularly critical -- early-stage investors may be willing to help if informed promptly.
- **Growth stage:** The crisis has more moving parts but also more resources. The team assessment (Step 2) becomes more complex because dysfunction may be localized to one department. Revenue diagnosis (Step 1) should segment by product line and geography. The action plan may involve restructuring rather than existential choices.
- **Scale stage:** Crisis at scale is public. Add a communications consideration to every decision: how will this be perceived by press, customers, and recruits? The investor update template may need board-level adaptation. The weekly CEO review becomes a daily review for the first two weeks.
