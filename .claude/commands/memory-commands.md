---
name: "memory-commands"
description: "Commands for viewing, updating, and managing the entrepreneur's persistent context — identity, company profile, decision history, follow-ups, and session data. These commands read from and write to the five-layer memory system."
category: "memory"
commands:
  - name: "/context"
    syntax: "/context [layer]"
    description: "Display the entrepreneur's current context from identity, company, and active memory layers."
  - name: "/update company"
    syntax: "/update company"
    description: "Interactive update of the company profile — stage, metrics, sector, and challenges."
  - name: "/update identity"
    syntax: "/update identity"
    description: "Interactive update of the entrepreneur's personal profile."
  - name: "/history"
    syntax: "/history [type] [--last n]"
    description: "Show past diagnostics, decisions, and skill applications from the history layer."
  - name: "/decisions"
    syntax: "/decisions [filter]"
    description: "List pending, overdue, and completed decisions."
  - name: "/follow-ups"
    syntax: "/follow-ups [filter]"
    description: "Show upcoming and overdue follow-up items."
  - name: "/forget"
    syntax: "/forget [type] [identifier]"
    description: "Delete a specific memory entry with confirmation."
  - name: "/reset"
    syntax: "/reset"
    description: "Full memory wipe across all layers, requiring double confirmation."
author: "Fatih Guner"
---

# Memory Commands

## `/context`

### Description

Displays the entrepreneur's current context as stored in memory. Without arguments, returns a consolidated view combining identity (who you are), company (stage, sector, metrics, challenges), and active items (running playbooks, pending decisions, upcoming follow-ups). With a layer argument, returns only that specific layer. This command is read-only — it never modifies state.

### Syntax

```
/context [layer]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `layer` | No | string | all | Specific memory layer: `identity`, `company`, `active` |

### Examples

```
/context
→ Identity:
    Name: Sarah Chen
    Role: CEO & Co-founder
    Experience: 8 years product management, 2 years as founder
  Company:
    Name: Relay Health
    Sector: B2B healthtech
    Stage: early-traction
    MRR: $42,000
    Team size: 12
    Challenges: churn rate rising, Series A timeline pressure
  Active:
    Playbook: fundraising-playbook (Step 4 of 8)
    Pending decisions: 2 (VP Engineering hire, pricing model change)
    Overdue follow-ups: 1 (investor update to Sequoia)

/context company
→ Company:
    Name: Relay Health
    Sector: B2B healthtech
    Stage: early-traction
    MRR: $42,000
    Burn rate: $85,000/month
    Runway: 11 months
    Team size: 12
    Challenges: churn rate rising, Series A timeline pressure

/context identity
→ Identity:
    Name: Sarah Chen
    Role: CEO & Co-founder
    Experience: 8 years product management, 2 years as founder
    Strengths: product intuition, stakeholder communication
    Development areas: financial modeling, board management
```

### Related Commands

- `/update company` — Modify the company profile
- `/update identity` — Modify the personal profile
- `/history` — View past actions rather than current state

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/context session` | `Unknown layer "session". Available layers: identity, company, active. Session data is internal and not directly viewable.` |
| `/context` (empty memory) | `No context found. Run /update identity and /update company to set up your profile.` |

---

## `/update company`

### Description

Launches an interactive company profile update. The system walks through each field — company name, sector, stage, key metrics (MRR, burn rate, runway, team size), current challenges, and strategic priorities — prompting for new values or confirmation of existing ones. Fields can be skipped to retain their current values. Changes are persisted immediately to the company memory layer.

### Syntax

```
/update company
```

### Parameters

This command takes no parameters. All updates are collected interactively.

### Examples

