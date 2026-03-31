# Foreman — Project Context

Foreman is an open-source, AI-powered strategic advisor for entrepreneurs. It uses a layered architecture of Skills, Agents, Hooks, Memory, Diagnostics, Playbooks, Commands, and Output Templates to deliver contextual, framework-driven guidance. The project lives at foreman.sh and ships as a public GitHub repository.

## Architecture Overview

```
Entrepreneur Input
    |
    ├→ [Commands] — Structured input: /apply, /diagnose, /run, etc.
    └→ [Hooks] — Natural language input: pattern matching → intent classification
            |
       [Orchestrator Agent] — Central brain, routes everything
            |
            ├→ [Memory Agent].read() — Retrieve entrepreneur context (5-layer system)
            |
            ├→ [Diagnostic Agent] — Triage: symptom → targeted questions → root cause
            |
            ├→ [Skill Executor Agent] — Apply framework to entrepreneur's context
            |
            ├→ [Playbook Runner Agent] — Run multi-step skill chains with checkpoints
            |
            ├→ [Output Agent] — Format results for target audience
            |
            └→ [Memory Agent].write() — Persist results and decisions
```

## System Layers

### Core Content Layers

1. **Skills** (`.claude/skills/`) — 158 self-contained `.md` files across 12 categories, each teaching one business framework, method, or practice. Every skill works standalone and can be invoked by an agent. Derived from 12 source collections.
2. **Output Templates** (`.claude/output-templates/`) — 48 fill-in-the-blank professional documents across 5 audiences: `investor/` (10), `board/` (7), `team/` (13), `self/` (10), `client/` (8).
3. **Diagnostics** (`.claude/diagnostics/`) — 20 triage systems (12 broad + 8 granular) that identify root causes through structured questioning. Each routes to specific skills, playbooks, and templates.
4. **Playbooks** (`.claude/playbooks/`) — 20 multi-step recipes (12 core + 8 extended) that chain skills sequentially with checkpoints and decision points.

### Orchestration Layers

5. **Hooks** (`.claude/hooks/`) — 17 trigger definitions (8 high-priority, 8 medium/low, 1 research) that classify natural-language input and route to diagnostics, skills, or playbooks.
6. **Agents** (`.claude/agents/`) — 6 AI agent definitions: orchestrator (central brain), diagnostic (triage), skill-executor (framework application), playbook-runner (multi-step conductor), output (formatting), memory (context persistence).
7. **Memory** (`.claude/memory/`) — 5-layer persistence system: identity (yearly), company (monthly), history (append-only), active (weekly), session (ephemeral). Schema + YAML templates.
8. **Commands** (`.claude/commands/`) — ~45 commands across 13 command files: navigation (7), execution (5), memory (8), playbook (5), output (3), meta (5).

### Tooling & Modes

