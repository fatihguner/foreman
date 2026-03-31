# Contributing to Foreman

Foreman is an open-source strategic advisor for entrepreneurs, built on a structured architecture of skills, diagnostics, playbooks, agents, and output templates. Contributions from the community strengthen the system's breadth, precision, and practical value.

Whether you are an entrepreneur who spotted a gap, a consultant who knows a framework we missed, or a developer who found a broken reference — your contribution matters.

## What We Welcome

- New skills (business frameworks, methods, practices)
- New output templates for professional documents
- New diagnostics, playbooks, and research guides
- Industry pack expansions and benchmark updates
- Bug fixes (broken references, validation failures, formatting errors)
- Documentation improvements
- Script enhancements

## Getting Started

### 1. Fork and Clone

```bash
git clone https://github.com/<your-username>/foreman.git
cd foreman
```

### 2. Run Setup

```bash
scripts/setup.sh
```

This installs the pre-commit hook and verifies your environment.

### 3. Understand the Structure

```
.claude/
  skills/              # 158 skills across 12 categories
  output-templates/    # 48 templates across 5 audiences
  diagnostics/         # 24 triage systems
  playbooks/           # 21 multi-step recipes
  hooks/               # 17 trigger definitions
  agents/              # 6 agent definitions
  memory/              # 5-layer persistence system
  commands/            # 13 command files (~45 commands)
  industry-packs/      # 9 sector-specific overlays
  research/            # 18 structured research guides
  implementation/      # Execution tracking system
  simulation/          # Board simulation system
  org-politics/        # Stakeholder dynamics navigation
scripts/               # 21 utility scripts
docs/                  # Project documentation
examples/              # 8 end-to-end walkthroughs
```

Read `CLAUDE.md` for the complete architecture overview.

## Contribution Types

### Adding a New Skill

1. Run `scripts/new-skill.sh` (or copy `.claude/skills/_schema/skill-template.md`)
2. Place the file in the correct category directory under `.claude/skills/`
3. Fill all required frontmatter: `name`, `description`, `version`, `category`, `stage`, `tags`, `related_skills`, `complexity`, `author`
4. Write all required body sections: opening, core framework, application prompts, use cases, anti-patterns, stage-specific guidance, output template, related skills
5. Ensure the opening differs from adjacent skills in the same category
6. Add 4-7 cross-references in `related_skills` (mix same-category and cross-category)
7. Run `scripts/validate-skills.sh` and `scripts/broken-refs.sh`

### Adding a New Output Template

1. Run `scripts/new-template.sh` (or copy `.claude/output-templates/_schema/output-template.md`)
2. Choose the correct audience directory: `investor/`, `board/`, `team/`, `self/`, or `client/`
3. Define `applicable_skills` referencing existing skills
4. Use clear `{{placeholder}}` syntax for fill-in fields
5. Match the formality and structure expectations of the target audience

### Adding a New Diagnostic

1. Run `scripts/new-diagnostic.sh` (or copy `.claude/diagnostics/_schema/diagnostic-template.md`)
2. Define entry symptoms using natural language patterns
3. Write 5-7 triage questions forming a decision tree
4. Map diagnoses to skills, playbooks, and templates via routing fields
5. Include red flags indicating the entrepreneur needs external professional help
6. Ensure all referenced skills and templates exist
7. Update relevant hooks to include the new diagnostic in their routing

### Adding a New Playbook

1. Run `scripts/new-playbook.sh` (or copy `.claude/playbooks/_schema/playbook-template.md`)
2. Design 4-7 steps, each with: skill reference, purpose, expected output, and checkpoint
3. Include decision points where the path branches based on findings
4. Specify final deliverables and document common pitfalls
5. Verify all skill and template references exist
6. Update relevant hooks and diagnostics to route to the new playbook

### Adding an Industry Pack

1. Create a directory under `.claude/industry-packs/` with a kebab-case slug
2. Follow the schema in `.claude/industry-packs/_schema/industry-pack-template.yaml`
3. Each pack requires exactly 4 YAML files:
   - `benchmarks.yaml` — sector KPIs, growth rates, unit economics ranges
   - `skill-overlays.yaml` — sector-specific modifications to existing skills
   - `diagnostic-rules.yaml` — additional triage logic for the sector
   - `templates.yaml` — audience-specific template adaptations
4. Source benchmark data from reputable, citable industry reports

### Adding a Research Guide

1. Follow the schema in `.claude/research/_schema/research-template.yaml`
2. Define: what data to collect, where to find it, how to interpret it, which skills it feeds
3. Include specific data sources and a clear protocol the entrepreneur can follow independently

### Bug Fixes and Documentation

Run `scripts/validate-all.sh` and `scripts/broken-refs.sh` to identify issues. Fix the problem, verify both scripts pass, and submit a pull request describing what was broken and how you fixed it. Improvements to files in `docs/` follow the same process — use the project writing style described below.

## Quality Standards

Every contribution must meet these non-negotiable requirements.

### Content Rules

- **Language**: All content in English
- **Frontmatter**: Every field required by the schema must be present and valid
- **Author field**: Use your own name or GitHub handle
- **Writing style**: Analytical, institutional, precise. The voice sits between The Economist, Harvard Business Review, and McKinsey Quarterly. See `docs/style-guide.md` for the full guide.
- **Related skills**: Every skill must cross-reference 4-7 other skills
- **Versioning**: New files start at `version: 1.0.0`

### Prohibited Phrases

The following are banned from all files in the repository:

- "In today's fast-paced..." or any variant
- "Let's dive in" / "Let's explore"
- "In this skill, you will learn..."
- "Without further ado"
- "It's important to note that"
- "At the end of the day"

### Additional Restrictions

- No emoji in any file content
- No rhetorical questions as paragraph openers (one per file maximum)
- No consecutive paragraphs starting with the same word
- No book author names anywhere in content (all source material is anonymized)

### Validation

Before submitting a pull request, run:

```bash
scripts/validate-all.sh    # Must pass with zero errors
scripts/broken-refs.sh     # Must report zero broken references
```

The CI pipeline runs both checks automatically. Pull requests that fail validation will not be reviewed.

## Pull Request Process

### Branch Naming

Use descriptive names with a type prefix: `skill/customer-segmentation`, `template/investor-quarterly-update`, `diagnostic/hiring-bottleneck`, `fix/broken-refs-in-leadership`, `docs/update-stage-mapping`.

### Commit Messages

Write clear, imperative messages: `Add competitive-positioning skill to frameworks category`, `Fix broken reference in growth-diagnostics playbook`.

### Review Expectations

- A maintainer will review your pull request within 7 days
- Expect feedback on writing style, structural completeness, and cross-reference quality
- Revisions are normal; most first contributions require one round of edits
- Once approved, a maintainer will merge your contribution

## Code of Conduct

All contributors are expected to follow our [Code of Conduct](CODE_OF_CONDUCT.md). Professional, respectful interaction is the baseline.

## Questions

Open a thread in [GitHub Discussions](https://github.com/fatihguner/foreman/discussions) for:

- Questions about contribution guidelines
- Proposals for new categories or structural changes
- Feedback on the architecture or content approach

For security concerns, see [SECURITY.md](SECURITY.md).
