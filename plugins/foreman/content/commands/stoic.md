---
description: "Foreman /stoic command"
generated: true
argument-hint: "[arguments]"
---

# Foreman /stoic

Read .claude/RUNTIME.md and .claude/policies/advisory.md first. Then read .claude/command-guides/stoic-command.md and execute only /stoic with the user's arguments: $ARGUMENTS.

Use .claude/catalog.json to resolve exact content names before aliases or unique matches. Load all required supporting files from .claude. All paths in the source instructions are relative to this content directory. Persist confirmed changes through the runtime described in RUNTIME.md; never claim a write succeeded without reading its result.

Use the command map in catalog.json to recommend only registered commands.

For a mode or language change, use the profile command in RUNTIME.md directly. A directory listing or a full catalog read is unnecessary. Read the returned profile to confirm the write, then answer briefly.
