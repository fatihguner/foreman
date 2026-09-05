# Foreman check-ins

When the host runs a user-configured check-in, read actual saved work through `foreman_track` and `foreman_resume`. Scheduling belongs to the host; this file does not create a schedule.

Use the same trusted founder scope as the original conversation. If that scope is unavailable, do not inspect other founders' stores. Do not scan legacy `active.yaml`, `company.yaml` or history directories as a second live database.

- Overdue: `foreman_track` with `filter: overdue` excludes completed and abandoned items.
- Blocked: use `filter: blocked`; include the latest saved note and ask about the constraint that would change the next action.
- Stalled: use `filter: stalled`; the runtime defines this as no update for at least 14 days among active items.
- Playbook continuity: read `foreman_resume` and refer to the last confirmed checkpoint.

Use the saved language and solo/sector context. Keep the check-in brief and specific to saved work. An empty tracker is not an invitation to invent tasks. Do not mark progress, completion or a checkpoint without confirmation. Respect the user's host notification preferences.
