# Foreman runtime contract

This document defines current runtime behavior. Use it when older examples in command, mode or memory documents describe a different storage shape.

Resolve paths relative to this content directory (the directory containing this file). In a cloned or initialized Claude project this is `.claude/`. In a plugin it is the bundled `content/` directory. In Codex the `foreman` skill links here. Read `policies/advisory.md` and `catalog.json` before routing.

For a specific request, search `catalog.json` for the requested kind and identifier and read only the matching entry and aliases. Load the entire catalog only when browsing or comparing many entries. This avoids carrying the full catalog through every advisory turn.

Use exact catalog identifiers first, then `aliases`, then a unique normalized name. Ask the user to choose if several identifiers match. Reject empty names and paths. A diagnostic or template is not a skill: use the catalog's `kind` to load the correct layer. Semantic content links are relative to each source file, while instruction paths beginning `.claude/` are relative to this content root after removing that prefix.

## Persistence

All hosts use schema version 1 at `<workspace>/.foreman/<founder-id>/state.json`. Keep this file private and outside version control. The default founder ID for the local CLI is `default`. For multiple founders, pass an explicit ID on every call; never infer another founder's records. OpenClaw scopes data by its trusted agent and sender context. To share an existing agent-only store with the CLI, pass that agent ID as `--founder`.

Run `node "<content-root>/runtime/run.mjs" <command> --workspace "<project-root>" --founder default ...`. Substitute real absolute paths and shell-quote each argument. User text is data; never interpolate it as executable shell syntax. This runtime needs Node 22.19 or later, and no package install or network connection. Check its exit status and returned JSON. Do not edit `state.json` directly.

Read profile: `profile`. Set `/solo`: `profile --mode solo`; `/solo off`: `profile --mode standard`. Set `/stoic`: `profile --stoic on`; off uses `off`. Set `/language tr`: `profile --language tr`; default uses `en`; status only reads. `/sector saas` uses `profile --sector saas`. Always read persisted settings at the start of a new session.

Honor the scope requested by the user. A mode or language requested only for this conversation is a session override: apply it without changing the saved profile. Explicitly requested persistent settings use the profile runtime. A current user instruction takes precedence over a saved preference for the current response.

Read tasks: `track --filter all` (also `active`, `overdue`, `stalled`, or any of the six statuses). Add a confirmed task: `task --id impl-001 --description "Interview five customers" --deadline 2026-10-01`. Update `/progress impl-001 40 note`: `task --id impl-001 --progress 40 --note "note"`. Status changes use `--status not-started|in-progress|blocked|completed|abandoned|deferred`. A completed task has progress 100. Use `--revision N` when editing a previously read revision; a conflict requires rereading, not overwriting.

After a confirmed playbook step, save the next step: `resume --playbook pivot-playbook --step 2`. Read `resume` to continue from that checkpoint; verify the playbook and step against the catalog before writing. The exposed Claude command is `/foreman-resume`, because `/resume` is a host command. Never mark a step complete based merely on a generated recommendation.

If the runtime or workspace is unavailable, explain that persistence is unavailable and keep the session usable. Do not fabricate saved tasks. Do not run a package installer automatically to enable persistence.

## Schema and legacy migration

Canonical preferences are `identity.mode` (`standard|solo`), `identity.stoic_mode` (boolean), `identity.language` (language code or name), and `company.sector`. Tasks are `implementation_items`; the checkpoint is `active.playbook: {id, next_step}` or null. Every record has `schema_version: 1`, `founder_id`, `revision` and `history`.

Legacy YAML memory remains readable source material. To migrate, read the user's existing identity/company/active/history files, assemble their parsed contents into one JSON object in a temporary file, and run `migrate --input "<legacy.json>"`. Migrate into an unused founder destination only. The runtime normalizes `mode_solo`, `mode_stoic`, and `preferences` and preserves the original object under `legacy`. A validation error leaves the destination unchanged. Keep original files until the user has verified the result. Never silently reset a malformed or newer state file.

## Host commands

Claude project commands are the files in `commands/`; names that conflict with built-ins use the `foreman-` prefix. Use `/foreman-run` for playbooks and `/foreman-skill` for skill previews. The latter also avoids a `skill.md` / `SKILL.md` filesystem collision that hides sibling commands. Plugin commands use `/foreman:NAME`. Consult `catalog.json` for the exact map. In Codex, invoke `$foreman` with the requested operation or use an individual framework skill. Do not advertise Claude slash commands as Codex commands.
