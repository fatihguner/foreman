# System Architecture

Foreman is a layered intelligence system. Eighteen distinct layers cooperate to transform an entrepreneur's unstructured input into contextual, framework-driven strategic guidance. This document explains how those layers connect, how data flows between them, and where the system can be extended.

---

## System Overview

Every interaction follows the same path, whether the entrepreneur types a slash command or a natural-language complaint about declining revenue.

```
Entrepreneur Input
    |
    +--> [Commands]  -- structured: /apply, /diagnose, /run, etc.
    +--> [Hooks]     -- natural language: pattern match --> intent classification
            |
       [Orchestrator Agent]
            |
            +-- [Memory Agent].read()        -- retrieve entrepreneur context
            +-- [Diagnostic Agent]           -- triage: symptom --> root cause
            +-- [Skill Executor Agent]       -- apply framework to context
            +-- [Playbook Runner Agent]      -- execute multi-step sequences
            +-- [Output Agent]              -- format for target audience
            +-- [Memory Agent].write()       -- persist results and decisions
            |
       Formatted Response
```

The orchestrator is the sole interface between the entrepreneur and the system. No other agent communicates with the user directly.

---

## Layer Architecture

Foreman comprises 18 system layers organized into three groups: content, orchestration, and tooling/modes.

### Core Content Layers

| # | Layer | Location | Files | Purpose |
|---|-------|----------|-------|---------|
| 1 | Skills | `.claude/skills/` | 158 | Self-contained business frameworks across 12 categories. Each skill teaches one method with stage-specific guidance, anti-patterns, and application prompts. |
| 2 | Output Templates | `.claude/output-templates/` | 48 | Fill-in-the-blank professional documents for 5 audiences: investor (10), board (7), team (13), self (10), client (8). |
| 3 | Diagnostics | `.claude/diagnostics/` | 20 | Triage systems that identify root causes through structured questioning, then route to skills, playbooks, and templates. |
| 4 | Playbooks | `.claude/playbooks/` | 20 | Multi-step recipes chaining skills sequentially with checkpoints, decision points, and final deliverables. |

### Orchestration Layers

| # | Layer | Location | Files | Purpose |
|---|-------|----------|-------|---------|
| 5 | Hooks | `.claude/hooks/` | 17 | Trigger definitions that classify natural-language input and route to the correct diagnostic, skill, or playbook. |
| 6 | Agents | `.claude/agents/` | 6 | AI agent definitions: orchestrator, diagnostic, skill-executor, playbook-runner, output, memory. |
| 7 | Memory | `.claude/memory/` | 5 layers | Persistence system operating at five temporal frequencies, from yearly identity to ephemeral session data. |
| 8 | Commands | `.claude/commands/` | 13 files | 33 structured commands across 6 groups: navigation, execution, memory, playbook, output, meta. |

### Tooling and Modes

| # | Layer | Location | Files | Purpose |
|---|-------|----------|-------|---------|
| 9 | Scripts | `scripts/` | 21 | Bash utilities for validation, content creation, analysis, maintenance, and community tooling. |
| 10 | Solo Mode | `.claude/solo-mode/` | 4 | Solopreneur adaptation: skill relevance scoring, audience remapping, diagnostic/playbook reframing. |
| 11 | Stoic Mode | `.claude/stoic-mode/` | 2 | Philosophical depth layer framing all output through Stoic principles. |
| 12 | Language Mode | `.claude/language-mode/` | 1 | Output language switch. System processes in English, delivers in the target language. |
| 13 | Industry Packs | `.claude/industry-packs/` | 36 | Sector-specific overlays across 9 industries, each with benchmarks, skill overlays, diagnostic rules, and templates. |
| 14 | Implementation Tracking | `.claude/implementation/` | 9 | Accountability layer tracking execution through 6 states with blocker diagnosis and weekly check-ins. |
| 15 | Research Prompts | `.claude/research/` | 18 | Structured guides teaching entrepreneurs how to gather the data frameworks require. |
| 16 | Board Simulation | `.claude/simulation/` | 13 | Adversarial role-play system with board personas, scoring, and post-simulation diagnostics. |
| 17 | Org Politics | `.claude/org-politics/` | 14 | Stakeholder dynamics: power mapping, resistance diagnosis, coalition building, influence strategy. |
| 18 | Schemas | `_schema/` dirs | 12 | Template files defining structure for every layer. |

