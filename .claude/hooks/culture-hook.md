---
name: "culture-hook"
description: "Hook for culture-hook intent classification and routing"
priority: "medium"
author: "Fatih Guner"
---

# Culture Hook

Every organisation has a culture. Few have the one they think they do. When the gap between stated values and lived behaviour widens beyond a certain threshold, the organism starts rejecting its own immune system — new hires bounce, veterans disengage, and the founder wonders why the place feels unfamiliar.

## Trigger Patterns

1. "Culture is breaking down"
2. "Values mean nothing here"
3. "New hires don't fit"
4. "We've lost our identity"
5. "Remote killed our culture"
6. "People don't care anymore"
7. "It used to feel different"
8. "We're just a job now"
9. "Nobody lives our values"
10. "The vibe has completely changed"
11. "Culture doesn't scale"
12. "We hired too fast and lost something"

## Intent Classification

| Signal | Intent | Confidence |
|--------|--------|------------|
| References to lost identity, changed feeling, nostalgia | `culture-erosion` | High |
| New hire friction, onboarding complaints, "don't fit" | `culture-fit-mismatch` | High |
| Remote/hybrid blame, office vs. distributed tension | `remote-culture-strain` | Medium |
| Values described as hollow, performative, or ignored | `values-integrity-gap` | High |
| General disengagement, apathy, "just a job" language | `meaning-deficit` | Medium |
| Rapid growth cited as the catalyst for culture loss | `scaling-culture-dilution` | Medium |

## Routing Logic

```
IF intent == culture-erosion OR values-integrity-gap:
  → diagnostics/culture-erosion-diagnosis
  → skills/leadership/organisational-culture
  → output-templates/team/culture-values-document

IF intent == culture-fit-mismatch:
  → diagnostics/culture-erosion-diagnosis
  → skills/leadership/team-culture-and-dynamics
  → skills/people/hiring-cultural-alignment

IF intent == remote-culture-strain:
  → diagnostics/culture-erosion-diagnosis
  → skills/leadership/organisational-culture
  → skills/leadership/team-culture-and-dynamics

IF intent == meaning-deficit:
  → diagnostics/culture-erosion-diagnosis
  → skills/leadership/organisational-culture
  → skills/ai-leadership/purpose-driven-leadership

IF intent == scaling-culture-dilution:
  → diagnostics/culture-erosion-diagnosis
  → skills/leadership/organisational-culture
  → playbooks/scaling-culture-playbook
```

**Priority:** Medium

## Disambiguation

Culture complaints frequently mask deeper structural problems. Before routing, probe for these overlaps:

- **Team hook overlap:** If the complaint centres on specific individuals or interpersonal conflict rather than systemic culture drift, route to `team-hook` instead.
- **Leadership hook overlap:** If the founder describes personal disconnection from the company's identity — burnout disguised as culture concern — route to `leadership-hook`.
- **Growth hook overlap:** If culture erosion is explicitly tied to operational scaling challenges (headcount doubling, new offices, process overload), co-route with `growth-hook`.
- **Strategy hook overlap:** When "lost identity" actually means "lost strategic direction," the culture language is symptomatic. Route to `strategy-hook` as primary.

**Disambiguation prompt:** "When you say the culture has changed — is this about how people behave day-to-day, or about the company's direction and purpose?"

## Example Conversations

**Example 1: Values-integrity gap**

> **Founder:** "We have five core values on the wall but nobody follows them. They're a joke."
>
> **Foreman:** That gap between declared values and observed behaviour is one of the most corrosive forces in an organisation. Before we address it, a few questions: When did the disconnect become noticeable — was it gradual or tied to a specific event? And which value is most visibly violated?
>
> *Routes to: culture-erosion-diagnosis → organisational-culture → culture-values-document template*

**Example 2: Remote culture strain**

> **Founder:** "Ever since we went fully remote, the culture just died. People clock in, do their work, clock out."
>
> **Foreman:** Remote work did not kill your culture — it revealed which parts of it depended on physical proximity rather than shared conviction. The question is whether you had a culture or merely had an office. Let me ask: what specific behaviours or rituals disappeared when the office did?
>
> *Routes to: culture-erosion-diagnosis → organisational-culture → team-culture-and-dynamics*

**Example 3: Scaling dilution**

> **Founder:** "We went from 12 to 60 people in a year. It used to feel like a family. Now I don't even know half the team."
>
> **Foreman:** The family metaphor is the first casualty of scaling — and arguably should be. Families do not have performance reviews. The real question is what replaced it, or whether nothing did. Let me help you diagnose what specifically eroded and what can be deliberately rebuilt at your current size.
>
> *Routes to: culture-erosion-diagnosis → organisational-culture → scaling-culture-playbook*
