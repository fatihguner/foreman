---
name: "post-simulation-diagnostic"
description: "Diagnostic that runs automatically after a board simulation to identify root causes of weak performance and route the entrepreneur to skills, research guides, and templates that address specific gaps. Unlike other diagnostics, the symptoms here are simulation scores, not entrepreneur-reported problems."
entry_symptoms:
  - "Low clarity score in simulation"
  - "Weak evidence across claims"
  - "Incoherent strategy under questioning"
  - "Hidden or unacknowledged risks"
  - "Poor response quality under pressure"
possible_diagnoses:
  - knowledge-gap
  - evidence-gap
  - narrative-weakness
  - risk-blindness
  - confidence-deficit
  - strategic-incoherence
routes_to_skills:
  - storytelling-for-leaders
  - story-structure-and-arc
  - building-story-stakes
  - porters-five-forces
  - business-model-canvas
  - swot-pest-analysis
  - scenario-planning
  - enemies-of-clear-thinking
  - evaluating-and-deciding
routes_to_templates:
  - quarterly-strategic-review
  - fundraising-deck-outline
  - unit-economics-snapshot
  - competitive-landscape-brief
  - quarterly-strategic-review
author: "Fatih Guner"
---

# Post-Simulation Diagnostic

Most diagnostics begin with a founder describing a problem. This one begins with data. The simulation has already run, the scores have already been calculated, and the weaknesses have already surfaced. The founder does not need to self-report -- the performance record speaks. What remains is interpretation: understanding whether a low score reflects a gap in preparation, a gap in delivery, or a gap in strategic thinking, and routing the founder to the system resources that close each gap.

This diagnostic runs automatically at the conclusion of every simulation. It can also be triggered manually via `/simulate score` to re-examine past results.

---

## Entry Symptoms

The post-simulation diagnostic evaluates five symptom categories, each mapped directly to a scoring dimension:

- **Low Clarity (score 1-2)** -- The presentation was disorganized, unfocused, or difficult to follow. The audience struggled to identify the key message.
- **Weak Evidence (score 1-2)** -- Claims were asserted without data. Projections lacked methodology. Questions about evidence were deflected.
- **Incoherent Strategy (score 1-2)** -- Strategic elements contradicted each other. Goals did not connect to actions. Resource allocation mismatched stated priorities.
- **Hidden Risks (score 1-2)** -- Risks were not acknowledged, not quantified, or actively concealed. Downside scenarios were absent or dismissed.
- **Poor Response Quality (score 1-2)** -- Under questioning, the founder became defensive, evasive, or repetitive. Follow-up questions were handled worse than initial questions.

A simulation may trigger multiple symptom categories. The triage below processes them in priority order.

---

## Triage Questions

### Level 1: Content vs. Delivery

**Q1: For each dimension scoring below 3, was the weakness a content gap or a delivery gap?**

- **Content gap** -- The founder did not have the information. When asked about unit economics, the numbers did not exist. When asked about competitors, the research had not been done. When asked about risks, they had not been considered. --> Proceed to Level 2A (Content Diagnosis).
- **Delivery gap** -- The founder had the information but could not communicate it under pressure. The data existed in the deck but was not articulated. The risk analysis was prepared but not surfaced. The strategy was sound but its coherence was not conveyed. --> Proceed to Level 2B (Delivery Diagnosis).
- **Both** -- Some weaknesses are content, others are delivery. --> Process each gap separately.

### Level 2A: Content Diagnosis

**Q2A: Which content is missing?**

- Market data, competitive intelligence, or customer evidence is absent --> **Diagnosis: Evidence Gap.** Route to research guides.
- Financial metrics, unit economics, or projections lack foundation --> **Diagnosis: Knowledge Gap.** Route to financial frameworks and data collection.
- Strategic elements do not connect or contradict each other --> **Diagnosis: Strategic Incoherence.** Route to strategy frameworks.
- Risks were not identified because they were not considered --> **Diagnosis: Risk Blindness.** Route to scenario planning and risk frameworks.

### Level 2B: Delivery Diagnosis

**Q2B: What is the nature of the delivery failure?**

