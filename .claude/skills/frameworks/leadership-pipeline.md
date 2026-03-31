---
name: "leadership-pipeline"
description: "Diagnoses leadership development blockages using Charan's six passage transitions from individual contributor through enterprise manager. Evaluates skills, time allocation, and values shifts required at each leadership level. Use when founders cannot let go of operational tasks, managers are failing after promotion, succession planning is needed, or the organization is experiencing growth-stage leadership bottlenecks."
version: "1.0.0"
category: "frameworks"
complexity: "advanced"
stage:
  - growth
  - scale
tags:
  - leadership-development
  - succession-planning
  - organizational-design
  - management
  - talent
  - scaling
related_skills:
  - situational-leadership
  - lewin-leadership-styles
  - tuckman-team-stages
  - hackman-enabling-conditions
author: "Fatih Guner"
---

# The Leadership Pipeline

A pipe carries fluid from one point to another. When the pipe is clean and correctly sized, flow is smooth and invisible -- you forget the plumbing exists. When the pipe is clogged, cracked, or the wrong diameter, the entire system backs up. Pressure builds in the wrong places. Things that should move freely stagnate. Eventually, something bursts.

Ram Charan, Stephen Drotter, and James Noel proposed in *The Leadership Pipeline* (2001) that organizations are precisely such plumbing systems, and leadership development is the flow. Each transition from individual contributor to first-line manager to functional leader to business leader to enterprise leader represents a distinct passage -- a joint in the pipe -- where the diameter changes, the flow dynamics shift, and blockages most commonly occur. The vast majority of leadership failures are not failures of character or intelligence. They are passage failures: someone operating with the skills, time allocation, and values of a previous level while occupying a role that demands an entirely different set. The pipe is clogged, and the organization suffers the consequences.

---

## The Framework

The Leadership Pipeline defines six leadership passages, each requiring a fundamental transformation in three dimensions: skills (what you do), time application (how you spend your hours), and work values (what you believe matters most).

### The Six Passages

```
Passage 6: Enterprise Manager
    ^
    |  [Values shift: long-term, visionary, portfolio thinking]
Passage 5: Group Manager
    ^
    |  [Values shift: strategic portfolio, business evaluation]
Passage 4: Business Manager
    ^
    |  [Values shift: P&L ownership, cross-functional integration]
Passage 3: Manager of Managers
    ^
    |  [Values shift: developing leaders, strategic resource allocation]
Passage 2: Manager of Others
    ^
    |  [Values shift: getting work done through others, not doing it yourself]
Passage 1: Managing Self (Individual Contributor)
    [Values: technical proficiency, personal productivity, reliability]
```

### Passage 1 to 2: From Managing Self to Managing Others

This is the passage where the greatest volume of blockage occurs and where startup founders feel it most acutely. The skills required shift from technical execution to planning, delegating, coaching, and measuring the work of others. Time application moves from doing the work to ensuring others do it. The value transformation is the most wrenching: the new manager must stop valuing personal technical contribution as the primary measure of worth and start valuing the success of their team.

The blockage symptom: the manager who still writes code, still closes deals, still designs the product -- because that is where their identity lives. Their reports wait for direction, receive little coaching, and eventually leave.

### Passage 2 to 3: From Managing Others to Managing Managers

The second passage requires selecting and developing first-line managers rather than individual contributors. The leader must learn to assess managerial capability (not just technical capability), allocate resources across teams, and think two levels down. Time shifts from direct supervision to strategic coordination.

The blockage symptom: the manager of managers who skips the middle layer, giving direction directly to individual contributors and undermining the first-line managers. The pipeline leaks talent at the manager level because they feel bypassed.

### Passage 3 to 4: From Managing Managers to Functional Manager

The functional manager oversees an entire function (engineering, marketing, finance) and must integrate the function's work with the broader business strategy. New skills include long-term functional strategy, mature cross-functional collaboration, and competing for resources at the executive level.

The blockage symptom: the functional leader who optimizes their silo without understanding how it connects to (or constrains) other functions. Engineering builds beautifully without regard for what sales can actually sell.

