# Skill Authoring Guide

Every skill in Foreman is a self-contained strategic framework that an entrepreneur can apply independently or that an agent can invoke programmatically. A well-written skill reads like a concise chapter from a first-rate business book -- analytical, precise, and immediately actionable. A poorly written skill reads like a blog post. This guide ensures you produce the former.

---

## 1. Before You Start

Three prerequisites before you write a single line.

**Understand the schema.** Read `.claude/skills/_schema/skill-template.md` in full. The template defines eight required sections and the complete frontmatter specification. Every field and every section exists for a reason -- agents rely on the frontmatter for programmatic selection, and entrepreneurs rely on the body sections for practical application.

**Read three existing skills for reference.** Not skimming -- reading. These three demonstrate the standard:

- `skills/frameworks/blue-ocean-strategy.md` -- Exemplary use of the ERRC Grid as an internal structure, strong metaphorical opening, and precise noncustomer analysis. Study the anti-patterns section for specificity.
- `skills/frameworks/porters-five-forces.md` -- The canonical reference for depth. Note the provocative opening ("Most people use Porter's Five Forces wrong"), the ASCII diagrams, and how each force includes a direct startup implication.
- `skills/storytelling/building-story-stakes.md` -- Advanced skill with five named techniques, demonstrating how to adapt structure to content rather than forcing every skill into the same shape.

**Check whether the skill already exists.** Search the 158 existing skills by name, tags, and description. Run `scripts/validate-skills.sh` to see the current inventory. If a similar skill exists, consider whether yours offers a genuinely distinct framework or merely restates existing content with different vocabulary.

---

## 2. Creating the File

Two paths:

**Automated:** Run `scripts/new-skill.sh` and follow the prompts. The script creates a correctly named file in the right directory with all frontmatter fields and section placeholders pre-populated.

**Manual:** Copy `.claude/skills/_schema/skill-template.md` into the appropriate category directory under `.claude/skills/`. Rename the file using kebab-case (e.g., `value-chain-analysis.md`). Replace all placeholder content.

Place the file in the category directory that matches its source material. If contributing a skill from a new book, create the category directory first and register the book in `CLAUDE.md` under "Current Source Books."

---

## 3. Frontmatter Guide

The YAML frontmatter is not decorative metadata -- it is the interface through which agents discover, filter, and invoke skills. Every field must be precise.

**`name`** -- Kebab-case, lowercase + numbers + hyphens only, max 64 chars, unique across all skills. Example: `"value-chain-analysis"` (not `"Value Chain Analysis"` or `"value_chain_analysis"`).

**`description`** -- Third-person, max 1024 chars. Must include trigger terms that agents and entrepreneurs would search for. Write it as if answering: "When should Foreman invoke this skill?" Example: `"Applies Value Chain Analysis to identify activities where a company creates or destroys value. Use when optimizing operations, evaluating make-vs-buy decisions, or diagnosing margin pressure."`

**`version`** -- Always start at `1.0.0`. Follow semver: major for structural breaks, minor for content additions, patch for fixes.

**`category`** -- Must exactly match the directory name. Skill in `skills/frameworks/` = category `frameworks`.

**`complexity`** -- Choose by the framework's cognitive demands, not by authoring difficulty:

| Level | Criteria | Example |
|-------|----------|---------|
| `basic` | Single concept, direct application | Eisenhower Matrix, SMART Goals |
| `intermediate` | Multi-component, requires analytical skill | Porter's Five Forces, Blue Ocean Strategy |
| `advanced` | Complex system, requires synthesis | Scenario Planning, Systems Thinking |

**`stage`** -- Array from: `idea`, `validation`, `early-traction`, `growth`, `scale`. Select only stages where the skill genuinely applies -- most skills fit 2-4. Thoughtless inclusion of all five degrades agent filtering.

**`tags`** -- 4-6 searchable keywords. Include both the framework name and the problems it solves. Avoid duplicating the category name.

**`related_skills`** -- 4-7 cross-references by `name`. Mix same-category and cross-category. Each must represent a genuine intellectual connection. Good: `blue-ocean-strategy` to `porters-five-forces` (one diagnoses structure, the other escapes it). Bad: `blue-ocean-strategy` to `smart-goals` (no conceptual link).

**`author`** -- Your name. Contributor attribution, not anonymized.

---

## 4. Body Sections

Each skill requires eight sections. The template provides the structure; this guide explains what makes each section succeed or fail.

### Opening

The opening is the skill's first impression. It must command attention within two sentences. No throat-clearing. No preamble. No "In today's competitive landscape..."

**Five opening strategies (rotate across skills):**

1. **Paradox:** "Most people use Porter's Five Forces wrong." -- Challenges the reader's assumption about a familiar concept.
2. **Vivid metaphor:** "Picture the ocean. In red waters, sharks circle." -- Creates a visual anchor that carries through the entire skill.
3. **Data point:** "Cirque du Soleil earns more per show than Ringling Brothers ever did, with a fraction of the cast." -- A surprising fact that demands explanation.
4. **Counter-intuitive claim:** "The most profitable strategic move is not to compete better but to stop competing entirely." -- Provokes intellectual engagement.
5. **Concrete scene:** "When our co-founder was twenty-six, she bet her entire savings on a product nobody believed would work." -- Drops the reader into a moment.

Every opening must be unique across all skills. Run a search before finalizing yours.

### Core Framework

This is the intellectual substance -- the framework explained with depth, precision, and appropriate structure. Adapt the internal structure to the content:

- **Tables** for comparison frameworks (Red Ocean vs. Blue Ocean)
- **Step-by-step sequences** for process frameworks (Kotter's Change Model)
- **Matrices** for two-dimensional analyses (Growth-Share Matrix)
- **Decision trees** for conditional logic (Thomas-Kilmann Conflict Modes)
- **Narrative** for conceptual frameworks (Systems Thinking)

Do not force every skill into the same structural mold. A framework about storytelling should not look identical to a framework about financial analysis.

### Prompts

3-5 copy-paste ready AI prompts, progressing from simple to complex. Each must be immediately usable -- paste into a conversation, receive actionable output. Include context variables in brackets: `[describe your industry]`, `[list competitors]`. Bad: "Help me apply this framework." Good: a prompt specifying context, inputs, and desired output format.

### Use Cases

2-4 concrete entrepreneurial scenarios. Each specifies **stage**, **sector**, **specific situation**, and **how the framework applies in practice**. Bad: "A startup uses this framework to improve strategy." Good: "A $10M ARR vertical SaaS company faces declining margins. The Five Forces analysis reveals buyer power has increased as three enterprise customers now represent 55% of revenue."

### Anti-Patterns

When NOT to use this framework and common mistakes when applying it. Minimum three. Each names the mistake, explains why it fails, and indicates the consequence. This section separates rigorous guidance from generic advice.

### By Stage

How application differs across at least three stages. Use a table for scanning, with narrative below where elaboration adds value. The key question: what changes as the company matures?

### Output Template

A fill-in-the-blank Markdown template for presenting results. Target a specific audience (investor, board, team, self). Use code blocks for copy-paste readiness.

### Related Skills

4-7 cross-references with one-sentence explanations of WHY each is related. Bad: "Blue Ocean Strategy -- another strategy framework." Good: "Five Forces diagnoses the competitive structure of the red ocean; Blue Ocean Strategy charts the escape route."

---

## 5. Differentiation Strategy

The greatest risk in a 158-skill system is homogeneity. Every skill must feel distinct. Apply deliberate variation across:

| Dimension | Technique |
|-----------|-----------|
| Opening | Rotate: paradox, metaphor, data, counter-intuitive claim, scene |
| Narrative voice | Match the framework: pragmatic tools get direct language, visionary frameworks get expansive language, analytical tools get precise language |
| Internal structure | Vary: tables vs. scenarios vs. Q&A vs. steps vs. decision trees |
| Rhythm | Alternate sentence length. Avoid repeating the same paragraph cadence across skills |
| First word | Never start two skills with the same word or sentence structure |

Read the two skills adjacent to yours in the same category. If your skill sounds like either of them, revise until it does not.

---

## 6. Quality Checklist

Complete every item before submitting a pull request:

- [ ] All frontmatter fields present, correctly formatted, `name` unique and kebab-case
- [ ] `description` includes trigger terms (under 1024 chars); `stage` reflects genuine applicability
- [ ] `related_skills` has 4-7 entries mixing same-category and cross-category
- [ ] Opening is strong, unique, contains no prohibited phrases
- [ ] Core Framework structure matches the content type (tables, steps, matrices, etc.)
- [ ] 3-5 copy-paste prompts progressing in complexity
- [ ] 2-4 use cases with specific stage, sector, and situation
- [ ] 3+ anti-patterns that are specific, not generic
- [ ] By Stage covers 3+ stages; output template is fill-in-the-blank
- [ ] Related Skills explain WHY each connection exists
- [ ] No author names in body; no prohibited phrases; voice matches style guide
- [ ] `scripts/validate-skills.sh` and `scripts/broken-refs.sh` both pass

---

## 7. Common Mistakes

These are the errors that skill authors commit most frequently. Learn from their predecessors.

**Generic openings.** "This framework helps entrepreneurs make better decisions." This tells the reader nothing and earns no attention. The opening must be specific to THIS framework.

**Identical structure across skills.** Every skill opens with a paragraph, then a table, then bullet points, then prompts. The result is 158 files that feel like the same file with different words. Vary the internal architecture deliberately.

**Shallow anti-patterns.** "Don't apply this framework incorrectly" is not an anti-pattern. An anti-pattern names the specific mistake, explains the mechanism of failure, and indicates the consequence. Compare: "Using Five Forces as a static snapshot produces a historical artifact rather than a strategic tool."

**Prompts that are too vague.** "Help me apply this framework to my business" is not a prompt -- it is a wish. A good prompt specifies the context, the inputs, and the desired output format.

**Over-broad stage mapping.** Selecting all five stages because the framework "could" apply everywhere. Could is not should. Every stage tag should represent a context where the framework delivers genuine, differentiated value.

**Missing cross-category references.** Listing only related skills from the same category. The most valuable connections are cross-category: a leadership skill referencing a game-theory skill, a writing skill referencing a storytelling skill.

**Anonymization failures.** Referencing source book authors by name. All content is anonymized. Refer to "the framework" or "the research" rather than "Porter argues" or "Kim and Mauborgne suggest."

---

## 8. Examples of Good Skills

Study these three files as models of craft:

1. **`skills/frameworks/blue-ocean-strategy.md`** -- Demonstrates vivid metaphorical opening, ERRC Grid as structured analysis, three tiers of noncustomers as layered depth, and a feasibility test that moves beyond theory. The anti-patterns section names five specific failure modes with explanations of mechanism.

2. **`skills/frameworks/porters-five-forces.md`** -- The gold standard for depth. Each of the five forces includes an ASCII diagram, a startup-specific implication table, and a synthesis section that ties the analysis together. The opening challenges the reader's assumptions about a well-known framework.

3. **`skills/storytelling/building-story-stakes.md`** -- Proof that skills need not follow a rigid template. Five named techniques (Elephant, Backpack, Breadcrumbs, Hourglass, Crystal Ball) are explained with concrete examples drawn from entrepreneurial contexts. The "Big Story Little" principle shows how to add supplementary concepts without losing focus.

Read all three. Then write yours.
