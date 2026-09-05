---
name: "execution-commands"
description: "Commands for applying skills, running diagnostics, executing playbooks, and formatting output. These commands trigger the agent architecture and produce analytical results. They read from and write to the memory system."
category: "execution"
commands:
  - name: "/apply"
    syntax: "/apply [skill-name] [--stage stage]"
    description: "Apply a skill to the current entrepreneur context via the skill-executor agent."
  - name: "/diagnose"
    syntax: "/diagnose [area]"
    description: "Run a diagnostic to identify the root cause behind a stated problem."
  - name: "/run"
    syntax: "/run [playbook-name]"
    description: "Start a multi-step playbook from Step 1, checking prerequisites first."
  - name: "/resume"
    syntax: "/resume"
    description: "Resume a paused playbook from the last completed step."
  - name: "/output"
    syntax: "/output [template] [audience]"
    description: "Format the most recent analysis results into a specific output template."
author: "Fatih Guner"
---

# Execution Commands

## `/apply`

### Description

Applies a single skill to the entrepreneur's current context. This command invokes the skill-executor agent, which loads the specified skill, pulls identity and company data from memory, adapts the framework to the entrepreneur's stage, and produces a structured analysis. Results are persisted to the history layer of memory. An optional stage override forces the skill to operate as though the company were at a different stage — useful for scenario planning.

### Syntax

```
/apply [skill-name] [--stage stage]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `skill-name` | Yes | string | -- | Skill identifier in kebab-case (e.g., `porters-five-forces`) |
| `--stage` | No | string | from memory | Override the company stage: `idea`, `validation`, `early-traction`, `growth`, `scale` |

### Examples

```
/apply porters-five-forces
→ Applying "Porter's Five Forces" to context...
  Stage: early-traction (from company profile)
  Loading competitive data from memory...
  [Full framework analysis output with five forces scored and interpreted]

/apply swot-pest-analysis --stage growth
→ Applying "SWOT-PEST Analysis" with stage override: growth
  Note: Company profile indicates "early-traction" — analysis adjusted to growth-stage lens.
  [Combined SWOT and PEST analysis with growth-specific guidance]

/apply business-model-canvas
→ Applying "Business Model Canvas" to context...
  Stage: idea (from company profile)
  [Nine building blocks populated from company context, gaps identified]

/apply stoic-emotional-mastery
→ Applying "Stoic Emotional Mastery" to context...
  Stage: validation (from company profile)
  [Framework applied to current active challenges from memory]
```

### Related Commands

- `/skill [name]` — Preview a skill's summary before applying it
- `/skills` — Browse available skills to find the right one
- `/output [template] [audience]` — Format the analysis results for a specific audience

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/apply` | `Missing skill name. Usage: /apply [skill-name] [--stage stage]. Run /skills to browse available skills.` |
| `/apply blue-ocean` | `No skill found matching "blue-ocean". Did you mean: blue-ocean-strategy? Run /search "blue ocean" to explore.` |
| `/apply porters-five-forces --stage seed` | `Unknown stage "seed". Valid stages: idea, validation, early-traction, growth, scale.` |
| `/apply porters-five-forces` (no company context) | `No company profile found. Run /update company to set your company context before applying skills.` |

---

## `/diagnose`

### Description

Runs a diagnostic flow to triage a problem area. The command maps the area keyword to the appropriate diagnostic file, then walks the entrepreneur through targeted questions to pinpoint the root cause. Once the root cause is identified, the diagnostic recommends specific skills or playbooks. Results are stored in the history layer of memory for future reference.

### Syntax

```
/diagnose [area]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `area` | Yes | string | -- | Problem area keyword: `revenue`, `team`, `pricing`, `fundraising`, `growth`, `product`, `culture`, `leadership`, `competition`, `hiring`, `churn`, `cofounder`, `communication`, `decisions`, `innovation`, `operations`, `partnership`, `market-entry`, `strategy`, `negotiation` |

### Examples

```
/diagnose revenue
→ Starting revenue-diagnosis...
  Q1: Has monthly recurring revenue declined, plateaued, or simply not grown as expected?
  Q2: When did you first notice the change — weeks, months, or quarters ago?
  Q3: Have you changed pricing, product, or sales approach in the same period?
  [Diagnostic continues with targeted questions, then produces root-cause analysis]

/diagnose team
→ Starting team-dysfunction-diagnosis...
  Q1: Is the issue concentrated in one team or department, or distributed?
  Q2: Did a specific event trigger the dysfunction — departure, reorg, missed target?
  [Diagnostic narrows from broad dysfunction to specific root cause]

/diagnose pricing
→ Starting pricing-diagnosis...
  Q1: Are you losing deals on price, or are customers paying but churning?
  Q2: Have you tested pricing experimentally, or is the current price inherited?
  [Diagnostic identifies pricing-specific failure mode and recommends next steps]

/diagnose churn
→ Starting customer-churn-diagnosis...
  Q1: What is your current monthly churn rate, and how does it compare to six months ago?
  [Diagnostic drills into churn drivers]
```

### Related Commands

- `/diagnostics` — List all available diagnostics before choosing
- `/apply [skill]` — Apply a skill recommended by the diagnostic
- `/run [playbook]` — Start a playbook recommended by the diagnostic
- `/history` — Review past diagnostic results

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/diagnose` | `Missing problem area. Usage: /diagnose [area]. Run /diagnostics to see all available areas.` |
| `/diagnose marketing` | `No diagnostic matches "marketing". Closest matches: market-entry, competition, growth. Run /diagnostics for the full list.` |

---

## `/run`

### Description

