# The Revenue Crisis: Two-Layer Diagnostic in Action

## The Scenario

Sarah runs TaskFlow, a B2B SaaS project management tool targeting mid-market companies (50-500 employees). She raised a $3.2M Series A fourteen months ago. The team is 18 people -- 9 in engineering, 4 in sales, 2 in customer success, and 3 in operations. Six months ago, MRR hit $80K and the trajectory looked clean. Then it started sliding. Three months later, MRR sits at $52K. Sarah has tried discounting, a new homepage, and a LinkedIn ad campaign. Nothing moved. She opens Foreman not knowing whether this is a churn problem, a pricing problem, a competitive threat, or something else entirely.

## The Conversation

### Turn 1: Entry

**Sarah:** "Our MRR dropped from $80K to $52K in three months and I have no idea why. We keep signing new customers but the number won't go up. I've tried discounting and new marketing but nothing works."

**System (behind the scenes):**
- Hook matching: Input scanned against all 16 hooks
- `revenue-and-sales-hook` matches at HIGH confidence -- "MRR dropped," "keep signing new customers," "number won't go up" map to the revenue decline and retention/conversion pattern clusters
- `product-hook` matches at MEDIUM confidence -- "nothing works" could indicate product-market fit issues
- Disambiguation: Both hooks are high priority, but the revenue-and-sales-hook scores higher because Sarah frames the problem in financial terms, not product terms. The revenue-and-sales-hook wins
- Route decision: `revenue-diagnosis` selected (Sarah has no prior diagnosis on file)
- Memory read: Stage = early-traction, sector = B2B SaaS, team = 18, no prior diagnostics

**Foreman:** "A $28K MRR decline over three months with ongoing new customer acquisition is a specific pattern. Revenue is entering the building through the front door and leaving through the back. Before we treat the symptoms, three questions will separate the possible causes.

First: is the revenue loss coming from customers cancelling, customers downgrading, or new deals closing at lower values than before?

Second: when you say you keep signing new customers -- has your close rate, deal size, or pipeline volume actually changed over these three months?

Third: do you have cohort retention data? Specifically, can you tell me when churned customers originally signed up and how long they lasted?"

### Turn 2: First-Layer Diagnostic (Revenue Diagnosis)

**Sarah:** "Okay, so our close rate is actually fine -- about the same as six months ago. Pipeline is steady. The problem is definitely existing customers leaving. We've lost maybe 15 accounts in the past three months. And now that I look at it, most of them signed up in the last four to five months. They barely used the product before cancelling."

**System (behind the scenes):**
- Diagnostic agent processes answers against `revenue-diagnosis` triage tree
- Q1 answer: "existing customers leaving" --> retention is failing --> proceed to Q4
- Q4 answer: "most signed up in the last four to five months," "barely used the product" --> churn is rising, customers leave early --> diagnosis: **high-churn**
- But the pattern is more specific than generic high-churn. Customers leaving within months, low usage before exit -- this matches `customer-churn-diagnosis` entry symptoms precisely
- Orchestrator escalates: routes to second-layer diagnostic `customer-churn-diagnosis` for granular triage

**Foreman:** "The first-layer picture is clear: your acquisition engine works. Your retention does not. New customers are entering and exiting within months, which means the value promise that closed the deal is not being delivered post-sale. This narrows it considerably, but 'churn' has six distinct root causes and treating the wrong one wastes time you do not have. A few more questions to reach the actual cause.

When these customers churned -- was it within the first 30 days, or between months two and five? And did they actively cancel, or did they go silent and stop logging in?"

### Turn 3: Second-Layer Diagnostic (Customer Churn Diagnosis)

**Sarah:** "Most of them within the first 30 days. And honestly, most just stopped logging in. We'd reach out and either get no response or a vague 'we went with something else.' A few said the setup was too complicated."

**System (behind the scenes):**
- `customer-churn-diagnosis` triage processes answers
- Q1: Churn within first 30 days --> customer never reached the value moment --> likely **onboarding-failure**
- Q2: Customers go silent and stop using --> usage data would show no activation
- Q3: "Setup was too complicated" --> confirms onboarding friction
- Q4: Usage was never high --> customer barely activated
- Diagnosis confirmed: **onboarding-failure** with high confidence
- Routing: `net-promoter-score` skill to quantify the loyalty gap + `business-model-canvas` to check value proposition alignment
- Playbook escalation: `pricing-strategy-playbook` (because the churn pattern may interact with pricing expectations set during sales)
- Output templates queued: `unit-economics-snapshot`, `action-plan`

