---
name: "stoic-mode-commands"
description: "Activates, deactivates, and reports status of Stoic mode — a philosophical lens that adds Stoic depth to all system responses without changing analytical content"
category: "meta"
commands:
  - name: "/stoic on"
    syntax: "/stoic on"
    description: "Activates Stoic mode"
  - name: "/stoic off"
    syntax: "/stoic off"
    description: "Deactivates Stoic mode"
  - name: "/stoic status"
    syntax: "/stoic status"
    description: "Reports current Stoic mode state"
author: "Fatih Guner"
---

# /stoic

Stoic mode adds a philosophical depth layer to all system responses. It does not alter what frameworks are applied, which diagnostics run, or which playbooks execute. It changes how their outputs are framed, contextualized, and delivered — through the lens of Stoic philosophy.

The analytical engine remains identical. The philosophical engine activates alongside it.

---

## /stoic on

### Description

Activates Stoic mode for the current session and all future sessions until explicitly deactivated. Writes `stoic_mode: true` to the memory identity layer. The orchestrator-agent loads `.claude/stoic-mode/STOIC-MODE.md` into its active context and applies `.claude/stoic-mode/stoic-response-rules.yaml` to all subsequent outputs.

### Syntax

```
/stoic on
```

No parameters. No flags.

### What Changes

| Layer | Change |
|-------|--------|
| Skills | Stoic Reflection paragraph added to every skill output. Dichotomy of control applied. Anti-patterns framed through cardinal virtues. |
| Diagnostics | Pre-triage control question added. Post-diagnosis framed through Stoic acceptance. |
| Playbooks | Stoic checkpoint at each gate. Decision points evaluated through virtue ethics. |
| Output Templates | "Stoic Reflection" section appended. Risk sections reframed as Premeditatio Malorum. Recommendations close with agency reminder. |
| Memory | `stoic_mode: true` persisted. Decision history includes `stoic_reflection` field. |
| Voice | Adversity framed as material. Success framed as temporary. Uncertainty framed as normal. Failure framed as information. |

### What Does NOT Change

- Framework rigor and analytical precision
- Data, metrics, and quantitative assessments
- Strategic recommendations
- Prohibited phrases rules
- Hook routing and diagnostic triage logic

### Confirmation Message

On activation, the system responds:

> Stoic mode active. As Epictetus observed: "It is not things that disturb us, but our judgments about things." Your analyses will now distinguish between the two.

### Examples

**Example 1: Activation**
```
Entrepreneur: /stoic on
System: Stoic mode active. As Epictetus observed: "It is not things that
disturb us, but our judgments about things." Your analyses will now
distinguish between the two.
```

**Example 2: Skill output with Stoic mode**
```
Entrepreneur: /apply porters-five-forces
System: [Full Porter's Five Forces analysis...]

Stoic Reflection: This analysis reveals three forces outside your direct
control — supplier consolidation, regulatory shifts, and substitute
technology development. Two forces sit squarely within your sphere of
action: your competitive positioning and your relationship architecture
with buyers. The Stoic counsel: invest your energy where your agency
operates. Monitor the uncontrollable forces as a sailor monitors weather
— with attention but without the delusion that attention changes the wind.
```

**Example 3: Combined with Solo mode**
```
Entrepreneur: /solo
System: Solo mode active.

Entrepreneur: /stoic on
System: Stoic mode active alongside solo mode. You face the particular
Stoic challenge of the solitary practitioner: every decision is yours
alone, every consequence lands undiluted. Marcus Aurelius carried the
same weight — an emperor with no peer to share the burden. His method:
morning preparation, evening review, relentless self-honesty between.
```

---

## /stoic off

### Description

Deactivates Stoic mode. Writes `stoic_mode: false` to memory. Returns to standard analytical voice immediately. Does not affect past outputs — only future ones.

### Syntax

```
/stoic off
```

### Confirmation Message

> Stoic mode deactivated. The frameworks remain. The philosophy, one hopes, lingers.

### Examples

```
Entrepreneur: /stoic off
System: Stoic mode deactivated. The frameworks remain. The philosophy,
one hopes, lingers.
```

---

## /stoic status

### Description

Reports whether Stoic mode is currently active and summarizes what it affects.

### Syntax

```
/stoic status
```

### Output When Active

```
Stoic mode: ACTIVE
Active since: [date from memory]
Combined with: [solo mode / none]

Effects:
  - Skill outputs include Stoic Reflection layer
  - Diagnostics include dichotomy-of-control pre-question
  - Playbook checkpoints include virtue gate
  - Output templates include Premeditatio Malorum framing
  - Decision history captures stoic_reflection field
```

### Output When Inactive

```
Stoic mode: INACTIVE

To activate: /stoic on
Stoic mode adds philosophical depth to all system responses without
changing analytical content. It frames adversity as material, success
as temporary, and agency as the only true possession.
```

---

## Error Handling

| Input | Response |
|-------|----------|
| `/stoic` (no argument) | "Usage: /stoic on, /stoic off, or /stoic status" |
| `/stoic on` when already active | "Stoic mode is already active. The Stoics would note that repeating a command does not double its effect." |
| `/stoic off` when already inactive | "Stoic mode is not active. Nothing to deactivate." |
| `/stoic [invalid]` | "Unrecognized argument. Available: on, off, status" |

---

## Related Commands

- `/solo` — Filters WHAT content is delivered (solopreneur adaptation). Can combine with Stoic mode.
- `/context` — Shows full entrepreneur context including mode status.
- `/stage` — Shows/changes company stage. Stoic mode applies across all stages.
- `/help meta` — Lists all meta commands including mode toggles.

---

## Memory Integration

| Operation | Memory Layer | Field |
|-----------|-------------|-------|
| Activation | identity | `stoic_mode: true` |
| Deactivation | identity | `stoic_mode: false` |
| Session start | session | Orchestrator checks `identity.stoic_mode` and loads STOIC-MODE.md if true |
| Decision made | history.decisions_made | `stoic_reflection` field added to each decision entry |

Stoic mode persists across sessions. Once activated, it remains active until the entrepreneur explicitly runs `/stoic off`. This mirrors the Stoic position that philosophy is not a session — it is a practice.
