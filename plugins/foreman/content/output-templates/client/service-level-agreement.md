---
name: "service-level-agreement"
description: "Produces a service-level agreement template for service-based businesses that balances contractual clarity with readability. Covers service description, scope boundaries, performance metrics with measurement methods, service credits for breaches, tiered escalation procedures, review cadence, and termination provisions. Written in plain professional English -- not legalese. Use when formalizing service commitments to clients, establishing accountability structures with partners, or replacing handshake agreements with documented performance standards."
audience: "client"
applicable_skills:
  - smart-goals
  - net-promoter-score
  - trust-equation
  - delivering-the-deal
format: "agreement"
author: "Fatih Guner"
---

# Service Level Agreement

<!-- INSTRUCTIONS:
     This template produces a readable SLA, not a legal contract. Have legal
     counsel review and adapt the final version before execution.
     Every metric needs three things: a target, a measurement method, and a
     consequence for missing it. A metric without a consequence is a suggestion.
     Scope exclusions matter as much as inclusions. Most SLA disputes originate
     in work the client assumed was covered but was never defined.
     Both parties should initial each section during review to confirm
     understanding -- not just sign the last page.
     Delete all HTML comments before delivery. -->

**Agreement reference:** [SLA-YYYY-XXX]

**Effective date:** [Date] | **Expiration date:** [Date or "Renewed annually unless terminated per Section 7"]

---

**Service provider:** [Organization name]

**Contact:** [Name, title, email, phone]

**Client:** [Organization name]

**Contact:** [Name, title, email, phone]

---

## 1. Service Description

**Service name:** [e.g., "Managed Cloud Infrastructure," "Fractional CFO Services," "Digital Marketing Retainer"]

