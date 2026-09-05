---
name: "hiring-diagnosis"
description: "Performs deep-layer triage on hiring problems by distinguishing between pipeline starvation, screening failures, interview theatre, closing gaps, onboarding abandonment, and role-reality mismatches. Use when a first-layer diagnostic identifies talent acquisition or retention issues, or when an entrepreneur reports inability to find, close, or retain hires."
entry_symptoms:
  - "Can't find good people"
  - "New hires don't stick past 90 days"
  - "Onboarding is broken"
  - "Hiring is way too slow"
  - "We keep getting wrong culture fits"
  - "We regret most of our hires"
possible_diagnoses:
  - pipeline-starvation
  - screening-failure
  - interview-theatre
  - closing-gap
  - onboarding-abandonment
  - role-reality-mismatch
routes_to_skills:
  - belbin-team-roles
  - hackman-enabling-conditions
  - understanding-people
  - reading-people
  - decision-traps-and-roles
  - employee-engagement-retention
routes_to_templates:
  - hiring-scorecard
  - role-description-template
  - team-health-check
author: "Fatih Guner"
---

# Hiring Diagnosis

## Entry Symptoms

Hiring complaints arrive dressed as a talent shortage: "There just aren't good people out there." This is almost never true. The labour market is large; the company's access to it, evaluation of it, and appeal within it are small. When an entrepreneur says "we can't find good people," the diagnostic question is not about the people — it is about which stage of the hiring funnel is broken and why.

## Triage Questions

### Q1: Where in the hiring funnel does it break down?

- **Not enough candidates apply or enter the pipeline** — likely diagnosis: **pipeline-starvation**. Proceed to Q2.
- **Plenty of candidates, but none seem qualified after screening** — likely diagnosis: **screening-failure**. Proceed to Q3.
- **Qualified candidates enter but perform poorly in interviews, or interviewers can't agree** — likely diagnosis: **interview-theatre**. Proceed to Q4.
- **Strong candidates get offers but decline them** — likely diagnosis: **closing-gap**. Proceed to Q5.
- **Hires are made but leave or underperform within 90 days** — likely diagnosis: **onboarding-abandonment** or **role-reality-mismatch**. Proceed to Q6.

### Q2: What does your employer brand and sourcing strategy look like?

- **Job posts go on generic boards and the company waits for inbound applications** — passive sourcing in a competitive market yields weak pipelines. Likely diagnosis: **pipeline-starvation** driven by channel failure.
- **Active outreach exists but response rates are under 10%** — the message or the messenger is wrong. Either the role descriptions repel strong candidates or the company has no visible reputation. Likely diagnosis: **pipeline-starvation** driven by brand deficit.
- **The company recruits almost exclusively through personal networks that have been exhausted** — the sourcing strategy scaled with the founders but not the company. Likely diagnosis: **pipeline-starvation** driven by channel dependency.

### Q3: What criteria are you using to screen candidates, and who defined them?

- **Criteria were inherited from a job description template or copied from a larger company** — likely diagnosis: **screening-failure**. The filter selects for credentials that correlate with performance at Google, not at a 15-person startup.
- **Criteria are clear but emphasise hard skills almost exclusively** — likely diagnosis: **screening-failure** leading to downstream culture-fit problems. Technical screens catch skill but miss motivation, adaptability, and alignment.
- **Screening criteria change with every hire because nobody documented what "good" looks like** — likely diagnosis: **screening-failure** compounded by **role-reality-mismatch**. Without a stable definition of success, every evaluation is improvised.

### Q4: Describe your interview process — how many stages, who participates, and how are decisions made?

- **Unstructured conversations where each interviewer asks whatever they want** — likely diagnosis: **interview-theatre**. Unstructured interviews are the single worst predictor of job performance, yet most startups default to them.
- **Structured process exists but interviewers are untrained and frequently disagree on candidates** — likely diagnosis: **interview-theatre**. The architecture is right but the calibration is absent.
- **One person (usually the founder) makes the final call regardless of team input** — likely diagnosis: **interview-theatre** combined with anchoring bias from `decision-traps-and-roles`. The process exists as performance; authority lives elsewhere.

### Q5: When strong candidates decline your offer, what reasons do they give?

- **Compensation — another company offered more** — determine whether comp is below market or the candidate used the offer as leverage. If below market, the problem is budgetary, not diagnostic. If competitive, likely diagnosis: **closing-gap** driven by total package (equity story, mission, role scope).
- **Role uncertainty — they weren't sure what they'd actually be doing** — likely diagnosis: **role-reality-mismatch** manifesting at the offer stage. The job was never clearly defined, and the candidate sensed it.
- **Culture or stage concerns — they worried about chaos, instability, or founder dynamics** — likely diagnosis: **closing-gap** driven by employer brand or interview experience. The process itself communicated dysfunction.

