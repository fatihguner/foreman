# Playbook Authoring Guide

A playbook is not a list of skills. It is a chain -- each step's output becomes the next step's input, checkpoints gate progression, and decision points force the entrepreneur to confront reality before proceeding. If a skill is a single tool, a playbook is the blueprint for building something with several tools in the right order.

---

## 1. What Makes a Good Playbook

Three qualities separate a strong playbook from a decorated to-do list.

**Sequential dependency.** Step 2 cannot be completed without Step 1's output. The revenue diagnosis must precede the financial decision because the decision depends on the diagnosis. If the steps can be executed in any order, you have written a skill collection, not a playbook.

**Decision points.** Every playbook encounters a moment where the path must branch. "Is this a financial crisis or a people crisis?" "Is the business actually ready to raise?" These gates prevent the entrepreneur from sleepwalking through a sequence that no longer applies to their situation.

**Compressed value.** A playbook delivers in hours what would otherwise take weeks of unfocused effort. The constraint is not comprehensiveness but discipline -- selecting the minimum necessary steps and executing them with maximum rigor.

Study these three playbooks before writing yours:

- `playbooks/product-market-fit-playbook.md` -- Six-step iterative chain with a recurring decision point. Demonstrates how to handle playbooks that cycle rather than terminate.
- `playbooks/crisis-playbook.md` -- Five steps designed for speed under pressure. The decision point after Step 2 branches the entire remaining sequence based on crisis type.
- `playbooks/fundraising-playbook.md` -- Seven-step sequential chain where each analytical output feeds the next. The decision point after Step 1 can halt the entire playbook.

---

## 2. Creating the File

**Automated:** Run `scripts/new-playbook.sh` and follow the prompts. The script creates a correctly named file in `.claude/playbooks/` with all frontmatter fields and section placeholders.

**Manual:** Copy `.claude/playbooks/_schema/playbook-template.md` into `.claude/playbooks/`. Rename using kebab-case (e.g., `international-expansion-playbook.md`). Replace all placeholder content.

---

## 3. Frontmatter Guide

**`trigger_diagnostics`** -- Array of 1-3 diagnostic names that route to this playbook. Must reference existing files in `.claude/diagnostics/`.

**`steps`** -- The core of the frontmatter. Each step has three fields: `skill` (must reference an existing skill name), `purpose` (one sentence on what this step accomplishes at this position), and `output` (what it produces, precise enough for the next step to consume).

```yaml
steps:
  - skill: "business-model-canvas"
    purpose: "Map current assumptions -- every block is a hypothesis until validated"
    output: "Annotated canvas with each block rated by evidence level"
```

**`final_outputs`** -- Array of output template names produced upon completion. Must reference existing templates in `.claude/output-templates/`.

**`estimated_duration`** -- Honest range with context: "2-4 hours" for crisis, "8-15 hours across 2-4 weeks" for fundraising. Under-estimating erodes trust.

**`complexity`** -- `basic`, `intermediate`, or `advanced`. Most playbooks are intermediate or advanced.

**`stage`** -- Array of applicable stages. Be selective -- a PMF playbook applies at idea and validation, not at scale.

---

## 4. Designing the Sequence

### Choosing Which Skills to Chain

Three selection criteria: (1) Does this skill produce an output the next step requires? If not consumed downstream, it does not belong. (2) Does the skill address a distinct dimension? Two skills on the same dimension should be consolidated. (3) Is the analysis necessary for the final decision? "Nice to have" is not "necessary to proceed."

### Ordering the Steps

Follow the natural logic of problem-solving:

1. **Diagnosis first** -- What is actually happening? (Revenue diagnosis, team assessment, problem definition)
2. **Analysis second** -- What does this mean? (Competitive analysis, SWOT, five forces)
3. **Decision third** -- What should we do? (Decision frameworks, negotiation preparation, kill criteria)
4. **Communication last** -- How do we present this? (Narrative construction, deck structure, writing)

Resist the temptation to begin with communication. Founders who build the pitch deck before understanding their unit economics have the sequence backwards. Playbooks enforce the correct order.

### Step Count

Maximum seven steps. Fewer is better. The crisis playbook accomplishes its purpose in five; the fundraising playbook uses seven -- the ceiling. If your playbook exceeds seven, either the scope is too broad (split it) or steps can be combined.

### Step Structure