### Passage 4 to 5: From Functional Manager to Business Manager

This is the most significant and underestimated transition. The business manager owns a P&L and must integrate all functions -- a fundamentally different cognitive task from excelling at one function. Long-term thinking, risk management, and external orientation (customers, competitors, market trends) become primary.

The blockage symptom: the business manager who continues to over-index on their original function. The former VP of Engineering who, as General Manager, still spends 60% of their time on technical architecture while the commercial side atrophies.

### Passage 5 to 6: From Business Manager to Group/Enterprise Manager

The enterprise leader manages a portfolio of businesses and develops business managers. Success is measured in decades, not quarters. The skills are primarily about capital allocation, talent development at the most senior levels, and shaping organizational culture.

The blockage symptom: the enterprise leader who cannot resist running one of the businesses directly, starving the others of strategic attention.

---

## Prompts

**Prompt 1 -- Pipeline Blockage Diagnosis:**
> My company is at [stage] with [number] employees. I'm experiencing these leadership challenges: [describe -- e.g., "My VP of Engineering still reviews every pull request," "My managers don't develop their people," "I can't step back from day-to-day operations"]. Using the Leadership Pipeline model, diagnose which passage transitions are blocked, what skills/time/values shifts haven't occurred, and recommend specific interventions to clear the blockages.

**Prompt 2 -- Founder Passage Planning:**
> As founder and CEO of a [stage] startup growing from [current size] to [target size], map my personal leadership pipeline journey. What passage am I currently navigating? What skills must I develop, what time allocation must change, and what values must I adopt to successfully make this transition? Be specific about what I need to stop doing, start doing, and continue doing.

**Prompt 3 -- Succession Pipeline Design:**
> I need to build a leadership pipeline for my [function/company] that currently has [describe structure]. Identify the critical passage transitions that need to happen in the next 12-24 months, the people who are candidates for each transition, and the development programs or experiences that would prepare them. Flag any passages where we have no viable candidates -- these are our succession gaps.

---

## Use Cases

**Series B Startup Where the Founder Cannot Let Go**

A Series B edtech company with 85 employees and $12M ARR has a founder-CEO who still approves every major product decision, attends every customer escalation call, and reviews every marketing campaign. The board has raised the issue twice. The founder genuinely believes no one else can do these things as well. A Leadership Pipeline analysis reveals the founder is stuck at Passage 1-2: still operating as a super-powered individual contributor managing others rather than managing managers who manage others. The intervention is threefold: hire a VP of Product (Passage 4 candidate), promote two senior engineers to engineering managers and invest in their Passage 1-2 transition, and create explicit decision-rights documentation that removes the founder from operational decisions. The founder's time allocation must shift from 80% execution / 20% strategy to the inverse.

**Hypergrowth Company Losing Middle Management**

A growth-stage marketplace company tripled headcount in 18 months. Attrition is concentrated at the manager level -- exactly the people promoted from individual contributor roles during the scaling surge. Pipeline analysis reveals a systemic Passage 1-2 failure: the company promoted its best engineers, designers, and salespeople into management roles without any transition support. These new managers were still valued (and valued themselves) for individual output, not team development. None received training in delegation, coaching, or performance management. The fix is a dedicated management development program focused on the three dimensions of the passage: skills workshops on delegation and feedback, time audits to shift from doing to managing, and explicit recalibration of what the company rewards -- measuring managers on team output, not personal heroics.

---

## Anti-Patterns

- **Promoting Based on Current-Level Excellence.** The single most common pipeline error: promoting the best salesperson to sales manager, the best engineer to engineering lead, the best analyst to analytics director. Excellence at level N is not evidence of readiness for level N+1. The skills, time application, and values are fundamentally different. Promotion should be based on evidence of next-level capabilities, not current-level performance.

- **Skipping Passages.** Leapfrogging someone from individual contributor to managing managers, or from functional leader to enterprise leader, without adequate preparation at intermediate levels. Each passage builds capabilities that the next passage assumes. Skipping one creates leaders who lack foundational skills they cannot easily acquire under the pressure of a more senior role.

