# Solo Command

Activates, deactivates, and inspects solo mode — the system-wide adaptation layer for solopreneurs.

---

## `/solo`

### Description

Activates solo mode. Writes `mode: solo` to the identity layer of memory and loads the solo configuration files (`solo/SOLO.md`, `solo/solo-skill-relevance.yaml`, `solo/solo-audience-map.yaml`, `solo/solo-adaptations.yaml`). From this point forward, every interaction is filtered through the solo lens until explicitly deactivated.

Activation triggers the following immediate changes:
- Skill relevance scoring adjusts routing priority for all 158 skills.
- Audience mapping remaps investor, board, and team outputs.
- Diagnostic adaptations skip or reframe 8 of 20 diagnostics.
- Playbook adaptations skip or reframe 11 of 20 playbooks.
- Hook adaptations reframe 8 of 16 hooks.
- Default output audience becomes `self`.
- Voice shifts to direct, personal address without team or board assumptions.

Solo mode persists across sessions. It is stored in memory, not in session state.

### Syntax

```
/solo
```

### Parameters

None.

### Examples

```
> /solo
Solo mode activated.

You are the company. Every skill, diagnostic, playbook, and template now adapts
for a solopreneur context. Team-oriented diagnostics are rerouted. Board and
investor templates reframe as personal analysis. The system defaults to you as
the audience.

What changed:
  Skills:     158 scored for solo relevance (47 critical, 56 high, 28 moderate, 27 low)
  Templates:  48 available (30 reframed, 10 as-is, 8 unchanged)
  Diagnostics: 20 available (12 as-is, 5 reframed, 3 skipped with reroutes)
  Playbooks:  20 available (8 as-is, 8 reframed, 4 skipped with alternatives)
  Hooks:      16 active (8 as-is, 8 reframed)

Mode persists across sessions. Use /solo off to deactivate.

> /solo
Solo mode is already active (since 2026-03-26). No change.
Use /solo status for details or /solo off to deactivate.
```

### What Changes When Activated

| System Layer | Change |
|-------------|--------|
| Memory (identity) | `mode: solo` written to identity.yaml |
| Skill routing | 158 skills scored per solo-skill-relevance.yaml; low-tier skills deprioritized, critical-tier skills elevated |
| Audience mapping | Investor, board, and team audiences remapped per solo-audience-map.yaml |
| Diagnostics | 3 diagnostics skipped (cofounder-conflict, culture-erosion, team-dysfunction), 5 reframed with solo triage questions |
| Playbooks | 4 playbooks skipped (board-formation, remote-team, team-rebuild, and none applicable), 8 reframed with solo step instructions |
| Hooks | 8 hooks reframed with solo routing changes; team-hook intercepts with clarifying question |
| Output | Default audience becomes `self`; all templates apply solo adaptation rules |
| Voice | Shifts to direct personal address; removes team/board/investor assumptions |

### Related Commands

- `/solo off` — Deactivate solo mode
- `/solo status` — Show current mode and adaptation summary
- `/stage` — Solo mode works with all five stages but interprets them differently

### Error Handling

| Input | Response |
|-------|----------|
| `/solo` when already active | `Solo mode is already active (since [date]). No change.` |
| `/solo enable` | `Unknown argument: "enable". Use /solo to activate, /solo off to deactivate, /solo status to inspect.` |

---

## `/solo off`

### Description

Deactivates solo mode. Removes `mode: solo` from the identity layer of memory. All routing, scoring, audience mapping, and voice modifications revert to default behavior. The system returns to its standard assumption: a startup founder with a team, board, and investors.

Deactivation is immediate. The current session switches to default mode for all subsequent interactions. Prior analysis produced in solo mode is retained in history without modification — it remains tagged as solo-context analysis.

### Syntax

```
/solo off
```

### Parameters

None.

### Examples

```
> /solo off
Solo mode deactivated. Default mode restored.

All skills, diagnostics, playbooks, and templates now operate with standard
assumptions: team, board, and investor contexts are active. Output audience
inference resumes normal behavior.

Prior solo-mode analysis remains in your history, tagged with mode: solo.

> /solo off
Solo mode is not active. No change.
```

### Related Commands

- `/solo` — Reactivate solo mode
- `/solo status` — Check current mode before deactivating

### Error Handling

| Input | Response |
|-------|----------|
| `/solo off` when not active | `Solo mode is not active. No change.` |
| `/solo off now` | `Unknown argument: "now". Use /solo off to deactivate. No additional arguments accepted.` |

---

## `/solo status`

### Description