Every step in the body needs six elements:

- **Purpose:** Why this step exists and why it comes at this position
- **Key questions:** The 2-3 questions this step must answer
- **Input:** What the entrepreneur brings (Step 1) or what the previous step produced (Steps 2+)
- **Output:** What this step delivers -- specific enough to serve as the next step's input
- **Time:** Realistic estimate for this individual step
- **Checkpoint:** How to validate the output before proceeding. What would cause you to stop, revisit a previous step, or exit the playbook entirely

---

## 5. Decision Points

Every playbook needs at least one decision point -- a moment where the entrepreneur evaluates the evidence gathered so far and chooses a path. Without decision points, the playbook is a conveyor belt that processes regardless of context.

**Placement:** After diagnostic or analytical steps, before action steps. The crisis playbook branches after Steps 1-2; the fundraising playbook gates after Step 1.

**Structure:** State the condition, then define branches. At least one branch must redirect, pause, or terminate the playbook. "Continue to the next step" is not a branch -- it is a formality. Example: "If X, proceed. If Y, exit and route to [alternative]. If unclear, return to the previous step with refined questions."

---

## 6. Checkpoints

Each step's checkpoint gates progression to the next step. Effective checkpoints share three properties:

**Specific.** "The root cause must be named" is specific. "Ensure the analysis is complete" is not.

**Falsifiable.** The checkpoint should make it possible to fail. "If unit economics are negative with no credible path to positive, stop" creates a real gate. "Review the output" creates the illusion of a gate.

**Actionable on failure.** When the checkpoint is not met, the playbook must specify what to do: return to a previous step, exit the playbook, or invoke an alternative sequence.

From the crisis playbook: "The root cause must be specific. 'Revenue is down' is not a diagnosis. 'Enterprise churn increased 40% after Q2 price increase while SMB acquisition held steady' is a diagnosis. Do not proceed until the cause is named."

This checkpoint is specific, falsifiable, and blocks progression until met.

---

## 7. Final Deliverables

Every playbook terminates with concrete outputs mapped to output templates and audiences. Every template referenced must exist in `.claude/output-templates/`. Include at least two deliverables targeting different audiences. The purpose column describes what each communicates, not just the template name.

---

## 8. Common Pitfalls

**Steps without dependency.** If Step 3 does not consume the output of Step 2, the sequence is arbitrary. Reorder or remove.

**Missing decision points.** A seven-step playbook with no branches assumes that every entrepreneur who begins the sequence should complete it identically. That assumption is nearly always wrong.

**Vague checkpoints.** "Ensure alignment before proceeding" is a non-checkpoint. Name the specific condition, the evidence required, and the consequence of failure.

**Scope creep.** A playbook that tries to solve everything solves nothing. The fundraising playbook does not address whether to raise -- it addresses how to raise. The crisis playbook does not prevent crises -- it structures the response. Define the boundary and respect it.

**Ignoring adaptation notes.** An early-traction founder runs the crisis playbook differently than a scale-stage company. The adaptation notes section exists to acknowledge these differences explicitly. Omitting it implies the playbook is stage-agnostic, which is rarely true.

---

## 9. Testing Your Playbook

Before submitting a pull request, walk through the playbook with a realistic scenario:

1. Execute each step mentally, noting what output you would produce
2. Hit the decision point -- do the branches make sense?
3. Verify each checkpoint is assessable by a founder without external help
4. Produce the final deliverables in outline to confirm sufficient material
5. Time the walkthrough against your estimated duration
6. Run `scripts/validate-skills.sh` and `scripts/broken-refs.sh` to verify all references

If any step feels forced, the sequence needs revision. If the decision point lacks consequence, it needs teeth.

---

## 10. Examples of Good Playbooks

**`playbooks/product-market-fit-playbook.md`** -- Model for iterative playbooks. Six steps with a recurring decision point that creates a cycle. Adaptation notes distinguish idea-stage from validation-stage with actionable specificity.

**`playbooks/crisis-playbook.md`** -- Model for compressed, high-urgency playbooks. Five steps, three-branch decision point after Step 2. Each checkpoint is concrete and falsifiable.

**`playbooks/fundraising-playbook.md`** -- Model for comprehensive, multi-week playbooks. Seven steps where analytical outputs feed narrative construction. The decision point after Step 1 can halt the entire playbook.

Read all three. Then write yours.