- **Allowing Passage Regression.** Tolerating leaders who retreat to the comfort of a previous passage under stress. The VP of Engineering who starts coding again during crunch time. The CEO who takes over a sales call because the deal is "too important." Each regression reinforces the old values and signals to the organization that passage transitions are optional.

- **Pipeline Without Development Infrastructure.** Diagnosing passage transitions without investing in the coaching, training, and mentoring required to support them. Telling a new manager to "manage, not do" without teaching them how is a recipe for failure and resentment.

- **Ignoring the Values Dimension.** Focusing development exclusively on skills while neglecting the values transformation. A manager can learn delegation techniques in a workshop. Learning to genuinely value team success over personal contribution requires sustained coaching, reinforcement, and often a personal identity shift that workshops alone cannot produce.

---

## By Stage

| Stage | Focus | Key Difference |
|-------|-------|----------------|
| Growth | Founder's Passage 1-2 and first management layer | The founder must navigate their own passage while simultaneously supporting the first generation of managers through theirs; this dual demand is the defining challenge of the growth stage |
| Scale | Building passages 2-4 systematically | The organization needs formal pipeline infrastructure: management development programs, assessment criteria for passage readiness, and succession planning at every level |

---

## Output Template

```markdown
# Leadership Pipeline Assessment: [Company Name]

**Date:** [Date]
**Company Stage:** [Stage]
**Headcount:** [Number]
**Assessed by:** [Name/Role]

## Current Pipeline Map

| Person | Current Role | Pipeline Level | Operating At Level | Gap? | Blockage Description |
|--------|-------------|---------------|-------------------|------|---------------------|
| [Name] | [Role] | [Passage N] | [Passage N-1/N/N+1] | [Yes/No] | [Description if yes] |

## Critical Blockages (Priority Order)

### Blockage 1: [Person/Role]
- **Expected level:** [Passage N]
- **Operating at:** [Passage N-x]
- **Skills gap:** [What they can't yet do]
- **Time allocation gap:** [How they spend time vs. how they should]
- **Values gap:** [What they value vs. what they should value at this level]
- **Intervention plan:** [Specific actions, timeline, support needed]

### Blockage 2: [Person/Role]
...

## Succession Gaps

| Role/Passage | Current Holder | Ready-Now Successor | Ready-in-12-Months | Development Needed |
|-------------|---------------|--------------------|--------------------|-------------------|
| [Role] | [Name] | [Name or NONE] | [Name or NONE] | [Development plan] |

## 90-Day Pipeline Development Plan
1. [Priority action]
2. [Priority action]
3. [Priority action]

## Investment Required
- **Training/coaching budget:** [Amount]
- **Time commitment from senior leaders:** [Hours/week]
- **External support needed:** [Coaches, programs, assessments]
```

---

## Related Skills

- **[Situational Leadership](situational-leadership.md)** -- Each pipeline passage requires the leader to adopt different situational styles; a first-time manager needs more direction (S1-S2), while a business manager requires delegation and strategic support (S3-S4).
- **[Hackman's Enabling Conditions](hackman-enabling-conditions.md)** -- Senior pipeline levels (Passages 3+) are primarily about creating the conditions Hackman describes rather than directing work.
- **[Tuckman's Team Stages](tuckman-team-stages.md)** -- Newly promoted managers often inherit or form new teams that restart the Tuckman cycle; understanding team stages helps navigate passage transitions.
- **[Delegation and Empowerment](../leadership/delegation-and-empowerment.md)** -- Every pipeline passage requires letting go of previous-level tasks, making delegation the core behavioral shift at each transition.
- **[Senior Leadership Transition](../leadership/senior-leadership-transition.md)** -- Addresses the practical challenges of moving into senior roles, directly complementing the pipeline's structural model of leadership passages.
- **[Mentoring and Coaching](../leadership/mentoring-and-coaching.md)** -- Pipeline transitions succeed when supported by coaching; managers at each passage need mentors who have navigated the same transition.
