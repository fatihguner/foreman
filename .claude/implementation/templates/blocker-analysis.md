---
name: "blocker-analysis"
description: "Produces a structured root-cause analysis of one or more blockers preventing implementation progress. Goes beyond surface identification to apply the five-whys technique, assess downstream impact, recommend specific resolution paths through the Foreman system, and define escalation triggers. Use when a blocker persists beyond one check-in cycle or when multiple blockers share a common root cause that warrants deeper investigation."
audience: "self"
applicable_skills:
  - evaluating-and-deciding
  - scenario-planning
  - stakeholder-map
  - resource-allocation
  - stoic-emotional-mastery
  - stoic-control-and-clarity
format: "analysis"
author: "Fatih Guner"
---

# Blocker Analysis

<!-- INSTRUCTIONS:
     Complete this for any blocker that has persisted through two or more
     check-in cycles, or for any single blocker that is delaying multiple
     downstream implementation items. The five-whys technique is not
     optional -- surface answers produce surface solutions. Push past
     the first explanation until you reach something structural.
     Be honest about motivation blockers. The analysis is for you. -->

**Analysis date:** [YYYY-MM-DD] | **Analyst:** [Name]

**Scope:** [Single blocker: blk-XXX | All blockers | Category: resource/knowledge/dependency/motivation/external]

---

## Blocker Description

<!-- State the blocker precisely. Not "stuck on design" but "cannot proceed with
     landing page redesign because no visual design assets exist and no designer
     is available within budget." Precision here determines the quality of
     everything that follows. -->

| Field | Detail |
|-------|--------|
| Blocker ID | [blk-XXX] |
| Affected item(s) | [impl-XXX: description] |
| Category | [resource / knowledge / dependency / motivation / external] |
| First identified | [date] |
| Days active | [N] |
| Current status of affected item(s) | [blocked at N%] |
| Stated blocker | [The entrepreneur's description of what is blocking progress] |

---

## Root Cause Analysis (Five Whys)

<!-- Start with the stated blocker. Ask "why" five times, each time going deeper.
     Stop early only if you reach a root cause that cannot be decomposed further.
     Do not accept "I don't know" at any level -- reframe as "What would I need
     to investigate to find out?" -->

| Level | Question | Answer |
|-------|----------|--------|
| **Why 1** | Why is [item] blocked? | [First-level answer: the surface reason] |
| **Why 2** | Why is [answer 1] the case? | [Second-level: one layer deeper] |
| **Why 3** | Why is [answer 2] the case? | [Third-level: structural cause emerging] |
| **Why 4** | Why is [answer 3] the case? | [Fourth-level: root cause territory] |
| **Why 5** | Why is [answer 4] the case? | [Fifth-level: fundamental constraint or decision] |

**Root cause identified:** [One sentence summarizing the deepest cause]

**Root cause category:** [Same as or different from original blocker category -- the five whys may reveal that a "dependency" blocker is actually a "motivation" blocker at root]

---

## Impact Assessment

<!-- What happens if this blocker is NOT resolved? Be specific about timelines,
     downstream items, and strategic consequences. -->

### Direct Impact

| Affected item | Current progress | Deadline | Delay if unresolved |
|---------------|-----------------|----------|---------------------|
| [impl-XXX] | [N]% | [date] | [Estimated additional days/weeks] |

### Downstream Impact

<!-- Items that depend on the blocked item, even if not themselves blocked yet. -->

| Downstream item | Dependency type | Impact if blocker persists |
|----------------|-----------------|---------------------------|
| [impl-XXX: description] | [Requires output of blocked item / Shares resource / Sequential dependency] | [What happens: delayed, degraded, or impossible] |

### Strategic Impact

<!-- Beyond individual items: does this blocker threaten a playbook's overall objective,
     a key decision deadline, or a business milestone? -->

[One to three sentences on the strategic consequence. Example: "This blocker delays the entire pivot-playbook execution by an estimated 2 weeks, pushing the B2B launch past the industry conference where first customers were expected to be acquired."]

---

## Resolution Path

<!-- Specific, actionable steps to resolve the blocker. Route through the Foreman
     system where applicable -- diagnostics, skills, templates. -->

### Option A: [Primary resolution approach]

| Step | Action | Tool/Route | Timeline |
|------|--------|------------|----------|
| 1 | [First action] | [/diagnose X or /apply Y or external action] | [Estimated time] |
| 2 | [Second action] | [Tool or route] | [Estimated time] |
| 3 | [Third action] | [Tool or route] | [Estimated time] |

**Probability of success:** [High / Medium / Low]
**Time to resolution:** [Estimated days]

### Option B: [Alternative resolution approach]

| Step | Action | Tool/Route | Timeline |
|------|--------|------------|----------|
| 1 | [First action] | [Tool or route] | [Estimated time] |
| 2 | [Second action] | [Tool or route] | [Estimated time] |

**Probability of success:** [High / Medium / Low]
**Time to resolution:** [Estimated days]

### Option C: Accept and Adapt

<!-- Sometimes the right answer is not to resolve the blocker but to abandon
     the blocked item or restructure the plan around it. -->

[Describe what changes if the blocker is accepted as permanent. Which items are abandoned, which are restructured, and what is the revised implementation plan?]

---

## Escalation Triggers

<!-- Define the conditions under which this blocker should escalate from
     "being worked on" to "requires a fundamentally different approach." -->

| Trigger | Condition | Escalation action |
|---------|-----------|-------------------|
| Time-based | Blocker persists beyond [N] more days | [Switch to Option B / Abandon item / Restructure plan] |
| Cost-based | Resolution cost exceeds [threshold] | [Reassess ROI of the blocked item] |
| Cascade | [N] additional items become blocked by same root cause | [Escalate to strategic reassessment via /diagnose strategy] |
| Opportunity | [Specific event] occurs that changes the calculus | [Reassess whether the blocked item is still relevant] |

---

## Dichotomy of Control

<!-- Applicable always, but especially emphasized when Stoic mode is active.
     Separate what you can act on from what you cannot. -->

| Within your control | Within your influence | Outside your control |
|--------------------|-----------------------|---------------------|
| [Actions you can take unilaterally] | [Outcomes you can affect but not guarantee] | [Factors you must accept or work around] |

**Recommended focus:** [Where to direct energy based on this separation]

---

**Analysis outcome:** [Pursuing Option A / Pursuing Option B / Accepting and adapting / Requires further investigation]

**Next review date:** [When to reassess if the blocker has not resolved]
