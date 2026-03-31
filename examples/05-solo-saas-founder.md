# Example 5: Solo Mode -- Micro-SaaS Founder Overwhelmed

## Scenario

Jake runs MailPulse, a bootstrapped email analytics tool that helps e-commerce stores optimise their campaign performance. No employees. No investors. No board. No co-founder. Revenue: $4,000 MRR from 62 paying customers. He built the product, writes the docs, handles support tickets, manages billing, runs the blog, and tries to do outbound sales in whatever time remains. He has not shipped a feature in six weeks because support and operational tasks consume every hour. His message to Foreman: "I can't prioritise. Everything feels urgent. I'm drowning."

**Mode activated:** `/solo`

**Purpose of this example:** Demonstrate how Solo Mode transforms system behaviour -- filtering team-oriented content, remapping audiences, replacing delegation with automation, and adapting the Foreman voice for a single operator.

---

## Conversation

### Turn 1: Jake's Opening

**Jake:**
> I can't prioritise. Everything feels urgent. I'm doing support, coding, marketing, sales -- all of it. Nothing is getting done well. I don't even know where to start fixing this.

**Behind the scenes:**
```
Orchestrator receives input.
Phase 1 — Context Retrieval:
  memory.identity.mode = "solo"  →  Load SOLO.md, solo-skill-relevance.yaml,
                                     solo-audience-map.yaml, solo-adaptations.yaml
  memory.company.stage = "early-traction"
  memory.company.team_size = 1
  memory.company.mrr = 4000

Phase 2 — Hook Matching:
  Input pattern "can't prioritise" + "everything feels urgent" + "drowning"
    → personal-growth-hook (priority match: "overwhelmed", "need to grow")
    → growth-hook secondary match (solo reframe: capacity ceiling, not market ceiling)

Phase 3 — Skill Selection (solo-skill-relevance.yaml applied):
  eisenhower-matrix           → tier: critical  ← SELECTED (primary)
  focus-and-priority-management → tier: critical  ← SELECTED (secondary)
  stoic-control-and-clarity   → tier: critical  ← SELECTED (emotional grounding)
  leader-resilience-and-wellbeing → tier: high  ← QUEUED

  Rejected routing:
    delegation-and-empowerment → tier: low (no one to delegate to)
    tuckman-team-stages        → tier: low (no team)

Phase 4 — Diagnostic Selection:
  operational-chaos-diagnosis → adaptation: "reframe"
    Solo reframe: "personal system failure, not organizational breakdown"
    Modified questions loaded.

Phase 5 — Voice:
  Solo voice active. Second-person direct address. No team references.
  Acknowledge the weight of solo operation without patronizing.
```

**Foreman:**
> You are running support, product, marketing, and sales simultaneously. That is not a failure of discipline -- it is a structural constraint of operating alone at $4K MRR. The question is not "how do I do everything better" but "which things should I stop doing entirely."
>
> Before we build a prioritisation system, I need to diagnose where the operational weight is concentrated. Three questions:
>
> 1. **What percentage of your week goes to support tickets versus all other work?** A rough estimate is sufficient.
> 2. **Do you have documented processes for recurring tasks** -- onboarding, billing questions, bug triage -- or do you handle each one from scratch?
> 3. **When you say "nothing is getting done well," is the primary consequence revenue loss, product stagnation, or personal burnout?**

---

### Turn 2: Jake Answers the Triage

**Jake:**
> Support is probably 40% of my week. No documentation -- I just handle things as they come. And honestly, it's all three. Revenue is flat, the product hasn't improved in weeks, and I'm burning out.

**Behind the scenes:**
```
Diagnostic Agent processes responses:
  operational-chaos-diagnosis (solo reframe):
    40% support → capacity bottleneck identified
    No SOPs → systemic inefficiency confirmed
    Triple impact (revenue + product + burnout) → acute overload

  Root cause classification:
    Primary: Absence of personal operating system
    Secondary: No triage system for incoming demands
    Tertiary: No automation or outsourcing for repeatable tasks

  Routing decision:
    Execute eisenhower-matrix with solo adaptation
      → Quadrant III (Delegate) remapped to "Automate or Eliminate"
      → No "assign to team member" language
    Follow with focus-and-priority-management
    Queue stoic-control-and-clarity for emotional grounding
```

