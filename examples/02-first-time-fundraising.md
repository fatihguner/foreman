# First-Time Fundraising: The Full Playbook Sequence

## The Scenario

Alex is a technical founder who built RecruitIQ, an AI-powered recruiting tool that automates candidate screening and interview scheduling for startups with 10-100 employees. He is a former machine learning engineer at a large tech company. Eight months post-launch, the product has $15K MRR, 34 paying customers, and a 3-person team (Alex, a junior developer, and a part-time marketing contractor). He has never raised money. His savings fund the operation. A mentor told him he should raise a seed round. He has no idea where to start, what investors expect, or whether his numbers are ready.

## The Conversation

### Turn 1: Entry

**Alex:** "I need to start preparing for a seed round. I've never raised money before and honestly I don't know what investors want to see. We're at $15K MRR with about 34 customers, growing maybe 10% month over month. I have enough savings for another 6 months but after that I'm in trouble."

**System (behind the scenes):**
- Hook matching: Input scanned against all 16 hooks
- `fundraising-hook` matches at HIGH confidence -- "seed round," "never raised money," "what investors want to see" map directly to fundraising readiness intent
- `revenue-and-sales-hook` matches at LOW confidence -- MRR mentioned but not as a complaint
- No disambiguation needed: single high-confidence match
- Route decision: Alex has no prior diagnostics. However, his intent is clearly preparation (not crisis or rejection). The fundraising-hook routing logic for "stage-specific preparation" directs to `fundraising-playbook` when intent is clear and business is healthy
- Memory read: New entrepreneur, no prior context. Memory agent creates identity layer: technical founder, AI recruiting, early-traction stage, 3-person team

**Foreman:** "You are in a stronger position than you think. $15K MRR at eight months with 10% month-over-month growth and 34 paying customers is a credible seed-stage profile. The fact that you have never raised before is not a disadvantage -- it means you have not yet developed the bad habits that repeat founders sometimes bring to the process.

Fundraising preparation is a seven-step sequence, and the order matters. Most first-time founders build a pitch deck and then discover, mid-meeting, that they cannot answer the unit economics question or articulate why their competitive position is defensible. We will build the substance before the presentation.

The sequence: business model validation, strategic assessment, competitive analysis, customer proof points, narrative construction, negotiation preparation, and deck architecture. Each step produces a deliverable that feeds the next. There is a critical checkpoint after Step 1 -- if the unit economics do not hold, we pause and fix the model before you walk into a room.

Ready to start with the business model?"

### Turn 2: Step 1 -- Business Model Canvas

**Alex:** "Yes. Though I should warn you, I'm an engineer. I've never done a business model canvas."

**Foreman:** "The canvas is not an art project. It is nine boxes that force you to articulate what you sell, to whom, through what channel, at what cost, and why anyone should care. Engineers tend to excel at it once they stop treating it as a business school exercise and start treating it as a system architecture diagram for the company.

Walk me through the basics. Who are your customers, what do they pay, and what does it cost you to acquire and serve them?"

**Alex:** "Our customers are mostly seed-to-Series-A startups. They pay $450/month on average. We get them through content marketing -- I write technical blog posts about AI in recruiting, and maybe 40% of signups come from organic search. The rest are referrals from existing customers. Our infrastructure costs are about $2,100/month total. I'm not paying myself a salary."

**System (behind the scenes):**
- Skill executor applies `business-model-canvas` with early-traction stage filter
- Key calculations performed:
  - CAC: Marketing contractor ($3K/mo) + Alex's content time (estimated $2K opportunity cost) / ~4 new customers per month = ~$1,250 CAC
  - LTV: $450/mo * estimated 14 months avg lifespan * ~85% gross margin = ~$5,355
  - LTV:CAC = 4.3:1 (healthy)
  - Payback = $1,250 / ($450 * 0.85) = 3.3 months (excellent)
  - Monthly burn: ~$8K (infrastructure + contractor + minimal expenses)
  - Gross margin: ~85% (software margins with low infrastructure cost)
- Checkpoint assessment: Unit economics are positive and fundable. Proceed.

**Foreman:** "Your unit economics are strong for seed stage. Let me show you the picture investors will see.

CAC is approximately $1,250 per customer, assuming your content marketing costs and your own time are accounted for. LTV at current retention and pricing is roughly $5,400. That puts your LTV:CAC at 4.3:1 -- well inside the healthy range. Payback period is 3.3 months, which is excellent. Gross margins around 85% are standard for software.

