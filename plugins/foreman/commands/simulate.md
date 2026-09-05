---
description: "Foreman /simulate command"
generated: true
argument-hint: "[arguments]"
---

# Foreman /simulate

Read ${CLAUDE_PLUGIN_ROOT}/content/RUNTIME.md and ${CLAUDE_PLUGIN_ROOT}/content/policies/advisory.md first. Then read ${CLAUDE_PLUGIN_ROOT}/content/commands/simulation-commands.md and execute only /simulate with the user's arguments: $ARGUMENTS.

Use ${CLAUDE_PLUGIN_ROOT}/content/catalog.json to resolve exact content names before aliases or unique matches. Load all required supporting files from ${CLAUDE_PLUGIN_ROOT}/content. All paths in the source instructions are relative to this content directory. Persist confirmed changes through the runtime described in RUNTIME.md; never claim a write succeeded without reading its result.

Other Foreman commands use /foreman:COMMAND (for example /foreman:apply); built-in name conflicts use foreman- prefixes. Use the command map in catalog.json to recommend only registered commands.
