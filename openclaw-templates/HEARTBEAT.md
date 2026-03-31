# Heartbeat — Periodic Tasks

These tasks run on a schedule when heartbeat is enabled. Each one checks a condition and takes action only when triggered. Foreman does not nag — it surfaces what matters and stays quiet otherwise.

## Task 1: Implementation Check-in

- **Description**: Review all in-progress implementation items and flag stalled ones.
- **Interval**: Every 7 days
- **Check**: Scan `active.yaml` → `implementation_items` for entries with state `in-progress` and no update in the last 7 days.
- **Action if triggered**: Compose a brief status summary:
  > You have [N] implementation items in progress. [M] have had no update in 7+ days: [list names]. Would you like to update their status, or should we diagnose what is blocking progress?
- **Action if clear**: No message. Silence is the signal that things are on track.

## Task 2: Follow-up Reminders

- **Description**: Surface overdue follow-ups before they become forgotten commitments.
- **Interval**: Every 3 days
- **Check**: Scan `active.yaml` → `follow_ups` for entries past their `due_date`.
- **Action if triggered**: Surface the overdue items concisely:
  > [N] follow-ups are overdue: [list with original due dates]. Mark as complete, reschedule, or drop?
- **Action if clear**: No message.

## Task 3: Decision Deadline Alerts

- **Description**: Warn about approaching decision deadlines before they arrive.
- **Interval**: Daily (when heartbeat runs)
- **Check**: Scan `active.yaml` → `pending_decisions` for entries with `deadline` within the next 3 days.
- **Action if triggered**: Alert with context:
  > Decision due in [N] days: "[decision description]". You noted this on [date]. Ready to decide, or need more analysis?
- **Action if clear**: No message.

## Task 4: Memory Staleness

- **Description**: Prompt for a context refresh when company information may be outdated.
- **Interval**: Every 30 days
- **Check**: Read `company.yaml` → `last_updated` field. Flag if older than 90 days.
- **Action if triggered**: Prompt gently:
  > Your company profile has not been updated in [N] days. Businesses change — has anything shifted in your stage, team, funding, or focus? Use `/update company` to refresh, or tell me what has changed.
- **Action if clear**: No message.

## Task 5: Playbook Progress

- **Description**: Check whether an active playbook is still being pursued or has quietly stalled.
- **Interval**: Every 7 days
- **Check**: If `active.yaml` → `active_playbook` exists and the current step has not advanced in 14+ days.
- **Action if triggered**: Ask directly:
  > You started the [playbook name] playbook [N] days ago and are on step [X] of [Y]. No progress in 14 days. Still pursuing this, or should we pause and revisit later?
- **Action if clear**: No message.

## Configuration

Heartbeat tasks respect the entrepreneur's preferences:

- **Opt-out**: The entrepreneur can disable specific tasks or all heartbeat checks.
- **Frequency override**: Custom intervals can be set per task if the defaults feel too frequent or too sparse.
- **Quiet hours**: Heartbeat messages are batched — never more than one heartbeat summary per session start.

All heartbeat output follows the same voice rules as `SOUL.md`: concise, direct, no performative warmth.

---

*Author: Fatih Guner*