Displays the current mode and a summary of what solo mode affects. If solo mode is active, shows activation date, adaptation statistics, and any active overrides. If solo mode is inactive, confirms default mode.

This command is read-only — it never modifies state.

### Syntax

```
/solo status
```

### Parameters

None.

### Examples

```
> /solo status
Mode: solo (active since 2026-03-26)
Stage: early-traction (solo interpretation: consistent revenue as solo operator)

Skill relevance adjustments:
  critical:  47 skills (elevated routing priority)
  high:      56 skills (normal priority)
  moderate:  28 skills (reframing required)
  low:       27 skills (deprioritized, available on request)

Audience mapping:
  investor → self-funding-analysis
  board    → mentor-advisor
  team     → systems-and-processes
  client   → client (unchanged)
  self     → self (default audience)

Diagnostic adaptations:
  as-is:    12 diagnostics
  reframed:  5 diagnostics (communication-breakdown, decision-paralysis,
             fundraising, growth-stall, hiring, innovation-drought,
             leadership-crisis, operational-chaos, revenue, strategic-drift)
  skipped:   3 diagnostics (cofounder-conflict, culture-erosion, team-dysfunction)

Playbook adaptations:
  as-is:    8 playbooks
  reframed: 8 playbooks
  skipped:  4 playbooks (board-formation, remote-team, team-rebuild)

Hook adaptations:
  as-is:    8 hooks
  reframed: 8 hooks

Use /solo off to deactivate. Use /solo to reactivate if currently off.

> /solo status
Mode: default (solo mode not active)
All skills, diagnostics, playbooks, and templates operate with standard
assumptions. Use /solo to activate solo mode.
```

### Related Commands

- `/solo` — Activate solo mode
- `/solo off` — Deactivate solo mode
- `/stage` — View or change company stage (works in both modes)
- `/version` — View system component counts

### Error Handling

| Input | Response |
|-------|----------|
| `/solo status verbose` | `Unknown argument: "verbose". /solo status takes no parameters.` |

---

## Implementation Notes

### Memory Integration

Solo mode state is stored in Layer 1 (Identity) of the memory system:

```yaml
# identity.yaml — fields added by /solo
mode: solo
mode_activated: 2026-03-26
```

The memory-agent reads this field during SESSION_START and passes it to the orchestrator. The orchestrator then loads the four solo configuration files and applies them for the duration of the session.

When `/solo off` is executed, the memory-agent removes the `mode` and `mode_activated` fields from identity.yaml. The next session start will find no mode flag and operate in default mode.

### Session Continuity

If solo mode is activated or deactivated mid-session, the change applies immediately to all subsequent interactions within that session. Analyses already produced in the session are not retroactively modified. The session layer records the mode change event:

```yaml
# session.yaml — mode change event
mode_changes:
  - from: default
    to: solo
    timestamp: 2026-03-26T14:30:00Z
```

### History Tagging

All analyses, decisions, and diagnostics produced while solo mode is active are tagged with `mode: solo` in the history layer. This ensures that when the entrepreneur reviews past analyses, the solo context is clear. If the entrepreneur later deactivates solo mode and reviews a prior solo analysis, the system notes: "This analysis was produced in solo mode. Team, board, and investor contexts were adapted for solopreneur use."

### Interaction with Stage

Solo mode and stage are independent settings. A solopreneur can be at any stage: idea, validation, early-traction, growth, or scale. Solo mode adjusts the interpretation of each stage (see SOLO.md, Behavioral Change 1) but does not restrict which stages are available.

```
> /stage growth
Updated: growth (was early-traction).
Solo mode active: "growth" interpreted as increasing revenue or margin
without proportional time increase; leveraging automation, pricing,
or productization. Standard growth interpretation (scaling team and
revenue aggressively) is not applied.
```

### Interaction with Commands

All existing commands work in solo mode. The following commands produce different output when solo mode is active:

| Command | Solo Mode Behavior |
|---------|-------------------|
| `/skills` | Adds solo relevance tier to each skill listing |
| `/templates` | Shows solo audience mapping next to original audience |
| `/diagnostics` | Notes which diagnostics are skipped or reframed |
| `/playbooks` | Notes which playbooks are skipped or reframed |
| `/hooks` | Notes which hooks have modified routing |
| `/stage` | Displays solo stage interpretation alongside standard |
| `/apply` | Adds reframing notes for moderate and low-tier skills |
| `/diagnose` | Applies solo diagnostic adaptations |
| `/run` | Applies solo playbook step modifications |
| `/output` | Applies audience remapping and template adaptations |
