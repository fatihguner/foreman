---
# PERSONA SCHEMA TEMPLATE
# All board personas must follow this structure.
# Copy this file and fill in each section when creating a new persona.

name: "persona-name"                    # Lowercase, hyphenated identifier used in CLI commands (e.g., --persona persona-name)
description: "One-paragraph description of this persona's role, worldview, and questioning style. This appears in help text and persona selection menus."
persona_type: "board-member"            # One of: board-member | investor | advisor | customer | regulator
archetype: "Human-Readable Name"       # Display name shown in simulation output (e.g., "Skeptic Investor")
difficulty: "medium"                    # One of: easy | medium | hard -- governs follow-up intensity and forgiveness
recommended_for:                        # 2-4 scenarios where this persona adds the most value
  - "scenario one"
  - "scenario two"
scoring_bias:                           # Multipliers applied to base dimension scores. 1.0 = neutral. Max recommended: 1.5
  clarity: 1.0
  evidence: 1.0
  strategic_coherence: 1.0
  risk_awareness: 1.0
  response_quality: 1.0
author: "Fatih Guner"
---

# [Archetype Name] Persona

<!-- Opening paragraph: 2-4 sentences establishing tone and worldview. Write in third person. This paragraph sets the emotional register for the entire persona -- it should feel like a character introduction, not a job description. -->

---

## Persona Profile

<!-- Who this person is, what they have seen, and why they question the way they do. -->

**Background:** <!-- Professional history, years of experience, domain expertise, formative experiences that shaped their worldview. -->

**Demeanour:** <!-- How they carry themselves in a boardroom -- tone of voice, body language, energy level, default emotional register. -->

**Core Belief:** <!-- The single conviction that drives every question this persona asks. One sentence. -->

---

## Questioning Style

<!-- How this persona asks questions -- not what they ask, but the method and rhythm. Describe the pattern: do they build slowly or strike immediately? Do they use silence? Do they follow up relentlessly or move on? Are they data-driven, narrative-driven, Socratic, or confrontational? -->

Pattern: <!-- e.g., "opening probe --> follow-up on weakest answer --> escalation --> synthesis question" -->

---

## Priority Areas

<!-- 5-7 numbered topics this persona always probes, regardless of the presentation content. Each entry: bold topic name followed by a dash and a clarifying sentence. -->

---

## Typical Questions

<!-- 10-15 numbered, specific questions this persona would ask. These should sound like real questions from a real person -- not generic templates. Include follow-up variants where natural. -->

---

## What Impresses This Persona

<!-- 3-5 bullet points. Specific founder behaviours, preparation qualities, or response characteristics that earn this persona's respect. -->

---

## What Triggers Skepticism

<!-- 3-5 bullet points. Specific founder behaviours, evasions, or red flags that cause this persona to push harder or lose confidence. -->

---

## Scoring Bias

<!-- 1-2 sentences explaining which dimensions carry elevated weight and why. Reference the specific multipliers from the frontmatter. Explain what a high score and a low score look like for this persona. -->
