<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="./assets/logo-foreman-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="./assets/logo-foreman.svg">
    <img src="./assets/logo-foreman.svg" alt="Foreman" width="200">
  </picture>
</p>

<p align="center">
  <strong>AI-powered strategic advisor for entrepreneurs.</strong><br>
  The frameworks of McKinsey. The philosophy of Marcus Aurelius. The accountability of a great mentor.<br>
  Open source. Free forever.
</p>

<p align="center">
  <a href="#quickstart"><strong>Quickstart</strong></a> ·
  <a href="https://foreman.sh"><strong>Website</strong></a> ·
  <a href="./docs/architecture.md"><strong>Docs</strong></a> ·
  <a href="./VISION.md"><strong>Vision</strong></a> ·
  <a href="./CONTRIBUTING.md"><strong>Contribute</strong></a>
</p>

<p align="center">
  <a href="https://www.npmjs.com/package/foreman-sh"><img src="https://img.shields.io/npm/v/foreman-sh" alt="npm"></a>
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue" alt="MIT License"></a>
  <a href="https://github.com/fatihguner/foreman/stargazers"><img src="https://img.shields.io/github/stars/fatihguner/foreman?style=flat" alt="Stars"></a>
  <a href="https://github.com/fatihguner/foreman/issues"><img src="https://img.shields.io/github/issues/fatihguner/foreman" alt="Issues"></a>
  <img src="https://komarev.com/ghpvc/?username=fatihguner&label=visitors&color=brightgreen&style=flat" alt="Visitors">
  <a href="https://buymeacoffee.com/fatihguner"><img src="https://img.shields.io/badge/Buy%20Me%20a%20Coffee-FFDD00?style=flat&logo=buy-me-a-coffee&logoColor=black" alt="Buy Me a Coffee"></a>
</p>

---

## What is Foreman?

Foreman is an open-source strategic advisor that gives every entrepreneur access to structured strategic thinking, the kind that used to require a six-figure consulting engagement.

You describe your problem in plain language. Foreman diagnoses the root cause, selects the right framework, applies it to your context, produces a professional deliverable, and tracks whether you actually follow through.

| Without Foreman | With Foreman |
|---|---|
| ❌ "My sales are dropping" stays a vague worry | ✅ Diagnosed as onboarding churn in 6 questions |
| ❌ Frameworks learned but never applied | ✅ 158 frameworks applied to YOUR context |
| ❌ Board deck built from scratch every time | ✅ 48 professional templates, ready to fill |
| ❌ Advice given, execution forgotten | ✅ Implementation tracking with weekly check-ins |
| ❌ Same strategy for SaaS and marketplace | ✅ 9 industry packs with sector-specific benchmarks |
| ❌ Generic AI chat with no memory | ✅ 5-layer memory system that knows your company |

---

## How It Works

```
Entrepreneur: "My competitors are crushing us on price"
        │
   ┌────▼────┐
   │  Hooks   │ ── Pattern matches intent → competition threat
   └────┬────┘
   ┌────▼────────────┐
   │  Orchestrator    │ ── Reads memory (Series A, SaaS, 20 employees)
   └────┬────────────┘
   ┌────▼────────────┐
   │  Diagnostic      │ ── 6 triage questions → "differentiation failure"
   └────┬────────────┘
   ┌────▼────────────┐
   │  Playbook        │ ── Competitive Response: Porter's → Art of War → Blue Ocean
   └────┬────────────┘
   ┌────▼────────────┐
   │  Output          │ ── Competitive landscape brief (investor) + action plan (team)
   └────┬────────────┘
   ┌────▼────────────┐
   │  Memory          │ ── Saves analysis, tracks implementation, follows up next week
   └─────────────────┘
```

---

## What's Inside

| **📚 158 Skills** | **📋 48 Output Templates** | **🔍 24 Diagnostics** |
|:---|:---|:---|
| Business frameworks from Porter to Stoic philosophy, across 12 categories | Professional documents for investors, boards, teams, clients, and yourself | Triage systems that identify root causes through structured questioning |
| **📖 21 Playbooks** | **🎯 17 Hooks** | **🤖 6 Agents** |
| Multi-step recipes for pivots, fundraising, scaling, crises, and more | Natural language triggers that route problems to the right solution | Orchestration layer connecting all components |
| **🏭 9 Industry Packs** | **🔬 18 Research Guides** | **🎭 10 Board Personas** |
| Sector-specific benchmarks for SaaS, Marketplace, Fintech, and 6 more | Data collection templates from market sizing to churn analysis | Adversarial role-play for pitch and board meeting practice |

---

## Three Modes

Foreman adapts to how you work:

| Mode | Command | What It Does |
|---|---|---|
| **Solo** | `/solo` | Adapts everything for solopreneurs: no team, no board, just you. Remaps audiences, adjusts priorities, acknowledges the isolation. |
| **Stoic** | `/stoic on` | Adds philosophical depth from Stoic tradition. Dichotomy of control on every analysis. Premeditatio malorum on every risk section. Virtue-based anti-patterns. |
| **Language** | `/language turkish` | Switches all output to any language. System thinks in English, speaks in yours. Works with every mode. |

All three combine: `/solo` + `/stoic on` + `/language japanese` = a solopreneur receiving Stoic-framed strategic guidance in Japanese.

---

## Industry Packs

Same framework, radically different application:

| Pack | Benchmarks | Key Focus |
|---|---|---|
| **SaaS** | MRR, ARR, NRR, churn, CAC, LTV | Subscription metrics, retention curves |
| **Marketplace** | GMV, take rate, liquidity, supply/demand | Two-sided dynamics, chicken-and-egg |
| **E-Commerce** | AOV, conversion, cart abandonment, ROAS | Physical product, inventory, seasonality |
| **Fintech** | TPV, default rate, compliance cost, fraud | Regulation-through-everything |
| **AI/ML** | Inference cost, hallucination rate, model drift | Model-centric, data moat |
| **HealthTech** | Clinical validation, provider adoption, HIPAA | Patient safety, triple-aim |
| **EdTech** | Completion rate, institutional adoption, FERPA | Multi-stakeholder (buyer ≠ user) |
| **D2C/Consumer** | CAC by channel, ROAS, brand awareness | Brand-as-moat, community |
| **Agency/Consulting** | Utilization rate, revenue per employee | People-as-product |

---

## Platform Support

Foreman runs wherever AI agents run:

| Platform | Integration | How |
|---|---|---|
| **Claude Code** | Native | `.claude/` directory: skills, commands, hooks, agents, memory |
| **Claude Code Plugin** | Marketplace | `/plugin marketplace add fatihguner/foreman` → `/plugin install foreman@foreman-marketplace` |
| **Codex** | Plugin | `.codex-plugin/plugin.json` + generated `skills/` via `build-codex.sh` |
| **OpenClaw** | Native plugin | `openclaw.plugin.json` + `index.ts` registering 7 agent tools |

Single source of truth: `.claude/`. Every other platform derives from it.

---

## Quickstart

### Install via npm (recommended)

```bash
npx foreman-sh init
```

That's it. Foreman installs `.claude/` and `CLAUDE.md` into your current directory. Open Claude Code and start talking:

> "My SaaS churn rate is 5.2% and I'm preparing for Series A. What should I focus on?"

### Install as Claude Code plugin

```
/plugin marketplace add fatihguner/foreman
/plugin install foreman@foreman-marketplace
```

### Clone from GitHub

```bash
git clone https://github.com/fatihguner/foreman.git
cd foreman
```

### Codex

```bash
git clone https://github.com/fatihguner/foreman.git
cd foreman
./scripts/build-codex.sh --clean
```

### OpenClaw

```bash
git clone https://github.com/fatihguner/foreman.git
cd foreman
./scripts/openclaw-setup.sh
```

---

## Key Commands

| Command | What It Does |
|---|---|
| `/skills` | List all 158 skills, filter by category or stage |
| `/apply [skill]` | Apply a framework to your context |
| `/diagnose [area]` | Run a diagnostic triage |
| `/run [playbook]` | Start a multi-step playbook |
| `/track` | View implementation progress |
| `/simulate board` | Practice your board presentation |
| `/research [topic]` | Get a data collection guide |
| `/context` | View your stored company context |
| `/sector [name]` | Activate an industry pack |
| `/help` | See all commands |

---

## Advanced Systems

<details>
<summary><strong>Implementation Tracking</strong>: accountability, not just advice</summary>

Every recommendation becomes a trackable item. Six states (not-started → in-progress → blocked → completed → abandoned → deferred), weekly check-ins via `/check-in`, blocker diagnosis with 10 root causes, and a stuck-protocols library covering all 14 skill categories.

The gap between knowing and doing is where entrepreneurial value dies. Foreman closes it.

</details>

<details>
<summary><strong>Board Simulation</strong>: practice before the real meeting</summary>

10 adversarial personas (skeptic investor, financial hawk, operational expert, industry veteran, legal counsel, and 5 more) challenge your presentations with hard questions. 5-dimension scoring (clarity, evidence, strategic coherence, risk awareness, response quality). Post-simulation diagnostic identifies your weakest points.

</details>

<details>
<summary><strong>Organizational Politics</strong>: navigate the humans, not just the strategy</summary>

Stakeholder power mapping, resistance diagnosis, coalition building, communication strategy. Because the best strategy fails if the CFO blocks it and the board is split.

</details>

<details>
<summary><strong>Research Guides</strong>: learn to gather your own data</summary>

18 structured guides: market sizing (TAM/SAM/SOM), competitor intelligence, customer interviews (34-question bank), pricing validation (Van Westendorp), financial modeling, due diligence prep, and 12 more. Foreman teaches the framework; research guides teach you how to feed it.