9. **Scripts** (`scripts/`) — 21 utility scripts: validation (7), content creation (5), analysis (3), maintenance (4), community (2).
10. **Solo Mode** (`.claude/solo-mode/`) — Complete solopreneur adaptation layer: SOLO.md (master instruction), skill relevance scoring (158 skills), audience remapping (48 templates), diagnostic/playbook/hook adaptations (56 items). Activated via `/solo`.
11. **Stoic Mode** (`.claude/stoic-mode/`) — Philosophical depth layer that frames all system responses through Stoic principles (dichotomy of control, cardinal virtues, premeditatio malorum, amor fati). Does not change WHAT is delivered — changes HOW it is framed. Activated via `/stoic on`. Can combine with Solo Mode.
12. **Language Mode** (`.claude/language-mode/`) — Complete output language switch. All responses delivered in the specified language while internal processing remains English. Supports any language the model speaks fluently. Activated via `/language [code]`. Persists across sessions. Combines with Solo and Stoic modes.
13. **Industry Packs** (`.claude/industry-packs/`) — Sector-specific overlay system. Each pack adds benchmarks, skill overlays, diagnostic rules, and template adaptations for a specific industry. 9 packs: SaaS, Marketplace, E-Commerce, Fintech, AI/ML, HealthTech, EdTech, D2C/Consumer, Agency/Consulting. Each pack contains 4 YAML files (benchmarks, skill-overlays, diagnostic-rules, templates). Activated automatically when `memory.company.sector` matches a pack.
14. **Implementation Tracking** (`.claude/implementation/`) — Accountability layer that tracks execution of playbook steps and skill recommendations. Tracks implementation items through 6 states (not-started → in-progress → blocked → completed → abandoned → deferred), categorizes blockers (resource, knowledge, dependency, motivation, external), runs weekly check-in protocol via `/check-in`, and routes stalled items to relevant diagnostics. Integrates with Stoic mode (dichotomy of control on blockers) and Solo mode (isolation-aware tracking). Includes 3 templates (dashboard, weekly report, blocker analysis) and 4 commands (`/track`, `/progress`, `/blockers`, `/check-in`). Extended by Implementation Support (`support/`) — blocker diagnosis (10 root causes), stuck protocols (14 categories, skill-specific interventions), and implementation retrospective template.
15. **Custom Research Prompts** (`.claude/research/`) — 18 structured research guides teaching entrepreneurs HOW to gather data needed for frameworks: market-sizing-worksheet, competitor-research-template, customer-interview-guide, data-collection-plan, pricing-research-guide, due-diligence-research, user-testing-protocol, industry-mapping-guide. Each guide: what to collect, where to find it, how to interpret it, which skills it feeds into. Accessible via `/research` command.
16. **Board Simulation** (`.claude/simulation/`) — Adversarial role-play system for practicing board presentations, investor pitches, and due diligence sessions. 5 board personas, 5-dimension scoring framework, post-simulation diagnostic, memory persistence. Activated via `/simulate` command.
17. **Organizational Politics Navigation** (`.claude/org-politics/`) — Stakeholder dynamics management system. Maps power structures, diagnoses resistance, builds coalitions, designs influence strategies. Includes 2 diagnostics (stakeholder-resistance, power-dynamics), 1 playbook (organizational-alignment), 3 templates (influence-map, resistance-plan, coalition-plan), and 4 commands (`/stakeholders`, `/power-map`, `/resistance`, `/coalition`). Integrates with simulation for adversarial practice.
18. **Claude Code Plugin Marketplace** (`.claude-plugin/marketplace.json` + `plugins/foreman/`) — Plugin marketplace for Claude Code. Users install via `/plugin marketplace add fatihguner/foreman` → `/plugin install foreman@foreman-marketplace`. 158 skills exposed as symlinks to `.claude/skills/`.
19. **Codex Plugin** (`.codex-plugin/`) — OpenAI Codex plugin manifest and build system. `plugin.json` manifest defines the plugin identity and component paths. `scripts/build-codex.sh` transforms `.claude/skills/` into Codex-compatible `skills/skill-name/SKILL.md` format. Generated `skills/` directory is gitignored. Marketplace config at `.agents/plugins/marketplace.json`.
19. **OpenClaw Plugin** — Native OpenClaw plugin (`openclaw.plugin.json` + `package.json` + `index.ts`). Registers 7 agent tools (apply_skill, diagnose, run_playbook, list_skills, research, simulate, track) that read from `.claude/` at runtime. Claude bundle fallback at `.claude-plugin/plugin.json`.
20. **OpenClaw Templates** (`openclaw-templates/`) — 6 workspace templates (SOUL, IDENTITY, AGENTS, BOOT, BOOTSTRAP, HEARTBEAT) that define Foreman's personality and behavior when running as an OpenClaw agent. Users copy to workspace root. CLI scripts: `openclaw-setup.sh` (installation), `openclaw-build.sh` (validation).
21. **Schemas** — Template files across `_schema/` directories defining the structure for skills, diagnostics, playbooks, hooks, output templates, agents, commands, memory, industry packs, and research guides.

