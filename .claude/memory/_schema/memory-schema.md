---
name: "memory-schema"
description: "Defines the five-layer memory architecture that persists entrepreneur context across sessions. Each layer has a distinct change frequency, ownership model, and data structure."
version: "1.0.0"
author: "Fatih Guner"
---

# Memory Schema

The memory system maintains entrepreneur context across sessions through five layers, each operating at a different temporal frequency. Together they enable the system to behave less like a stateless tool and more like a mentor who remembers.

---

## Architecture Overview

```
Layer 1: Identity    (changes: ~yearly)      — Who is the entrepreneur?
Layer 2: Company     (changes: ~monthly)     — What is the company's current state?
Layer 3: History     (changes: append-only)   — What has happened before?
Layer 4: Active      (changes: ~weekly)       — What is in progress right now?
Layer 5: Session     (changes: per message)   — What is happening this conversation?
```

Each layer is stored as an independent YAML file within the entrepreneur's directory. This separation ensures that updating one layer never risks corrupting another, and that each layer can be read independently when full context is unnecessary.

---

## Layer Definitions

### Layer 1: Identity

**File:** `identity.yaml`
**Change frequency:** Rarely — updated when the entrepreneur's role, background, or preferences shift
**Owner:** Entrepreneur provides, system records
**Purpose:** Personalizes tone, complexity, and framing of all system outputs

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Entrepreneur's name |
| `role` | string | Current role (Founder, CEO, CTO, etc.) |
| `background` | string | Professional background (technical, business, design, etc.) |
| `leadership_style` | string | Observed or self-reported leadership tendencies |
| `communication_preference` | string | How they prefer to receive information (direct, narrative, data-driven) |
| `known_strengths` | list | 3-5 identified strengths |
| `known_weaknesses` | list | 3-5 identified growth areas |
| `personality_notes` | string | Behavioral observations that affect how the system should interact |

**Read by:** orchestrator-agent (every session start), skill-executor-agent (tone calibration), output-agent (formatting decisions)
**Written by:** memory-agent on first interaction, updated when entrepreneur reveals new information

---

### Layer 2: Company

**File:** `company.yaml`
**Change frequency:** Monthly or quarterly — updated when metrics, stage, or structure change
**Owner:** Entrepreneur provides updates, system prompts for refresh when data appears stale
**Purpose:** Enables stage filtering, metric-informed diagnosis, and contextual skill application

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Company name |
| `stage` | enum | `idea`, `validation`, `early-traction`, `growth`, `scale` |
| `sector` | string | Industry and sub-sector |
| `team_size` | integer | Current headcount |
| `funding.raised` | string | Total funding raised |
| `funding.runway_months` | integer | Months of runway remaining |
| `funding.next_round` | string | Planned next round and timing |
| `metrics.mrr` | string | Monthly recurring revenue |
| `metrics.growth_rate` | string | Month-over-month growth |
| `metrics.churn` | string | Monthly churn rate |
| `metrics.nps` | integer | Net Promoter Score |
| `business_model` | string | Revenue model description |
| `key_challenges` | list | Top 3-5 current challenges |
| `competitive_landscape` | string | Brief competitive context |

**Staleness rule:** If `company.yaml` has not been updated in 90 days, memory-agent prompts for refresh at next session start.
**Read by:** orchestrator-agent (stage filtering), diagnostic-agent (metric-informed triage), skill-executor-agent (contextual application)
**Written by:** memory-agent when entrepreneur provides updates or when metrics are mentioned in conversation

---

### Layer 3: History

**File:** `history.yaml`
**Change frequency:** Append-only — entries are added, never modified or deleted
**Owner:** System writes automatically after each significant interaction
**Purpose:** Prevents redundant analysis, enables "we already explored this" context, tracks decision patterns

| Section | Entry Fields | Description |
|---------|-------------|-------------|
| `diagnostics_run` | date, diagnostic, result, confidence | Every diagnostic executed with its outcome |
| `skills_applied` | date, skill, context, key_insight | Every skill application with the primary finding |
| `decisions_made` | date, decision, rationale, outcome, review_date, related_skill | Every significant decision with reasoning and follow-up |
| `playbooks_completed` | date, playbook, status, key_outcome | Every playbook run with completion status |
| `outputs_generated` | date, template, audience, context | Every output template produced |

