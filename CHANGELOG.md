# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/).

## [Unreleased]

### Fixed
- Command guides moved from `.claude/commands/` to `.claude/command-guides/`. Claude Code exposes every file in the command directory as a slash command, so a 1.1.0 installation showed thirteen guide files such as `/execution-commands` beside the real commands. The build now refuses non-generated files there, and the installer names leftover guides in an upgraded workspace.
- Local `npm pack` shipped the maintainer's `.claude/settings.local.json` and copied it, together with `.DS_Store` files and plugin-only wrappers, into the plugin bundle and initialized workspaces. Bundles, installs and the npm `files` allowlist now exclude host-private files, and the package smoke test checks both locations.
- The bundled runtime accepted a checkpoint for a playbook that does not exist. `resume` now resolves the playbook through the catalog, which records each playbook's step count, and rejects unreachable steps.

### Added
- `foreman-sh --version`, `-h` and a usage screen; `init` prints next steps, notes a preserved `CLAUDE.md` with the line to add, and reports legacy guide files.
- A founder-facing `templates/CLAUDE.md` installed into projects instead of the repository's development instructions.
- `.foreman/.gitignore` written on first state write so founder records never enter version control.
- The CLI imports `lib/` directly, so `node bin/cli.js init` works from a fresh clone without a build.

### Changed
- OpenClaw development dependency updated to 2026.9.1; `npm audit` reports no vulnerabilities in any dependency.
- Getting-started, security policy, architecture and contribution documentation aligned with the shipped commands, script counts and installation flow.

## [1.1.0] - 2026-09-05

Stable release of the cross-platform installer, persistent state runtime and complete plugin bundles introduced in 1.1.0-rc.1.

### Changed
- Use npm's stable `latest` channel for the cross-platform installer, persistent state runtime and complete plugin bundles.
- Keep session-only mode and language overrides separate from saved profile preferences.
- Stop live advisory evaluation on incomplete model responses, and add isolated host-session checks for profile, task and playbook persistence.
- Keep existing commitments and urgent fixes running during research; scope caution to a specific proposed change.
- Remove fixed interview quotas, unsupported statistical confidence claims and invented evidence weights or time-saving guarantees from the customer interview guide.
- Present Stoic emotional framing as an optional perspective, not a diagnosis of the founder.
- Ground Codex resource paths in the installed skill directory, restrict record discovery to the selected founder, and verify that live tool calls do not read another founder's test record.

## [1.1.0-rc.1] - 2026-09-05

Public release candidate for the cross-platform runtime and packaging update.

### Added
- A working npm CLI, compiled OpenClaw adapter with 10 tools, 159 packaged skills (including the router), and 46 registered Claude commands.
- Shared persistent profiles, implementation tasks, playbook checkpoints, revision checks, atomic writes and explicit legacy migration.
- Strict YAML and reference validation, 23 automated tests, and Node 22/24 CI on macOS and Linux.
- Portable maintenance commands, staged-content validation and repeatable package installation checks.
- Shared advisory rules and an opt-in live evaluation runner using isolated fictional scenarios and an explicit usage cap.

### Fixed
- Broken and incorrectly typed content references, missing support templates, ambiguous lookups and path traversal inputs.
- Plugin symlinks that broke packaged installs, missing runtime resources, and the macOS `skill.md`/`SKILL.md` command discovery collision.
- Workspace initialization overwriting existing instructions and tracker output that did not reflect persisted records.

### Compatibility and release status
- Requires Node 22.19 or newer; OpenClaw 2026.6.1 is the tested SDK baseline.
- Initialization preserves existing files; review and replace old generated files explicitly when upgrading.
- Live advisory quality acceptance is pending. Preliminary answers exposed unsupported causal claims, invented targets and language drift; stronger instructions are included but the complete final regression has not yet passed. Codex project installation is verified; a live Codex model session is still unverified.
- This candidate uses the `next` npm channel when published and does not replace the stable `latest` version.

## [1.0.0] - 2026-03-29

Initial public release of Foreman -- an AI-powered strategic advisor for entrepreneurs.

### Added

#### Core Content
- 158 skills across 12 categories derived from 12 source books:
  - `frameworks` (50), `leadership` (28), `writing` (13), `ai-leadership` (9)
  - `game-theory` (7), `stoic` (12), `storytelling` (8), `negotiation` (4)
  - `people` (8), `creative` (8), `thinking` (6), `decisions` (5)
- 48 output templates across 5 audiences:
  - `investor` (10), `board` (7), `team` (13), `self` (10), `client` (8)
- 24 diagnostics: 20 core triage systems + 2 organizational politics + 1 board simulation + 1 implementation
- 21 playbooks: 20 core multi-step recipes + 1 organizational alignment playbook
- 17 hooks for natural-language intent classification and routing
- 18 research guides with structured data collection protocols covering market sizing, competitor research, customer interviews, pricing, due diligence, user testing, and industry mapping

#### Orchestration
- 6 agents: orchestrator, diagnostic, skill-executor, playbook-runner, output, memory
- 5-layer memory system:
  - `identity` (yearly), `company` (monthly), `history` (append-only)
  - `active` (weekly), `session` (ephemeral)
- 13 command files defining approximately 45 structured commands across 6 groups:
  - navigation (7), execution (5), memory (8), playbook (5), output (3), meta (5)
  - Plus specialized commands for solo, stoic, language, implementation, research, simulation, and org-politics

#### Modes
- Solo Mode: complete solopreneur adaptation layer with skill relevance scoring, audience remapping, and diagnostic/playbook/hook adaptations
- Stoic Mode: philosophical depth layer framing responses through Stoic principles (dichotomy of control, cardinal virtues, premeditatio malorum, amor fati)
- Language Mode: full output language switch supporting any language the model speaks fluently, with persistent cross-session configuration

#### Industry Packs
- 9 sector-specific overlay packs, each containing 4 YAML files (benchmarks, skill overlays, diagnostic rules, template adaptations):
  - SaaS, Marketplace, E-Commerce, Fintech, AI/ML
  - HealthTech, EdTech, D2C/Consumer, Agency/Consulting

#### Systems
- Implementation tracking: 6-state lifecycle (not-started, in-progress, blocked, completed, abandoned, deferred), blocker categorization across 5 types, weekly check-in protocol, and support system with 14-category stuck protocols
- Board simulation: 10 adversarial personas, 5-dimension scoring framework, post-simulation diagnostic, and memory persistence
- Organizational politics navigation: stakeholder resistance diagnosis, power dynamics mapping, coalition building, and influence strategy design with 6 templates

#### Tooling and Infrastructure
- 21 utility scripts:
  - 7 validation (skills, templates, diagnostics, playbooks, hooks, all, broken-refs)
  - 5 content creation (new-skill, new-template, new-diagnostic, new-playbook, new-hook)
  - 3 analysis (stats, orphan-check, coverage-report)
  - 4 maintenance (update-claude-md, bump-version, rename-category, anonymize-author)
  - 2 community (setup, pre-commit-hook)
- 8 end-to-end example walkthroughs demonstrating complete advisory workflows
- 12 schema files defining structure for all content types
- Complete GitHub configuration: CI workflows, issue templates (bug report, skill request, feature request), pull request template, CODEOWNERS, labels, and funding configuration
- Project documentation: architecture overview, getting-started guide, skill authoring guide, playbook authoring guide, style guide, and stage mapping reference