---

## Data Flow

### Hook Matching

Natural-language input enters through the hook layer. Each of the 17 hooks defines 10-15 trigger patterns.

```
"My sales are dropping and I can't figure out why"
  --> Pattern match: revenue-and-sales-hook (primary), growth-hook (secondary)
  --> Intent: revenue problem, cause unknown
  --> Route: diagnostic-agent (triage needed)
```

When multiple hooks match, the orchestrator applies disambiguation rules. When no hook matches, it asks a clarifying question.

### Diagnostic Flow

The diagnostic agent runs a structured triage sequence against the routed intent.

```
Routed intent: "revenue decline, cause unknown"
  --> Select: revenue-diagnosis.md
  --> Triage: 5-7 branching questions ("When did the decline start?", etc.)
  --> Diagnosis: pricing misalignment identified
  --> Route to: pricing-strategy skill + pricing-strategy-playbook
  --> Red flags: churn rate exceeds sector benchmarks
```

### Skill Execution

The skill-executor agent loads a skill, retrieves context from memory, and produces a contextualized analysis.

```
Skill: pricing-strategy | Stage: early-traction | Sector: SaaS | MRR: $12k
  --> Load skill markdown + frontmatter
  --> Filter to stage-specific guidance
  --> Apply industry pack overlay (SaaS benchmarks)
  --> Apply active mode overlays (solo, stoic, language)
  --> Generate framework analysis --> persist to memory.history
```

### Playbook Execution

The playbook-runner orchestrates multi-step sequences with checkpoints and decision points.

```
Playbook: fundraising-playbook
  --> Step 1: business-model-canvas    --> checkpoint
  --> Step 2: financial-projections    --> checkpoint
  --> Step 3: investor-readiness       --> decision point
        Not ready? --> route to product-market-fit-playbook
        Ready?     --> continue
  --> Step 4: pitch-deck-structure     --> checkpoint
  --> Step 5: output investor-deck     --> final deliverable
```

### Memory Flow

The memory agent reads at session start, writes after every substantive interaction, and persists at session end.

```
Session start:  Read identity.yaml + company.yaml + active.yaml
During session: Append to history.yaml, update active.yaml and company.yaml
Session end:    Persist session.yaml, update active.yaml with pending items
```

---

## Mode System

Foreman's three modes operate on orthogonal axes. They can combine freely without conflict because each filters a different dimension of the output.

### Solo Mode -- Filters WHAT

Solo mode adapts content relevance for solopreneurs. Skills about board management, team delegation, and investor relations are deprioritized. Skills about personal productivity, solo decision-making, and automation are elevated. Diagnostics reframe team-oriented questions for individual operators. Audience mappings redirect "board" and "team" templates to "self."

Activated via `/solo`. Persists across sessions in `identity.mode`.

### Stoic Mode -- Filters HOW

Stoic mode applies a philosophical lens to all output. Every analysis gains a dichotomy of control framing (what the entrepreneur can and cannot influence), virtue-based evaluation of options, premeditatio malorum (pre-mortem risk assessment), and amor fati reframing of setbacks. The underlying framework analysis is unchanged. Only the interpretive layer shifts.

Activated via `/stoic on`. Persists across sessions.

### Language Mode -- Filters IN WHICH LANGUAGE

Language mode switches all output to a specified language. The system continues to process internally in English -- reading skills, running diagnostics, applying frameworks -- but delivers the final response in the target language. Technical terms and framework names remain in English for precision.

Activated via `/language [code]`. Persists across sessions.

### Combining Modes

All three modes compose without interference:

```
/solo + /stoic on + /language es

Result: Solopreneur-adapted content (WHAT),
        framed through Stoic philosophy (HOW),
        delivered in Spanish (LANGUAGE).
```

---

## Industry Pack Overlay

Industry packs are sector-specific configuration layers stored in `.claude/industry-packs/`. Nine packs ship with Foreman: SaaS, Marketplace, E-Commerce, Fintech, AI/ML, HealthTech, EdTech, D2C/Consumer, and Agency/Consulting.

Each pack contains four YAML files:

