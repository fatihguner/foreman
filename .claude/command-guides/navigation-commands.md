---
name: "navigation-commands"
description: "Commands for exploring and discovering Foreman's skill library, output templates, playbooks, diagnostics, and hooks. These commands produce read-only listings and summaries — they never modify state or trigger execution."
category: "navigation"
commands:
  - name: "/skills"
    syntax: "/skills [category] [--stage stage] [--complexity level]"
    description: "List all skills, optionally filtered by category, company stage, or complexity."
  - name: "/skill"
    syntax: "/skill [name]"
    description: "Display a single skill's summary, including description, stage, complexity, and related skills."
  - name: "/templates"
    syntax: "/templates [audience] [--format type]"
    description: "List all output templates, optionally filtered by audience or document format."
  - name: "/playbooks"
    syntax: "/playbooks [--stage stage]"
    description: "List all playbooks, optionally filtered by company stage."
  - name: "/diagnostics"
    syntax: "/diagnostics"
    description: "List all available diagnostics with their target problem domains."
  - name: "/hooks"
    syntax: "/hooks"
    description: "List all hooks with their trigger patterns and routing destinations."
  - name: "/search"
    syntax: "/search [query] [--in layer]"
    description: "Full-text search across all system layers or a specific layer."
author: "Fatih Guner"
---

# Navigation Commands

## `/skills`

### Description

Lists every skill registered in the system. Without arguments, returns a grouped summary across all 14 categories. With a category argument, returns only skills in that category. Stage and complexity flags narrow results further. Output includes skill name, one-line description, stage tags, and complexity level.

### Syntax

```
/skills [category] [--stage stage] [--complexity level]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `category` | No | string | all | Category slug: `frameworks`, `leadership`, `writing`, `ai-leadership`, `game-theory`, `stoic`, `storytelling`, `negotiation`, `people`, `creative`, `thinking`, `decisions` |
| `--stage` | No | string | all | Filter by company stage: `idea`, `validation`, `early-traction`, `growth`, `scale` |
| `--complexity` | No | string | all | Filter by complexity: `basic`, `intermediate`, `advanced` |

### Examples

```
/skills
→ 158 skills across 14 categories
  frameworks (50) | leadership (28) | writing (6) | ai-leadership (9) | ...

/skills frameworks
→ 50 skills in "frameworks"
  balanced-scorecard      | intermediate | validation, growth, scale
  blue-ocean-strategy     | advanced     | validation, growth
  business-model-canvas   | basic        | idea, validation, early-traction
  ...

/skills --stage growth
→ 94 skills applicable to "growth" stage
  (filtered list across all categories)

/skills leadership --complexity advanced
→ 8 skills in "leadership" at advanced complexity
  senior-leadership-transition | advanced | growth, scale
  strategic-thinking-and-alignment | advanced | growth, scale
  ...
```

### Related Commands

- `/skill [name]` — View full detail on a specific skill
- `/search [query]` — Find skills by keyword when the name is unknown

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/skills nonexistent-category` | `Unknown category "nonexistent-category". Available categories: frameworks, leadership, writing, ai-leadership, game-theory, stoic, storytelling, negotiation, people, creative, thinking, decisions.` |
| `/skills --stage pre-seed` | `Unknown stage "pre-seed". Valid stages: idea, validation, early-traction, growth, scale.` |

---

## `/skill`

### Description

Displays the summary card for a single skill, including its name, description, category, stage applicability, complexity, tags, and related skills. Does not render the full skill body — use this for quick reference before deciding whether to apply a skill.

### Syntax

```
/skill [name]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `name` | Yes | string | -- | Skill identifier in kebab-case (e.g., `porters-five-forces`) |

### Examples

```
/skill porters-five-forces
→ porters-five-forces
  Category:    frameworks
  Complexity:  advanced
  Stages:      validation, early-traction, growth, scale
  Description: Analyzes five competitive forces that shape industry profitability...
  Related:     blue-ocean-strategy, swot-pest-analysis, growth-share-matrix