The checkpoint verdict: these economics are fundable. The model is coherent. Proceed.

Two flags for the investor conversation. First, your CAC is artificially low because you are the marketing engine. Investors will ask what happens to CAC when you hire a demand generation team and stop writing every blog post yourself. Have an answer -- likely CAC doubles to $2,500, which still works at current LTV. Second, your average contract value of $450/month is low. Investors will want to see either a path to higher ACV through enterprise expansion or a volume argument that shows you can acquire customers cheaply enough for the math to work at scale. Your organic acquisition channel supports the volume argument.

On to the strategic assessment."

### Turn 3: Step 2 -- SWOT-PEST Analysis

**Alex:** "That CAC question is exactly what I'd get wrong in a meeting. What's the strategic assessment?"

**Foreman:** "SWOT maps your internal position. PEST maps external forces. Together they reveal what investors will probe in due diligence and -- more usefully -- arm you with pre-written responses.

Start with honesty. What is the biggest weakness in your business right now, and what external trend worries you most?"

**Alex:** "Biggest weakness is probably that it's just me as the technical person. If I get hit by a bus, the product stops. External trend -- everyone and their dog is building AI tools right now. I worry about getting drowned out."

**System (behind the scenes):**
- Skill executor applies `swot-pest-analysis` with context from Step 1
- SWOT constructed with investor-facing framing:
  - Strengths: Strong unit economics, organic acquisition channel (defensible moat), technical founder with domain expertise, high NPS among active users
  - Weaknesses: Single point of failure (Alex), no sales team, low ACV, narrow customer segment
  - Opportunities: Expansion into mid-market, vertical-specific features, integration partnerships with ATS platforms
  - Threats: AI tool proliferation, large ATS vendors adding AI features, possible market saturation in startup segment
- PEST overlay: Technology (AI cost declining, enabling faster development), Economic (startup funding environment recovering), Political (AI hiring regulation increasing -- creates compliance need), Social (remote hiring normalizing, expanding addressable market)
- Checkpoint: Every weakness paired with mitigation. Key insight: the AI regulation trend is actually a strength -- compliance creates switching costs.

**Foreman:** "Your SWOT reveals something you have not yet leveraged. You identified AI proliferation as a threat, but the PEST analysis surfaces a counter-force: AI hiring regulation is increasing. The EU AI Act and several US state laws now require explainability in automated hiring decisions. Most AI recruiting tools, including the ones built by large ATS vendors, are black boxes. If your system can demonstrate explainable decisions, regulation becomes your moat -- not your threat.

For investors, the SWOT framing looks like this:

**Weakness pre-emption** (the bus factor): 'We are hiring two senior engineers with the seed round. The architecture is well-documented and the codebase follows standard ML pipeline patterns. Key-person risk is real at this stage and mitigated by use of funds.'

**Threat reframing** (AI proliferation): 'The market is crowded with AI tools that automate the easy part -- resume screening. We automate the hard part -- structured interview scheduling with bias-reduction compliance. Regulation is thinning the competitive field, not thickening it.'

Investors will respect that you found the weakness before they did. Shall we move to competitive analysis?"

### Turn 4: Step 3 -- Porter's Five Forces

**Alex:** "Yes. I know my competitors but I've never thought about it as 'five forces.'"

**Foreman:** "Name your three most dangerous competitors -- and tell me whether customers ever leave you for them."

**Alex:** "Lever is the big one -- backed by Sequoia, raised $40M. They do similar AI screening but for enterprise. Ashby has a broader ATS with some AI features. And there are about ten smaller tools that pop up and disappear. We've lost maybe two customers to Lever. Nobody has left for Ashby."

**System (behind the scenes):**
- Skill executor applies `porters-five-forces`:
  - Rivalry: Moderate -- fragmented market, Lever dominates enterprise but ignores SMB
  - Buyer power: Moderate -- low switching costs, but high onboarding friction creates stickiness
  - Supplier power: Low -- cloud infrastructure commoditized, ML model APIs widely available
  - Threat of substitutes: High -- manual recruiting, staffing agencies, internal HR tools
  - Threat of new entrants: High -- low barriers with available AI APIs; but regulation raises barrier
- Defensibility narrative: Segment focus (SMB startups) + compliance readiness + organic content moat
- Checkpoint: Market has low barriers but high substitution. Deck must address this directly.

