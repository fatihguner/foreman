---
name: "communication-hook"
description: "Hook for communication-hook intent classification and routing"
priority: "medium"
author: "Fatih Guner"
---

# Communication Hook

Most communication failures are not communication problems. They are thinking problems dressed in communication clothing — unclear strategy presented as unclear writing, misaligned teams presented as bad meetings, weak value propositions presented as investor confusion. The diagnostic challenge is separating genuine skill deficits from upstream clarity failures.

## Trigger Patterns

1. "Nobody reads my emails"
2. "Team misunderstands everything"
3. "Investors don't get it"
4. "Meetings are useless"
5. "Can't explain what we do"
6. "My writing sucks"
7. "Presentation went badly"
8. "Internal comms are chaos"
9. "Board doesn't understand our strategy"
10. "I dread public speaking"
11. "Our messaging is all over the place"
12. "People tune out when I talk"

## Intent Classification

| Signal | Intent | Confidence |
|--------|--------|------------|
| Emails ignored, writing complaints, document problems | `writing-deficit` | High |
| Meetings described as useless, unproductive, chaotic | `meeting-dysfunction` | High |
| Investor or board confusion, pitch failures | `stakeholder-communication` | High |
| Cannot articulate value proposition or company purpose | `messaging-clarity` | Medium |
| Presentation anxiety, public speaking dread | `presentation-anxiety` | High |
| General team misunderstanding, internal miscommunication | `internal-alignment` | Medium |

## Routing Logic

```
IF intent == writing-deficit:
  → diagnostics/communication-breakdown-diagnosis
  → skills/writing/reader-psychology
  → skills/writing/writing-for-navigation
  → skills/writing/writing-effective-emails

IF intent == meeting-dysfunction:
  → diagnostics/communication-breakdown-diagnosis
  → skills/leadership/effective-meetings
  → skills/writing/writing-for-navigation

IF intent == stakeholder-communication:
  → diagnostics/communication-breakdown-diagnosis
  → skills/storytelling/storytelling-for-leaders
  → output-templates/investor/
  → output-templates/board/

IF intent == messaging-clarity:
  → diagnostics/communication-breakdown-diagnosis
  → skills/storytelling/storytelling-for-leaders
  → skills/frameworks/value-proposition-canvas

IF intent == presentation-anxiety:
  → skills/storytelling/stage-presence
  → skills/storytelling/storytelling-for-leaders
  → skills/stoic/managing-emotions

IF intent == internal-alignment:
  → diagnostics/communication-breakdown-diagnosis
  → skills/writing/writing-for-navigation
  → skills/leadership/organisational-culture
  → output-templates/team/
```

**Priority:** Medium

## Disambiguation

Communication is a symptom layer — nearly every business problem eventually manifests as a communication complaint. Careful triage prevents treating the symptom while ignoring the disease.

- **Strategy hook overlap:** "Can't explain what we do" often means the founder has not decided what they do. If probing reveals strategic ambiguity rather than articulation difficulty, route to `strategy-hook`.
- **Product hook overlap:** "Investors don't get it" may indicate a product-market fit problem, not a pitch problem. If the product's value proposition is genuinely unclear, route to `product-hook`.
- **Team hook overlap:** "Team misunderstands everything" can signal interpersonal conflict, unclear roles, or management structure problems rather than communication skill gaps. Route to `team-hook` if structural.
- **Leadership hook overlap:** Presentation anxiety rooted in impostor syndrome or burnout belongs with `leadership-hook`.

**Disambiguation prompt:** "Is the problem that you know exactly what to say but struggle to say it well — or that you are not entirely sure what the message should be?"

## Example Conversations

**Example 1: Writing deficit**

> **Founder:** "I spend hours on emails and nobody reads them. Important updates get completely ignored."
>
> **Foreman:** The problem is rarely that people cannot read — it is that your emails are not written for how people actually read. Cognitive science is unambiguous: busy readers scan, skip, and abandon. They do not study your prose. The fix is structural, not stylistic. What types of emails are being ignored — operational updates, decisions that need input, or announcements?
>
> *Routes to: communication-breakdown-diagnosis → reader-psychology → writing-for-navigation → writing-effective-emails*

**Example 2: Stakeholder confusion**

> **Founder:** "Every time I pitch to investors, their eyes glaze over by slide three. They just don't get what we're building."
>
> **Foreman:** Glazed eyes by slide three means the narrative arc failed before it began. Investors do not process information sequentially — they pattern-match against mental models of businesses they understand. The question is whether you are giving them a story they can place, or a feature tour they cannot. Walk me through your opening three slides.
>
> *Routes to: communication-breakdown-diagnosis → storytelling-for-leaders → investor output templates*

**Example 3: Meeting dysfunction**

> **Founder:** "We have meetings about meetings. Nothing gets decided. Everyone leaves confused."
>
> **Foreman:** Meeting dysfunction is typically a decision-rights problem masquerading as a scheduling problem. When nobody knows who decides, everyone discusses endlessly. Before we redesign your meeting cadence: how many recurring meetings does your team have per week, and can you name a single important decision that was made in one recently?
>
> *Routes to: communication-breakdown-diagnosis → effective-meetings → writing-for-navigation*