/skill business-model-canvas
→ business-model-canvas
  Category:    frameworks
  Complexity:  basic
  Stages:      idea, validation, early-traction
  Description: Maps the nine building blocks of a business model...
  Related:     lean-in, doblin-ten-types, four-ps-marketing

/skill stoic-emotional-mastery
→ stoic-emotional-mastery
  Category:    stoic
  Complexity:  intermediate
  Stages:      idea, validation, early-traction, growth, scale
  Description: Applies Stoic techniques for emotional regulation under pressure...
  Related:     stoic-control-and-clarity, emotional-intelligence, leader-resilience-and-wellbeing
```

### Related Commands

- `/skills` — Browse all skills by category
- `/apply [name]` — Execute this skill against your current context

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/skill` | `Missing skill name. Usage: /skill [name]. Run /skills to browse available skills.` |
| `/skill porters-five` | `No skill found matching "porters-five". Did you mean: porters-five-forces? Run /search "porters" to explore.` |

---

## `/templates`

### Description

Lists all output templates organized by audience. Without arguments, returns a count and grouped listing across all five audiences (investor, board, team, self, client). With an audience argument, shows only templates for that audience. The format flag filters by document type when specified.

### Syntax

```
/templates [audience] [--format type]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `audience` | No | string | all | Target audience: `investor`, `board`, `team`, `self`, `client` |
| `--format` | No | string | all | Document format: `memo`, `one-pager`, `email`, `checklist`, `brief`, `template` |

### Examples

```
/templates
→ 48 output templates across 5 audiences
  investor (10) | board (7) | team (13) | client (8) | self (10)

/templates investor
→ 10 templates for "investor" audience
  cap-table-summary | competitive-landscape-brief | decision-rationale-memo
  due-diligence-checklist | exit-scenario-analysis | fundraising-deck-outline
  investor-update-email | market-opportunity-summary | strategic-analysis-one-pager
  unit-economics-snapshot

/templates team --format template
→ Templates for "team" audience filtered by "template" format
  feedback-360-template | meeting-notes-template | one-on-one-template
  retrospective-template | role-description-template
```

### Related Commands

- `/output [template] [audience]` — Generate a formatted output using a template
- `/skills` — Browse the skills whose results these templates format

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/templates shareholders` | `Unknown audience "shareholders". Available audiences: investor, board, team, self, client.` |
| `/templates --format slide-deck` | `Unknown format "slide-deck". Available formats: memo, one-pager, email, checklist, brief, template.` |

---

## `/playbooks`

### Description

Lists all playbooks with their names, descriptions, and applicable stages. Playbooks are multi-step recipes that chain several skills into a guided workflow. The stage flag filters playbooks relevant to a specific company stage.

### Syntax

```
/playbooks [--stage stage]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `--stage` | No | string | all | Filter by company stage: `idea`, `validation`, `early-traction`, `growth`, `scale` |

### Examples

```
/playbooks
→ 20 playbooks available
  acquisition-evaluation-playbook | board-formation-playbook | competitive-response-playbook
  crisis-playbook | first-100-customers-playbook | founder-transition-playbook
  fundraising-playbook | innovation-sprint-playbook | ...

/playbooks --stage validation
→ 8 playbooks applicable to "validation" stage
  first-100-customers-playbook | launch-playbook | pivot-playbook
  pricing-strategy-playbook | product-market-fit-playbook | ...

/playbooks --stage scale
→ 6 playbooks applicable to "scale" stage
  acquisition-evaluation-playbook | board-formation-playbook
  founder-transition-playbook | international-expansion-playbook | ...
```

### Related Commands

- `/run [playbook]` — Start executing a playbook
- `/resume` — Continue a paused playbook

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/playbooks --stage seed` | `Unknown stage "seed". Valid stages: idea, validation, early-traction, growth, scale.` |

---

## `/diagnostics`

### Description

Lists all diagnostics with their target problem domains. Diagnostics are triage flows that identify the root cause behind an entrepreneur's stated problem. Each diagnostic maps to one or more skills and playbooks it may route to after analysis.

### Syntax

```
/diagnostics
```

### Parameters

This command takes no parameters.

