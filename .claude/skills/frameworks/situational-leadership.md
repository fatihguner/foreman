---
name: "situational-leadership"
description: "Matches leadership style to follower development level using Hersey and Blanchard's Situational Leadership model. Maps four styles -- directing, coaching, supporting, delegating -- to four development levels based on competence and commitment per task. Use when diagnosing style mismatches causing disengagement, assessing delegation readiness, onboarding experienced hires who are new to the domain, or building a management training curriculum."
version: "1.0.0"
category: "frameworks"
complexity: "intermediate"
stage:
  - early-traction
  - growth
  - scale
tags:
  - leadership
  - management
  - team-development
  - delegation
  - coaching
related_skills:
  - lewin-leadership-styles
  - tuckman-team-stages
  - leadership-pipeline
  - hackman-enabling-conditions
author: "Fatih Guner"
---

# Situational Leadership

When Steve Jobs returned to Apple in 1997, he ran the company with iron-fisted directiveness -- killing product lines, overruling engineers, and making unilateral decisions that saved the company from bankruptcy. A decade later, leading the team that created the iPhone, the same Steve Jobs operated differently: setting the vision, then stepping back to let Jony Ive, Scott Forstall, and their teams execute with extraordinary autonomy. Same leader. Radically different style. The conventional explanation is that Jobs "mellowed." The more precise explanation is that he -- consciously or not -- matched his leadership approach to the situation. Paul Hersey and Ken Blanchard formalized this instinct into Situational Leadership Theory, arguing that there is no single best leadership style. There is only the right style for this person, on this task, at this moment. Leaders who refuse to adapt do not fail because they are bad leaders. They fail because they are inflexible ones.

---

## The Framework

Situational Leadership maps two variables against each other in a 2x2 matrix: the leader's behavior (task-oriented vs. relationship-oriented) and the follower's development level (competence vs. commitment). The result is four leadership styles, each appropriate for a specific combination of follower readiness.

### The 2x2 Matrix

```
                        TASK BEHAVIOR (Directive)
                    Low                         High
                +-----------------+-------------------+
       High     |   S3:           |   S2:             |
                |   SUPPORTING    |   COACHING         |
  RELATIONSHIP  |                 |                    |
  BEHAVIOR      |  High rel,     |  High task,        |
  (Supportive)  |  Low task      |  High rel          |
                +-----------------+-------------------+
       Low      |   S4:           |   S1:             |
                |   DELEGATING    |   DIRECTING        |
                |                 |                    |
                |  Low rel,      |  High task,        |
                |  Low task      |  Low rel           |
                +-----------------+-------------------+

  Applied to follower development:

  D1 (Low competence, High commitment)  --> S1: DIRECTING
  D2 (Some competence, Low commitment)  --> S2: COACHING
  D3 (High competence, Variable commit) --> S3: SUPPORTING
  D4 (High competence, High commitment) --> S4: DELEGATING
```

### The Four Styles in Detail

**S1: Directing** -- The leader provides specific instructions and closely supervises performance. Communication is primarily one-way. This style works when the follower is enthusiastic but unskilled (a new hire eager to prove themselves, a team member tackling an unfamiliar task). The leader's job is to reduce ambiguity and build competence through clear guidance.

**S2: Coaching** -- The leader still provides direction but also explains decisions, solicits suggestions, and supports progress. Communication is two-way, though the leader retains decision authority. This style addresses the dangerous D2 zone: the follower has learned enough to recognize how much they don't know, and their initial enthusiasm has dimmed. Coaching prevents the "sophomore slump" that causes so many promising employees to disengage or quit.

**S3: Supporting** -- The leader shifts from directing to facilitating. The follower has the competence to perform but may lack confidence or motivation. The leader's role becomes encouragement, active listening, and collaborative problem-solving. Day-to-day decisions shift to the follower. The leader's value lies in emotional support and removing obstacles, not in providing technical direction.

**S4: Delegating** -- The leader turns over responsibility for decisions and implementation. Monitoring is minimal. The follower has both the competence and the commitment to operate independently. The leader's job is to stay available without hovering -- to trust the outcome without controlling the process. This is where many founders struggle most, because letting go feels like losing control.

### The Development Continuum