```
/update company
→ Updating company profile...
  Company name [Relay Health]: (enter to keep)
  Sector [B2B healthtech]: (enter to keep)
  Stage [early-traction]: growth
  MRR [$42,000]: $78,000
  Burn rate [$85,000/month]: $110,000/month
  Team size [12]: 18
  Current challenges [churn rate rising, Series A timeline pressure]: scaling engineering, enterprise sales motion
  Updated. Stage changed from early-traction to growth — skill recommendations will adjust accordingly.

/update company
→ Updating company profile...
  Company name []: DataForge
  Sector []: B2B SaaS, developer tools
  Stage []: validation
  MRR []: $3,200
  Burn rate []: $25,000/month
  Team size []: 3
  Current challenges []: finding design partners, unclear pricing
  Company profile created.
```

### Related Commands

- `/context company` — View the current company profile
- `/update identity` — Update personal profile alongside company data
- `/apply [skill]` — Skills will use the updated company context

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/update company` (invalid stage input) | `"series-a" is not a recognized stage. Valid stages: idea, validation, early-traction, growth, scale. Please select one.` |
| `/update company` (invalid metric format) | `Could not parse "$42k" as a metric value. Enter a number: e.g., $42,000 or 42000.` |

---

## `/update identity`

### Description

Launches an interactive personal profile update. The system walks through the entrepreneur's name, role, experience, strengths, development areas, and working style preferences. This identity data influences how skills are framed and which coaching patterns the system applies. Fields can be skipped to retain existing values.

### Syntax

```
/update identity
```

### Parameters

This command takes no parameters. All updates are collected interactively.

### Examples

```
/update identity
→ Updating identity profile...
  Name [Sarah Chen]: (enter to keep)
  Role [CEO & Co-founder]: (enter to keep)
  Years of experience [10]: (enter to keep)
  Background [product management]: product management, design
  Strengths [product intuition, stakeholder communication]: (enter to keep)
  Development areas [financial modeling, board management]: financial modeling, board management, hiring
  Updated. Development areas expanded — relevant skill recommendations will adjust.

/update identity
→ Updating identity profile...
  Name []: Marcus Rivera
  Role []: Solo founder & CTO
  Years of experience []: 6
  Background []: software engineering, machine learning
  Strengths []: technical architecture, rapid prototyping
  Development areas []: sales, fundraising, delegation
  Identity profile created.
```

### Related Commands

- `/context identity` — View the current identity profile
- `/update company` — Update company profile alongside identity
- `/context` — View the full consolidated context

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/update identity` (session interruption) | `Profile update interrupted. Partial changes saved. Run /update identity again to complete.` |

---

## `/history`

### Description

Displays the entrepreneur's action history from the history memory layer. Without arguments, returns a reverse-chronological summary of all recorded events — diagnostics run, skills applied, decisions made, and playbook completions. A type filter narrows to one category. The `--last` flag limits the number of entries returned.

### Syntax

```
/history [type] [--last n]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `type` | No | string | all | Filter by entry type: `diagnostics`, `skills`, `decisions`, `playbooks` |
| `--last` | No | integer | 20 | Number of entries to return |

### Examples

```
/history
→ Recent activity (last 20 entries):
  2026-03-25  skill     porters-five-forces applied (stage: early-traction)
  2026-03-24  decision  Pricing model change — decided: usage-based
  2026-03-22  playbook  fundraising-playbook paused at Step 4
  2026-03-20  skill     swot-pest-analysis applied (stage: early-traction)
  2026-03-18  diagnostic revenue-diagnosis completed → recommended: pricing-diagnosis
  ...

/history decisions
→ Decision history:
  2026-03-24  Pricing model change — decided: usage-based
  2026-03-15  VP Engineering hire — decided: defer 60 days
  2026-03-08  Market expansion — decided: vertical-first, horizontal later
  2026-02-28  Product roadmap Q2 — decided: core platform stability over new features

/history skills --last 5
→ Last 5 skill applications:
  2026-03-25  porters-five-forces (stage: early-traction)
  2026-03-20  swot-pest-analysis (stage: early-traction)
  2026-03-14  business-model-canvas (stage: early-traction)
  2026-03-10  unit-economics (stage: early-traction)
  2026-03-05  net-promoter-score (stage: early-traction)