### Cross-Cutting Concerns

- **Stage Mapping**: Every skill carries stage tags (`idea`, `validation`, `early-traction`, `growth`, `scale`). Agents filter and adapt based on the entrepreneur's stage from Memory.
- **Anti-Patterns**: Each skill includes when NOT to use the framework and common mistakes.
- **Solo Mode**: `/solo` command activates solopreneur adaptations across all layers — skill relevance filtering, audience remapping, diagnostic/playbook reframing.
- **Stoic Mode**: `/stoic on` command activates Stoic philosophical lens across all outputs — dichotomy of control framing, virtue-based anti-patterns, premeditatio malorum risk sections. Combines with Solo Mode.
- **Language Mode**: `/language [code]` switches all output to the specified language. System thinks in English, speaks in target language. Combines with all other modes.

## Skill Specification

### Versioning

Every skill file carries a semantic version (`version: 1.0.0`) in its frontmatter. Versions follow semver: breaking structural changes = major, content additions = minor, fixes/polish = patch.

### Schema

Each skill is a Markdown file with YAML frontmatter. The frontmatter provides machine-readable metadata so agents can select, filter, and invoke skills programmatically.

**Required frontmatter fields:**
- `name` — Unique identifier, kebab-case, max 64 chars, lowercase + numbers + hyphens only
- `description` — What the skill does and when to use it. Third person, max 1024 chars. Must include trigger terms for discovery.
- `version` — Semantic version
- `category` — Category slug matching the directory name
- `stage` — Array of applicable stages: `idea`, `validation`, `early-traction`, `growth`, `scale`
- `tags` — Searchable keyword array
- `related_skills` — Array of related skill names
- `complexity` — `basic`, `intermediate`, `advanced`
- `author` — Contributor attribution

**Required body sections (order may vary per skill):**
1. Opening — A strong, hook-driven introduction (no generic preambles)
2. Core Framework — The framework explained with depth and precision
3. Application Prompts — Multiple AI prompts the entrepreneur can use
4. Use Cases — Concrete entrepreneurial scenarios
5. Anti-Patterns — When NOT to use this framework + common mistakes
6. Stage-Specific Guidance — How application differs by company stage
7. Output Template — A ready-to-use format for presenting results
8. Related Skills — Cross-references to complementary frameworks

### Differentiation Strategy

When generating multiple skills, apply deliberate variation across these dimensions to prevent homogeneity:

| Dimension | Variation Techniques |
|-----------|---------------------|
| **Opening** | Rotate: paradox, case study, provocative question, counter-intuitive claim, historical anecdote, data point, metaphor |
| **Narrative voice** | Match the framework's nature: pragmatic tools get direct language; visionary frameworks get expansive language; analytical frameworks get precise, data-driven language |
| **Internal structure** | Vary: tables vs. scenarios vs. Q&A vs. step-by-step vs. decision trees vs. before/after comparisons |
| **Rhythm** | Alternate sentence length patterns; avoid repeating the same paragraph cadence across skills |
| **Opening words** | Never start two skills with the same first word or sentence structure |

## Other Layer Specifications

### Diagnostics
20 triage files in `diagnostics/`. Each has: entry symptoms (natural language), 5-7 triage questions (decision tree), diagnosis map, routing (skills + playbooks + templates), red flags. Schema: `.claude/diagnostics/_schema/diagnostic-template.md`.

### Playbooks
20 multi-step recipes in `playbooks/`. Each has: trigger diagnostics, 4-7 steps (each with skill, purpose, output, checkpoint), decision points, final deliverables, common pitfalls, adaptation notes. Schema: `.claude/playbooks/_schema/playbook-template.md`.

### Hooks
16 trigger definitions in `hooks/`. Each has: 10-15 trigger patterns (natural language), intent classification, routing logic (decision tree), disambiguation rules, example conversations. Schema: `.claude/hooks/_schema/hook-template.md`.

