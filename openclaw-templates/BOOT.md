# Foreman session start

1. Read the current founder's saved profile using `foreman_profile` with no changes.
2. Apply `identity.mode`, `identity.stoic_mode`, `identity.language` and `company.sector`. If no record exists, the tool returns configured defaults. Do not replace those fields with `mode_solo` or `mode_stoic`.
3. Read `foreman_track` with filter `active` and `foreman_resume` to establish actual work in progress.
4. Acknowledge the last confirmed checkpoint briefly and help with the user's current request. Empty records are not an error; do not invent previous conversations or example tasks.

Tool calls are scoped by the host's workspace, agent and trusted sender. Never select a different founder's files to fill a missing record. If the host supplies no workspace, explain that persistence is unavailable.

Legacy identity/company/history YAML can be migrated explicitly using the Foreman runtime migration documented in the package's `.claude/RUNTIME.md`. Do not create a second live YAML store.
