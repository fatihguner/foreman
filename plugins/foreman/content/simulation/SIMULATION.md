<!-- author: Fatih Guner -->

# Board Simulation -- Adversarial Rehearsal for High-Stakes Presentations

Every competent founder can produce a board deck. Fewer can defend one. The gap between preparing a document and surviving the room where that document is questioned, challenged, and dismantled by experienced investors is vast, consequential, and almost never rehearsed. Founders spend weeks perfecting slides and hours memorizing talking points, then walk into a board meeting or investor pitch with zero practice at the one skill that determines the outcome: responding under pressure.

Board Simulation closes that gap. It places the entrepreneur in an adversarial role-play with an AI that assumes the persona of a specific board archetype -- the relentless skeptic, the operational inquisitor, the financial hawk, the industry veteran, or the supportive challenger. The simulation takes the entrepreneur's own output template (board update, investor deck, strategic review) as input, interrogates it across 5-7 rounds, scores the performance, identifies weaknesses, and persists the results so improvement can be tracked over time.

This is not a friendly review. It is a rehearsal for a room that will not be friendly.

---

## Why Simulation Matters

Three reasons:

1. **Knowledge does not equal articulation.** A founder may understand unit economics deeply and still fumble when a board member asks "Why is your CAC rising faster than LTV?" The gap between knowing and communicating under pressure is a separate skill.
2. **Documents hide weaknesses.** A polished deck can obscure thin evidence, incoherent strategy, or unaddressed risks. Live questioning exposes what the document conceals.
3. **Confidence is trained, not innate.** The founder who has rehearsed against a hostile persona five times enters the real meeting differently than the one who has rehearsed zero times. The questions will not be identical, but the muscle memory of composure will be.

---

## Three Simulation Types

### Board Meeting Simulation

Replicates a formal board meeting where the entrepreneur presents a company update and fields questions from a seated board member. Typical duration: 5-7 rounds of Q&A. Input: any board-audience output template (board update, quarterly review, strategic review). The persona reads the material, then interrogates it.

### Investor Pitch Simulation

Replicates a VC pitch meeting -- shorter, higher stakes, faster pace. The persona plays a potential investor hearing the pitch for the first time. Typical duration: 5-6 rounds. Input: any investor-audience output template (fundraising deck, unit economics snapshot, competitive landscape brief). Focus areas: market size, traction proof, team credibility, return thesis.

### Due Diligence Simulation

Replicates a technical DD session where every claim is verified and every number is traced to its source. The persona plays a DD analyst or lead investor during a later-stage evaluation. Typical duration: 6-7 rounds. Input: financial models, due diligence materials, operational data. Focus areas: data integrity, assumption validity, risk disclosure, legal and financial exposure.

---

## How a Simulation Works

**Step 1 -- Select simulation type.** The entrepreneur chooses board meeting, investor pitch, or due diligence via `/simulate board`, `/simulate investor-pitch`, or `/simulate due-diligence`.

**Step 2 -- Choose or receive a persona.** The entrepreneur specifies a persona (e.g., `--persona skeptic-investor`) or the system assigns one based on the entrepreneur's weakest scoring dimension from prior simulations. First-time users receive `friendly-challenger` by default.

**Step 3 -- Present material.** The entrepreneur provides an output template as the basis for the simulation. The persona reads and internalizes the material before questioning begins.

**Step 4 -- Q&A rounds (5-7 rounds).** The persona asks questions in character, probing weaknesses, challenging assumptions, and testing the entrepreneur's command of the material. Each round consists of one question or follow-up and the entrepreneur's response. The persona adapts based on the quality of responses -- weak answers trigger harder follow-ups.

**Step 5 -- Scoring.** After the final round, the system scores the performance across five dimensions (see Scoring Framework below). Scores range from 1 to 5 per dimension with a weighted composite.

**Step 6 -- Weakness analysis.** The system identifies the 2-3 most significant weaknesses revealed during the simulation and classifies them as content gaps (missing data, thin evidence) or delivery gaps (had the data but could not articulate it).

**Step 7 -- Memory persistence.** Simulation results are written to the history memory layer, enabling the entrepreneur to track improvement across multiple simulations. The post-simulation diagnostic runs automatically to route weaknesses to relevant skills and research guides.

---

## The Persona System

Five board personas, each with a distinct worldview, questioning style, and set of priorities. Personas are not caricatures -- they represent real archetypes found in boardrooms and investor meetings worldwide.