**Foreman:** "The forces analysis confirms your instinct about competition but reframes it. Lever is not your competitor -- they serve a different segment at ten times your price point. Your actual competitive threat is substitutes: founders who decide to just post on LinkedIn and screen resumes themselves, or who hire a contract recruiter for $10K instead of paying $450/month for software.

The investor slide should position RecruitIQ not against other AI tools but against the manual alternative. The argument: 'Our competition is not Lever. Our competition is the founder spending 15 hours a week on recruiting instead of building product. We replace that time for $450/month.' That reframing changes the market sizing from 'AI recruiting tools' (small, crowded) to 'startup recruiting spend' (large, fragmented).

This is the defensibility narrative: segment ownership in a market that large players ignore because the ACV is too low for their sales model. Combined with the compliance angle from Step 2, you have a plausible moat."

### Steps 4-7: Summary

**System (behind the scenes):**
- Step 4 (`net-promoter-score`): Alex collects NPS from 34 customers. Score: 62. Promoter quotes extracted for deck. Strongest: "Saved me 12 hours a week. I'd be furious if it disappeared." Checkpoint passed: NPS above 30, strong verbatims available.
- Step 5 (`story-structure-and-arc`): Narrative arc constructed. Opening: Alex's personal story of spending 40% of his time recruiting as an engineering lead, realizing every startup founder faces the same trap. Stakes: AI tools solve the wrong problem (screening) while the real bottleneck (scheduling, coordination, compliance) remains manual. Proof: 34 customers, 62 NPS, 10% MoM growth. Vision: The recruiting operating system for startups that turns a founder's worst time sink into an automated workflow. Checkpoint passed: Narrative retellable in two sentences.
- Step 6 (`competitive-negotiation`): BATNA defined: Alex can sustain 6 more months on savings, giving negotiating room but not leverage. Anchoring strategy: target $2M raise on $8-10M post-money valuation, justified by $180K ARR run rate at 10% MoM growth. Non-negotiable: no full ratchet anti-dilution, board seat for lead investor acceptable, no participating preferred.
- Step 7 (`writing-for-navigation`): Deck structure optimized for 3-minute scan. Each slide headline carries the argument independently. Test: reading only headlines tells the complete story.

**Foreman (summarizing Steps 4-7):** "Steps 4 through 7 are complete. Your NPS of 62 is in the top quartile for B2B SaaS -- investors will notice. The narrative arc connects your personal experience to the market gap to the traction proof. Your negotiation preparation sets a $2M target at $8-10M post-money, which is defensible given your growth rate and unit economics. And the deck structure ensures that even a partner who skims for ninety seconds absorbs the core thesis.

Two deliverables are ready: your fundraising deck outline and your unit economics snapshot."

## Behind the Scenes

**Complete agent orchestration trace:**

| Step | Agent | Action | Result |
|------|-------|--------|--------|
| 1 | Orchestrator | Receive input, create new entrepreneur in memory | Identity: Alex, technical founder, AI recruiting, early-traction |
| 2 | Orchestrator | Match against 16 hooks | `fundraising-hook` (HIGH, 0.94) |
| 3 | Orchestrator | Route decision | Intent = stage-specific preparation, business healthy --> `fundraising-playbook` directly, skip diagnostic |
| 4 | Playbook Runner | Step 1: `business-model-canvas` | Canvas complete, unit economics positive, checkpoint passed |
| 5 | Playbook Runner | Decision Point: fundable? | Yes -- LTV:CAC 4.3:1, payback 3.3 months. Proceed. |
| 6 | Playbook Runner | Step 2: `swot-pest-analysis` | SWOT-PEST with investor-facing framing, regulation-as-moat insight |
| 7 | Playbook Runner | Step 3: `porters-five-forces` | Five forces with defensibility narrative, competitive reframing |
| 8 | Playbook Runner | Step 4: `net-promoter-score` | NPS 62, promoter verbatims extracted |
| 9 | Playbook Runner | Step 5: `story-structure-and-arc` | Narrative arc: personal story --> market gap --> proof --> vision |
| 10 | Playbook Runner | Decision Point: story ready? | Yes -- narrative retellable in two sentences. Proceed. |
| 11 | Playbook Runner | Step 6: `competitive-negotiation` | BATNA, anchoring, non-negotiables defined |
| 12 | Playbook Runner | Step 7: `writing-for-navigation` | Deck structure with headline-carries-argument test |
| 13 | Output Agent | Format `fundraising-deck-outline` (audience: investor) | 12-slide outline with RecruitIQ data |
| 14 | Output Agent | Format `unit-economics-snapshot` (audience: investor) | Filled snapshot with actuals |
| 15 | Memory Agent | Write session | Playbook: fundraising-playbook (complete), all 7 skills applied, 2 outputs generated |

