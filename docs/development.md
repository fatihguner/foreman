# Development and verification

Use Node 22.19 or newer. The CI matrix covers Node 22 and 24 on macOS and Linux. OpenClaw 2026.6.1 is the SDK baseline; it is a pinned development dependency and an optional production peer. A normal npm installation does not require OpenClaw.

```sh
npm ci --ignore-scripts
npm run build
npm run build:plugins
npm run check
npm pack --ignore-scripts
```

`npm run check` validates actual source content, runs deterministic negative and integration tests, and typechecks the adapter against the installed SDK. A missing or empty source layer fails validation. The report distinguishes core layers from additional diagnostics, playbooks and templates under organizational politics, simulation and implementation.

Canonical content is `.claude/`. `lib/content.js` provides YAML parsing, typed references and exact-first lookup. Alias targets are explicit in `.claude/catalog-aliases.json`; distinct unimplemented frameworks are not silently treated as equivalent. The reference repair ledger records removals, corrected types and routing replacements in `reference-repairs.json`.

`npm run build:plugins` produces `.claude/catalog.json`, registered command wrappers and dependency-free state runtime files, plus the self-contained `plugins/foreman/` content, skills and commands. Commit those generated files so Git marketplace installs work without a build step. Do not edit them directly. Both Claude and Codex manifests use the shared skill bundle. The extra `foreman` router skill exposes the other layers. `dist/` is generated for npm and OpenClaw and is not committed.

The old shell entry points remain available and delegate to portable Node code. Run each with `--help`. Creators require explicit arguments, validate them before writing and refuse to overwrite a file. They mark new content `draft: true`; finish it and remove that flag before validation can pass. Category renaming previews by default; `--confirm` changes directory metadata and paths without renaming framework identifiers. Rebuild bundles after source changes.

`setup.sh --install-hook` installs a hook only when no hook exists. The pre-commit check materializes staged content from the Git index; unrelated documentation does not require content frontmatter. It never substitutes unstaged repairs for the staged version.

Workspace installation preserves existing files. If an existing `CLAUDE.md` is preserved, add an instruction to read `.claude/RUNTIME.md` yourself, or invoke one of the installed Foreman commands. Re-running init fills missing files; it does not upgrade customized files. Review and replace older generated files explicitly when upgrading.

## Runtime and migration

`lib/state.js` owns profile and task persistence, six task statuses, history, filters, revision checks and atomic writes. The same dependency-free implementation is bundled for Claude and Codex; OpenClaw tools call it directly. See [the runtime contract](../.claude/RUNTIME.md) for commands and storage. A workspace without records produces an empty tracker, not an example dashboard. A malformed state fails visibly instead of resetting.

The state lock prevents concurrent writers. If a process is killed during a write, a stale `state.json.lock` can remain. Confirm no writer is running before removing that lock. Original legacy data is retained by explicit migration; a used destination cannot be overwritten by migration.

## Advisory regression

The shared policy is `.claude/policies/advisory.md`. Revenue triage keeps acquisition and retention hypotheses open until comparable revenue data exists. Profiles, prompts and tools must apply this policy, the saved language, and solo/sector context before recommending an action.

Deterministic tests verify delivery of these instructions, lookup boundaries, installation links, SDK registration, actual state transitions and cross-process recall. They do not measure model answer quality. Optional live regressions must use fictional inputs, an explicit per-run cost cap and a recorded result; they are never part of credential-free CI. See `tests/advisory-scenarios.json` for the qualitative rubric.

`node scripts/live-eval.mjs --help` describes the opt-in Claude runner. It requires an output directory and an explicit total cost cap, accepts a prior-spend amount, and starts each advisory scenario in a fresh workspace so one founder's preferences cannot affect another case. It preserves responses and usage records, refuses to overwrite previous runs, and stops on uncertain costs. Review answers against the rubric; a successful CLI result alone is not a quality pass.

Plugin packaging follows the [OpenAI plugin documentation](https://developers.openai.com/plugins/build/plugins) and [Claude plugin reference](https://code.claude.com/docs/en/plugins-reference). Runtime compatibility is additionally checked against the installed OpenClaw SDK.
