---
name: "kebab-case-agent-name"
description: "Third-person description of this agent's role within the Foreman orchestration layer. Max 1024 characters."
role: "orchestrator | diagnostic | skill-executor | playbook-runner | memory | output"
triggers:
  - "activation condition that causes this agent to be invoked"
  - "another activation condition"
dependencies:
  - "other-agent-name"
inputs:
  - "what this agent receives from its caller"
outputs:
  - "what this agent produces and returns"
author: "Fatih Guner"
---

<!-- AGENT TEMPLATE
     Agents are the orchestration layer of Foreman. Each agent receives structured
     input, performs a defined function, and returns structured output. Agents do not
     interact with the entrepreneur directly — only the orchestrator-agent holds that
     privilege. All other agents operate as internal specialists.

     RULES:
     - Every agent file follows this section structure exactly
     - Frontmatter must include all required fields
     - Role must be one of: orchestrator, diagnostic, skill-executor, playbook-runner, memory, output
     - Workflow sections should include pseudocode where the logic benefits from precision
     - Example Flow must reference real skills, diagnostics, templates, and playbooks from the repository
     - Decision Rules must be exhaustive — no ambiguous routing
     - Error Handling must cover every failure mode the agent can encounter
     - Writing style: analytical, institutional, precise (see CLAUDE.md style guide)
     - Target lengths vary by agent complexity (noted per section below)
-->

# {Agent Name}

## Role

<!-- 2-4 sentences defining what this agent does, what it owns, and what it does NOT do.
     Be precise about boundaries — agents must not overlap in responsibility. -->

{Role definition}

---

## Responsibilities

<!-- Bulleted list of specific responsibilities this agent owns.
     Each bullet is a discrete, testable function. -->

- {Responsibility 1}
- {Responsibility 2}
- {Responsibility 3}

---

## Activation

<!-- When and how this agent is invoked.
     Specify the caller (which agent triggers this one) and the conditions. -->

| Trigger Condition | Caller | Priority |
|-------------------|--------|----------|
| {condition} | {calling agent} | {high/medium/low} |

---

## Workflow

<!-- Step-by-step execution flow. Include pseudocode where logic is non-trivial.
     Number each step. Show decision branches explicitly. -->

1. {Step 1}
2. {Step 2}
3. {Step 3}

```
pseudocode where helpful
```

---

## Interactions

<!-- Which other agents this agent communicates with, in which direction, and what data flows between them. -->

| Agent | Direction | Data Exchanged |
|-------|-----------|----------------|
| {agent-name} | {sends to / receives from / bidirectional} | {data description} |

---

## Decision Rules

<!-- Explicit rules for every decision this agent makes.
     Format: IF condition THEN action. No ambiguity permitted. -->

- **IF** {condition} **THEN** {action}
- **IF** {condition} **THEN** {action}

---

## Error Handling

<!-- Every failure mode and the agent's response.
     Include: input failures, dependency failures, ambiguous results, timeouts. -->

| Failure Mode | Response |
|-------------|----------|
| {failure} | {how the agent handles it} |

---

## Example Flow

<!-- A complete end-to-end scenario showing this agent in action.
     Reference real skills, diagnostics, templates, and playbooks from the repository.
     Show inputs, internal decisions, outputs, and interactions with other agents. -->

**Scenario:** {description}

1. {Step with specific component references}
2. {Step with specific component references}
3. {Step with specific component references}

**Result:** {what the agent produces}