/history diagnostics --last 3
→ Last 3 diagnostics:
  2026-03-18  revenue-diagnosis → root cause: churn-driven revenue loss
  2026-03-10  fundraising-diagnosis → root cause: narrative gap, not traction gap
  2026-02-25  team-dysfunction-diagnosis → root cause: unclear engineering ownership
```

### Related Commands

- `/context` — View current state rather than past actions
- `/decisions` — Focused view of decisions with pending/overdue status
- `/forget [item]` — Delete a specific history entry

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/history metrics` | `Unknown type "metrics". Available types: diagnostics, skills, decisions, playbooks.` |
| `/history --last 0` | `--last must be a positive integer. Usage: /history [type] [--last n].` |
| `/history` (empty history) | `No history found. Run /apply, /diagnose, or /run to start building your history.` |

---

## `/decisions`

### Description

Lists decisions tracked in memory, organized by status. Without arguments, shows pending decisions — those recorded but not yet resolved. Filters narrow to a specific status. Each decision entry shows the decision topic, date recorded, current status, and deadline if set.

### Syntax

```
/decisions [filter]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `filter` | No | string | `pending` | Decision status filter: `pending`, `overdue`, `completed`, `all` |

### Examples

```
/decisions
→ 2 pending decisions:
  1. VP Engineering hire — recorded 2026-03-15, deadline 2026-04-15
     Context: Deferred 60 days pending Series A clarity
  2. Pricing model change — recorded 2026-03-20, deadline 2026-04-01
     Context: Usage-based vs. seat-based, customer interviews in progress

/decisions overdue
→ 1 overdue decision:
  1. Partner channel strategy — recorded 2026-02-10, deadline 2026-03-10 (16 days overdue)
     Context: AWS Marketplace vs. direct sales, waiting on partner terms

/decisions completed
→ 4 completed decisions:
  2026-03-24  Pricing model change — decided: usage-based
  2026-03-08  Market expansion — decided: vertical-first
  2026-02-28  Product roadmap Q2 — decided: stability over features
  2026-02-15  Office lease — decided: remain remote through 2026

/decisions all
→ 7 total decisions (2 pending, 1 overdue, 4 completed)
  [Combined listing of all decisions across all statuses]
```

### Related Commands

- `/history decisions` — View the full decision history log
- `/follow-ups` — See follow-up items that may relate to pending decisions
- `/forget decision [identifier]` — Remove a decision from tracking

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/decisions active` | `Unknown filter "active". Available filters: pending, overdue, completed, all.` |
| `/decisions` (no decisions tracked) | `No decisions tracked. Decisions are recorded when diagnostics or playbooks surface decision points, or when you log them during skill application.` |

---

## `/follow-ups`

### Description

Lists follow-up items — actions the entrepreneur committed to during diagnostics, playbooks, or skill applications. Without arguments, shows all upcoming follow-ups ordered by date. The `overdue` filter isolates items past their deadline.

### Syntax

```
/follow-ups [filter]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `filter` | No | string | `upcoming` | Filter: `upcoming`, `overdue`, `all` |

### Examples

```
/follow-ups
→ 3 upcoming follow-ups:
  1. Send investor update to Sequoia — due 2026-03-28
     Source: fundraising-playbook, Step 3
  2. Schedule customer interviews for pricing validation — due 2026-04-01
     Source: pricing-diagnosis
  3. Review VP Engineering candidate pipeline — due 2026-04-15
     Source: decision: VP Engineering hire

/follow-ups overdue
→ 1 overdue follow-up:
  1. Finalize partner channel terms with AWS — due 2026-03-10 (16 days overdue)
     Source: decision: partner channel strategy

/follow-ups all
→ 4 follow-ups (3 upcoming, 1 overdue)
  [Combined listing ordered by due date]
