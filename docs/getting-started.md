# Getting Started

## What is Foreman

Foreman is an open-source, AI-powered strategic advisor for entrepreneurs. It delivers contextual, framework-driven business guidance through 158 skills, 24 diagnostics, 21 playbooks, 48 output templates, 18 research guides and 9 industry packs, all adapted to your company's stage, sector and operating context. Think of it as a chief of staff who has read the business canon and remembers what you decided last month.

---

## Installation

Foreman needs Node 22.19 or newer and an AI host: Claude Code, Codex or OpenClaw. Foreman itself is free under the MIT license; your host account and model usage are separate.

Run the installer in your project directory:

```bash
npx foreman-sh init
```

The installer adds `.claude/` and a project `CLAUDE.md`, preserves any file that already exists and prints the next steps. If your project already has a `CLAUDE.md`, it names the one line to add so Claude loads Foreman. Use `--platform codex` for Codex, `--platform all` for both, and `--workspace /path/to/project` to choose a directory. Check the installed version with `npx foreman-sh --version`.

Then open Claude Code in that directory and describe your situation:

> "My SaaS churn rate is 5.2% and I'm preparing for Series A. What should I focus on?"

Other installation routes, including the Claude Code plugin marketplace, Codex and OpenClaw, are listed in the [README](../README.md#quickstart).

---

## First Interaction

Foreman responds to both structured commands and natural language. Here is what happens when you describe a problem in plain English:

**You:** "My sales have been dropping for the last two months and I don't know why."

**What the system does:**

1. **Hook matching.** The input matches the `revenue-and-sales-hook`, which classifies the intent as a revenue problem with an unknown root cause.
2. **Diagnostic routing.** Because the cause is unclear, the orchestrator routes to the diagnostic agent, which loads `revenue-diagnosis.md`.
3. **Triage questions.** The diagnostic asks a small number of questions that separate the possible causes: when did the decline start, did volume or conversion fall, what changed in pricing, what did competitors do. New customers still arriving does not rule out an acquisition problem.
4. **Diagnosis.** Your answers narrow the hypotheses. The cause stays labelled as unconfirmed until comparable measurements distinguish the branches.
5. **Skill application.** The relevant framework is applied to your specific context, using your stage, sector and saved preferences.
6. **Output.** You receive a structured analysis with findings, one bounded action with a review point, and the evidence still missing.

Every interaction follows this pattern: understand the problem, diagnose the root cause, apply the right framework, deliver actionable output.

---

## Key Commands

Commands are generated from the specifications in `.claude/command-guides/`. Names that would shadow a Claude Code built-in carry a `foreman-` prefix. In the plugin installation the same commands use the `/foreman:` namespace, and in Codex you invoke `$foreman` with the operation you need.

| Command | Purpose |
|---------|---------|
| `/skills` | Browse all 158 skills, filter by category, stage, or complexity |
| `/foreman-skill [name]` | View a single skill's summary, stage tags, and related skills |
| `/apply [skill]` | Apply a specific framework to your current context |
| `/diagnose [area]` | Run a diagnostic to identify the root cause of a problem |
| `/foreman-run [playbook]` | Start a multi-step playbook from Step 1 |
| `/foreman-context` | View your saved profile: mode, language, sector and active items |
| `/track` | View saved implementation tasks and their status |
| `/simulate board` | Rehearse a board meeting against adversarial personas |
| `/research [topic]` | Load a structured data collection guide |
| `/foreman-help` | Display all commands grouped by category |

The complete, host-safe command map is in `.claude/catalog.json`.

---

## Setting Your Context

Foreman adapts its guidance to what it knows about you. Saved preferences live in `.foreman/<founder-id>/state.json`, written only through the bundled runtime; the store keeps itself out of version control. Set the sector with `/sector saas` (or any of the nine industry packs) so benchmarks and diagnostic rules match your business. Describe your stage, metrics and constraints in conversation; Foreman separates the facts you supply from its hypotheses and asks for the measurement that would most change the next decision.

Confirmed tasks are tracked with `/track`, `/progress` and `/check-in`. Playbook checkpoints are saved only after you confirm a step is complete, and `/foreman-resume` continues from the saved checkpoint in a later session.

---

## Choosing a Mode

Three optional modes adapt Foreman's behavior. Each operates on a different axis, and all three can be active simultaneously. Modes persist across sessions unless you ask for one only in the current conversation.

- **`/solo`** adapts the system for solopreneurs: board and team skills are deprioritized, diagnostics are reframed for a single operator, and templates default to the `self` audience. `/solo off` deactivates it.
- **`/stoic on`** adds Stoic philosophical framing: dichotomy of control, virtue-based evaluation, pre-mortem risk sections. The business analysis stays the same; the interpretive lens shifts.
- **`/language [code]`** switches output to the specified language, for example `/language es`. Processing remains in English; delivery shifts to your language.

---

## Exploring Skills

Foreman ships with 158 skills across 12 categories, derived from foundational business texts.

```
/skills                                  # Browse all 158 skills
/skills frameworks --stage growth        # Filter by category and stage
/skills leadership --complexity advanced # Filter by complexity
/foreman-skill porters-five-forces       # View a specific skill
```

Each skill includes a core framework explanation, application prompts, concrete use cases, anti-patterns (when NOT to use the framework), stage-specific guidance, and cross-references to related skills.

---

## Running a Playbook

Playbooks chain skills into multi-step sequences with checkpoints and decision points. Start one with:

```
/foreman-run fundraising-playbook
```

The system checks prerequisites, then walks you through each step sequentially. At every checkpoint you review the output before proceeding. At decision points the playbook may branch: if an investor-readiness assessment reveals gaps, it routes you to a product-market-fit sequence first.

Manage an active playbook:

| Command | Purpose |
|---------|---------|
| `/foreman-status` | View the current step and progress |
| `/foreman-resume` | Continue from the last saved checkpoint |
| `/skip` | Skip the current step (with confirmation) |
| `/back` | Re-run the previous step |
| `/pause` | Save progress and pause |

Twenty-one playbooks cover scenarios from first-100-customers to international expansion. Run `/playbooks` to browse the full list.

---

## Getting Help

- **`/foreman-help`** lists all commands grouped by category
- **`/foreman-help [category]`** gives detailed help for a specific command group
- **`/about`** shows project information and an architecture overview
- **`docs/`** contains the architecture, style and authoring guides
- **GitHub Discussions** hosts community support and feature requests at the project repository

---

## Next Steps

You have the essentials. Here is where to go deeper:

- **[Architecture](architecture.md)**: how the system layers connect and how data flows between them
- **[Stage Mapping](stage-mapping.md)**: how the five company stages affect skills, diagnostics, and playbooks
- **[Skill Authoring](skill-authoring.md)**: how to create new skills and contribute to the library
- **[Playbook Authoring](playbook-authoring.md)**: how to design multi-step playbook sequences
- **[Style Guide](style-guide.md)**: writing conventions and quality standards for all contributions
- **[Development](development.md)**: build, verification and release workflow
- **[CONTRIBUTING.md](../CONTRIBUTING.md)**: contribution guidelines, pull request process, and code of conduct