| File | Purpose |
|------|---------|
| `{sector}-benchmarks.yaml` | Industry-standard metrics, thresholds, and percentile ranges |
| `{sector}-skill-overlays.yaml` | Sector-specific modifications to skill application guidance |
| `{sector}-diagnostic-rules.yaml` | Adjusted diagnostic thresholds and sector-relevant red flags |
| `{sector}-templates.yaml` | Audience-specific template adaptations for the sector |

Packs activate automatically when `memory.company.sector` matches a pack identifier. The system loads the pack at session start alongside memory context. Pack data overlays base behavior without modifying source files -- the original skill, diagnostic, and template definitions remain untouched.

---

## Agent Orchestration

Six agents form the execution layer. The orchestrator operates as a hub; the other five are specialists.

| Agent | Role | Invoked By | Produces |
|-------|------|------------|----------|
| **Orchestrator** | Central routing, intent classification, response assembly | Every user input | Formatted response to entrepreneur |
| **Diagnostic** | Structured triage through question trees | Orchestrator (when root cause is unclear) | Diagnosis + routing targets |
| **Skill Executor** | Framework application against entrepreneur context | Orchestrator or Playbook Runner | Structured analysis |
| **Playbook Runner** | Multi-step sequence execution with checkpoints | Orchestrator (when a playbook is invoked) | Sequential skill outputs + final deliverable |
| **Output** | Response formatting for target audience | Orchestrator (every response) | Formatted text matching audience expectations |
| **Memory** | Context persistence across sessions | Orchestrator (session start/end + after substantive interactions) | Read: context data. Write: confirmation. |

The orchestrator never performs analysis. The skill executor never formats output. The memory agent never routes input. Each agent has a single responsibility, and all inter-agent communication passes through the orchestrator.

---

## Memory Architecture

Five layers operate at different temporal frequencies.

| Layer | File | Change Frequency | Contents |
|-------|------|-----------------|----------|
| Identity | `identity.yaml` | Yearly | Name, role, background, leadership style, communication preference, strengths, weaknesses |
| Company | `company.yaml` | Monthly | Stage, sector, team size, funding, metrics (MRR, growth, churn, NPS), business model, challenges |
| History | `history.yaml` | Append-only | Every diagnostic run, skill applied, decision made, playbook completed |
| Active | `active.yaml` | Weekly | Running playbooks, pending decisions, upcoming follow-ups, blocked items |
| Session | `session.yaml` | Per message | Current conversation context, ephemeral notes, thread state |

The separation ensures that updating one layer never risks corrupting another. Each layer can be read independently when full context is unnecessary. A staleness rule triggers a refresh prompt when `company.yaml` has not been updated in 90 days.

---

## Extension Points

Foreman grows through contribution rather than modification. Every extension follows the same pattern: create files in the appropriate directory, follow the schema, and the system discovers them automatically.

| Extension | Location | Schema | Auto-discovered |
|-----------|----------|--------|----------------|
| New skill | `.claude/skills/{category}/` | `_schema/skill-template.md` | Yes -- `/skills` and agents find it immediately |
| New industry pack | `.claude/industry-packs/{sector}/` | `_schema/industry-pack-template.yaml` | Yes -- activates when `memory.company.sector` matches |
| New diagnostic | `.claude/diagnostics/` | `_schema/diagnostic-template.md` | Yes -- update relevant hooks to route to it |
| New playbook | `.claude/playbooks/` | `_schema/playbook-template.md` | Yes -- update hooks and diagnostics to route to it |
| New output template | `.claude/output-templates/{audience}/` | `_schema/output-template.md` | Yes -- output agent discovers it |
| New mode | `.claude/{mode-name}/` | Follow solo/stoic/language pattern | Requires command definition in `.claude/commands/` |

Scaffold scripts exist for the most common extensions: `scripts/new-skill.sh`, `scripts/new-diagnostic.sh`, `scripts/new-playbook.sh`, `scripts/new-template.sh`.

---

## Design Principles

1. **Separation of concerns.** Each layer has one job. Skills do not format. Diagnostics do not execute. The orchestrator does not analyze. Every layer is independently testable and replaceable.

2. **Config over code.** Behavior lives in Markdown and YAML, not application logic. Adding capabilities means creating files -- not modifying routers or deployment pipelines.

3. **Orthogonal composition.** Modes, packs, and stage filtering compose without interference. Solo changes what is relevant. Stoic changes how it is framed. Language changes the delivery language. Industry packs change benchmarks. Stage filtering changes specificity. All five dimensions operate independently on the same content.