## Final Deliverables

### Fundraising Deck Outline (abbreviated)

**SLIDE 1: Title**
RecruitIQ -- Automated recruiting operations for startups | Seed Round

**SLIDE 2: Problem**
Startup founders spend 15+ hours per week on recruiting logistics -- screening, scheduling, coordinating, following up. At Series A stage, this is the #1 non-product time sink. The cost: $180K/year in founder time at conservative valuation. Existing solutions (enterprise ATS platforms, staffing agencies) are built for companies with dedicated HR teams and $50K+ annual budgets.

**SLIDE 3: Solution**
RecruitIQ automates the recruiting workflow end-to-end: AI-powered candidate screening, automated interview scheduling, structured feedback collection, and compliance-ready decision documentation. One integration, fifteen minutes to set up, no recruiter required.

**SLIDE 5: Business Model**
SaaS subscription: $450/month average. LTV: $5,400. CAC: $1,250. LTV:CAC: 4.3:1. Payback: 3.3 months. Gross margin: 85%. Expansion: usage-based pricing at 50+ hires/quarter (not yet active, designed for mid-market expansion).

**SLIDE 6: Traction**
$15K MRR | $180K ARR run rate | 34 paying customers | 10% MoM growth (6-month sustained) | NPS: 62 | 40% organic acquisition via content | Logo churn: 2.1%/month

**SLIDE 11: The Ask**
Raising: $2M | Instrument: SAFE with $10M post-money cap | Use of funds: 55% engineering (hire 2 senior engineers), 25% GTM (first sales hire + content scaling), 20% ops (compliance infrastructure, office). Target milestone: $75K MRR and 150 customers within 12 months -- positions for Series A.

### Unit Economics Snapshot (abbreviated)

**RecruitIQ** | **Period:** March 2026 | **Segment:** All (startup customers, 10-100 employees)

| Metric | Value | Benchmark | Status |
|--------|-------|-----------|--------|
| CAC | $1,250 | SaaS SMB: $200-$2K | On track |
| LTV | $5,400 | Credible with 8 months cohort data | Watch -- limited observation period |
| LTV:CAC | 4.3:1 | 3-5:1 healthy | On track |
| Payback | 3.3 months | <12 months strong | On track |
| Gross Margin | 85% | Software: 70-85% | On track |
| Monthly Churn | 2.1% | <2% SMB target | Watch -- slightly above benchmark |
| NRR | 98% | >100% target | Action needed -- no expansion revenue yet |

**Investor pre-emption note:** LTV is calculated from 8 months of cohort data. The oldest cohort (Month 1) retains at 82% after 8 months. NRR is below 100% because no expansion pricing exists yet -- the $2M raise funds the infrastructure for usage-based upsell at 50+ hires/quarter, which addresses this gap directly.

## Key Takeaways

This example demonstrates three architectural features of the Foreman system:

1. **Playbook sequencing with checkpoints.** The `fundraising-playbook` runs seven skills in a deliberate order. Each step produces output that feeds the next. The checkpoint after Step 1 (are the economics fundable?) exists to prevent founders from building a pitch on a broken model. Alex passed -- but if his LTV:CAC had been below 1.5:1, the playbook would have paused and redirected to model repair.

2. **Decision points as architectural gates.** The playbook contains two explicit decision points: "Is the business ready to raise?" after Step 1 and "Is the story ready?" after Step 5. These are not cosmetic -- they change the playbook's execution path. A failed checkpoint exits the playbook or loops back, never pushes through to the next step with unresolved issues.

3. **Diagnostic bypass for clear intent.** The `fundraising-hook` routed directly to the playbook without running `fundraising-diagnosis` first. The routing logic recognized that Alex's intent was preparation (not crisis or rejection), his business metrics were healthy, and the stage was clear. Running a diagnostic on a founder who knows what he needs and has the numbers to support it would have been an unnecessary detour. The system's restraint is as important as its thoroughness.
