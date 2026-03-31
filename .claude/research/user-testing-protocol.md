---
name: "user-testing-protocol"
description: "Comprehensive protocol for planning and executing user and usability testing. Covers moderated and unmoderated testing, task-based protocols, think-aloud method, A/B testing, prototype testing, and first-click testing with structured note-taking templates."
research_type: "customer"
feeds_into_skills:
  - net-promoter-score
  - product-market-fit-diagnosis
  - product-market-fit-playbook
  - new-initiative-brief
feeds_into_templates:
  - new-initiative-brief
  - product-market-fit-diagnosis
estimated_time: "10-20 hours"
data_sources:
  - existing-users
  - recruited-participants
  - analytics-platforms
  - session-recording-tools
author: "Fatih Guner"
---

# User Testing Protocol

## Purpose

Opinions about your product are abundant. Evidence about how people actually use it is scarce. This guide provides a structured protocol for observing real behaviour -- not collecting preferences, not running focus groups, not asking users what they want. The goal is to watch people attempt tasks and measure where they succeed, struggle, and abandon.

## What You'll Learn

- How to select the right testing method for your research question
- How to write task scenarios that reveal genuine usability problems
- How to recruit participants who represent your target segments
- How to moderate sessions that produce actionable data without leading the witness
- How to synthesize findings into prioritised fixes with clear severity ratings

## Data Sources

| Source | What It Provides | Access Method |
|--------|-----------------|---------------|
| Existing users | Behaviour data from people with real usage context | In-app recruitment, email outreach, CRM segment |
| Recruited participants (UserTesting, Maze, UsabilityHub) | Fresh perspectives from people matching your ICP | Platform-based recruitment with screener surveys |
| Analytics (Hotjar, FullStory, Amplitude) | Quantitative behaviour patterns: funnels, rage clicks, drop-offs | Configure event tracking; export funnel and session data |
| Session recordings | Frame-by-frame interaction evidence | Hotjar, FullStory, or Loom for moderated sessions |
| Prototype tools (Figma, InVision) | Clickable prototypes for pre-build testing | Share prototype links with participants |

## Research Protocol

### Step 1: Define What You Are Testing and Why

Write a single research question. Not "is our product good?" but "can a new user complete their first project setup within 5 minutes without assistance?" Choose one method:

- **Moderated testing**: Facilitator guides participants through tasks in real time. Best for exploratory research and capturing the "why" behind behaviour.
- **Unmoderated testing**: Participants complete tasks independently via a platform. Best for validation at scale and geographic diversity.
- **A/B testing**: Two variants measured against a conversion metric. Best for optimising specific elements with sufficient traffic.
- **First-click testing**: Measures where users click first on a page. Best for navigation and information hierarchy validation.
- **Prototype testing**: Task-based testing on a clickable prototype. Best for pre-build validation of new features or redesigns.

### Step 2: Write 3-5 Task Scenarios

Each scenario should be realistic, specific (clear completion criteria), and unbiased (does not reveal the "right" answer). Frame tasks as goals, not instructions. Write "You need to invite a colleague to your project" rather than "Click the settings icon and select team members."

### Step 3: Recruit 5-8 Participants Per Segment

Five participants per segment uncover approximately 80% of usability problems. Recruit through your user base, third-party platforms with screener surveys, or social channels with incentives. Screen out people too familiar with your product and people with no relevance to your target segment.

### Step 4: Run Sessions (30-45 Minutes Each)

For moderated sessions: **Minutes 1-5** -- introduction, consent, think-aloud instructions. **Minutes 5-35** -- task execution; observe silently; prompt with "What are you thinking?" when participants go quiet. **Minutes 35-45** -- debrief on confusion points and comparisons to existing tools.

For unmoderated sessions, configure the platform with: task instructions, time limits, post-task satisfaction questions (1-7 scale), and a final open-response question.

### Step 5: Synthesize Findings

Compile data per task: success rate, average completion time, error frequency, satisfaction scores, and verbatim quotes. Patterns across three or more participants are signal; isolated incidents are noise.

### Step 6: Prioritize Fixes

| Severity | Definition | Action |
|----------|-----------|--------|
| Critical | Task failure for majority; core goal unreachable | Fix before next release |
| Major | Completed with significant difficulty or errors | Fix within current sprint |
| Minor | Completed with slight confusion | Backlog; batch with related work |
| Cosmetic | Noticed but did not impede completion | Fix opportunistically |

## Data Collection Template

```
SESSION NOTE-TAKING FORM
Session ID: ___  Date: ___________  Participant: ___________  Segment: _______________

TASK 1: _______________
  Result: [ ] Complete [ ] Partial [ ] Fail | Time: ___m ___s | Errors: ___ | Satisfaction: ___/7
  Quotes: "_______________"  |  Observations: _______________

TASK 2: _______________
  Result: [ ] Complete [ ] Partial [ ] Fail | Time: ___m ___s | Errors: ___ | Satisfaction: ___/7
  Quotes: "_______________"  |  Observations: _______________

TASK 3: _______________
  Result: [ ] Complete [ ] Partial [ ] Fail | Time: ___m ___s | Errors: ___ | Satisfaction: ___/7
  Quotes: "_______________"  |  Observations: _______________

OVERALL
  Most confusing element: _______________
  Expected but missing:   _______________
  Comparison to current tools: _______________
```

## Interpretation Guide

**Strong product signal**: Task success above 85%, satisfaction above 5/7. Friction is minor and cosmetic. The interaction model matches user mental models.

**Iteration needed**: Success rate 60-85%. Users complete goals but with workarounds, backtracking, or confusion. Core flow works; details need refinement.

**Structural problem**: Success below 60%. Users cannot accomplish primary goals -- a fundamental mismatch between interaction model and expectations. Redesign the flow before optimising details.

## Common Pitfalls

- **Leading the participant**: "Did you notice the blue button?" biases attention. Ask "What would you do next?" instead.
- **Testing with colleagues**: Internal testers navigate by memory, not by interface logic.
- **Too many tasks per session**: Fatigue degrades data quality after 30 minutes. Five tasks is the practical ceiling.
- **Ignoring think-aloud gaps**: When a participant goes silent, they are usually struggling. The silence is data.
- **Fixing everything at once**: Shipping twenty minor fixes while ignoring two critical failures is optimising the wrong layer.

## Output

This research feeds directly into the following Foreman components:

- **Skills**: `net-promoter-score` (satisfaction benchmarking), `product-market-fit-diagnosis` (usage quality evidence), `product-market-fit-playbook` (iteration inputs)
- **Templates**: `new-initiative-brief` (user evidence section), `product-market-fit-diagnosis` (qualitative data inputs)
- **Playbooks**: `product-market-fit-playbook` (uses testing data to validate or invalidate PMF signals)
