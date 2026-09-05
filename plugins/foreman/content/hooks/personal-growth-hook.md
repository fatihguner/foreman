---
name: "personal-growth-hook"
description: "Hook for personal-growth-hook intent classification and routing"
priority: "medium"
author: "Fatih Guner"
trigger_patterns:
  - Want to be a better leader
  - Need a mentor
  - How do I grow?
  - Skill gaps
  - Career feels stuck
  - Building my personal brand
  - Want to learn more
  - Investing in myself
  - Need to develop my team
  - Executive coaching
  - Outgrowing my own abilities
  - Not sure I'm the right CEO anymore
  - How do other founders handle this?
  - Want to build my network
routes_to:
  templates:
    - personal-board-tracker
  playbooks:
    - founder-transition-playbook
    - personal-brand-playbook
  skills:
    - tuckman-team-stages
    - career-strategy-for-leaders
    - leader-self-reflection
    - learning-agility
    - mentoring-and-coaching
    - storytelling-for-leaders
    - meeting-the-right-people
    - teaching-and-leading
    - stoic-emotional-mastery
    - stoic-right-action
    - stoic-self-awareness
    - reader-psychology
---

# Personal Growth Hook

The founder who asks "how do I become a better leader" has already crossed the most important threshold — the recognition that the company's ceiling is set by the founder's own capabilities. This is a rare and valuable moment of self-awareness in a role that systematically selects for overconfidence. The challenge is converting that awareness into a structured development path rather than letting it curdle into impostor syndrome or scatter across a dozen half-read business books.

## Trigger Patterns

1. "Want to be a better leader"
2. "Need a mentor"
3. "How do I grow?"
4. "Skill gaps"
5. "Career feels stuck"
6. "Building my personal brand"
7. "Want to learn more"
8. "Investing in myself"
9. "Need to develop my team"
10. "Executive coaching"
11. "Outgrowing my own abilities"
12. "Not sure I'm the right CEO anymore"
13. "How do other founders handle this?"
14. "Want to build my network"

## Intent Classification

| Signal | Intent | Confidence |
|--------|--------|------------|
| Leadership improvement, self-development requests | `leadership-development` | High |
| Mentor or coach seeking, advisory relationships | `mentorship-seeking` | High |
| Skill gap awareness, specific capability deficits | `skill-gap-remediation` | Medium |
| Career stagnation, feeling stuck or plateaued | `career-plateau` | Medium |
| Personal brand, public profile, thought leadership | `personal-brand` | Medium |
| Team development, growing others' capabilities | `team-development` | Medium |
| Self-doubt about fitness for the role | `role-fitness-doubt` | High |

## Routing Logic

```
IF intent == leadership-development:
  → skills/leadership/leader-self-reflection
  → skills/leadership/learning-agility.md
  → skills/leadership/career-strategy-for-leaders
  → skills/stoic/stoic-right-action.md

IF intent == mentorship-seeking:
  → skills/leadership/mentoring-and-coaching
  → output-templates/self/personal-board-tracker.md
  → skills/people/meeting-the-right-people.md

IF intent == skill-gap-remediation:
  → skills/leadership/leader-self-reflection
  → skills/leadership/learning-agility.md
  → skills/stoic/stoic-self-awareness.md

IF intent == career-plateau:
  → skills/leadership/career-strategy-for-leaders
  → skills/leadership/leader-self-reflection.md
  → playbooks/founder-transition-playbook

IF intent == personal-brand:
  → playbooks/personal-brand-playbook
  → skills/leadership/storytelling-for-leaders.md
  → skills/writing/reader-psychology

IF intent == team-development:
  → skills/leadership/mentoring-and-coaching
  → skills/people/teaching-and-leading
  → skills/frameworks/tuckman-team-stages.md

IF intent == role-fitness-doubt:
  → skills/leadership/leader-self-reflection
  → skills/stoic/stoic-emotional-mastery.md
  → playbooks/founder-transition-playbook
  → skills/stoic/stoic-self-awareness.md
```

**Priority:** Low

## Disambiguation

Personal growth is the broadest hook in the system — nearly any founder concern, taken to its root, becomes a personal development question. The routing priority is deliberately low to prevent this hook from absorbing problems that have more specific, actionable entry points:

- **Leadership hook overlap:** If the founder describes burnout, isolation, impostor syndrome, or emotional exhaustion, route to `leadership-hook`. Personal growth presumes energy and capacity; leadership hook addresses their absence.
- **Team hook overlap:** "Need to develop my team" may indicate a team capability problem (hiring, training, structure) rather than the founder's own development journey. If the concern is about the team's performance rather than the founder's growth, route to `team-hook`.
- **Strategy hook overlap:** "Career feels stuck" in a founder context often means the company feels stuck. If probing reveals strategic uncertainty rather than personal development needs, route to `strategy-hook`.
- **Communication hook overlap:** Specific skill requests — better writing, better presentations, better public speaking — route to `communication-hook` for targeted skill development rather than the broader personal growth pathway.

**Disambiguation prompt:** "Are you looking to develop yourself as a leader, build specific skills for a current challenge, or figure out what your next chapter looks like?"

## Example Conversations

**Example 1: Leadership development**

> **Founder:** "I want to be a better leader but I don't know where to start. There's so much advice out there."
>
> **Foreman:** The abundance of leadership advice is itself the problem — it creates the illusion that leadership development is about consuming content rather than changing behaviour. Effective development starts with an honest audit of your current capabilities and their fit to your company's current needs, not with generic prescriptions. A Series A CEO needs different skills than a pre-seed founder. What stage is your company at, and what specific situation made you realise you needed to grow?
>
> *Routes to: leader-self-reflection → learning-agility → career-strategy-for-leaders*

**Example 2: Mentorship seeking**

> **Founder:** "I need a mentor. I'm making decisions in the dark and I don't have anyone to bounce ideas off."
>
> **Foreman:** The desire for a mentor is sound; the approach most founders take to finding one is not. Cold-emailing successful CEOs asking them to "be your mentor" has a near-zero success rate and misunderstands how mentorship actually forms. The most productive advisory relationships emerge from specific, bounded requests — not open-ended commitments. Who in your network or industry do you already have a transactional relationship with, even a thin one?
>
> *Routes to: mentoring-and-coaching → advisory-board → networking*

**Example 3: Role fitness doubt**

> **Founder:** "Honestly, I'm not sure I'm the right person to be CEO anymore. The company has outgrown me."
>
> **Foreman:** That statement takes more courage than most board presentations. The question deserves honest examination rather than reflexive reassurance. Sometimes founders are right — the skills that built the company are not the skills that scale it. Other times, the feeling reflects a temporary gap that structured development can close. The distinction matters enormously. What specifically makes you feel outgrown — is it a skill you lack, a responsibility you dread, or a version of the job you no longer recognise?
>
> *Routes to: leader-self-reflection → managing-emotions → founder-transition-playbook → self-knowledge*