```

### Related Commands

- `/decisions` — View the decisions that generated these follow-ups
- `/context active` — See all active items including follow-ups
- `/forget` — Remove a follow-up that is no longer relevant

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/follow-ups completed` | `Unknown filter "completed". Available filters: upcoming, overdue, all. Completed follow-ups move to /history.` |
| `/follow-ups` (none tracked) | `No follow-ups tracked. Follow-ups are created during diagnostics, playbooks, and skill applications when action items are identified.` |

---

## `/forget`

### Description

Deletes a specific entry from memory. Requires both the entry type and an identifier — either a name or a date — to target the correct record. The command displays the matched entry and asks for explicit confirmation before deletion. Deletion is permanent and cannot be undone.

### Syntax

```
/forget [type] [identifier]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `type` | Yes | string | -- | Entry type: `decision`, `diagnostic`, `skill`, `follow-up`, `playbook` |
| `identifier` | Yes | string | -- | Entry name (in quotes if multi-word) or date (YYYY-MM-DD) |

### Examples

```
/forget decision "VP hire"
→ Found: Decision — "VP Engineering hire" (recorded 2026-03-15)
  This will permanently delete this decision and its associated follow-ups.
  Confirm deletion? [y/n]
  > y
  Deleted.

/forget diagnostic 2026-03-18
→ Found: Diagnostic — revenue-diagnosis (completed 2026-03-18)
  This will permanently delete this diagnostic result from history.
  Confirm deletion? [y/n]
  > y
  Deleted.

/forget follow-up "investor update"
→ Found: Follow-up — "Send investor update to Sequoia" (due 2026-03-28)
  Confirm deletion? [y/n]
  > n
  Cancelled. No changes made.

/forget skill 2026-03-25
→ Found: Skill application — porters-five-forces (applied 2026-03-25)
  This will permanently delete this analysis result from history.
  Confirm deletion? [y/n]
  > y
  Deleted.
```

### Related Commands

- `/history` — Review entries before deciding what to delete
- `/decisions` — Review decisions before deleting
- `/reset` — Delete everything instead of individual entries

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/forget` | `Missing type and identifier. Usage: /forget [type] [identifier]. Types: decision, diagnostic, skill, follow-up, playbook.` |
| `/forget decision` | `Missing identifier. Usage: /forget decision [name or date]. Example: /forget decision "VP hire" or /forget decision 2026-03-15.` |
| `/forget decision "board meeting"` | `No decision found matching "board meeting". Run /decisions all to see tracked decisions.` |
| `/forget metric "MRR"` | `Unknown type "metric". Available types: decision, diagnostic, skill, follow-up, playbook. Company profile fields are updated via /update company.` |

---

## `/reset`

### Description

Performs a full memory wipe across all five layers — identity, company, history, active, and session. This is a destructive, irreversible operation. The command requires double confirmation: first acknowledging the scope of deletion, then entering a confirmation phrase. After reset, the system returns to a blank-slate state as though no entrepreneur context has ever been set.

### Syntax

```
/reset
```

### Parameters

This command takes no parameters.

### Examples

```
/reset
→ WARNING: This will permanently delete ALL memory across all layers:
  - Identity profile (name, role, experience, strengths)
  - Company profile (stage, metrics, challenges)
  - Full history (diagnostics, skills, decisions, playbooks)
  - Active items (running playbooks, pending decisions, follow-ups)
  - Session data

  This action cannot be undone.
  Type "RESET ALL" to confirm: RESET ALL
  Memory cleared. All layers wiped. Run /update identity and /update company to start fresh.

/reset
→ WARNING: This will permanently delete ALL memory across all layers:
  ...
  Type "RESET ALL" to confirm: cancel
  Reset cancelled. No changes made.
```

### Related Commands

- `/forget [item]` — Delete individual entries instead of everything
- `/context` — Review what exists in memory before resetting
- `/update company` — Rebuild company profile after a reset
- `/update identity` — Rebuild identity profile after a reset

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/reset` (confirmation mismatch) | `Confirmation phrase did not match. Expected "RESET ALL". Reset cancelled. No changes made.` |
| `/reset` (empty memory) | `Memory is already empty. Nothing to reset.` |