### Q6: What happens on Day 1 through Day 90 for a new hire?

- **No structured onboarding — new hires are expected to "figure it out" and "hit the ground running"** — likely diagnosis: **onboarding-abandonment**. Sink-or-swim onboarding selects for self-starters while destroying everyone else — including many strong performers who need context before contributing.
- **Onboarding exists but is administrative (paperwork, tool access, org chart) with no role-specific ramp plan** — likely diagnosis: **onboarding-abandonment**. Logistical onboarding without performance onboarding leaves new hires productive on email and lost on work.
- **New hires report that the actual job differs significantly from what was described in the interview** — likely diagnosis: **role-reality-mismatch**. The gap between promise and reality creates immediate disillusionment and is the strongest predictor of early attrition.

## Diagnosis Map

| Diagnosis | Key Signals | Confirmation Path |
|-----------|------------|-------------------|
| **Pipeline starvation** | Few applicants, low response rates, exhausted networks, weak employer brand | Q1 shows top-of-funnel failure + Q2 shows passive or depleted sourcing |
| **Screening failure** | Many applicants rejected, criteria copied or undefined, culture misses | Q1 shows screening bottleneck + Q3 shows imported or unstable criteria |
| **Interview theatre** | Unstructured process, interviewer disagreement, founder override, poor prediction | Q1 shows interview-stage breakdown + Q4 shows process dysfunction |
| **Closing gap** | Offers declined, candidates cite comp/culture/uncertainty, losing to competitors | Q1 shows offer-stage failure + Q5 shows specific decline reasons |
| **Onboarding abandonment** | 90-day attrition high, new hires lost or disengaged, no ramp plan | Q1 shows post-hire failure + Q6 shows no structured onboarding |
| **Role-reality mismatch** | Early attrition, "this isn't what I signed up for," job differs from description | Q1 shows post-hire failure + Q6 shows expectation gap + Q5 may preview it |

## Routing

**Pipeline starvation:**
1. Apply `hackman-enabling-conditions` — ensure the role itself is designed to attract (compelling purpose, autonomy, meaningful work)
2. Apply `understanding-people` — build candidate personas to target sourcing with the same rigour as customer acquisition
3. Output with `role-description-template`

**Screening failure:**
1. Apply `belbin-team-roles` — define what the team actually needs in terms of behavioural contribution, not just technical skill
2. Apply `decision-traps-and-roles` — audit the screening criteria for anchoring, availability bias, and halo effects
3. Output with `hiring-scorecard`

**Interview theatre:**
1. Apply `decision-traps-and-roles` — redesign the interview process to counteract cognitive biases
2. Apply `reading-people` — train interviewers to gather signal from structured observation, not gut feel
3. Output with `hiring-scorecard`

**Closing gap:**
1. Apply `understanding-people` — understand what motivates the candidates you're losing and build offers around those drivers
2. Apply `hackman-enabling-conditions` — ensure the role offers the structural conditions (autonomy, feedback, significance) that strong candidates seek
3. Output with `role-description-template`

**Onboarding abandonment:**
1. Apply `hackman-enabling-conditions` — design the first 90 days with the same structural intentionality as the role itself
2. Apply `employee-engagement-retention` — build early engagement mechanisms that prevent new-hire disillusionment
3. Output with `team-health-check`

**Role-reality mismatch:**
1. Apply `belbin-team-roles` — clarify what the role actually requires versus what was advertised
2. Apply `hackman-enabling-conditions` — redesign the role so that the description, the interview, and the reality converge
3. Output with `role-description-template` and `hiring-scorecard`

## Red Flags

- **The company has had more than 50% turnover in a single department within six months.** This rate suggests systemic toxicity rather than hiring process failure. Investigate the manager and the environment before optimising the funnel — better hiring into a toxic environment just burns through talent faster.
- **The founder cannot describe the ideal candidate for their most critical open role in concrete, observable terms.** Vague descriptions ("a rockstar," "someone entrepreneurial," "culture fit") are not criteria — they are projections that invite bias. Until the role is defined with specificity, no hiring process can succeed.
- **New hires consistently report that the interview process misrepresented the role, the culture, or the company's financial health.** Systematic misrepresentation — even unintentional — is an integrity issue. It damages employer brand through word of mouth and creates legal exposure. Fix the honesty problem before the process problem.
