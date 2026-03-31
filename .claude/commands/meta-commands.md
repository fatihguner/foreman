# Meta Commands

System information, configuration, and feedback -- operations on Foreman itself.

---

## `/help`

Display all commands grouped by category, or detailed help for one category.

**Syntax:** `/help [category]`

| Parameter | Required | Values | Description |
|-----------|----------|--------|-------------|
| `category` | No | `playbook`, `output`, `meta`, `memory`, `skill`, `diagnostic` | Filter to one category. Omit for all. |

**Examples:**
```
> /help
Playbook: /status /skip /back /pause /abort | Output: /format /export /compare
Meta: /help /about /version /feedback /stage | Memory: /recall /forget /memory
Skill: /run /list | Diagnostic: /diagnose /symptoms
> /help playbook
/status — active state  /skip — skip step  /back — re-run previous
/pause — save to memory  /abort — cancel (double confirm)
> /help memory
/recall <query> — retrieve stored analysis  /forget <item-id> — remove from memory
/memory [layer] — show contents (active, history, context, stage, profile)
```
**Related:** `/about`, `/version`
**Errors:** `Unknown category: "<value>". Available: playbook, output, meta, memory, skill, diagnostic.`

---

## `/about`

Display Foreman project info: purpose, architecture, source links.

**Syntax:** `/about` | **Parameters:** None.

**Examples:**
```
> /about
Foreman — AI-Powered Strategic Advisor for Entrepreneurs
Open-source, framework-driven guidance via skills, agents, hooks, and memory.
Input --> Diagnostics --> Hooks --> Agent --> Skills --> Template --> Memory
Adapts to stage (idea through scale). Context accumulates across sessions.
foreman.sh | github.com/anthropics/foreman | License: TBD
> /about --verbose
Unknown flag: "--verbose". /about takes no parameters.
```
**Related:** `/version`, `/help` | **Errors:** Any argument: `Unknown flag. /about takes no parameters.`

---

## `/version`

Show system version and component counts.

**Syntax:** `/version` | **Parameters:** None.

**Examples:**
```
> /version
Foreman v0.1.0
Skills: 158  Templates: 48  Diagnostics: 20  Playbooks: 20
Hooks: 16  Agents: 6  Memory layers: 5
> /version skills
Unknown argument: "skills". /version takes no parameters. Try /help skill.
```
**Related:** `/about`, `/help` | **Errors:** Any argument: `Unknown argument. /version takes no parameters.`

---

## `/feedback [message]`

Submit feedback about a skill, template, diagnostic, or the system. Logged with session context for project improvement.

**Syntax:** `/feedback "<message>"`

| Parameter | Required | Description |
|-----------|----------|-------------|
| `message` | Yes | Free text. Reference the skill or feature by name. Quote the message. |

**Examples:**
```
> /feedback "SWOT skill needs more B2B SaaS examples."
Logged. Ref: FB-20260326-001. Context: stage=early-traction, skill=swot-analysis
> /feedback "Pricing diagnosis missed freemium. Treated free tier as trial."
Logged. Ref: FB-20260326-002. Context: stage=growth, skill=pricing-strategy
> /feedback "Board template: zero edits for March meeting."
Logged. Ref: FB-20260326-003. Context: stage=growth, template=board/strategic-summary
> /feedback
Usage: /feedback "<message>". Reference the specific skill or feature by name.
```
**Related:** `/about`, `/version`
**Errors:** No message: `Usage: /feedback "<message>".` Empty: `Feedback cannot be empty.`

---

## `/sector`

Show, set, or deactivate the active industry pack. Industry packs add sector-specific benchmarks, skill overlays, diagnostic rules, and template adaptations. Setting a sector updates `memory.company.sector` and loads the matching pack automatically.

**Syntax:** `/sector [name|list|off]`

| Parameter | Required | Values | Description |
|-----------|----------|--------|-------------|
| `name` | No | `saas`, `marketplace`, `e-commerce`, `fintech`, `ai-ml`, `healthtech`, `edtech`, `d2c-consumer`, `agency-consulting` | Sector to activate. Omit to view current. |
| `list` | No | literal `list` | Show all available industry packs. |
| `off` | No | literal `off` | Deactivate sector-specific overlays. |

**Examples:**
```
> /sector
Current sector: saas (set 2026-02-10)
Industry pack: saas — benchmarks, skill overlays, diagnostic rules, templates active.
> /sector fintech
Updated: fintech (was saas). Fintech benchmarks, regulatory diagnostic rules,
and compliance template sections now active across all agents.
> /sector list
Available industry packs (9):
  saas, marketplace, e-commerce, fintech, ai-ml, healthtech, edtech,
  d2c-consumer, agency-consulting
Each pack: benchmarks + skill overlays + diagnostic rules + templates.
> /sector off
Sector deactivated (was fintech). Generic benchmarks and diagnostics restored.
> /sector crypto
Unknown sector: "crypto". Available: saas, marketplace, e-commerce, fintech,
ai-ml, healthtech, edtech, d2c-consumer, agency-consulting.
Hint: if your sector is not listed, the closest match may still add value.
```

**Memory integration:** Setting a sector writes to `memory.company.sector`. The value persists across sessions. The orchestrator reads `company.sector` at session start and loads the matching industry pack automatically.

**Related:** `/stage`, `/about`, `/version`
**Errors:** Unknown sector: `Unknown sector: "<value>". Available: saas, marketplace, e-commerce, fintech, ai-ml, healthtech, edtech, d2c-consumer, agency-consulting.` Already set: `Already set to <value>. No change.` No sector active (on `/sector` without args): `No sector set. Use /sector <name> to activate an industry pack.`

---

## `/stage`

Show or change company stage. Governs skill selection, playbook filtering, framework adaptation. Five stages: `idea`, `validation`, `early-traction`, `growth`, `scale`. Past analyses retain their original stage.

**Syntax:** `/stage [new-stage]`

| Parameter | Required | Values | Description |
|-----------|----------|--------|-------------|
| `new-stage` | No | `idea`, `validation`, `early-traction`, `growth`, `scale` | Stage to set. Omit to view current. |

**Examples:**
```
> /stage
Current stage: early-traction (set 2026-01-15)
> /stage growth
Updated: growth (was early-traction). Unit Economics shifts to LTV/CAC.
Hiring/scaling playbooks available. Fundraising framed for Series A/B.
> /stage idea
Updated: idea (was growth). Validation prioritized. Financial modeling
simplified. Team playbooks focus on co-founder dynamics.
> /stage series-a
Unknown stage: "series-a". Available: idea, validation, early-traction, growth, scale.
Hint: after a Series A, "growth" is likely appropriate.
> /stage validation
Updated: validation (was idea). Customer discovery prioritized. PMF assessment
available. Lean Canvas emphasized over full BMC.
```
**Related:** `/status`, `/version`, `/help`
**Errors:** Unknown: `Unknown stage. Available: idea, validation, early-traction, growth, scale.` Same: `Already set to <value>. No change.`