### Output Templates
48 fill-in-the-blank templates in `output-templates/`. Organized by audience: investor (10), board (7), team (13), self (10), client (8). Each has: name, description, audience, applicable_skills, format, fill-in placeholders. Schema: `.claude/output-templates/_schema/output-template.md`.

### Agents
6 agent definitions in `agents/`. Roles: orchestrator, diagnostic, skill-executor, playbook-runner, output, memory. Each has: role, responsibilities, activation conditions, workflow (pseudocode), interactions, decision rules, error handling, example flows. Schema: `.claude/agents/_schema/agent-template.md`.

### Memory
5-layer system in `memory/`. Layers: identity (yearly), company (monthly), history (append-only), active (weekly), session (ephemeral). Schema: `.claude/memory/_schema/memory-schema.md`. Templates: `.claude/memory/_template/*.yaml`.

### Commands
33 commands in 6 groups in `commands/`. Groups: navigation (7), execution (5), memory (8), playbook (5), output (3), meta (5). Schema: `.claude/commands/_schema/command-template.md`.

### Scripts
21 bash scripts in `scripts/`. Categories: validation (7), content creation (5), analysis (3), maintenance (4), community (2). All executable, with --help flags.

### Solo Mode
5 files in `solo/`. Activates via `/solo` command. Adapts all layers for solopreneurs: skill relevance scoring, audience remapping, diagnostic/playbook/hook adaptations. Config-driven — no content duplication.

## Writing Style Guide

These rules apply to ALL files in the repository.

### Tone
Analytical, intelligent, sophisticated, with a thread of dry irony. Objective stance with sharp perspective and subtle wit. Never ponderous. Never didactic.

### Structure
Open every piece with a sentence that commands attention. No throat-clearing, no preamble. Short, precise paragraphs. Clarity of thought above all.

### Syntax
Clean, exact, elegant sentences. Build rhythm by alternating short declarative sentences with more complex constructions. Observe grammatical precision.

### Lexicon
Rich, precise vocabulary. No cliches. No jargon for jargon's sake. Every word earns its place.

### Voice
Institutional and authoritative. Write as though representing a respected analytical body. The tone sits between The Economist, Harvard Business Review, and McKinsey Quarterly.

### Absolute Prohibitions
- "In today's fast-paced..." or any variant
- "Let's dive in" / "Let's explore"
- "In this skill, you will learn..."
- "Without further ado"
- "It's important to note that"
- "At the end of the day"
- Emoji in any file content
- Rhetorical questions as paragraph openers (one per file maximum)
- Starting consecutive paragraphs with the same word
- Referencing source material authors by name (all content is anonymized)

## Project Identity

- **Name:** Foreman
- **Domain:** foreman.sh
- **Language:** English (all content and code)
- **License:** TBD
- **Target audience:** Entrepreneurs at all stages (idea through scale) + solopreneurs (via /solo mode)

## Repository Structure

