---
name: foreman
description: "Use Foreman diagnostics, playbooks, research, board simulations, solo and language modes, or persistent implementation tracking for an entrepreneur."
---

# Foreman

Resolve every resource path relative to this SKILL.md file, not the workspace root. In an initialized Codex project, this file is `<workspace>/.agents/skills/foreman/SKILL.md` and the content root is `<workspace>/.agents/content/`. The runtime is `<workspace>/.agents/content/runtime/run.mjs`. In a plugin, content is the sibling `../../content/` directory. Use these known paths directly; do not search state folders to find content.

Read [runtime](../../content/RUNTIME.md), [advisory rules](../../content/policies/advisory.md), and the matching entry in [catalog](../../content/catalog.json). Resolve the requested command or content from that catalog, then read its source under the content root. Apply its instructions to the user context.

Founder boundary: `.foreman/` contains private records, not Foreman instructions. Use only the explicitly requested founder, or `default` when none is given. Never list, search, read or infer records belonging to another founder. A missing default record means a new profile; it is not a reason to inspect another founder. Read the requested profile with the runtime and an explicit `--founder` argument.

Never invent state or a successful write. Use the local runtime for profile and task changes. Run mutations for the same founder sequentially, using the returned revision before the next mutation. If a compound shell command is denied, try the direct Node runtime command rather than broadening permissions or inspecting other records.