**Append rules:**
- A diagnostic entry is added after every diagnostic-agent run
- A skill entry is added after every skill-executor-agent application
- A decision entry is added when the entrepreneur explicitly commits to a course of action
- Outcome fields are updated during follow-up reviews (the only exception to append-only)

**Read by:** diagnostic-agent (avoid re-diagnosing known issues), skill-executor-agent (reference prior insights), orchestrator-agent (continuity awareness)
**Written by:** memory-agent at end of each session via PRUNE_SESSION operation

---

### Layer 4: Active

**File:** `active.yaml`
**Change frequency:** Weekly — updated as playbooks progress, decisions resolve, follow-ups arrive
**Owner:** System manages, entrepreneur confirms
**Purpose:** Tracks work in progress — ensures nothing falls through the cracks between sessions

| Section | Entry Fields | Description |
|---------|-------------|-------------|
| `current_playbook` | name, current_step, started, status, completed_steps[], next_step, blocker | The playbook currently being executed |
| `pending_decisions` | decision, deadline, related_diagnostic, options_considered[] | Decisions that have been framed but not yet made |
| `follow_ups` | date, type, context | Scheduled review dates for past decisions or milestones |

**Lifecycle rules:**
- When a playbook completes → move to `history.playbooks_completed`, clear from active
- When a decision is made → move to `history.decisions_made`, clear from pending
- When a follow-up date passes → memory-agent raises it at next session start
- When a blocker resolves → update `next_step`, clear blocker field

**Read by:** orchestrator-agent (session start — "you have a pending decision due Friday"), playbook-runner-agent (resume from checkpoint)
**Written by:** memory-agent after each session, playbook-runner-agent during execution

---

### Layer 5: Session

**File:** `session.yaml`
**Change frequency:** Every message — ephemeral, exists only during active conversation
**Owner:** System creates and destroys automatically
**Purpose:** Maintains conversation context, accumulates data for end-of-session persistence

| Field | Type | Description |
|-------|------|-------------|
| `started` | datetime | Session start timestamp |
| `topic` | string | Primary topic identified from first message |
| `hooks_triggered` | list | Which hooks matched during this session |
| `current_context` | list | Running notes on what is being discussed |
| `messages_exchanged` | integer | Conversation length counter |
| `skills_invoked` | list | Skills applied during this session |
| `temp_notes` | list | Observations to evaluate for persistence at session end |

**End-of-session protocol (PRUNE_SESSION):**

```
For each item in session:
  if decision_made → append to history.decisions_made + create active.follow_up
  if skill_applied → append to history.skills_applied
  if diagnostic_run → append to history.diagnostics_run
  if playbook_progressed → update active.current_playbook
  if company_data_mentioned → update company.yaml
  if identity_insight_revealed → update identity.yaml
  discard remaining temp_notes and session metadata
  delete session.yaml
```

---

## Cross-Layer Interactions

| Operation | Trigger | Reads | Writes |
|-----------|---------|-------|--------|
| SESSION_START | Conversation begins | Identity + Company + Active | Session (create) |
| CONTEXT_CHECK | Orchestrator needs background | History (relevant entries) | — |
| SKILL_COMPLETE | Skill executor finishes | — | Session.skills_invoked |
| DECISION_MADE | Entrepreneur commits | — | Session.temp_notes |
| PLAYBOOK_STEP | Playbook runner advances | Active.current_playbook | Active.current_playbook |
| SESSION_END | Conversation ends | Session (all) | History + Active + Company (selective) |
| STALENESS_CHECK | Session start | Company.last_updated | — (prompts if stale) |
| FOLLOW_UP_CHECK | Session start | Active.follow_ups | — (raises overdue items) |

---

## Data Governance

**Retention:** History is permanent. Active is cleared when items complete. Session is destroyed after each conversation.

**Privacy:** All memory is entrepreneur-specific. No cross-entrepreneur data sharing. Memory files reside within the entrepreneur's own directory.

**Portability:** YAML format ensures memory can be exported, backed up, or migrated without system dependency.

**Right to forget:** An entrepreneur can request deletion of any layer at any time. The system confirms, executes, and does not retain shadows of deleted data.
