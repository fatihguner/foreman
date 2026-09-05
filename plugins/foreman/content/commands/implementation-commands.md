---
name: "implementation-commands"
description: "Commands for tracking implementation of recommendations, updating progress, analyzing blockers, and running weekly accountability check-ins. These commands operate on the implementation tracking layer and read from and write to the active and history memory layers."
category: "implementation"
commands:
  - name: "/track"
    syntax: "/track [status-filter]"
    description: "View all active implementation items with status, progress, deadlines, and blockers. Filterable by status."
  - name: "/progress"
    syntax: "/progress [item-id] [percentage] [note]"
    description: "Update progress on a specific implementation item."
  - name: "/blockers"
    syntax: "/blockers [category-filter]"
    description: "View all blocked items with blocker analysis and suggested resolution routes."
  - name: "/check-in"
    syntax: "/check-in"
    description: "Run the weekly accountability check-in protocol across all active implementation items."
author: "Fatih Guner"
---

# Implementation Commands

## `/track`

### Description

Displays all active implementation items -- every recommendation from playbooks, skills, and diagnostics that has entered the tracking system and has not yet reached a terminal state. The default view shows all non-terminal items sorted by deadline proximity. Status filters narrow the view to a specific state. The `overdue` filter is a computed view: it surfaces items past their deadline that have not been completed, regardless of their current status.

This is the command for situational awareness. Run it at the start of a session to see what is in flight, what is stuck, and what is due.

### Syntax

```
/track [status-filter]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `status-filter` | No | string | all active | Filter by status: `not-started`, `in-progress`, `blocked`, `completed`, `abandoned`, `deferred`, `overdue`, `stalled` |

### Examples

```
/track
--> Implementation Tracker: 12 active items
    3 not-started | 5 in-progress | 2 blocked | 1 deferred | 1 overdue
    [Table: ID | Description | Status | Progress | Deadline | Last Check-in]
    impl-001  Redesign BMC for B2B pivot         in-progress  40%   Apr 15   Apr 08
    impl-002  Validate pricing with 10 prospects  in-progress  70%   Apr 10   Apr 08
    impl-003  Draft investor narrative for pivot  not-started   0%   Apr 20   --
    ...

/track blocked
--> Blocked Items: 2
    [Table: ID | Description | Blocker Category | Blocker | Days Blocked]
    impl-005  Hire freelance designer           resource      Budget not approved    12
    impl-008  Integrate partner API              dependency    Waiting on partner SDK  7

/track in-progress
--> In-Progress Items: 5
    [Table: ID | Description | Progress | Deadline | Trend]
    impl-001  Redesign BMC for B2B pivot         40%   Apr 15   +20% this week
    impl-002  Validate pricing with 10 prospects  70%   Apr 10   +30% this week
    ...

/track overdue
--> Overdue Items: 1
    [Table: ID | Description | Status | Progress | Deadline | Days Overdue]
    impl-004  Complete competitive analysis      in-progress  25%   Apr 01   7 days overdue

/track stalled
--> Stalled Items (no progress for 14+ days): 2
    [Table: ID | Description | Progress | Last Change | Days Stalled]
    impl-005  Hire freelance designer            10%   Mar 25   14 days
    impl-009  Document onboarding process         0%   Mar 22   17 days
    Recommendation: Run /blockers to analyze what is preventing movement.
```

### Related Commands

- `/progress [item-id] [%] [note]` -- Update progress on a specific item
- `/blockers` -- Deep dive into blocked and stalled items
- `/check-in` -- Run the full weekly accountability protocol
- `/context` -- View broader active memory context

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/track` (no items exist) | `No implementation items found. Items are created when playbooks, skills, or diagnostics produce actionable recommendations.` |
| `/track overdue` (none overdue) | `No overdue items. All active items are within their deadlines.` |
| `/track invalid-status` | `Unknown status filter "invalid-status". Valid filters: not-started, in-progress, blocked, completed, abandoned, deferred, overdue, stalled.` |

---

## `/progress`

### Description

Updates the progress on a specific implementation item. Accepts the item ID, a new percentage, and an optional note describing what changed. The command validates that the item exists and is in a trackable state (not completed, not abandoned). If the new percentage is 100, the system prompts for an outcome description and transitions the item to `completed` status.

This is the lightweight update mechanism -- faster than a full `/check-in` when you want to record progress on a single item mid-week.

### Syntax

