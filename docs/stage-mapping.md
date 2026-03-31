# Stage Mapping

Every skill, diagnostic, and playbook in Foreman carries stage tags. The entrepreneur's current stage -- stored in `memory.company.stage` -- determines which frameworks are most relevant, how diagnostics weight their questions, and which playbooks are appropriate. This document defines the five stages, explains how they propagate through the system, and identifies the signals that indicate a transition.

---

## The Five Stages

| Stage | Definition |
|-------|-----------|
| `idea` | Pre-product, exploring the problem space. Revenue is zero. The team is the founder, possibly a co-founder. Primary activity: research, customer conversations, hypothesis formation. |
| `validation` | An MVP exists and assumptions are being tested. The entrepreneur is seeking product-market fit. Revenue may exist but is inconsistent. The team is small and generalist. |
| `early-traction` | Revenue or meaningful user engagement exists. The business model is proving viable but not yet at scale. Unit economics are becoming visible. First hires beyond founders are likely. |
| `growth` | The model works; the task is to scale it. Revenue grows predictably. The team is expanding. The entrepreneur shifts from doing the work to building the organization that does the work. |
| `scale` | Optimizing and expanding into new markets, segments, or geographies. Governance and institutional processes take precedence. The entrepreneur's role shifts to strategic leadership and long-term vision. |

---

## How Stages Affect Skills

Every skill file carries a `stage` array in its frontmatter listing the stages where the framework applies. The same framework often appears at multiple stages, but its application changes materially.

**Example: SWOT Analysis**

| Stage | Application Focus |
|-------|------------------|
| `idea` | Evaluating the viability of the opportunity itself. Strengths and weaknesses are personal (founder capabilities). Opportunities and threats are market-level. |
| `validation` | Assessing product-market fit signals. Strengths shift to product qualities. Weaknesses become gaps in the value proposition. |
| `growth` | Analyzing competitive positioning at scale. Strengths are organizational capabilities. Threats include competitive response to your traction. |
| `scale` | Strategic portfolio evaluation. SWOT applies to business units, market segments, or geographic expansions rather than the core product. |

**Example: Porter's Five Forces**

| Stage | Application Focus |
|-------|------------------|
| `idea` | Industry attractiveness assessment before committing. Are the structural forces favorable? |
| `early-traction` | Understanding which force is most constraining current growth. Buyer power? Supplier dependency? Substitutes? |
| `scale` | Shaping industry structure through strategic moves -- building switching costs, vertical integration, platform effects. |

The skill-executor agent reads the entrepreneur's stage from memory and filters to the relevant stage-specific guidance within each skill.

---

## How Stages Affect Diagnostics

Diagnostics weight their triage questions and diagnosis probabilities based on stage. The same symptom -- "we're not growing" -- points to fundamentally different root causes depending on where the company sits.

| Symptom | At `validation` | At `growth` |
|---------|----------------|-------------|
| "Not growing" | Likely a product-market fit problem. Diagnostic routes to PMF assessment, customer interview analysis. | Likely a channel, pricing, or operational bottleneck. Diagnostic routes to growth-stall analysis, unit economics review. |
| "Running out of money" | Likely premature spending before PMF. Diagnostic probes burn rate relative to learning velocity. | Likely a fundraising timing or revenue scaling problem. Diagnostic probes runway, growth metrics, investor readiness. |
| "Team conflict" | Likely co-founder alignment issues. Diagnostic routes to co-founder conflict diagnosis. | Likely scaling pains -- role ambiguity, cultural dilution. Diagnostic routes to team dysfunction, culture erosion. |

Each diagnostic file defines stage-conditional routing rules that adjust which skills and playbooks are recommended based on the entrepreneur's current stage.

---

## How Stages Affect Playbooks

Playbooks carry stage prerequisites. A playbook designed for growth-stage companies will not activate for an idea-stage entrepreneur without an explicit override. This prevents premature execution of processes that require organizational maturity the company has not yet developed.

| Playbook | Primary Stages | Rationale |
|----------|---------------|-----------|
| `product-market-fit-playbook` | `idea`, `validation` | PMF is the defining challenge of early stages |
| `first-100-customers-playbook` | `validation`, `early-traction` | Customer acquisition before scalable channels exist |
| `fundraising-playbook` | `early-traction`, `growth` | Requires traction data that earlier stages lack |
| `scaling-playbook` | `growth`, `scale` | Assumes a working model to scale |
| `board-formation-playbook` | `growth`, `scale` | Irrelevant before governance structures are needed |
| `international-expansion-playbook` | `scale` | Requires organizational maturity and domestic market stability |

When an entrepreneur requests a playbook outside their current stage, the system warns about the mismatch and suggests alternatives appropriate to their stage.

---

## How to Set Your Stage

Set or update your company stage through the memory system:

```
/update company
```

The system prompts you to confirm or change your stage. The value is stored in `memory.company.stage` and persists across sessions. You can also set the stage directly during any conversation by stating it:

> "We just got our first 50 paying customers last month."

The memory agent infers the stage (`early-traction`) and prompts for confirmation before updating.

To override the stage for a single skill application without changing your stored profile:

```
/apply swot-analysis --stage growth
```

This applies growth-stage guidance while leaving your memory unchanged -- useful for scenario planning or preparing for the next stage.

---

## Stage Transitions

Stages are not rigid categories with hard boundaries. They are lenses that shift the system's recommendations. Transitions happen gradually, but certain signals indicate the shift is underway.

| Transition | Signals |
|-----------|---------|
| `idea` to `validation` | You have built something users can interact with. You are collecting feedback, not just researching. |
| `validation` to `early-traction` | Paying customers exist. Revenue is not yet predictable, but the conversion from interest to payment has occurred. Retention signals are emerging. |
| `early-traction` to `growth` | Revenue growth is repeatable. You understand your acquisition channels. Unit economics are positive or on a clear trajectory. You are hiring beyond the founding team. |
| `growth` to `scale` | The core business model is proven in your primary market. You are expanding to new segments, geographies, or product lines. Organizational structure, not product iteration, is the primary constraint. |

When the system detects that your described situation consistently matches a different stage than what is stored in memory, it prompts you to consider updating.

---

## Common Mistakes

**Applying growth-stage frameworks at validation.** The most frequent error. Entrepreneurs at validation attempt to run scaling playbooks, optimize funnels that do not yet exist, or build organizational processes for a two-person team. At validation, the only question is whether the product solves a real problem for people willing to pay.

**Skipping validation entirely.** Interpreting initial revenue as product-market fit. Early revenue can come from founder-led sales, personal networks, or novelty. Genuine traction requires repeatable acquisition from people who do not know you personally.

**Clinging to an earlier stage.** Continuing to iterate on product when the constraint has shifted to distribution, pricing, or team. The frameworks that served at validation -- customer interviews, MVP testing -- are no longer the highest-leverage tools once traction is real.

**Treating stages as a ladder.** A solopreneur may operate at early-traction indefinitely by design. A lifestyle business may never enter growth stage. The stage system selects the right tools; it does not measure progress on a single axis.

**Ignoring stage-specific anti-patterns.** Every skill includes guidance on when NOT to use the framework. Running a balanced scorecard at idea stage creates the illusion of measurement without anything meaningful to measure.

---

## Interaction with Solo Mode

When solo mode is active, stage interpretations shift. A solopreneur at "growth" is not hiring a team and raising capital -- they are increasing revenue or margin without proportional increases in personal time investment. The stage definitions remain the same, but their practical meaning adapts. See the [Solo Mode documentation](../.claude/solo-mode/SOLO.md) for the complete stage reinterpretation table.