```
foreman/
├── .claude/                            # Claude Code operational directory
│   ├── skills/                         # 158 skills across 14 categories
│   │   ├── _schema/skill-template.md
│   │   ├── frameworks/ (50)
│   │   ├── leadership/ (28)
│   │   ├── writing/ (13)
│   │   ├── ai-leadership/ (9)
│   │   ├── game-theory/ (7)
│   │   ├── stoic/ (12)
│   │   ├── storytelling/ (8)
│   │   ├── negotiation/ (4)
│   │   ├── people/ (8)
│   │   ├── creative/ (8)
│   │   ├── thinking/ (6)
│   │   └── decisions/ (5)
│   ├── output-templates/               # 48 templates across 5 audiences
│   │   ├── _schema/output-template.md
│   │   ├── investor/ (10)
│   │   ├── board/ (7)
│   │   ├── team/ (13)
│   │   ├── self/ (10)
│   │   └── client/ (8)
│   ├── diagnostics/                    # 20 triage systems
│   │   └── _schema/diagnostic-template.md
│   ├── playbooks/                      # 20 multi-step recipes
│   │   └── _schema/playbook-template.md
│   ├── hooks/                          # 16 trigger definitions
│   │   └── _schema/hook-template.md
│   ├── agents/                         # 6 agent definitions
│   │   └── _schema/agent-template.md
│   ├── memory/                         # 5-layer persistence system
│   │   ├── _schema/memory-schema.md
│   │   └── _template/*.yaml (5 layers)
│   ├── commands/                       # 33 commands in 6 groups
│   │   ├── _schema/command-template.md
│   │   ├── navigation-commands.md
│   │   ├── execution-commands.md
│   │   ├── memory-commands.md
│   │   ├── playbook-commands.md
│   │   ├── output-commands.md
│   │   ├── meta-commands.md
│   │   ├── solo-command.md
│   │   ├── stoic-command.md
│   │   ├── language-command.md
│   │   ├── implementation-commands.md
│   │   ├── research-commands.md
│   │   ├── simulation-commands.md
│   │   └── org-politics-commands.md
│   ├── solo-mode/                      # Solopreneur adaptation layer
│   │   ├── SOLO.md
│   │   ├── solo-skill-relevance.yaml
│   │   ├── solo-audience-map.yaml
│   │   └── solo-adaptations.yaml
│   ├── stoic-mode/                      # Stoic philosophical lens
│   │   ├── STOIC-MODE.md
│   │   └── stoic-response-rules.yaml
│   ├── language-mode/                   # Output language switch
│   │   └── LANGUAGE-MODE.md
│   ├── industry-packs/                  # 9 sector-specific overlay packs
│   │   ├── _schema/industry-pack-template.yaml
│   │   ├── saas/ (4 YAML files)
│   │   ├── marketplace/ (4 YAML files)
│   │   ├── e-commerce/ (4 YAML files)
│   │   ├── fintech/ (4 YAML files)
│   │   ├── ai-ml/ (4 YAML files)
│   │   ├── healthtech/ (4 YAML files)
│   │   ├── edtech/ (4 YAML files)
│   │   ├── d2c-consumer/ (4 YAML files)
│   │   └── agency-consulting/ (4 YAML files)
│   ├── research/                       # 18 structured research guides
│   │   ├── _schema/research-template.yaml
│   │   ├── market-sizing-worksheet.md
│   │   ├── competitor-research-template.md
│   │   ├── customer-interview-guide.md
│   │   ├── data-collection-plan.md
│   │   ├── pricing-research-guide.md
│   │   ├── due-diligence-research.md
│   │   ├── user-testing-protocol.md
│   │   ├── industry-mapping-guide.md
│   ├── implementation/                 # Implementation tracking system
│   │   ├── IMPLEMENTATION.md
│   │   ├── implementation-schema.yaml
│   │   ├── templates/ (3 templates)
│   │   └── support/
│   │       ├── blocker-diagnosis.md
│   │       ├── stuck-protocols.yaml
│   │       └── implementation-retrospective.md
│   ├── simulation/                    # Board simulation system
│   │   ├── SIMULATION.md
│   │   ├── board-personas/ (10 personas + schema)
│   │   ├── simulation-scoring.yaml
│   │   └── post-simulation-diagnostic.md
│   ├── org-politics/                  # Organizational politics navigation
│   │   ├── ORG-POLITICS.md
│   │   ├── stakeholder-resistance-diagnosis.md
│   │   ├── power-dynamics-diagnosis.md
│   │   ├── organizational-alignment-playbook.md
│   │   └── templates/ (6 templates + schema)
│   └── settings.local.json
├── scripts/                            # 21 utility scripts (dev tooling)
│   ├── validate-*.sh (7)
│   ├── new-*.sh (5)
│   ├── stats.sh, orphan-check.sh, coverage-report.sh
│   ├── update-claude-md.sh, bump-version.sh, rename-category.sh, anonymize-author.sh
│   └── setup.sh, pre-commit-hook.sh
├── docs/                               # Project documentation
│   ├── architecture.md
│   ├── getting-started.md
│   ├── skill-authoring.md
│   ├── playbook-authoring.md
│   ├── style-guide.md
│   ├── stage-mapping.md
│   └── assets/
├── .github/                            # GitHub infrastructure
│   ├── ISSUE_TEMPLATE/
│   ├── workflows/
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── CODEOWNERS
│   ├── FUNDING.yml
│   └── labels.yml
├── examples/                           # Example usage walkthroughs
├── CLAUDE.md                           # Project brain (Claude Code entry point)
├── README.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── CHANGELOG.md
├── VISION.md
├── LICENSE
├── SECURITY.md
├── .editorconfig
└── .gitignore
```


