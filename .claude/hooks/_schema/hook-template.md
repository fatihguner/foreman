---
name: "kebab-case-hook-name"
description: "Third-person description of what intent this hook captures and what entrepreneur language it matches. Max 1024 characters."
trigger_patterns:
  - "natural language phrase an entrepreneur might say"
  - "another common phrasing"
  - "emotional variant"
  - "question variant"
  - "complaint variant"
routes_to:
  diagnostics:
    - diagnostic-name
  skills:
    - skill-name
  playbooks:
    - playbook-name
priority: "high | medium | low"
author: "Fatih Guner"
---

<!-- HOOK TEMPLATE
     A hook translates natural language into system routing.
     It pattern-matches on what the entrepreneur says and routes to the right diagnostic, skill, or playbook.

     Hook ≠ Diagnostic:
     - Hook = fast classification → "this is a revenue problem" → route
     - Diagnostic = deep inquiry → "specifically, it's a churn problem caused by onboarding failure"

     RULES:
     - 10-15 trigger patterns minimum (formal, informal, emotional, questions, complaints)
     - Patterns must reflect how REAL entrepreneurs talk, not textbook language
     - Intent Classification table maps patterns to specific intents
     - Routing Logic is a decision tree: intent → destination
     - Disambiguation section handles overlap with other hooks
     - 2-3 Example Conversations showing complete flow
     - Priority: high (urgent business problems), medium (operational/tactical), low (development/growth)
     - Target length: 60-90 lines
-->

# {Hook Title}

## Trigger Patterns

<!-- Minimum 10-15 patterns. Include:
     - Formal business language ("revenue decline," "customer acquisition cost")
     - Informal founder language ("we're bleeding money," "nobody's buying")
     - Emotional expressions ("I'm drowning," "this is killing us")
     - Questions ("should I...?," "how do I...?," "what do I do about...?")
     - Complaints ("investors don't get it," "my team doesn't care")
-->

| Pattern | Confidence |
|---------|-----------|
| "{phrase 1}" | High |
| "{phrase 2}" | High |
| "{phrase 3}" | Medium |

---

## Intent Classification

<!-- Map trigger patterns to specific intents within this hook's domain -->

| Intent | Trigger Signals | Description |
|--------|----------------|-------------|
| {Intent A} | {keywords/phrases} | {What this intent means} |
| {Intent B} | {keywords/phrases} | {What this intent means} |

---

## Routing Logic

<!-- Decision tree: which intent → which diagnostic/skill/playbook -->

```
Intent A → [Diagnostic: diagnostic-name]
Intent B → [Playbook: playbook-name]
Intent C (simple, clear) → [Skill: skill-name] (direct, no diagnostic needed)
```

---

## Disambiguation

<!-- What happens when this hook overlaps with another hook.
     Which hook takes priority? How to resolve? -->

| Overlapping Hook | Overlap Condition | Resolution |
|-----------------|-------------------|------------|
| {other-hook-name} | {when both match} | {which takes priority and why} |

---

## Example Conversations

**Example 1:**
- Entrepreneur says: "{natural language input}"
- Hook classifies as: {Intent}
- Routes to: {destination}
- Rationale: {why this routing}

**Example 2:**
- Entrepreneur says: "{different input}"
- Hook classifies as: {Intent}
- Routes to: {destination}
