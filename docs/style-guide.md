# Foreman Style Guide

This document governs how every word in the Foreman repository is written. Skills, playbooks, diagnostics, templates, documentation -- all of it. The voice is the product. Inconsistency in voice is inconsistency in quality.

---

## 1. The Foreman Voice

Foreman writes like the institution you trust most when the stakes are highest: analytical, intelligent, sophisticated, with a thread of dry irony that prevents pomposity. The voice sits at the intersection of three publications:

- **The Economist** -- institutional authority, global perspective, precise language, and the confidence to hold opinions
- **Harvard Business Review** -- intellectual rigor applied to practical management problems, research-backed but never academic
- **McKinsey Quarterly** -- strategic framing, synthesis across disciplines, the ability to make the complex clear without making it simplistic

The result is prose that respects the reader's intelligence, earns attention through substance rather than decoration, and delivers insight with economy.

---

## 2. Tone

**Objective but sharp.** Foreman does not preach. It does not cheerfully encourage. It analyzes, synthesizes, and occasionally delivers a verdict with the quiet confidence of a surgeon explaining a procedure.

**Never ponderous.** Dense does not mean heavy. Every paragraph should move. If a sentence does not advance understanding, it is occupying space that could be occupied by one that does.

**Never didactic.** The reader is an intelligent adult running a business. Write as a peer with specialized knowledge, not as a teacher addressing a student. The difference is subtle but fundamental: "Consider the implications of customer concentration" versus "You should think about your customer concentration." The first treats the reader as a strategist. The second treats them as a novice.

**Dry irony permitted, humor earned.** Wit sharpens prose when it emerges naturally from the material. Forced humor -- jokes, puns, exclamation marks used for enthusiasm -- cheapens the voice. "Plans that work perfectly make terrible stories. Perfect execution is the province of narcissists and thin-skinned egotists" is the correct register.

---

## 3. Structure Rules

**Strong openings.** The first sentence must earn the reader's next sentence. No throat-clearing. Bad: "In this section, we will explore competitive analysis." Good: "Most people use Porter's Five Forces wrong."

**Short, precise paragraphs.** One point per paragraph. Three to five sentences is the working range. Long paragraphs signal muddled thinking.

**Clarity above all.** If a sentence requires re-reading, it has failed. Complexity of thought does not require complexity of expression.

---

## 4. Syntax Rules

**Sentence rhythm.** Alternate short declarative sentences with complex constructions. "Industry structure evolves. Technology shifts, regulatory changes, and new entrants alter the balance of forces continuously." Short. Long. Medium. The rhythm propels the reader.

**"That" vs. "which."** "That" for restrictive clauses (essential to meaning). "Which" for non-restrictive (parenthetical). Use "that" by default.

**Active voice.** Default to active. Passive is acceptable when the actor is unknown or when the object deserves emphasis: "The term sheet was signed within 48 hours."

**Parallel construction.** List items share grammatical structure. "Eliminating factors, reducing complexity, and raising standards" -- not "to raise standards."

---

## 5. Lexicon Rules

**Rich but accessible.** Use the precise word: "diagnose" not "look at," "synthesize" not "put together." But precision is not pretension -- do not use a rare word when a common one is equally exact.

**No cliches.** "Move the needle," "low-hanging fruit," "think outside the box" -- each began as a vivid metaphor and died through overuse. Find the original expression or state the idea directly.

**No jargon for jargon's sake.** "Unit economics" is legitimate -- it compresses a concept efficiently. "Synergize cross-functional alignment vectors" is noise. The test: would plain language lose precision? If not, use plain language.

**Every word earns its place.** Delete "very," "really," "quite," "somewhat," "rather," and "fairly" on sight. These modifiers add nothing.

---

## 6. Voice Rules

**Institutional, not personal.** "The evidence suggests" not "I think." "Analysis reveals" not "we believe." The institutional voice implies guidance from systematic analysis, not personal opinion.

**Authoritative without arrogance.** "Industry structure trumps execution" is authoritative. "We humbly suggest that industry structure might be more important" is a committee afraid of its own opinion. When evidence is mixed, say so directly. False certainty is worse than honest uncertainty.

---

## 7. Absolute Prohibitions

These phrases and patterns are banned from all Foreman content. Each prohibition exists for a specific reason.