```
/progress [item-id] [percentage] [note]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `item-id` | Yes | string | -- | Implementation item identifier (e.g., `impl-001`) |
| `percentage` | Yes | integer | -- | New progress percentage (0-100) |
| `note` | No | string | -- | Brief description of what changed. Enclosed in quotes if multi-word. |

### Examples

```
/progress impl-001 60 "Customer interviews completed, synthesizing findings"
--> Updated impl-001: Redesign BMC for B2B pivot
    Progress: 40% --> 60% (+20%)
    Note recorded: "Customer interviews completed, synthesizing findings"
    Deadline: Apr 15 (7 days remaining)

/progress impl-002 100 "All 10 prospects validated, pricing model confirmed"
--> Updated impl-002: Validate pricing with 10 prospects
    Progress: 70% --> 100%
    Status: in-progress --> completed
    Outcome recorded: "All 10 prospects validated, pricing model confirmed"
    Item moved to history layer.

/progress impl-003 15 "Outlined narrative structure, first draft of opening"
--> Updated impl-003: Draft investor narrative for pivot
    Progress: 0% --> 15%
    Status: not-started --> in-progress
    Note recorded: "Outlined narrative structure, first draft of opening"

/progress impl-005 10
--> Cannot update impl-005: item is currently blocked.
    Blocker: "Budget not approved" (resource)
    Resolve the blocker first, or update status with /progress impl-005 10 "Proceeding despite budget constraint"
    This will clear the blocked status and resume tracking.

/progress impl-007 0 "Decided this is no longer relevant after market shift"
--> impl-007 progress set to 0% with note.
    To abandon this item, confirm: /progress impl-007 abandon "Market shift made this obsolete"
```

### Related Commands

- `/track` -- View all items to find the right ID
- `/blockers` -- If progress is blocked, analyze the blocker first
- `/check-in` -- For batch progress updates across all items

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/progress` | `Missing parameters. Usage: /progress [item-id] [percentage] [note]` |
| `/progress impl-999 50` | `No implementation item found with ID "impl-999". Run /track to see active items.` |
| `/progress impl-002 50` (item is completed) | `Item impl-002 is already completed. Completed items cannot be updated. To reopen, contact support or create a new item.` |
| `/progress impl-001 150` | `Invalid percentage "150". Progress must be between 0 and 100.` |
| `/progress impl-001 -10` | `Invalid percentage "-10". Progress must be between 0 and 100.` |

---

## `/blockers`

### Description

Displays all items in `blocked` status plus items detected as stalled (no progress for 14+ days). For each blocker, the system shows the category, duration, impact assessment (what downstream items or deadlines are affected), and a recommended resolution route -- the specific diagnostic, skill, or action that could unblock the item. Category filters narrow the view to a specific blocker type.

This command does analysis, not just reporting. It identifies patterns (multiple resource blockers may indicate a systemic funding issue), suggests resolution paths, and flags when a "dependency" blocker might actually be a "motivation" blocker in disguise.

### Syntax

```
/blockers [category-filter]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `category-filter` | No | string | all | Filter by blocker category: `resource`, `knowledge`, `dependency`, `motivation`, `external` |

### Examples

```
/blockers
--> Blocker Analysis: 4 items blocked or stalled
    By category: 1 resource | 1 dependency | 1 motivation | 1 external

    [Detailed analysis per item]

    impl-005 | Hire freelance designer
      Category: resource (budget)
      Duration: 12 days blocked
      Impact: Delays impl-001 (BMC redesign needs visual assets) by estimated 1 week
      Resolution route: Run /diagnose operations to assess budget reallocation options
                        Apply resource-allocation skill for prioritization framework

    impl-008 | Integrate partner API
      Category: dependency (waiting on partner)
      Duration: 7 days blocked
      Impact: Blocks impl-010 (launch beta to first 10 users)
      Resolution route: Apply stakeholder-map to identify escalation path
                        Consider parallel work on impl-010 with mock API

    Pattern detected: 2 of 4 blockers involve external parties. Consider whether
    your execution plan has too many external dependencies.

/blockers resource
--> Resource Blockers: 1 item
    impl-005 | Hire freelance designer
      Blocker: Budget not approved for $3K design contract
      Duration: 12 days
      Suggested resolution: Reallocate from underutilized budget line, negotiate
      phased payment, or reduce scope to essential deliverables only.
      Route: /apply resource-allocation or /diagnose operations

/blockers motivation
--> Motivation Blockers: 1 item
    impl-009 | Document onboarding process
      Blocker: No explicit blocker stated. Stalled 17 days at 0%.
      Analysis: This item has been in not-started status since creation despite
      no resource, knowledge, dependency, or external constraint. The most likely
      blocker is avoidance -- the task feels tedious or overwhelming relative to
      higher-energy work.
      Route: Apply eisenhower-matrix to confirm priority. If priority is confirmed,
      break into 3 sub-tasks of 30 minutes each. If Stoic mode is active, examine
      which of the Seven Functions of the Mind is failing here.
