# Playbook Commands

Lifecycle management for active playbooks -- navigation, state, termination.

---

## `/status`

Show the active playbook's state: name, step position, checklist, blockers. Returns `No active playbook.` when idle.

**Syntax:** `/status` | **Parameters:** None.

**Examples:**
```
> /status
Fundraising Readiness (Series A) — Step 3/7
  [x] Market Sizing  [x] Competitive Landscape  [ ] Unit Economics (current)
  [ ] Financial Projections  [ ] Pitch Narrative  [ ] Investor Targeting
  [ ] Due Diligence | Blockers: None
```
```
> /status
Should I Pivot? — Step 2/5
  [x] PMF Assessment  [ ] SWOT (current)  [ ] Lean Canvas
  [ ] Unit Economics  [ ] Go/No-Go | Blockers: Interview data low-confidence (n=4).
```
```
> /status
No active playbook.
```
**Related:** `/pause`, `/abort` | **Errors:** `Unable to retrieve state. Try again or /abort to reset.`

---

## `/skip`

Skip the current step. Warns what insight will be absent downstream. Requires `[y/n]`. Step marked `[skipped]`.

**Syntax:** `/skip` | **Parameters:** None.

**Examples:**
```
> /skip
Skipping Step 3 (Porter's Five Forces) — competitive data absent from Pitch
Narrative (5) and Investor Targeting (6). Confirm? [y/n]
> y — Step 3 skipped. Proceeding to Step 4.
```
```
> /skip
Skipping Step 2 (SWOT) removes strengths/weaknesses from Lean Canvas (3).
Confirm? [y/n]  > n — Skip cancelled. Continuing Step 2.
```
```
> /skip
Cannot skip Step 5 (Go/No-Go) — final step. Use /abort.
```
**Related:** `/back`, `/status` | **Errors:** No playbook: `Nothing to skip.` Last step: `Cannot skip the final step.`

---

## `/back`

Return to the previous step, re-run with current context. Output replaces the original.

**Syntax:** `/back` | **Parameters:** None.

**Examples:**
```
> /back
Returning to Step 2 (Competitive Landscape). Re-running with Unit Economics context. Running Step 2...
> /back
Returning to Step 1 (PMF Assessment). Customer data from Step 2 incorporated. Running Step 1...
> /back
Cannot go back — already on Step 1.
```
**Related:** `/skip`, `/status` | **Errors:** No playbook: `Nothing to go back to.` Step 1: `Already on Step 1.`

---

## `/pause`

Pause the playbook, save full state to memory. Resume with `/resume`. Clears active slot.

**Syntax:** `/pause` | **Parameters:** None.

**Examples:**
```
> /pause
Fundraising Readiness paused at Step 3. Steps 1-2 saved. /resume to continue.
> /pause
Should I Pivot? paused at Step 4. Steps 1-3 saved. /resume to continue.
> /pause
Pricing Strategy paused at Step 1. No completed steps. /resume to continue.
```
**Related:** `/resume`, `/status`, `/abort` | **Errors:** No playbook: `Nothing to pause.` Write fail: `State not saved. Playbook remains active.`

---

## `/abort`

Cancel the playbook. Completed outputs go to history; remaining steps discarded. Irreversible -- double confirmation.

**Syntax:** `/abort` | **Parameters:** None.

**Examples:**
```
> /abort
End Fundraising Readiness? Steps 1-2 preserved, 3-7 discarded. [y/n]
> y — Final confirmation, cannot undo. [y/n] > y — Aborted. Steps 1-2 in history.
```
```
> /abort
End Should I Pivot? Steps 1-4 preserved, Step 5 discarded. [y/n]
> n — Abort cancelled. Continuing at Step 5.
```
```
> /abort
End Pricing Strategy? Nothing completed, nothing preserved. [y/n]
> y — Final confirmation. [y/n] > y — Aborted.
```
**Related:** `/pause`, `/status` | **Errors:** No playbook: `Nothing to abort.` Declined: `Abort cancelled.`