</details>

<details>
<summary><strong>5-Layer Memory</strong>: a mentor who remembers</summary>

Identity (yearly) → Company (monthly) → History (append-only) → Active (weekly) → Session (ephemeral). Your stage, sector, past analyses, ongoing playbooks, and pending decisions persist across conversations. Foreman doesn't start from scratch; it builds on what came before.

</details>

---

## Architecture

```
foreman/
├── .claude/                     # All operational content (single source of truth)
│   ├── skills/                  # 158 skills across 12 categories
│   ├── output-templates/        # 48 templates across 5 audiences
│   ├── diagnostics/             # 24 triage systems
│   ├── playbooks/               # 21 multi-step recipes
│   ├── hooks/                   # 17 natural language triggers
│   ├── agents/                  # 6 orchestration agents
│   ├── memory/                  # 5-layer persistence system
│   ├── commands/                # 13 command files (~45 commands)
│   ├── industry-packs/          # 9 sector-specific overlay packs
│   ├── research/                # 18 data collection guides
│   ├── implementation/          # Tracking + support system
│   ├── simulation/              # Board simulation + 10 personas
│   ├── org-politics/            # Stakeholder navigation
│   ├── solo-mode/               # Solopreneur adaptations
│   ├── stoic-mode/              # Stoic philosophical lens
│   └── language-mode/           # Multilingual output
├── scripts/                     # 24 utility scripts
├── docs/                        # Architecture, guides, style guide
├── examples/                    # 8 end-to-end walkthroughs
├── openclaw-templates/          # OpenClaw workspace templates
└── .github/                     # CI, issue templates, labels
```

For the full architecture deep-dive: [docs/architecture.md](./docs/architecture.md)

---

## Skill Categories

| Category | Skills | What It Covers |
|---|---|---|
| `frameworks` | 50 | Porter's, SWOT, BMC, Blue Ocean, Balanced Scorecard, NPS, and 44 more |
| `leadership` | 28 | Senior transition, delegation, resilience, feedback, mentoring, and more |
| `writing` | 13 | Purpose, process, clarity, tone, emails, memos, performance reviews |
| `ai-leadership` | 9 | AI adoption: learning, purpose, inclusion, vision, augmentation |
| `game-theory` | 7 | Nash equilibrium, prisoner's dilemma, information asymmetry, coalitions |
| `stoic` | 12 | Control, emotions, awareness, duty, resilience, mortality, amor fati |
| `storytelling` | 8 | Finding stories, structure, stakes, emotional impact, performance |
| `negotiation` | 4 | Mindset, competitive tactics, cooperative strategy, closing |
| `people` | 8 | Understanding, meeting, reading, connecting, influencing, conflict |
| `creative` | 8 | Identity, perception, practice, obstacles, flow, collaboration |
| `thinking` | 6 | Clear thinking defaults, strength, weakness, decisions, priorities |
| `decisions` | 5 | Traps, generating solutions, evaluating options, executing, tough calls |

---

## Contributing

Foreman is open source because strategic thinking should be open. Every contribution (a new skill, a refined diagnostic, a sector-specific industry pack) helps an entrepreneur somewhere make a better decision.

```bash
git clone https://github.com/fatihguner/foreman.git
cd foreman
./scripts/setup.sh
```

Read the full guide: [CONTRIBUTING.md](./CONTRIBUTING.md)

---

## Roadmap

- [x] 158 skills across 12 categories
- [x] 48 output templates across 5 audiences
- [x] 24 diagnostics + 21 playbooks
- [x] 9 industry packs with benchmarks
- [x] Board simulation with 10 personas
- [x] Implementation tracking + support
- [x] Solo, Stoic, and Language modes
- [x] Claude Code + Codex + OpenClaw support
- [ ] Community-contributed skills and packs
- [ ] Anonymous cross-user benchmarks
- [ ] Live data integration (CRM, analytics)
- [ ] Predictive diagnostics
- [ ] Adaptive playbooks

---

## Built By

**Fatih Guner**, founder of [Komunite](https://komunite.com.tr/) (Türkiye's largest entrepreneurship community) and [Lokomotif AI](https://lokomotif.ai/) (corporate AI adoption). Built Foreman after watching thousands of entrepreneurs struggle with the same strategic blind spots.

[𝕏 @fatihguner](https://x.com/fatihguner) · [LinkedIn](https://linkedin.com/in/fatihguner)

---

## License

[MIT](./LICENSE). Fatih Guner, 2026.

---

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="./assets/logo-foreman-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="./assets/logo-foreman.svg">
    <img src="./assets/logo-foreman.svg" alt="Foreman" width="80">
  </picture><br><br>
  <sub>Open source under MIT. Built for the 99% of entrepreneurs who will never hire McKinsey, and shouldn't have to.</sub>
</p>