### Examples

```
/diagnostics
→ 20 diagnostics available
  cofounder-conflict-diagnosis    — Interpersonal and equity disputes between cofounders
  communication-breakdown-diagnosis — Internal communication failures and misalignment
  competitive-threat-diagnosis    — Emerging or intensifying competitive pressure
  culture-erosion-diagnosis       — Declining team culture, values drift
  customer-churn-diagnosis        — Rising customer attrition, retention failures
  decision-paralysis-diagnosis    — Inability to commit to strategic decisions
  fundraising-diagnosis           — Capital-raising obstacles and investor relations
  growth-stall-diagnosis          — Revenue or user growth plateaus
  ...
```

### Related Commands

- `/diagnose [area]` — Run a specific diagnostic
- `/hooks` — See how natural-language input maps to these diagnostics

### Error Handling

This command has no failure modes — it always returns the full diagnostic listing.

---

## `/hooks`

### Description

Lists all hooks with their trigger patterns and routing destinations. This command exists for transparency and debugging: it reveals how Foreman interprets natural-language input and routes it to diagnostics, skills, or playbooks. Useful when a hook misroutes and the entrepreneur wants to understand why.

### Syntax

```
/hooks
```

### Parameters

This command takes no parameters.

### Examples

```
/hooks
→ 16 hooks registered
  revenue-and-sales-hook
    Triggers: "sales are dropping", "revenue is declining", "nobody's buying"...
    Routes to: revenue-diagnosis, pricing-diagnosis

  team-hook
    Triggers: "my team isn't working", "I need to fire someone", "hiring is broken"...
    Routes to: team-dysfunction-diagnosis, hiring-diagnosis

  fundraising-hook
    Triggers: "I need funding", "investors aren't interested", "running out of cash"...
    Routes to: fundraising-diagnosis, fundraising-playbook
  ...
```

### Related Commands

- `/diagnostics` — See the diagnostics that hooks route to
- `/search [query]` — Find specific trigger patterns

### Error Handling

This command has no failure modes — it always returns the full hook listing.

---

## `/search`

### Description

Performs full-text search across all system layers: skills, templates, diagnostics, playbooks, and hooks. Returns ranked matches with the layer, name, and a snippet showing where the query matched. The `--in` flag restricts the search to a single layer for faster, narrower results.

### Syntax

```
/search [query] [--in layer]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `query` | Yes | string | -- | Search term or phrase (wrap multi-word queries in quotes) |
| `--in` | No | string | all | Restrict to a single layer: `skills`, `templates`, `diagnostics`, `playbooks`, `hooks` |

### Examples

```
/search "pricing"
→ 12 matches across 4 layers
  skill:     pricing-strategy-playbook, porters-five-forces, four-ps-marketing
  diagnostic: pricing-diagnosis
  playbook:  pricing-strategy-playbook
  template:  unit-economics-snapshot
  hook:      revenue-and-sales-hook

/search "churn" --in skills
→ 3 skill matches for "churn"
  customer-churn-diagnosis (tagged: churn, retention, attrition)
  net-promoter-score (mentions churn in anti-patterns)
  growth-stall-diagnosis (mentions churn as growth inhibitor)

/search "fundraising" --in playbooks
→ 1 playbook match for "fundraising"
  fundraising-playbook — Multi-step guide to raising a round

/search "team conflict"
→ 6 matches across 3 layers
  skill:     thomas-kilmann-conflict, cofounder-conflict-diagnosis
  diagnostic: cofounder-conflict-diagnosis, team-dysfunction-diagnosis
  hook:      team-hook
  playbook:  team-rebuild-playbook
```

### Related Commands

- `/skills` — Browse by category when search terms are too broad
- `/skill [name]` — View the full summary of a search result

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/search` | `Missing search query. Usage: /search [query] [--in layer].` |
| `/search "xyz" --in agents` | `Unknown layer "agents". Searchable layers: skills, templates, diagnostics, playbooks, hooks.` |
| `/search "quantum computing"` | `No matches found for "quantum computing". Try broader terms or check /skills for category browsing.` |
