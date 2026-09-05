---
name: "fundraising-hook"
description: "Captures intent related to raising capital, investor relations, pitch preparation, valuation disputes, term sheets, and runway anxiety"
trigger_patterns:
  - "need to raise money"
  - "investors keep saying no"
  - "pitch isn't working"
  - "VCs ghost me"
  - "valuation pushback"
  - "don't know how to pitch"
  - "Series A prep"
  - "running out of runway"
  - "need a bridge round"
routes_to:
  diagnostics:
    - fundraising-diagnosis
  skills:
    - storytelling-for-leaders
    - persuasion-and-influence
    - business-model-canvas
  playbooks:
    - fundraising-playbook
  output_templates:
    - fundraising-deck-outline
    - unit-economics-snapshot
priority: "high"
author: "Fatih Guner"
---

# Fundraising Hook

## Trigger Patterns

Fundraising is where financial pressure meets emotional vulnerability. Founders describe it through rejection stories, runway countdowns, and confusion about the process itself.

- "We need to raise money soon"
- "Investors keep saying no and I don't know why"
- "My pitch isn't working"
- "VCs ghost me after the first meeting"
- "Getting pushback on our valuation"
- "I don't know how to pitch to investors"
- "Preparing for our Series A"
- "Running out of runway in four months"
- "We need a bridge round to survive"
- "Should I raise or bootstrap?"
- "How much should I raise?"
- "Investor said our unit economics don't work"
- "Got a term sheet but it looks predatory"
- "Can't get past the partner meeting"
- "Spent six months fundraising with nothing to show"

## Intent Classification

| Pattern Cluster | Classified Intent | Confidence |
|---|---|---|
| Need to raise, how much to raise, raise or bootstrap | Fundraising readiness | High |
| Investors say no, VCs ghost, can't get past partner | Pitch failure | High |
| Running out of runway, bridge round, survive | Runway emergency | High |
| Valuation pushback, term sheet, predatory | Deal negotiation | Medium |
| Series A prep, unit economics | Stage-specific preparation | Medium |

## Routing Logic

**Fundraising readiness** -- Route to `fundraising-diagnosis`. Founders who are unsure whether to raise often have underlying business model questions. The diagnostic separates "not ready to raise" from "ready but unclear on approach." The `business-model-canvas` skill can pressure-test the underlying model.

**Pitch failure** -- Route to `fundraising-diagnosis` to determine whether the problem is the pitch, the business, or the targeting. If the business is sound and the issue is communication, escalate to `fundraising-playbook` with emphasis on narrative. The `storytelling-for-leaders` and `persuasion-and-influence` skills strengthen the pitch itself.

**Runway emergency** -- Route to `fundraising-diagnosis` with urgency. Short runway changes the calculus entirely -- bridge rounds, revenue acceleration, and cost cuts all enter the picture simultaneously. The diagnostic must triage survival versus optimization.

**Deal negotiation** -- Route to `fundraising-playbook` directly. Term sheet review and valuation negotiation are execution problems, not diagnostic ones. If the founder lacks negotiation fundamentals, the `negotiation-playbook` provides tactical support.

**Stage-specific preparation** -- Route to `fundraising-playbook` with stage context. Series A preparation has a known checklist; the playbook walks through metrics, narrative, and materials.

## Disambiguation

This hook overlaps with `revenue-and-sales-hook` when "running out of runway" is actually a revenue problem dressed as a fundraising question. If the diagnostic reveals the company could become self-sustaining with modest revenue improvements, re-route to `revenue-and-sales-hook`. Overlap with `strategy-hook` occurs when "should I raise?" masks a deeper strategic uncertainty. If the founder questions the entire direction of the business, defer to `strategy-hook`.

## Example Conversations

**Example 1: Repeated rejection**
Entrepreneur says: "I've pitched forty VCs and got two second meetings, both of which went nowhere."
Hook classifies as: Pitch failure.
Routes to: `fundraising-diagnosis` to determine whether the pitch, the metrics, or the targeting is the root cause.

**Example 2: Runway crisis**
Entrepreneur says: "We have maybe three months of cash left. I need to figure out next steps immediately."
Hook classifies as: Runway emergency.
Routes to: `fundraising-diagnosis` with urgency flag to triage between emergency raise, bridge round, revenue acceleration, and cost restructuring.

**Example 3: Preparation mode**
Entrepreneur says: "We're doing well -- growing 15% month over month. I want to start preparing for a Series A in six months."
Hook classifies as: Stage-specific preparation.
Routes to: `fundraising-playbook` with a preparation timeline, skipping the diagnostic since the intent is clear and the business is healthy.
