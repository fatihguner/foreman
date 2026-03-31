---
name: "incident-postmortem"
description: "Produces a crisis-specific post-incident analysis that reconstructs what happened, determines why, and ensures the failure mode cannot recur. Distinct from a general retrospective: this template demands minute-by-minute timeline reconstruction, five-whys root cause analysis with contributing factor mapping, detection and response evaluation, customer impact quantification, and systemic fixes with named owners and deadlines. Modeled on SRE postmortem practices and aviation safety investigation methodology. Use after any incident that affected customers, revenue, or system integrity."
audience: "team"
applicable_skills:
  - systems-thinking
  - kaizen-bpr
  - learning-from-failure
  - defining-and-exploring-problems
format: "postmortem"
author: "Fatih Guner"
---

# Incident Postmortem

<!-- INSTRUCTIONS:
     Blameless does not mean accountability-free. Name systems and process gaps,
     not individuals as culprits. Complete the timeline within 48 hours of
     resolution. Hold the review meeting within 5 business days.
     Delete all HTML comments before archiving. -->

**Incident title:** [Short, descriptive] | **Severity:** [ ] SEV-1 [ ] SEV-2 [ ] SEV-3 [ ] SEV-4

**Author:** [Name] | **Date:** [Date] | **Status:** [ ] Draft [ ] Final

---

## Incident Summary

| Field | Detail |
|-------|--------|
| **What happened** | [2-3 sentences. A board member should understand this.] |
| **Start / Detected / Resolved** | [HH:MM] / [HH:MM] / [HH:MM timezone] |
| **Duration (total / to detect)** | [Total elapsed] / [Time to awareness] |
| **Customer impact** | [Users affected, revenue impact, SLA breach Y/N] |

## Timeline Reconstruction

| Time (UTC) | Event | Actor / System | Source |
|------------|-------|---------------|--------|
| [HH:MM] | [Trigger event or first anomaly] | [Actor] | [Log / alert / Slack] |
| [HH:MM] | [Incident detected] | [Actor] | [Source] |
| [HH:MM] | [First response action] | [Actor] | [Source] |
| [HH:MM] | [Key decision or pivot] | [Actor] | [Source] |
| [HH:MM] | [Mitigation applied, service restored] | [Actor] | [Source] |

## Root Cause Analysis (Five Whys)

| Level | Question | Answer |
|-------|----------|--------|
| Why 1 | Why did [the incident] occur? | [Because...] |
| Why 2 | Why did [answer to Why 1] happen? | [Because...] |
| Why 3 | Why did [answer to Why 2] happen? | [Because...] |
| Why 4 | Why did [answer to Why 3] happen? | [Because...] |
| Why 5 | Why did [answer to Why 4] happen? | [Because...] |

**Root cause:** [Single sentence -- the systemic failure, not the proximate trigger]

### Contributing Factors

- [ ] **Process gap:** [Missing or inadequate procedure]
- [ ] **Monitoring gap:** [What should have alerted us but did not]
- [ ] **Knowledge gap:** [Information not accessible to responders]
- [ ] **Communication gap:** [Escalation that failed or arrived late]
- [ ] **Testing gap:** [Scenario not covered in testing or staging]

## Detection and Response Evaluation

| Dimension | Assessment | Grade |
|-----------|-----------|-------|
| **How we found out** | [Automated alert / customer report / internal discovery] | [ ] Proactive [ ] Reactive |
| **Time to respond** | [Minutes from detection to first action] | [ ] Acceptable [ ] Too slow |
| **Escalation** | [Right people involved at the right time?] | [ ] Effective [ ] Gaps |
| **Communication** | [Stakeholders and customers informed appropriately?] | [ ] Effective [ ] Gaps |

## Customer and Stakeholder Impact

| Dimension | Detail |
|-----------|--------|
| **Users affected** | [Number or percentage] |
| **Revenue / SLA impact** | [Estimated $, commitments violated] |
| **Data impact** | [Loss, corruption, or exposure -- Y/N, detail if Y] |
| **Communication sent** | [What, when, which channel] |

## Immediate Fixes Applied

| # | Fix | Applied by | Permanent? |
|---|-----|-----------|-----------|
| 1 | [Action taken to restore service] | [Name] | [ ] Yes [ ] No |
| 2 | [Action taken] | [Name] | [ ] Yes [ ] No |

## Systemic Fixes Required

| # | Fix | Root cause addressed | Owner | Deadline | Status |
|---|-----|---------------------|-------|----------|--------|
| 1 | [Structural change to system, process, or monitoring] | [From analysis above] | [Name] | [Date] | [ ] Not started |
| 2 | [Fix] | [Cause] | [Name] | [Date] | [ ] Not started |
| 3 | [Fix] | [Cause] | [Name] | [Date] | [ ] Not started |

## Lessons Learned

1. **[Lesson title]:** [What we now understand that we did not understand before]
2. **[Lesson title]:** [Lesson]
3. **[Lesson title]:** [Lesson]

---

**Follow-up review:** [Date, 2-4 weeks out] | **Owner:** [Who tracks fix completion]