Followers move through development levels on each task -- not globally. A senior engineer might be D4 on backend architecture but D1 on customer-facing presentations. A seasoned marketer might be D4 on campaign strategy but D2 on data analytics. Situational Leadership demands that the leader diagnose development level per task, not per person. This granularity is what separates the framework from simpler leadership models.

---

## Prompts

**Prompt 1 -- Follower Development Assessment:**
> I have a team member in the role of [role] who is responsible for [key tasks]. For each of their major responsibilities, help me assess their development level (D1-D4) based on these observations: [describe their competence and commitment indicators for each task area]. Then recommend which leadership style (S1-S4) I should use for each task area and what that looks like in practice.

**Prompt 2 -- Leadership Style Mismatch Diagnosis:**
> I'm experiencing friction with a team member. Here's the situation: [describe the person's role, their behavior, your leadership approach, and the symptoms of the problem -- e.g., missed deadlines, disengagement, defensiveness]. Using the Situational Leadership model, diagnose whether there's a mismatch between my leadership style and their development level. What style should I be using instead, and how do I transition without damaging the relationship?

**Prompt 3 -- Team-Wide Style Map:**
> Map my entire team using Situational Leadership. Here are my team members and their key responsibilities: [list each person, their role, and 2-3 primary tasks]. For each person-task combination, I'll describe their current competence and commitment: [provide observations]. Create a visual map showing which leadership style I should be using with each person on each task, and identify where I'm likely over-directing or under-supporting.

**Prompt 4 -- Delegation Readiness Check:**
> I want to delegate [specific responsibility] to [team member]. Their current performance on related tasks is [describe]. Using the Situational Leadership D1-D4 framework, assess whether they're ready for S4 (full delegation) or whether I need an intermediate step. If they're not ready, design a development path -- with specific milestones -- that moves them from their current level to D4 on this responsibility.

**Prompt 5 -- Founder Scaling Assessment:**
> As a founder of a [stage] startup with [number] employees, I find myself [describe your leadership challenges -- e.g., "still making every product decision," "unable to delegate hiring," "micromanaging the sales team"]. Using Situational Leadership, analyze which of my behaviors represent appropriate directing (because the team genuinely needs it) versus over-directing (because I haven't adjusted my style to match their development). Create a 90-day plan for appropriate style shifts.

---

## Use Cases

**Engineering Manager Losing a Senior Developer**

A growth-stage startup's engineering manager is applying S1 (Directing) uniformly to the entire team -- including a senior developer who is clearly D4 on most technical tasks. The senior developer, accustomed to autonomy at her previous company, interprets the detailed task assignments and frequent check-ins as distrust. She begins updating her LinkedIn profile. The Situational Leadership diagnosis is immediate: style-development mismatch. The senior developer needs S4 (Delegating) on technical work and perhaps S2 (Coaching) on the company's specific domain knowledge, which she is still acquiring. Restructuring the relationship -- delegating architecture decisions entirely while coaching on industry context -- reverses the disengagement within weeks.

**First-Time Sales Hire at an Early-Traction Startup**

A technical founder hires their first salesperson -- an experienced enterprise seller who negotiated seven-figure deals at a Fortune 500 company. The founder assumes S4 (Delegating) is appropriate: "She's a pro, let her do her thing." Three months later, the pipeline is empty. The diagnosis: while the hire is D4 on enterprise sales mechanics, she is D1 on the startup's product, market, competitive landscape, and the radically different sales cycle of a company with no brand recognition. The founder should have started with S1 (Directing) on product knowledge and market positioning while applying S4 on negotiation and relationship management. The nuance of per-task diagnosis would have prevented a costly quarter.

**Co-Founder Relationship Strain**

Two co-founders -- one technical, one commercial -- find themselves in escalating conflict. The technical co-founder applies S1 (Directing) to every product decision, treating the commercial co-founder as D1 on anything product-related. The commercial co-founder, who has strong product instincts shaped by years of customer interaction, feels patronized. Mapping the relationship through Situational Leadership reveals that the commercial co-founder is genuinely D1 on technical architecture but D3-D4 on product-market fit, user experience priorities, and feature prioritization. Disaggregating "product decisions" into sub-domains and applying different styles to each domain transforms the relationship from adversarial to complementary.

---

## Anti-Patterns

- **The Universal Delegator.** Founders who hire experienced people and immediately apply S4 across the board, assuming that seniority equals readiness in every dimension. Every new hire -- regardless of experience -- is D1 on company-specific knowledge, culture, relationships, and domain nuances. Blanket delegation on day one is not empowerment; it is abandonment.

- **The Permanent Director.** The inverse pathology: founders who cannot release control regardless of how much their team develops. Every team member receives S1 treatment indefinitely. Competent people leave. Those who stay learn helplessness. The organization becomes a reflection of one person's bandwidth.

- **Assessing Development Level by Person, Not by Task.** Labeling someone as "a D3" globally rather than recognizing that they may be D4 on some tasks and D1 on others. This coarse-grained assessment leads to uniformly wrong leadership approaches and frustrates team members who feel over-managed in their areas of strength and under-supported in their areas of weakness.

- **Skipping S2 (Coaching).** Moving directly from S1 (Directing) to S3 (Supporting) or S4 (Delegating) without the critical coaching phase. D2 is the most fragile development stage -- the follower knows enough to be dangerous but not enough to be competent, and their initial enthusiasm has faded. Skipping coaching during this stage is the single most common cause of promising employees failing to develop.

- **Treating the Model as a Personality Test.** Using Situational Leadership to label people ("She's a D2") as though it describes their character. Development levels are task-specific and temporary. They describe a state, not an identity. Leaders who use D-levels as permanent labels create self-fulfilling prophecies.

---

## By Stage

| Stage | Focus | Key Difference |
|-------|-------|----------------|
| Early Traction | Diagnosing first hires | Every new hire requires per-task development assessment; founders must resist defaulting to uniform S1 or S4 |
| Growth | Building a management layer | The framework becomes a tool for training new managers, not just for the founder's direct reports; teaching middle managers to diagnose and adapt is critical |
| Scale | Institutionalizing adaptive leadership | Situational Leadership becomes part of the management training curriculum; the organization develops shared vocabulary for discussing leadership style explicitly |

---

## Output Template

```markdown
# Situational Leadership Map: [Team/Department Name]

**Date:** [Date]
**Leader:** [Your name/role]
**Team Size:** [Number]

## Team Member Development Map

### [Team Member Name] -- [Role]

| Task/Responsibility | Competence | Commitment | Development Level | Recommended Style | Current Style | Gap? |
|---------------------|-----------|------------|-------------------|-------------------|---------------|------|
| [Task 1] | [Low/Some/High] | [Low/Variable/High] | [D1/D2/D3/D4] | [S1/S2/S3/S4] | [S1/S2/S3/S4] | [Yes/No] |
| [Task 2] | [Level] | [Level] | [D-level] | [S-style] | [S-style] | [Yes/No] |

### [Next Team Member]...

## Priority Mismatches
1. **[Person -- Task]:** Currently using [style], should be using [style]. Impact: [what's going wrong]
2. ...

## 30-Day Adjustment Plan
- **Week 1-2:** [Specific behavior changes with specific people]
- **Week 3-4:** [Follow-up and assessment of impact]

## Development Goals
| Team Member | Task | Current Level | Target Level | Timeline | Support Needed |
|-------------|------|---------------|-------------|----------|----------------|
| [Name] | [Task] | [D-level] | [D-level] | [Weeks] | [What you'll provide] |
```

---

## Related Skills

- **[Lewin's Leadership Styles](lewin-leadership-styles.md)** -- Lewin provides the foundational taxonomy of leadership styles that Hersey and Blanchard refined into a situational model.
- **[Tuckman's Team Stages](tuckman-team-stages.md)** -- Team development stages interact with individual development levels; a forming team has different leadership needs than a performing one.
- **[Leadership Pipeline](leadership-pipeline.md)** -- As leaders move through pipeline passages, they must learn to apply Situational Leadership at progressively higher organizational levels.
- **[GROW Model](grow-model.md)** -- The GROW coaching conversation is the primary tool for the S2 (Coaching) style; it provides the structure for developing competence while sustaining commitment.
- **[Delegation and Empowerment](../leadership/delegation-and-empowerment.md)** -- S4 (Delegating) is the culmination of the development journey; this skill provides the practical playbook for releasing control while maintaining accountability.
- **[Mentoring and Coaching](../leadership/mentoring-and-coaching.md)** -- The S2 and S3 styles require coaching skills that go beyond task direction; mentoring relationships accelerate movement through development levels.