| Banned | Reason |
|--------|--------|
| "In today's fast-paced..." | Empty filler that says nothing about any specific context |
| "Let's dive in" / "Let's explore" | False intimacy; the reader does not need an invitation to read |
| "In this skill, you will learn..." | Pedagogical framing that talks down to the reader |
| "Without further ado" | Acknowledges that the preceding text was ado -- which means the preceding text should not have been written |
| "It's important to note that" | If it is important, state it. The importance should be self-evident from the content |
| "At the end of the day" | Cliche that substitutes for actual synthesis |
| Emoji in any file content | Incompatible with the institutional voice |
| Rhetorical questions as paragraph openers (limit: one per file) | Overuse creates a patronizing, quiz-show tone |
| Consecutive paragraphs starting with the same word | Signals structural laziness; rotate constructions |

---

## 8. Anonymization Rule

No source book author may be referenced by name in any skill, playbook, diagnostic, or template. All content is anonymized. The intellectual frameworks are attributed to their systematic form, not to their human originators.

| Instead of | Write |
|------------|-------|
| "Porter argues that..." | "The framework identifies..." |
| "Kim and Mauborgne's research shows..." | "The research demonstrates..." |
| "As Drucker observed..." | "The observation holds that..." |
| "Christensen's theory of disruption..." | "The theory of disruption..." |

This rule applies to body content only. The `CLAUDE.md` source book table and academic citations in framework history sections may reference authors when doing so adds genuine strategic context. When in doubt, anonymize.

---

## 9. Formatting Conventions

**Markdown:** ATX-style headers (`#`, `##`, `###`) -- do not skip levels. Horizontal rules (`---`) between sections. Bold for emphasis, italics for titles and first-use terms. Blockquotes exclusively for copy-paste prompts.

**Tables:** Serve comparison, not decoration. If one sentence suffices, write a sentence. Always include a header row.

**Code blocks:** Fenced (triple backtick) for output templates, ASCII diagrams, and data examples. Not for ordinary emphasis.

**Headers:** `#` H1 (one per file), `##` H2 (major sections), `###` H3 (subsections), `####` H4 (sparingly).

---

## 10. Before/After Examples

Five transformations from weak writing to Foreman-quality prose.

**1. Generic opening**
Before: "Customer discovery is a really important process that every entrepreneur should undertake early in their journey."
After: "The most expensive assumption in entrepreneurship is that you understand your customer. Customer discovery does not confirm what you already believe -- it dismantles it."

**2. Passive, hedging language**
Before: "It could potentially be argued that there might be some benefits to conducting competitive analysis before entering a new market."
After: "Competitive analysis before market entry is not optional. Entering a market without understanding its structure is the strategic equivalent of navigating without a map."

**3. Cliche-laden advice**
Before: "At the end of the day, it's important to think outside the box and move the needle. The low-hanging fruit is to leverage your core competencies."
After: "Competitive advantage emerges from doing fewer things with greater precision. Identify the three capabilities that matter most. Invest in those. Discard the rest."

**4. Pedagogical tone**
Before: "In this section, you will learn about the five forces that shape industry competition. Let's dive in and explore each one."
After: "Five forces determine whether an industry is structurally profitable or structurally hostile. Understanding them determines whether a startup enters a gold mine or a tar pit."

**5. Monotonous rhythm**
Before: "The company should analyze the market. The company should assess the competition. The company should evaluate the team. The company should review the finances."
After: "Start with the market -- its structure, its trajectory, its unmet needs. Then map the competitive landscape. Assess whether the team has the capabilities the opportunity demands. Review the finances with surgical honesty. Only then, make the call."

---

## 11. Self-Editing Checklist

Apply this checklist to every piece of content before submission:

- [ ] Does the opening sentence command attention without throat-clearing?
- [ ] Can every paragraph justify its existence in one clause?
- [ ] Are there any prohibited phrases? (Search the document for each one.)
- [ ] Is the voice institutional rather than personal?
- [ ] Are sentences varied in length and structure?
- [ ] Is every modifier ("very," "really," "quite") deleted or replaced with precision?
- [ ] Are all author names anonymized in body content?
- [ ] Does the prose match the Foreman register -- Economist meets HBR meets McKinsey?
- [ ] Is the formatting consistent with Markdown conventions?
- [ ] Have you read the piece aloud? (Clumsy rhythm reveals itself in speech.)
- [ ] Would a smart, busy entrepreneur finish reading this? If not, why not -- and fix it.
