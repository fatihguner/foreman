---
name: "kebab-case-diagnostic-name"
description: "Third-person description of what this diagnostic identifies and when to use it. Include entry symptoms and the types of root causes it can distinguish. Max 1024 characters."
entry_symptoms:
  - "Natural language symptom the entrepreneur might report"
  - "Another symptom phrasing"
  - "A third variation"
possible_diagnoses:
  - diagnosis-slug-1
  - diagnosis-slug-2
  - diagnosis-slug-3
routes_to_skills:
  - skill-name-1
  - skill-name-2
routes_to_templates:
  - template-name-1
author: "Fatih Guner"
---

<!-- DIAGNOSTIC TEMPLATE
     A diagnostic is a triage system: symptom → targeted questions → root cause → routing.
     Think ER triage: fast, structured, decisive.

     RULES:
     - 3-5 entry symptoms (natural language, how entrepreneurs actually talk)
     - 3-7 possible diagnoses (distinct root causes, not overlapping)
     - 5-7 triage questions in decision-tree format (each answer narrows possibilities)
     - Routing must reference ONLY existing skills, templates, and playbooks
     - Red Flags section is mandatory — know the limits of AI-assisted diagnosis
     - Target length: 80-120 lines
-->

# {Diagnostic Title}

## Entry Symptoms

{The things an entrepreneur actually says — natural language, informal, emotional. These are the trigger phrases that indicate this diagnostic is needed.}

- "Symptom phrasing 1"
- "Symptom phrasing 2"
- "Symptom phrasing 3"

---

## Triage Questions

<!-- Each question should ELIMINATE possibilities. Structure as a decision tree:
     Q1 answer A → narrows to diagnoses X, Y
     Q1 answer B → narrows to diagnoses Z, W
     Progress from broad to specific. 5-7 questions total. -->

**Q1: {Broad differentiating question}**
- If {answer A} → {implication, narrows to...}
- If {answer B} → {implication, narrows to...}

**Q2: {More specific question based on Q1}**
- If {answer A} → {implication}
- If {answer B} → {implication}

---

## Diagnosis Map

<!-- Table mapping question-answer patterns to specific diagnoses -->

| Pattern | Diagnosis | Confidence |
|---------|-----------|------------|
| Q1=A + Q2=A + Q3=B | {Diagnosis name} | High |
| Q1=B + Q2=A | {Diagnosis name} | Medium |

---

## Routing

<!-- For EACH diagnosis: specific skills (in order), playbook if applicable, output template -->

**Diagnosis: {Name}**
- Skills: `skill-1` → `skill-2` → `skill-3`
- Playbook: `playbook-name` (if the problem requires multi-step resolution)
- Output: `template-name`

**Diagnosis: {Name}**
- Skills: `skill-1` → `skill-2`
- Output: `template-name`

---

## Red Flags

<!-- Situations this diagnostic CANNOT handle — route to professional help -->

{Conditions that exceed the scope of framework-based guidance: legal issues requiring counsel, mental health crises requiring professional support, financial emergencies requiring accountants, etc.}
