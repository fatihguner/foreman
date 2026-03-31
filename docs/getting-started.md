# Getting Started

## What is Foreman

Foreman is an open-source, AI-powered strategic advisor for entrepreneurs. It delivers contextual, framework-driven business guidance through 158 skills, 20 diagnostics, 20 playbooks, and 48 output templates -- all adapted to your company's stage, sector, and operating context. Think of it as a chief of staff who has read the business canon and remembers everything about your company.

---

## Installation

Clone the repository and run the setup script:

```bash
git clone https://github.com/nicguner/foreman.git
cd foreman
scripts/setup.sh
```

The setup script validates the directory structure, checks file integrity, and confirms that all cross-references between skills, diagnostics, playbooks, and templates resolve correctly. No external dependencies are required beyond a working Claude Code installation.

---

## First Interaction

Foreman responds to both structured commands and natural language. Here is what happens when you describe a problem in plain English:

**You:** "My sales have been dropping for the last two months and I don't know why."

**What the system does:**

1. **Hook matching.** The input matches the `revenue-and-sales-hook`, which classifies the intent as a revenue problem with unknown root cause.
2. **Diagnostic routing.** Because the cause is unclear, the orchestrator routes to the diagnostic agent, which loads `revenue-diagnosis.md`.
3. **Triage questions.** The diagnostic agent asks 5-7 targeted questions: When did the decline start? Has traffic dropped or has conversion fallen? Have you changed pricing recently? Are competitors doing something new?
4. **Diagnosis.** Based on your answers, the system identifies the most likely root cause -- perhaps a pricing misalignment or a channel that stopped performing.
5. **Skill application.** The system applies the relevant framework (e.g., pricing strategy or customer acquisition analysis) to your specific context, drawing on your company stage, sector, and metrics from memory.
6. **Output.** You receive a structured analysis with findings, recommendations, and next steps.

Every interaction follows this pattern: understand the problem, diagnose the root cause, apply the right framework, deliver actionable output.

---

## Key Commands

These ten commands cover the most common operations:

| Command | Purpose |
|---------|---------|
| `/skills` | Browse all 158 skills, filter by category, stage, or complexity |
| `/skill [name]` | View a single skill's summary, stage tags, and related skills |
| `/apply [skill]` | Apply a specific framework to your current context |
| `/diagnose [area]` | Run a diagnostic to identify the root cause of a problem |
| `/run [playbook]` | Start a multi-step playbook from Step 1 |
| `/context` | View your stored profile: identity, company, and active items |
| `/update company` | Update your company profile -- stage, metrics, sector, challenges |
| `/history` | Review past diagnostics, skill applications, and decisions |
| `/search [query]` | Full-text search across all system layers |
| `/help` | Display all commands grouped by category |

Commands are organized into six groups: navigation, execution, memory, playbook, output, and meta. Run `/help [group]` for detailed documentation on any group.

---

## Setting Your Context

Foreman adapts its guidance based on what it knows about you and your company. Run `/update company` to set your core profile: stage (`idea` through `scale`), sector, key metrics (MRR, growth rate, churn, NPS, team size, runway), and top challenges. Run `/update identity` to set your role, background, and communication preference.

Context persists across sessions. The system prompts for a refresh when company data appears stale (90 days without an update).

---

## Choosing a Mode

Three optional modes adapt Foreman's behavior. Each operates on a different axis, and all three can be active simultaneously.

- **`/solo`** -- Adapts the system for solopreneurs. Deprioritizes board and team skills, reframes diagnostics for solo operators, redirects templates to "self" audience. Use if you are building alone.
- **`/stoic on`** -- Adds Stoic philosophical framing (dichotomy of control, virtue-based evaluation, pre-mortem risk). Business analysis stays the same; only the interpretive lens shifts.
- **`/language [code]`** -- Switches output to the specified language (e.g., `/language es` for Spanish). Processing remains in English; delivery shifts to your language.

---

## Exploring Skills

Foreman ships with 158 skills across 12 categories, derived from foundational business texts.

```
/skills                                  # Browse all 158 skills
/skills frameworks --stage growth        # Filter by category and stage
/skills leadership --complexity advanced # Filter by complexity
/skill porters-five-forces              # View a specific skill
```

Each skill includes a core framework explanation, application prompts, concrete use cases, anti-patterns (when NOT to use the framework), stage-specific guidance, and cross-references to related skills.

---

## Running a Playbook

Playbooks chain skills into multi-step sequences with checkpoints and decision points. Start one with:

```
/run fundraising-playbook
```

The system checks prerequisites, then walks you through each step sequentially. At every checkpoint you review output before proceeding. At decision points the playbook may branch -- if an investor-readiness assessment reveals gaps, it routes you to a product-market-fit sequence first.

Manage an active playbook:

| Command | Purpose |
|---------|---------|
| `/status` | View current step and progress |
| `/resume` | Continue from the last checkpoint |
| `/skip` | Skip the current step (with confirmation) |
| `/back` | Re-run the previous step |
| `/pause` | Save progress and pause |

Twenty playbooks cover scenarios from first-100-customers to international expansion. Run `/playbooks` to browse the full list.

---

## Getting Help

- **`/help`** -- Lists all commands grouped by category
- **`/help [category]`** -- Detailed help for a specific command group
- **`/about`** -- Project information and architecture overview
- **`docs/`** -- This documentation directory contains architecture, style, and authoring guides
- **GitHub Discussions** -- Community support and feature requests at the project repository

---

## Next Steps

You have the essentials. Here is where to go deeper:

- **[Architecture](architecture.md)** -- How the 18 system layers connect and how data flows between them
- **[Stage Mapping](stage-mapping.md)** -- How the five company stages affect skills, diagnostics, and playbooks
- **[Skill Authoring](skill-authoring.md)** -- How to create new skills and contribute to the library
- **[Playbook Authoring](playbook-authoring.md)** -- How to design multi-step playbook sequences
- **[Style Guide](style-guide.md)** -- Writing conventions and quality standards for all contributions
- **[CONTRIBUTING.md](../CONTRIBUTING.md)** -- Contribution guidelines, pull request process, and code of conduct