**Foreman:** "The diagnosis is onboarding failure. Your sales team is closing deals on a value promise that the product experience does not deliver in the critical first thirty days. Customers buy the vision, encounter setup friction, never reach the moment where the product demonstrates its value, and quietly leave. The $28K MRR loss is not a revenue problem or a product problem in the traditional sense. It is a gap between what the sale promises and what the first week delivers.

This explains why discounting and new marketing failed -- both interventions target acquisition, which is not broken. And it explains why the problem appeared six months ago: your sales team likely ramped up around then, bringing in customers faster than your onboarding process could absorb.

I want to do two things. First, run a structured NPS analysis to quantify the gap between customers who survived onboarding and those who did not. Second, map your unit economics to see how the churn is affecting your LTV and whether the pricing model needs adjustment alongside the onboarding fix. Shall I proceed?"

### Turn 4: Skill Application (Net Promoter Score)

**Sarah:** "Yes, do it. We actually ran an NPS survey two months ago but I never really dug into it. Overall score was 18."

**Foreman:** "An NPS of 18 is mediocre for B2B SaaS, where the benchmark for healthy companies sits between 30 and 50. But the aggregate number is the least useful part. Segment it.

What was the NPS for customers who have been with you longer than 90 days versus those under 90 days? And can you separate by company size -- do your enterprise accounts score differently from your smaller accounts?"

**Sarah:** "I can pull that. Give me a second... Okay. Customers over 90 days: NPS is 47. Under 90 days: NPS is negative 12. Enterprise accounts over 90 days are at 58. SMB under 90 days is negative 23."

**Foreman:** "There is the fracture line. Customers who survive the first 90 days become promoters -- an NPS of 47 is excellent. Customers who are still in the onboarding window are active detractors. Your product delivers genuine value to the people who learn to use it. The problem is that most never get there.

The negative 23 among SMB accounts under 90 days is particularly telling. Smaller companies have less tolerance for complex setup because they lack dedicated project managers to drive adoption internally. Your product likely requires a sophistication of onboarding that SMB buyers do not bring to the table.

This has a direct pricing implication. If SMB accounts churn at disproportionate rates, your effective LTV for that segment is far below your blended average. You may be acquiring customers at a CAC that the segment cannot support."

### Turn 5: Output Generation

**System (behind the scenes):**
- Skill executor completes `net-promoter-score` analysis with segment breakdown
- Orchestrator routes to `pricing-strategy-playbook` awareness -- flags that pricing-by-segment may be warranted
- Output agent formats two deliverables: `unit-economics-snapshot` and `action-plan`
- Memory agent writes: diagnosis = onboarding-failure, NPS segmentation data, churn timing data, recommended interventions

**Foreman:** "Here is your unit economics snapshot with the churn impact modeled, and an action plan for the onboarding fix. I have separated the economics by segment because the blended numbers were hiding the dysfunction."

## Behind the Scenes

**Complete agent orchestration trace:**

| Step | Agent | Action | Result |
|------|-------|--------|--------|
| 1 | Orchestrator | Receive input, call memory-agent.read() | Context: early-traction, B2B SaaS, 18 employees, no prior diagnostics |
| 2 | Orchestrator | Match against 16 hooks | `revenue-and-sales-hook` (HIGH, 0.91), `product-hook` (MEDIUM, 0.54) |
| 3 | Orchestrator | Disambiguate | Revenue framing wins; route to `revenue-diagnosis` |
| 4 | Diagnostic Agent | Run `revenue-diagnosis` triage (Q1, Q2, Q4) | Diagnosis: **high-churn** -- retention failing, early lifecycle |
| 5 | Orchestrator | Escalate to second-layer diagnostic | Route to `customer-churn-diagnosis` for granular cause |
| 6 | Diagnostic Agent | Run `customer-churn-diagnosis` triage (Q1, Q2, Q3, Q4) | Diagnosis: **onboarding-failure** -- churn in first 30 days, no activation |
| 7 | Skill Executor | Apply `net-promoter-score` with stage filter (early-traction) | NPS segmentation: 47 (>90 days) vs. -12 (<90 days); SMB = -23 |
| 8 | Orchestrator | Flag pricing interaction | Queue `pricing-strategy-playbook` for follow-up |
| 9 | Output Agent | Format `unit-economics-snapshot` (audience: self) | Segmented unit economics with churn-adjusted LTV |
| 10 | Output Agent | Format `action-plan` (audience: team) | 90-day onboarding rebuild plan |
| 11 | Memory Agent | Write session data | Hook: revenue-and-sales-hook, diagnosis: onboarding-failure, skills: net-promoter-score, outputs: unit-economics-snapshot + action-plan |

