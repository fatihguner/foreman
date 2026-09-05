---
description: "Foreman /diagnose command"
generated: true
argument-hint: "[arguments]"
---

# Foreman /diagnose

Read ${CLAUDE_PLUGIN_ROOT}/content/RUNTIME.md and ${CLAUDE_PLUGIN_ROOT}/content/policies/advisory.md first. Then read ${CLAUDE_PLUGIN_ROOT}/content/commands/execution-commands.md and execute only /diagnose with the user's arguments: $ARGUMENTS.

Use ${CLAUDE_PLUGIN_ROOT}/content/catalog.json to resolve exact content names before aliases or unique matches. Load all required supporting files from ${CLAUDE_PLUGIN_ROOT}/content. All paths in the source instructions are relative to this content directory. Persist confirmed changes through the runtime described in RUNTIME.md; never claim a write succeeded without reading its result.

Other Foreman commands use /foreman:COMMAND (for example /foreman:apply); built-in name conflicts use foreman- prefixes. Use the command map in catalog.json to recommend only registered commands.

Before answering, apply the diagnostic first-response contract: label the cause unconfirmed until comparable measurements distinguish the branches. Nonzero acquisition does not establish healthy acquisition. Ask for a revenue bridge before locating a revenue loss; do not invent metric targets. Check every causal sentence against an observed fact.