```

### Related Commands

- `/track blocked` -- Quick view of blocked items without deep analysis
- `/progress [item-id] [%] [note]` -- Update an item after resolving its blocker
- `/diagnose [area]` -- Run a diagnostic suggested by blocker analysis
- `/apply [skill]` -- Apply a skill suggested by blocker analysis
- `/check-in` -- Full accountability review including blocker identification

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/blockers` (no blocked items) | `No blocked or stalled items. All active implementation items are progressing. Run /track to see current status.` |
| `/blockers creativity` | `Unknown blocker category "creativity". Valid categories: resource, knowledge, dependency, motivation, external.` |

---

## `/check-in`

### Description

Initiates the weekly accountability review -- the core ritual of the implementation tracking system. The check-in walks through every active implementation item systematically, records progress updates, identifies blockers, detects stalls, rebalances priorities, and persists all changes to memory. A complete check-in takes 10-20 minutes depending on the number of active items. The system guides the conversation; the entrepreneur provides honest status updates.

This command should be run weekly. If more than 14 days elapse since the last check-in, the system notes the gap and adjusts its expectations accordingly -- longer gaps mean more items may have drifted, and the check-in will be more thorough.

### Syntax

```
/check-in
```

### Parameters

This command takes no parameters. The check-in protocol is fully guided.

### Examples

```
/check-in
--> Weekly Check-In | Last check-in: Apr 08 (7 days ago)
    Active items: 10 (3 not-started, 5 in-progress, 2 blocked)

    Phase 1: Status Sweep
    [Table of all active items with current progress and deadline proximity]

    Phase 2: Progress Updates
    Starting with items closest to deadline...

    impl-002 | Validate pricing with 10 prospects (due: Apr 10, 2 days)
    Current progress: 70%
    --> What progress have you made since Apr 08?
    [Entrepreneur responds]
    --> Recorded: 90%. Note: "8 of 10 interviews complete, 2 scheduled for tomorrow."

    impl-001 | Redesign BMC for B2B pivot (due: Apr 15, 7 days)
    Current progress: 40%
    --> What progress have you made since Apr 08?
    [Entrepreneur responds]
    ...

    Phase 3: Blocker Identification
    impl-005 has been at 10% for 14 days.
    --> What is preventing progress on "Hire freelance designer"?
    [Entrepreneur responds]
    --> Blocker categorized: resource (budget). Suggested route: /diagnose operations

    Phase 4: Priority Rebalancing
    Recommended focus for next week:
    1. impl-002 -- Complete pricing validation (due in 2 days)
    2. impl-001 -- Advance BMC redesign past 50% (due in 7 days)
    3. impl-005 -- Resolve budget blocker to unblock design work

    Phase 5: Summary
    Items updated: 8
    New blockers identified: 1
    Items completed since last check-in: 0
    Check-in saved to memory.

/check-in (with Stoic mode active)
--> Weekly Check-In | Stoic Reflection Enabled

    [Standard phases 1-4, plus Stoic prompts:]

    Dichotomy of Control:
    Of your 2 blocked items, which blockers are within your control?
    - impl-005 (budget): Partially within control -- you can reallocate or negotiate
    - impl-008 (partner API): Outside your control -- focus energy elsewhere

    Premeditatio Malorum:
    Your top priority (impl-002, due in 2 days) -- what could prevent completion?
    Have you prepared for a scenario where the last 2 interviews cancel?

    Reflection: "Are any of your stalled items stalled because of fear rather
    than circumstance? Name the fear, and it loses half its power."

/check-in (14+ days since last)
--> Weekly Check-In | Gap Detected: 18 days since last check-in (Mar 20)
    Extended review mode: some items may have changed significantly.
    [Proceeds with standard protocol but asks for more detailed updates]
```

### Related Commands

- `/track` -- Quick status view without the full check-in protocol
- `/progress [item-id] [%] [note]` -- Update a single item outside the check-in cycle
- `/blockers` -- Deep blocker analysis if the check-in surfaces many blockers

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/check-in` (no items) | `No active implementation items to review. Items are created when playbooks, skills, or diagnostics produce actionable recommendations. Run /track to confirm.` |
| `/check-in` (already run today) | `A check-in was already completed today (Apr 15). Run /track to view current status, or /progress to update individual items.` |