**Hook matched:** `revenue-and-sales-hook` (high priority, confidence 0.91)
**First-layer diagnostic:** `revenue-diagnosis` --> high-churn
**Second-layer diagnostic:** `customer-churn-diagnosis` --> onboarding-failure
**Skills applied:** `net-promoter-score` (with segment analysis)
**Playbook flagged:** `pricing-strategy-playbook` (for follow-up session)
**Templates generated:** `unit-economics-snapshot`, `action-plan`
**Memory persisted:** Full session with diagnosis chain and segmented NPS data

## Final Deliverables

### Unit Economics Snapshot (abbreviated)

**TaskFlow** | **Period:** Q4 2025 | **Segment comparison: Enterprise vs. SMB**

| Metric | Enterprise (>200 emp) | SMB (<200 emp) | Blended | Red Flag |
|--------|----------------------|----------------|---------|----------|
| CAC | $4,200 | $1,800 | $2,600 | SMB CAC rising -- outbound sales cost same regardless of deal size |
| LTV | $38,400 | $3,600 | $14,200 | SMB LTV destroyed by 30-day churn; blended figure misleading |
| LTV:CAC | 9.1:1 | 2.0:1 | 5.5:1 | SMB below minimum viable ratio |
| Payback | 4.2 months | 14.8 months | 7.1 months | SMB payback exceeds average SMB lifespan (11 months) |
| Monthly Churn | 1.8% | 11.2% | 5.4% | SMB churn catastrophic; enterprise healthy |
| NRR | 112% | 64% | 91% | Blended NRR below 100% due to SMB drag |

**Cohort narrative:** Enterprise cohorts from Q1-Q2 2025 retain at 94% after 6 months. SMB cohorts from the same period retain at 38%. The divergence began when the sales team expanded and started closing smaller accounts with the same pitch and onboarding process designed for enterprise buyers.

### Action Plan (abbreviated)

**Plan title:** TaskFlow Onboarding Rebuild -- 90 Days

**Objective:** Reduce first-30-day churn from 34% to under 10% by rebuilding the onboarding experience with segment-specific paths.

| # | Action | Owner | Deadline |
|---|--------|-------|----------|
| 1 | Audit all 15 churned accounts from last 90 days -- map exact drop-off points | VP Customer Success | Week 1 |
| 2 | Design SMB-specific onboarding flow: guided setup wizard, pre-built templates, 72-hour check-in call | Product Lead + CS | Week 3 |
| 3 | Implement time-to-value metric: track hours from signup to first project created with team | Engineering | Week 4 |
| 4 | Restructure SMB pricing to include onboarding support in first 30 days (not add-on) | Sarah (CEO) | Week 5 |
| 5 | Run NPS survey at Day 14 for all new accounts -- create early warning trigger at NPS < 20 | CS Lead | Week 6 |

## Key Takeaways

This example demonstrates three architectural features of the Foreman system:

1. **Two-layer diagnostics.** The `revenue-diagnosis` identified the category (high churn) but not the cause. The system automatically escalated to `customer-churn-diagnosis` for granular triage, which identified onboarding failure -- a far more actionable finding than "you have churn."

2. **Stage-filtered skill application.** The `net-promoter-score` skill was applied with early-traction stage awareness, which meant the analysis focused on segment-level patterns rather than aggregate scores. The aggregate NPS of 18 was nearly useless; the segmented data (47 vs. -12) revealed the entire problem.

3. **Cross-layer routing.** The onboarding diagnosis surfaced a pricing implication -- SMB unit economics are broken not because the price is wrong, but because the onboarding cost is invisible. The system flagged the `pricing-strategy-playbook` for a follow-up session rather than cramming it into the current conversation. Restraint in scope is a design principle, not a limitation.
