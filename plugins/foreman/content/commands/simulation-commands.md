---
name: "simulation-commands"
description: "Commands for initiating, configuring, and reviewing board simulation sessions -- adversarial role-play rehearsals where the AI assumes board member personas and challenges the entrepreneur's presentations."
category: "simulation"
commands:
  - name: "/simulate board"
    syntax: "/simulate board [--persona <persona-name>]"
    description: "Start a board meeting simulation with an optional persona selection."
  - name: "/simulate investor-pitch"
    syntax: "/simulate investor-pitch [--persona <persona-name>]"
    description: "Start an investor pitch simulation with higher stakes and faster pace."
  - name: "/simulate due-diligence"
    syntax: "/simulate due-diligence [--persona <persona-name>]"
    description: "Start a due diligence simulation with technical, granular questioning."
  - name: "/simulate score"
    syntax: "/simulate score"
    description: "View the detailed score breakdown from the most recent simulation."
  - name: "/simulate history"
    syntax: "/simulate history"
    description: "View past simulation results with scores and trend analysis."
author: "Fatih Guner"
---

# Simulation Commands

## `/simulate board`

Initiates a board meeting simulation. The system assumes a board member persona, reads the entrepreneur's presentation material, and conducts 5-7 rounds of adversarial Q&A. Optionally accepts a persona flag; defaults to `friendly-challenger` for first-time users or the persona targeting the entrepreneur's weakest dimension for returning users.

| Parameter | Required | Type | Description |
|-----------|----------|------|-------------|
| `--persona` | No | string | Board persona identifier: `skeptic-investor`, `operational-expert`, `financial-hawk`, `industry-veteran`, `friendly-challenger` |

```
/simulate board
--> Starting board meeting simulation
    Persona: friendly-challenger (default for first simulation)
    Provide your board presentation material to begin.

/simulate board --persona skeptic-investor
--> Starting board meeting simulation
    Persona: skeptic-investor
    Provide your board presentation material to begin.

/simulate board --persona financial-hawk
--> Starting board meeting simulation
    Persona: financial-hawk
    Warning: This persona focuses heavily on unit economics. Have your numbers ready.

/simulate board --persona nonexistent
--> Error: Unknown persona "nonexistent". Available: skeptic-investor, operational-expert, financial-hawk, industry-veteran, friendly-challenger.
```

**Error**: No presentation material provided after start returns a prompt: `Please provide your board update, quarterly review, or other board-audience material. You can use /output [template] to generate one first.`

Related: `/simulate score`, `/output board-update`, `/output quarterly-review`.

---

## `/simulate investor-pitch`

Initiates an investor pitch simulation -- shorter, faster, and higher stakes than a board meeting. The persona plays a potential investor hearing the pitch for the first time. Runs 5-6 rounds of Q&A. Same persona options as `/simulate board`.

| Parameter | Required | Type | Description |
|-----------|----------|------|-------------|
| `--persona` | No | string | Board persona identifier (same set as `/simulate board`) |

```
/simulate investor-pitch
--> Starting investor pitch simulation
    Persona: skeptic-investor (default for pitch simulations)
    Provide your pitch deck or investor materials to begin.

/simulate investor-pitch --persona friendly-challenger
--> Starting investor pitch simulation
    Persona: friendly-challenger
    Provide your pitch deck or investor materials to begin.

/simulate investor-pitch --persona industry-veteran
--> Starting investor pitch simulation
    Persona: industry-veteran
    This persona will test your industry knowledge. Prepare for historical precedent challenges.
```

**Error**: Running `/simulate investor-pitch` without investor-audience material returns: `This simulation expects investor-facing material. Use /output fundraising-deck-outline or /output unit-economics-snapshot to prepare.`

Related: `/simulate score`, `/output fundraising-deck-outline`, `/output unit-economics-snapshot`.

---

## `/simulate due-diligence`

Initiates a due diligence simulation -- the most granular and technically demanding format. The persona plays a DD analyst verifying every claim, tracing every number to its source, and stress-testing every assumption. Runs 6-7 rounds. Best suited for later-stage founders preparing for institutional investor scrutiny.

| Parameter | Required | Type | Description |
|-----------|----------|------|-------------|
| `--persona` | No | string | Board persona identifier (same set; `financial-hawk` is the default for DD simulations) |

```
/simulate due-diligence
--> Starting due diligence simulation
    Persona: financial-hawk (default for DD simulations)
    Provide your financial model, data room materials, or operational documentation.

/simulate due-diligence --persona operational-expert
--> Starting due diligence simulation
    Persona: operational-expert
    This simulation will focus on operational due diligence. Prepare process documentation.

/simulate due-diligence --persona skeptic-investor
--> Starting due diligence simulation
    Persona: skeptic-investor
    Provide your financial model and supporting documentation to begin.
```

**Error**: `/simulate due-diligence` without material returns: `Due diligence simulation requires detailed documentation. Provide your financial model, operational data, or use /research due-diligence-research to prepare.`

Related: `/simulate score`, `/research due-diligence-research`, `/output unit-economics-snapshot`.

---

## `/simulate score`

Displays the detailed score breakdown from the most recent simulation, including dimension-level scores, persona weights, composite grade, weakness analysis, and routing to improvement resources. Also triggers the post-simulation diagnostic if it has not yet run.

```
/simulate score
--> Last simulation: board meeting | Persona: skeptic-investor | Date: 2026-03-25
    Clarity:              4/5  (weight: 1.0)
    Evidence:             2/5  (weight: 1.5)  ** Weakest
    Strategic Coherence:  3/5  (weight: 1.0)
    Risk Awareness:       3/5  (weight: 1.3)
    Response Quality:     3/5  (weight: 1.2)
    Composite: 2.9 / 5.0 | Grade: C (Adequate)
    Top weakness: Evidence (content gap -- missing unit economics data)
    Recommended: /research pricing-research-guide, /apply business-model-canvas

/simulate score
--> No simulation results found. Run /simulate board, /simulate investor-pitch, or /simulate due-diligence first.
```

Related: `/simulate history`, `/simulate board`.

---

## `/simulate history`

Displays all past simulation results with dates, types, personas, composite scores, and trend analysis. Enables the entrepreneur to track improvement over time and identify persistent weaknesses.

```
/simulate history
--> 3 simulations on record
    2026-03-10  board           friendly-challenger  C (2.8)
    2026-03-18  investor-pitch  skeptic-investor     C (3.1)
    2026-03-25  board           skeptic-investor     B (3.6)
    Trend: improving (+0.8 over 3 sessions)
    Persistent weakness: Evidence (scored below 3 in all sessions)

/simulate history
--> No simulation history. Run your first simulation with /simulate board.
```

Related: `/simulate score`, `/simulate board`, `/memory`.
