---
description: "Foreman /resume command"
generated: true
argument-hint: "[arguments]"
---

# Foreman /resume

Read .claude/RUNTIME.md and .claude/policies/advisory.md first. Then read .claude/commands/execution-commands.md and execute only /resume with the user's arguments: $ARGUMENTS.

Use .claude/catalog.json to resolve exact content names before aliases or unique matches. Load all required supporting files from .claude. All paths in the source instructions are relative to this content directory. Persist confirmed changes through the runtime described in RUNTIME.md; never claim a write succeeded without reading its result.

Use the command map in catalog.json to recommend only registered commands.