**Foreman:**
> Forty percent of your week on support with 62 customers means your support process is consuming roughly 16 hours weekly -- approximately 15 minutes per customer per week. That ratio is unsustainable and will worsen as you grow. The absence of documentation means every ticket requires your full cognitive engagement rather than a repeatable response.
>
> Here is your situation mapped through the Eisenhower Matrix, adapted for solo operation:
>
> ### Eisenhower Matrix -- Solo Adaptation
>
> ```
>                     URGENT                     NOT URGENT
>             ┌──────────────────────┬──────────────────────┐
>   IMPORTANT │ Q1: DO NOW           │ Q2: SCHEDULE         │
>             │                      │                      │
>             │ - Critical bugs      │ - Feature development│
>             │ - Revenue-threatening │ - Documentation/SOPs │
>             │   support tickets    │ - Marketing strategy │
>             │ - Billing failures   │ - Pricing review     │
>             │                      │ - Product roadmap    │
>             ├──────────────────────┼──────────────────────┤
>  NOT        │ Q3: AUTOMATE OR      │ Q4: ELIMINATE        │
>  IMPORTANT  │ ELIMINATE            │                      │
>             │                      │ - Vanity metrics     │
>             │ - Routine "how-to"   │   tracking           │
>             │   support tickets    │ - Social media       │
>             │ - Onboarding emails  │   without ROI data   │
>             │ - Status inquiries   │ - Feature requests   │
>             │ - Billing FAQ        │   from non-paying    │
>             │                      │   users              │
>             └──────────────────────┴──────────────────────┘
> ```
>
> **Note what changed:** In the standard Eisenhower Matrix, Quadrant III is "Delegate." You have no one to delegate to, and suggesting you hire someone at $4K MRR would be irresponsible. The solo adaptation replaces delegation with a two-part test: **Can this be automated?** If yes, automate it. If no, **can it be eliminated without meaningful revenue impact?** If yes, eliminate it.
>
> Your 40% support load lives primarily in Q3. The majority of those tickets are almost certainly repeatable questions with predictable answers. The fix is not "work faster" -- it is "build a system that answers before the customer asks."
>
> **Immediate priorities:**
> 1. Audit your last 30 support tickets and categorise them. My estimate: 60-70% are FAQ-addressable.
> 2. Build a knowledge base covering the top 10 recurring questions. Time investment: one weekend. Time savings: permanent.
> 3. Set up auto-responses for billing and account inquiries using your help desk tool.
>
> This alone should recover 10+ hours per week -- time that moves directly into Q2 (feature development and marketing strategy).

---

### Turn 3: Deeper Prioritisation and Stoic Grounding

**Jake:**
> That makes sense. But even after I fix support, I still have marketing, sales, product, and operations all competing. And honestly -- I see competitors with teams of five shipping features every week. I feel like I'm falling behind every day.

**Behind the scenes:**
```
Skill Executor applies focus-and-priority-management:
  Solo adaptation: "align team" → "commit personally"; "delegate" → "automate or drop"
  Queue stoic-control-and-clarity (as SKILL, not mode -- /stoic on not invoked):
    Euthymia test: Jake is chasing competitor footpaths
    Seven Functions: Purpose and Assent compromised
```

**Foreman:**
> After support is systematised, you face a capacity allocation problem. The answer is not a balanced split -- it is a deliberate imbalance.
>
> **The Solo Operator's Priority Stack (early-traction stage):**
>
> | Rank | Function | Weekly Hours | Rationale |
> |------|----------|-------------|-----------|
> | 1 | Product | 15-20 | At $4K MRR, product quality is your moat. |
> | 2 | Marketing | 8-10 | Content and SEO compound. Outbound does not scale for one person. |
> | 3 | Support | 5-8 | Post-automation target. Knowledge base handles volume. |
> | 4 | Sales | 3-5 | Product-led growth replaces cold outbound. |
> | 5 | Operations | 2-3 | Billing, admin, tools. Automate ruthlessly. |
>
> **Stop immediately:** Manual outbound sales emails (negative ROI for solo operators), custom feature work for individual customers below 10% of MRR, networking events without measurable objectives.
>
> Now, the competitor comparison. A team of five with venture funding has different economics, different timelines, and different failure modes. They ship faster and burn faster. Their runway is someone else's money with a clock attached. Yours is renewable revenue accountable to no one but your customers.
>
> Two diagnostic questions: Are your customers leaving for competitors? If churn is low, feature velocity is a vanity metric. Is your revenue flat from competitive pressure or your capacity ceiling? Those are different problems. Separate what you control from what you cannot. Your product quality, support experience, content strategy, and operating rhythm are yours. Their headcount and funding are not. Direct energy accordingly.
>
> Your burnout is not a footnote -- it is a structural risk. A solo business has zero redundancy. **Personal sustainability is a Q1 item -- urgent and important -- not a reward you earn after the work is done.**

---

### Turn 5: Weekly Review and Action Plan

**Jake:**
> OK. I want a system for keeping myself on track. What does that look like?

**Behind the scenes:**
```
Output Agent applies template selection:
  weekly-ceo-review → audience: self (unchanged in solo mode)
    Solo remapping: "self-only operational review"
    Remove: "People Issues" section (no team)
    Replace with: "Contractor & System Status"
    Remove: references to direct reports, team meetings
    Add: personal energy and sustainability check

  action-plan → audience: team → REMAPPED to self
    Solo remapping: "personal implementation checklist"
    Remove: "Owner" column (everything is Jake)
    Remove: team distribution instructions
    Replace "Owner" with "Method" (manual / automated / outsourced)
```