Starts a multi-step playbook from the beginning. Before execution, the command checks prerequisites — required memory fields, company stage compatibility, and any prior diagnostics the playbook expects. If prerequisites pass, Step 1 begins immediately. Progress is saved to the active memory layer after each step, enabling pause and resume. Only one playbook can be active at a time.

### Syntax

```
/run [playbook-name]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `playbook-name` | Yes | string | -- | Playbook identifier in kebab-case (e.g., `fundraising-playbook`) |

### Examples

```
/run fundraising-playbook
→ Checking prerequisites for "fundraising-playbook"...
  Company profile: present
  Stage: early-traction (compatible)
  Required prior diagnostic: fundraising-diagnosis (completed 2026-03-10)
  Prerequisites met. Starting Step 1 of 8.
  [Step 1: Define round parameters — amount, valuation range, investor profile]

/run pivot-playbook
→ Checking prerequisites for "pivot-playbook"...
  Company profile: present
  Stage: validation (compatible)
  Required prior diagnostic: product-market-fit-diagnosis (not found)
  Recommendation: Run /diagnose product first to establish baseline before pivoting.
  Proceeding anyway? [y/n]

/run first-100-customers-playbook
→ Checking prerequisites for "first-100-customers-playbook"...
  Company profile: present
  Stage: idea (compatible)
  No prior diagnostics required.
  Starting Step 1 of 6.
  [Step 1: Define ideal customer profile from company context]

/run scaling-playbook
→ Cannot start "scaling-playbook" — a playbook is already active.
  Active: fundraising-playbook (Step 4 of 8, paused 2026-03-22)
  Complete or abandon the active playbook first, or run /resume to continue it.
```

### Related Commands

- `/playbooks` — Browse available playbooks
- `/resume` — Continue a paused playbook
- `/diagnose [area]` — Run a prerequisite diagnostic

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/run` | `Missing playbook name. Usage: /run [playbook-name]. Run /playbooks to browse available playbooks.` |
| `/run fundraising` | `No playbook found matching "fundraising". Did you mean: fundraising-playbook? Run /playbooks for the full list.` |
| `/run scaling-playbook` (incompatible stage) | `"scaling-playbook" requires stage growth or scale. Your current stage: validation. Override with /update company to change your stage, or choose a stage-appropriate playbook.` |

---

## `/resume`

### Description

Resumes the currently active playbook from the last completed step. Reads the active memory layer to determine which playbook is in progress, which step was last completed, and what context was captured so far. If no playbook is active, the command reports that and suggests `/run` or `/playbooks`.

### Syntax

```
/resume
```

### Parameters

This command takes no parameters.

### Examples

```
/resume
→ Resuming "fundraising-playbook"...
  Last completed: Step 4 of 8 (paused 2026-03-22)
  Context loaded: round parameters, target investor list, pitch narrative draft
  Starting Step 5: Financial model review and unit economics validation.

/resume
→ Resuming "pivot-playbook"...
  Last completed: Step 2 of 5 (paused 2026-03-24)
  Context loaded: current PMF assessment, customer interview synthesis
  Starting Step 3: Generate pivot options using Lean Canvas.

/resume
→ No active playbook found.
  Start a new playbook with /run [playbook-name]. Run /playbooks to browse options.
```

### Related Commands

- `/run [playbook]` — Start a new playbook
- `/playbooks` — Browse available playbooks
- `/context` — Check what active items exist in memory

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/resume` (no active playbook) | `No active playbook found. Start one with /run [playbook-name].` |
| `/resume` (corrupted state) | `Active playbook state is incomplete. Last known position: fundraising-playbook, Step 3. Restart from Step 3? [y/n]` |

---

## `/output`

### Description

Formats the most recent analysis results — from a skill application, diagnostic, or playbook step — into a specified output template for a target audience. The command reads the latest results from memory, applies the selected template's structure and tone, and produces a polished document. If no recent results exist, the command reports that and suggests running an analysis first.

### Syntax

```
/output [template] [audience]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `template` | Yes | string | -- | Template identifier in kebab-case (e.g., `strategic-analysis-one-pager`) |
| `audience` | Yes | string | -- | Target audience: `investor`, `board`, `team`, `self`, `client` |

### Examples

```
/output strategic-analysis-one-pager investor
→ Formatting last analysis (Porter's Five Forces, 2026-03-25) for investor audience...
  Template: strategic-analysis-one-pager
  [Formatted one-page strategic analysis with investor-appropriate framing]

/output action-plan team
→ Formatting last analysis (pivot-playbook Step 3, 2026-03-24) for team audience...
  Template: action-plan
  [Structured action plan with team-facing language, clear owners, and timelines]

/output decision-rationale-memo investor
→ Formatting last decision (pricing model change, 2026-03-23) for investor audience...
  Template: decision-rationale-memo
  [Formal memo explaining the rationale, alternatives considered, and expected impact]

/output weekly-ceo-review self
→ Formatting accumulated week data for self audience...
  Template: weekly-ceo-review
  [Personal review covering decisions made, diagnostics run, and open items]
```

### Related Commands

- `/templates` — Browse available templates and audiences
- `/apply [skill]` — Generate analysis results to format
- `/diagnose [area]` — Generate diagnostic results to format

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/output` | `Missing template and audience. Usage: /output [template] [audience].` |
| `/output strategic-analysis-one-pager` | `Missing audience. Usage: /output [template] [audience]. Available audiences: investor, board, team, self, client.` |
| `/output strategic-analysis-one-pager partner` | `Unknown audience "partner". Available audiences: investor, board, team, self, client.` |
| `/output nonexistent-template investor` | `No template found matching "nonexistent-template". Run /templates investor to see available templates for that audience.` |
| `/output strategic-analysis-one-pager investor` (no recent results) | `No recent analysis results found. Run /apply [skill] or /diagnose [area] first, then format the output.` |