## Working Conventions

### Adding a New Source
1. Read the source material and identify discrete, actionable frameworks/methods
2. Create a new category directory under `skills/` with a kebab-case slug
3. Register the source in the project documentation
4. Generate skills following the schema and differentiation strategy
5. Anonymize all author references before committing
6. Run `scripts/validate-skills.sh` to verify quality
7. Update CHANGELOG.md

### Adding a New Skill
1. Run `scripts/new-skill.sh` or copy `.claude/skills/_schema/skill-template.md`
2. Place in the correct category directory
3. Fill all required frontmatter fields
4. Write all required body sections
5. Ensure the opening and narrative approach differ from adjacent skills
6. Add anti-patterns and stage-specific guidance
7. Cross-reference related skills (4-7, mix of same-category and cross-category)
8. Run `scripts/validate-skills.sh` and `scripts/broken-refs.sh`

### Adding a New Diagnostic
1. Run `scripts/new-diagnostic.sh` or copy `.claude/diagnostics/_schema/diagnostic-template.md`
2. Define entry symptoms, triage questions, diagnosis map, routing, red flags
3. Ensure routes_to_skills and routes_to_templates reference existing files
4. Update relevant hooks to include the new diagnostic in their routing

### Adding a New Playbook
1. Run `scripts/new-playbook.sh` or copy `.claude/playbooks/_schema/playbook-template.md`
2. Define trigger diagnostics, steps with checkpoints, decision points, final deliverables
3. Ensure all skill and template references exist
4. Update relevant hooks and diagnostics to route to the new playbook

### Adding a New Output Template
1. Run `scripts/new-template.sh` or copy `.claude/output-templates/_schema/output-template.md`
2. Place in the correct audience directory
3. Define applicable_skills referencing existing skills

### Quality Checklist
- [ ] Frontmatter complete with all required fields
- [ ] Strong, unique opening (not duplicated across files)
- [ ] No prohibited phrases used
- [ ] No source author names referenced
- [ ] All cross-references point to existing files
- [ ] Writing style matches the style guide
- [ ] `scripts/validate-all.sh` passes
- [ ] `scripts/broken-refs.sh` reports zero broken references

## Project Statistics

- **Skills:** 158 (12 categories)
- **Output Templates:** 48 (5 audiences: investor 10, board 7, team 13, self 10, client 8)
- **Diagnostics:** 24 (20 core + 2 org-politics + 1 simulation + 1 implementation)
- **Playbooks:** 21 (20 core + 1 org-politics alignment)
- **Hooks:** 17 (8 high + 8 medium/low + 1 research)
- **Agents:** 6
- **Memory Layers:** 5 (identity, company, history, active, session)
- **Commands:** 13 command files (~45 individual commands)
- **Scripts:** 21
- **Solo Mode:** 4 config files
- **Stoic Mode:** 2 config files
- **Language Mode:** 1 config file
- **Industry Packs:** 9 sectors, 36 YAML files
- **Research Guides:** 18 + 1 schema
- **Implementation Tracking:** 6 tracking + 3 support files
- **Board Simulation:** 10 personas + scoring + diagnostic + master doc
- **Org Politics:** 7 files + 6 templates + 1 schema
- **Schemas:** 12
- **Examples:** 8 end-to-end walkthroughs
- **Total Files:** 443+