**Foreman:**
> Two tools. Use both weekly.
>
> ### Weekly Self-Review (Solo-Adapted)
>
> Complete every Friday in 15 minutes. The standard weekly-ceo-review includes "People Issues," "Board Prep," and "Investor Relations" -- solo mode removes all three. What remains:
>
> | Section | Content |
> |---------|---------|
> | **Revenue** | MRR, new customers, churned customers, net change |
> | **Product** | Features shipped, bugs fixed, backlog changes |
> | **Support** | Tickets, % resolved by knowledge base, response time |
> | **Marketing** | Content published, traffic, inbound leads |
> | **Systems** | What was automated or documented this week? |
> | **Energy** | Sustainability rating (1-5). Below 3 for two consecutive weeks = something must be cut. |
> | **Next week's top 3** | Three priorities. More than three means you have not prioritised. |
>
> ### Action Plan (Solo-Adapted)
>
> **Objective:** Recover 15 hours/week by systematising support and eliminating low-ROI activities. 30 days.
>
> | # | Action | Method | Deadline | Success Metric |
> |---|--------|--------|----------|----------------|
> | 1 | Audit last 30 support tickets, categorise | Manual (one-time) | This weekend | FAQ list drafted |
> | 2 | Build knowledge base (top 10 FAQs) | Manual (one-time) | Week 2 | Live, linked from app |
> | 3 | Auto-responses for billing/account queries | Automated (tool) | Week 2 | Active in help desk |
> | 4 | Stop cold outbound sales | Eliminate | Immediate | Hours reallocated |
> | 5 | 2 SEO articles per month | Manual (recurring) | Ongoing | Inbound leads tracked |
> | 6 | Friday self-review | Manual (recurring) | This Friday | First review done |
> | 7 | Block 15-20 hours weekly for product | System (calendar) | Monday | Calendar blocks defended |
>
> *The standard action-plan "Owner" column is replaced with "Method" -- the solo operator's question is never "who does this" but "how: manually, automated, or outsourced?"*

---

## Behind the Scenes: What Solo Mode Changed

### Skill Routing

| Normal Mode Would Have Suggested | Solo Mode Selected Instead |
|----------------------------------|---------------------------|
| delegation-and-empowerment | eisenhower-matrix (solo-adapted: Q3 = Automate or Eliminate) |
| tuckman-team-stages | focus-and-priority-management |
| psychological-safety | stoic-control-and-clarity (isolation management emphasis) |
| leader-resilience-and-wellbeing (standard) | leader-resilience-and-wellbeing (queued with burnout-as-structural-risk framing) |

### Template Remapping

| Template | Normal Audience | Solo Audience | What Changed |
|----------|----------------|---------------|-------------|
| weekly-ceo-review | self | self (unchanged) | Removed: People Issues, Board Prep, Investor Relations. Added: Systems status, Energy rating. |
| action-plan | team | self | Removed: Owner column, team distribution. Added: Method column (manual/automated/outsourced). |

### Voice Changes

| Normal Mode | Solo Mode |
|------------|-----------|
| "Align your team around these priorities" | "Commit to these priorities" |
| "Delegate Q3 tasks to your team" | "Automate or eliminate Q3 tasks" |
| "Your VP of Sales should own pipeline" | "Your sales process should be systematised for inbound" |
| "Discuss with your board" | Not mentioned (no board exists) |
| "Consider hiring to address capacity" | "Build systems that do not require headcount" |

### Diagnostic Adaptation

`operational-chaos-diagnosis` ran with `reframe` adaptation:
- "Are your processes documented?" became "Do you have personal SOPs for recurring tasks?"
- "Is there accountability across teams?" became "Do you have a system for tracking commitments and deadlines?"
- "Is your operations team staffed adequately?" became "Are you trying to do more than one person reasonably can?"

---

## Final Deliverables

1. **Eisenhower Matrix** -- Solo-adapted with Q3 remapped from "Delegate" to "Automate or Eliminate"
2. **Solo Operator's Priority Stack** -- Weekly hour allocation across five functions
3. **Weekly Self-Review** -- Solo-adapted template with energy monitoring and no team sections
4. **30-Day Action Plan** -- Self-assigned with Method column replacing Owner column

---

## Key Takeaways

1. **Solo mode changes application, not frameworks.** The Eisenhower Matrix is the same intellectual tool. The difference is that Quadrant III cannot mean "delegate" when there is no one to delegate to. The framework adapts; the logic persists.

2. **Audience remapping is invisible but structural.** Jake never asked for "team-adapted" or "investor-adapted" output. Solo mode ensured he never received it. Every template defaulted to self-audience, and team-audience templates were silently remapped to personal implementation documents.

3. **The voice carries the weight.** Solo mode's most important contribution is not what it adds but what it removes. No references to teams that do not exist. No suggestions to hire at a stage where hiring is premature. No board meetings, no all-hands, no one-on-ones. The system speaks to a person running a business alone -- and treats that as a legitimate, permanent operating model rather than a phase to outgrow.

4. **Freelancer and automation alternatives replace team solutions.** Where the default system says "hire," solo mode says "automate." Where it says "delegate," solo mode says "eliminate or outsource to a contractor." The strategic logic is identical -- reduce the founder's personal burden on low-value tasks -- but the mechanism respects the solopreneur's constraints.

5. **Personal sustainability becomes a first-class concern.** In normal mode, founder burnout is a risk factor. In solo mode, it is a structural threat with zero redundancy. The system elevates it from "nice to address" to "urgent and important."