**Service summary:** [Two to three sentences describing what the service provider delivers, the business outcome it supports, and the client's operational context. Write for someone who was not in the room when the deal was negotiated.]

**Service hours:** [e.g., "Monday through Friday, 09:00-18:00 [timezone], excluding national holidays per Schedule A" or "24/7/365"]

---

## 2. Scope of Services

### Included

| # | Service component | Description | Delivery method |
|---|------------------|-------------|----------------|
| 1 | [e.g., System monitoring] | [What this entails specifically] | [e.g., Automated tooling + human review] |
| 2 | [e.g., Monthly reporting] | [What the report covers] | [e.g., Written report delivered via email] |
| 3 | [e.g., Incident response] | [What constitutes an incident, what the response involves] | [e.g., Ticketing system + phone escalation] |
| 4 | [Component] | [Description] | [Method] |
| 5 | [Component] | [Description] | [Method] |

### Excluded

_Clarity on boundaries prevents disputes. Name the services the client might reasonably assume are included but are not._

- [Exclusion 1 -- e.g., "Third-party vendor management beyond the platforms listed in Schedule B"]
- [Exclusion 2 -- e.g., "Hardware procurement and physical infrastructure maintenance"]
- [Exclusion 3 -- e.g., "Training beyond the initial onboarding sessions defined in Section 2.1"]
- [Exclusion 4 -- e.g., "Work requested outside service hours unless pre-approved as out-of-scope engagement"]

**Out-of-scope requests:** Handled via a separate statement of work at rates defined in Schedule C.

---

## 3. Performance Metrics

### 3.1 Availability / Uptime

| Metric | Target | Measurement method | Measurement period | Reporting frequency |
|--------|--------|-------------------|-------------------|-------------------|
| Service uptime | [e.g., 99.5%] | [e.g., Automated monitoring via [tool], calculated as total minutes minus downtime minutes divided by total minutes] | [Monthly] | [Monthly report, Section 5 of client dashboard] |

**Scheduled maintenance windows:** [e.g., "Sundays 02:00-06:00 [timezone], notified 72 hours in advance. Scheduled maintenance is excluded from uptime calculations."]

### 3.2 Response Time

| Severity | Definition | Target response time | Target acknowledgment |
|----------|-----------|---------------------|-----------------------|
| Critical (S1) | [e.g., Complete service outage or data loss affecting production] | [e.g., 15 minutes] | [e.g., 30 minutes with named responder] |
| High (S2) | [e.g., Significant degradation affecting multiple users] | [e.g., 1 hour] | [e.g., 2 hours] |
| Medium (S3) | [e.g., Partial impact, workaround available] | [e.g., 4 hours] | [e.g., 8 business hours] |
| Low (S4) | [e.g., Minor issue, cosmetic, or feature request] | [e.g., 1 business day] | [e.g., 2 business days] |

### 3.3 Resolution Time

| Severity | Target resolution time | Escalation trigger |
|----------|----------------------|-------------------|
| Critical (S1) | [e.g., 4 hours] | [Auto-escalates to Tier 2 at 2 hours] |
| High (S2) | [e.g., 8 business hours] | [Auto-escalates to Tier 2 at 4 hours] |
| Medium (S3) | [e.g., 3 business days] | [Escalates at provider discretion] |
| Low (S4) | [e.g., 10 business days] | [Included in next scheduled maintenance cycle] |

---

## 4. Service Credits

_What happens when commitments are missed. An SLA without consequences is a marketing document._

### 4.1 Credit Schedule

| SLA metric | Threshold breached | Credit applied |
|------------|-------------------|----------------|
| Monthly uptime | [Below 99.5% but above 99.0%] | [5% of monthly service fee] |
| Monthly uptime | [Below 99.0% but above 95.0%] | [15% of monthly service fee] |
| Monthly uptime | [Below 95.0%] | [30% of monthly service fee] |
| S1 response time | [Missed in more than 1 incident per month] | [5% of monthly service fee per additional miss] |
| S1 resolution time | [Missed in more than 1 incident per month] | [10% of monthly service fee per additional miss] |

### 4.2 Credit Provisions

- Maximum aggregate credit per month: [e.g., 30% of monthly service fee]
- Credits applied to the following month's invoice, not issued as cash refunds
- Client must request credits within [e.g., 30 days] of the breach
- Credits do not apply when the breach results from client actions, force majeure, or scheduled maintenance

---

## 5. Escalation Procedures

| Tier | Condition | Contact | Response commitment |
|------|-----------|---------|-------------------|
| Tier 1 -- Operational | [Standard issues, initial contact for all requests] | [Name / Team, email, phone] | [Per severity targets in Section 3] |
| Tier 2 -- Management | [Unresolved after target resolution time, or client requests escalation] | [Name / Title, email, phone] | [Acknowledgment within 1 hour; status update every 2 hours until resolved] |
| Tier 3 -- Executive | [Business-critical impact unresolved after 2x target resolution time, or pattern of repeated failures] | [Name / Title, email, phone] | [Direct engagement within 30 minutes; resolution plan within 4 hours] |

**Escalation rights:** The client may escalate directly to any tier at any time. Tier 1 triage is the recommended path but not a mandatory gate.

**Post-incident review:** Any S1 incident triggers a written root cause analysis delivered within [e.g., 5 business days], including corrective actions to prevent recurrence.

---

## 6. Review and Amendment

**Regular review cadence:** [e.g., Quarterly -- aligned with the quarterly business review]

**Review covers:**

- SLA performance vs. targets (all metrics from Section 3)
- Service credit activity (Section 4)
- Escalation frequency and resolution patterns (Section 5)
- Scope relevance -- whether included/excluded services still match client needs
- Proposed amendments for the next period

**Amendment process:** Either party may propose SLA amendments in writing. Amendments require mutual written agreement and take effect [e.g., 30 days] after execution. Performance targets cannot be reduced below the levels defined in this agreement without the client's written consent.

---

## 7. Term and Termination

**Initial term:** [e.g., 12 months from effective date]

**Renewal:** [e.g., Automatically renews for successive 12-month periods unless either party provides written notice of non-renewal at least 60 days before the current term expires]

**Termination for convenience:** Either party may terminate with [e.g., 90 days] written notice.

**Termination for cause:** Either party may terminate with [e.g., 30 days] written notice if the other party materially breaches this agreement and fails to cure the breach within the notice period.

**Termination triggers (service provider):**

- Client non-payment beyond [e.g., 45 days] past due
- Client actions that compromise service integrity or security

**Termination triggers (client):**

- Three or more S1 SLA breaches in any rolling 90-day period
- Aggregate service credits exceeding [e.g., 30%] of fees in any single month
- Failure to deliver post-incident root cause analysis for two consecutive S1 incidents

**Transition assistance:** Upon termination, the service provider will deliver reasonable transition support for a period of [e.g., 30 days] at standard rates, including data export, documentation handover, and knowledge transfer sessions.

---

**Signatures:**

| | Service provider | Client |
|---|-----------------|--------|
| Name | [Name] | [Name] |
| Title | [Title] | [Title] |
| Date | [Date] | [Date] |
| Signature | _________________ | _________________ |

---

**Schedules:**

- **Schedule A:** Holiday calendar and service hour exceptions
- **Schedule B:** Covered platforms, systems, and environments
- **Schedule C:** Out-of-scope rate card
