---
name: "kebab-case-playbook-name"
description: "Third-person description of when to use this playbook and what entrepreneurial scenario it solves. Max 1024 characters."
trigger_diagnostics:
  - diagnostic-name-1
  - diagnostic-name-2
steps:
  - skill: "skill-name-1"
    purpose: "What this step accomplishes in one sentence"
    output: "What this step produces — feeds into the next step"
  - skill: "skill-name-2"
    purpose: "What this step accomplishes"
    output: "What this step produces"
  - skill: "skill-name-3"
    purpose: "What this step accomplishes"
    output: "What this step produces"
final_outputs:
  - template-name-1
  - template-name-2
estimated_duration: "X-Y hours"
complexity: "basic | intermediate | advanced"
stage:
  - validation
  - early-traction
author: "Fatih Guner"
---

<!-- PLAYBOOK TEMPLATE
     A playbook chains multiple skills into a sequential solution for a complex scenario.
     Each step's output feeds the next step's input. Checkpoints gate progression.
     Think senior consultant's engagement plan: rigorous, sequenced, with clear gates.

     RULES:
     - 4-7 steps (fewer = too shallow, more = too complex)
     - Each step has: purpose, key questions, input, output, time estimate, checkpoint
     - At least one Decision Point where the path may branch
     - Final deliverables reference specific output templates
     - Common Pitfalls section is mandatory (3-5 mistakes)
     - Adaptation Notes explain how the playbook varies by company stage
     - Target length: 100-150 lines
-->

# {Playbook Title}

## When to Use This Playbook

{The scenario — what the entrepreneur is experiencing that makes this playbook the right choice. Be specific about the trigger conditions.}

---

## Prerequisites

{What must be true or ready before starting this playbook. Data needed, decisions already made, stakeholder alignment, etc.}

---

## The Sequence

### Step 1: {Skill Name}

- **Purpose:** {Why this step comes first — what it establishes}
- **Key questions:** {The 2-3 questions this step must answer}
- **Input:** {What the entrepreneur brings to this step}
- **Output:** {What this step produces — becomes input for Step 2}
- **Time:** {Estimated duration}
- **Checkpoint:** {How to validate before proceeding — what would cause you to stop or revisit}

### Step 2: {Skill Name}

- **Purpose:** {Why this step follows Step 1}
- **Key questions:** {Questions to answer}
- **Input:** {Output from Step 1 + any additional data}
- **Output:** {What this step produces}
- **Time:** {Duration}
- **Checkpoint:** {Validation gate}

---

## Decision Point

<!-- At least one mid-playbook decision where the path branches.
     Format: condition → branch A or branch B -->

{After Step N, evaluate: is this actually problem X or problem Y? If Y → exit this playbook and route to [alternative]. If X → continue to Step N+1.}

---

### Step 3: {Skill Name}
{Continue the sequence...}

---

## Final Deliverable

| Audience | Template | Purpose |
|----------|----------|---------|
| {Investors} | `template-name` | {What this deliverable communicates} |
| {Team} | `template-name` | {What this deliverable communicates} |

---

## Common Pitfalls

{3-5 specific mistakes entrepreneurs make when running this playbook. Not generic advice — specific to THIS scenario.}

---

## Adaptation Notes

{How this playbook changes by company stage. A pre-seed founder runs it differently than a Series B company. Be specific about what changes.}