- The information existed but the presentation structure buried it --> **Diagnosis: Narrative Weakness.** Route to storytelling and communication skills.
- The founder had prepared answers but froze or became defensive under questioning --> **Diagnosis: Confidence Deficit.** Route to repeated simulation with friendly-challenger persona and response coaching.
- The founder could state facts but could not connect them into a coherent argument --> **Diagnosis: Strategic Incoherence (Delivery Variant).** Route to thinking skills and clear communication frameworks.

---

## Diagnosis Map

| Diagnosis | Trigger Condition | Root Cause | Severity |
|-----------|-------------------|------------|----------|
| **Knowledge Gap** | Evidence score 1-2, content gap confirmed | The data required for credible claims does not exist or has not been gathered | High -- cannot be solved by practice alone |
| **Evidence Gap** | Evidence score 1-2, data exists elsewhere but not in the presentation | Research has been done but not integrated into the material | Medium -- addressable by template revision |
| **Narrative Weakness** | Clarity score 1-2, delivery gap confirmed | The founder cannot structure information for an audience | Medium -- addressable by storytelling skills |
| **Risk Blindness** | Risk Awareness score 1-2, content gap confirmed | The founder has not considered what can go wrong | High -- indicates strategic immaturity |
| **Confidence Deficit** | Response Quality score 1-2, delivery gap confirmed | The founder knows the material but cannot perform under pressure | Medium -- addressable by repeated simulation |
| **Strategic Incoherence** | Strategic Coherence score 1-2, any gap type | The strategy contains internal contradictions or disconnected elements | High -- requires strategic rework, not just presentation polish |

---

## Routing

### Knowledge Gap
- **Research guides:** `market-sizing-worksheet`, `competitor-research-template`, `customer-interview-guide`, `data-collection-plan`, `pricing-research-guide`
- **Skills:** `business-model-canvas`, `porters-five-forces`
- **Action:** Gather the missing data before re-simulating. The presentation cannot be defended if the underlying evidence does not exist.

### Evidence Gap
- **Templates:** `unit-economics-snapshot`, `competitive-landscape-brief`, `fundraising-deck-outline`
- **Skills:** `swot-pest-analysis`
- **Action:** Revise the output template to integrate existing research. The data exists; it needs to be surfaced in the material.

### Narrative Weakness
- **Skills:** `storytelling-for-leaders`, `story-structure-and-arc`, `building-story-stakes`
- **Templates:** `quarterly-strategic-review`, `quarterly-strategic-review`
- **Action:** Rebuild the presentation structure using narrative frameworks. Focus on the arc: problem, insight, solution, evidence, ask.

### Risk Blindness
- **Skills:** `scenario-planning`, `swot-pest-analysis`
- **Research guides:** `due-diligence-research`
- **Action:** Conduct a structured risk analysis before re-simulating. Model at least two downside scenarios with specific triggers and mitigations.

### Confidence Deficit
- **Simulation:** Re-run with `friendly-challenger` persona at reduced intensity. Build response fluency through repetition.
- **Skills:** `storytelling-for-leaders`, `enemies-of-clear-thinking`
- **Action:** Practice is the only remedy. Simulate again. The anxiety decreases with each repetition; the competence increases.

### Strategic Incoherence
- **Skills:** `business-model-canvas`, `porters-five-forces`, `enemies-of-clear-thinking`, `evaluating-and-deciding`
- **Playbooks:** `strategy-reset-playbook`
- **Action:** The strategy itself requires revision, not just the presentation. Apply strategic frameworks to rebuild coherence before preparing a new deck.

---

## Red Flags

- **Composite score below 2.0 with no prior simulation history:** The founder may be presenting material they do not understand. Verify whether they authored the output template themselves or received it from a third party.
- **Response Quality score of 1 with all other dimensions above 3:** Performance anxiety or lack of live presentation experience. This is the most addressable weakness -- pure practice deficit.
- **Risk Awareness score of 1 across multiple simulations:** Persistent risk blindness suggests a cognitive pattern, not a preparation gap. Route to `scenario-planning` skill and Stoic mode's premeditatio malorum framework.
- **Declining scores across consecutive simulations:** The founder may be fatigued or demoralized. Recommend a pause, then re-simulate with `friendly-challenger` to rebuild confidence before returning to harder personas.
- **All dimensions score 4+ but composite is 3 due to one catastrophic dimension:** A single fatal weakness. Concentrate all preparation effort on that dimension before the live meeting.