| Persona | Archetype | Primary Concern | Recommended For |
|---------|-----------|-----------------|-----------------|
| `skeptic-investor` | "Show me the money" | Market assumptions and growth projections | Founders preparing for fundraising |
| `operational-expert` | "How will you actually do this?" | Execution capability and operational plans | Founders with ambitious roadmaps |
| `financial-hawk` | "Where are the numbers?" | Unit economics, burn, and capital efficiency | Founders presenting financial models |
| `industry-veteran` | "I have seen this before" | Market dynamics and competitive positioning | Founders in competitive or regulated markets |
| `friendly-challenger` | "Help me believe in this" | Overall story coherence and preparedness | First-time simulation users |

Persona files reside in `.claude/simulation/board-personas/`. Each defines the persona's questioning style, priority areas, typical questions, what impresses them, what triggers their skepticism, and their scoring bias.

---

## Scoring Framework

Five dimensions, each scored 1-5. Full specification in `simulation-scoring.yaml`.

1. **Clarity** -- Was the presentation structured, focused, and comprehensible?
2. **Evidence** -- Were claims backed by data, research, or credible reasoning?
3. **Strategic Coherence** -- Does the strategy hold together? Are goals, actions, and resources aligned?
4. **Risk Awareness** -- Were risks identified, quantified, and mitigated -- or concealed?
5. **Response Quality** -- Under direct questioning, did the entrepreneur defend, adapt, or collapse?

Each persona weights these dimensions differently. The financial hawk weights Evidence and Risk Awareness heavily. The operational expert weights Strategic Coherence and Response Quality. Composite scores produce an overall grade (A-F) with actionable improvement priorities.

---

## Integration with Output Templates

Simulation consumes output templates as input material. The following template audiences serve as natural simulation inputs:

- **Board templates** (7): Board update, quarterly review, strategic plan -- natural inputs for board meeting simulation
- **Investor templates** (10): Fundraising deck, unit economics, competitive landscape -- natural inputs for investor pitch simulation
- **Self templates** (10): Decision journals, retrospectives -- can serve as preparation notes before simulation

The entrepreneur runs `/output [template-name]`, produces the completed document, then runs `/simulate [type]` to rehearse defending it.

---

## Integration with Memory

Simulation results persist across sessions through the memory system.

- **Session layer**: Current simulation state, round history, in-progress scores
- **Active layer**: Most recent simulation results, improvement targets
- **History layer**: All past simulation results with scores, enabling trend analysis

The `/simulate history` command retrieves past results. The system uses historical scores to recommend personas that target the entrepreneur's weakest dimensions and to detect improvement patterns.

---

## Integration with Playbooks

Two playbooks explicitly reference simulation as a final preparation step:

- **`fundraising-playbook`**: After completing the pitch deck and financial model, the playbook recommends running an investor pitch simulation to stress-test the presentation before live meetings.
- **`strategy-reset-playbook`**: After producing the new strategic plan, the playbook recommends a board meeting simulation to rehearse defending the pivot or reset to the board.

Simulation is the bridge between producing the deliverable and presenting it.

---

## Integration with Stoic Mode

When `/stoic on` is active, simulation includes a Stoic reflection moment before the first round begins:

> "Before we begin -- which questions are you most afraid of? That is where the preparation matters most."

This applies the premeditatio malorum principle: the premeditation of adversity. By naming the feared questions before the simulation starts, the entrepreneur confronts anxiety directly rather than allowing it to ambush them mid-session. After the simulation, the Stoic reflection returns: the entrepreneur evaluates which fears materialized, which did not, and what that reveals about the gap between perceived and actual vulnerability.

The dichotomy of control also surfaces in weakness analysis. Content gaps (missing data) are within control -- the data can be gathered. Delivery gaps (articulation under pressure) are trained through repetition, which is also within control. No simulation weakness falls outside the circle of influence.

---

## Integration with Solo Mode

When `/solo` is active, simulation acknowledges the solopreneur context:

- The persona will not ask "Who on your team handles this?" -- it asks "How do you handle this given you are the entire team?"
- Questions about delegation, team depth, and organizational structure are reframed as questions about systems, automation, and personal bandwidth
- The scoring adjustment: solo founders are not penalized for lacking team depth; they are evaluated on whether their systems compensate for it

Solo simulation is harder in one specific way: there is no co-founder or CFO to tag-team difficult questions. The solopreneur must answer everything. The simulation reflects that reality.

---

## Integration with Language Mode

When `/language [code]` is active, the entire simulation runs in the specified language. Persona questions, entrepreneur responses, scoring feedback, and weakness analysis are all delivered in the active language. Internal scoring logic remains English; output is translated. The persona maintains its character and questioning style regardless of language.
