# Output Commands

Reformatting, exporting, and comparing analysis outputs from skills and playbooks.

---

## `/format [audience]`

Reformat the most recent output for a different audience. Content stays identical -- structure, emphasis, vocabulary change per the target template.

**Syntax:** `/format <audience>`

| Parameter | Required | Values | Description |
|-----------|----------|--------|-------------|
| `audience` | Yes | `investor`, `board`, `team` | Maps to the corresponding output template. |

**Examples:**
```
> /format board
SWOT --> board. Strategic Position Q1 2026: Distribution moat via 3 enterprise
partnerships ($2.1M ACV). Threats: 2 funded competitors in mid-market.
Actions: 1) 3 AE hires Q2. 2) Competitive response review.
> /format team
Unit Economics --> team. Action Plan: CAC payback 14mo (target <12), 2.1% trial
conversion. Product: onboarding redesign Apr 15. Marketing: $8K/mo reallocation.
Sales: 30-min onboarding calls for trials >$500 MRR.
> /format investor
Competitive Landscape --> investor. Series A: 12+ players, no dominant platform.
Edge: real-time compliance + automated reporting, 2 patents. Moat: 4-6mo switching cost.
```
**Related:** `/export`, `/compare`
**Errors:** No output: `No recent analysis. Run a skill or playbook first.` Bad value: `Unknown audience. Available: investor, board, team.`

---

## `/export [format]`

Export the most recent output as a file. Filename: `{skill}_{date}.{ext}`.

**Syntax:** `/export <format>`

| Parameter | Required | Values | Description |
|-----------|----------|--------|-------------|
| `format` | Yes | `md`, `pdf`, `html`, `txt` | Output file format. |

**Examples:**
```
> /export md
swot-analysis_2026-03-26.md (4.2 KB) ready.
> /export pdf
unit-economics_2026-03-26.pdf (12.1 KB) ready.
> /export html
competitive-landscape_2026-03-26.html (8.7 KB) ready.
> /export csv
Unknown format: "csv". Available: md, pdf, html, txt.
```
**Related:** `/format`, `/compare`
**Errors:** No output: `No recent analysis. Run a skill or playbook first.` Bad format: `Unknown format. Available: md, pdf, html, txt.` Failure: `Export failed. Try a different format or check /status.`

---

## `/compare [analysis1] [analysis2]`

Side-by-side comparison of two past analyses. Same-framework runs field-by-field; cross-framework highlights agreements and contradictions.

**Syntax:** `/compare "<analysis1>" "<analysis2>"`

| Parameter | Required | Description |
|-----------|----------|-------------|
| `analysis1` | Yes | Skill name, date-qualified label, or natural-language match. Quote if spaces. |
| `analysis2` | Yes | Same format as `analysis1`. |

**Examples:**
```
> /compare "swot 2026-01" "swot 2026-03"
SWOT Jan vs. Mar: Strengths + "Series A closed" / - "Bootstrap efficiency".
Weakness gap 3 roles-->1. Threat: Competitor B raised $22M. Trend: improved.
> /compare "nps Q1" "nps Q2"
NPS: 34-->41 (+7). Promoters 38%-->45%. Driver: onboarding 3.1-->4.0.
Drag: support response time unchanged.
> /compare "pricing analysis" "unit economics march"
Cross-framework. Agree: $49/mo undervalues enterprise. Conflict: pricing
recommends usage-based; unit economics flags CAC risk. Run sensitivity analysis.
> /compare "swot 2025-06" "tam analysis"
No match: "swot 2025-06". Available: swot 2026-01, swot 2026-03.
Try: /compare "swot 2026-01" "tam analysis"
```
**Related:** `/format`, `/export`
**Errors:** No match: lists similar outputs with correction. No history: `No past analyses. Run a skill or playbook first.`
