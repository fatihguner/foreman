---
name: "research-hook"
description: "Hook for research-hook intent classification and routing"
priority: "medium"
author: "Fatih Guner"
---

# Research Hook

Entrepreneurs frequently arrive at a framework knowing they need data they do not have. The instinct is to guess, to substitute opinion for evidence, or to skip the analysis entirely. None of these produces good decisions. This hook intercepts research-related intent and routes to the structured research guides in `.claude/research/`, which teach entrepreneurs how to gather the specific data that skills, diagnostics, and playbooks require as input.

## Trigger Patterns

1. "I need data"
2. "Where do I find information about my market?"
3. "How do I research my competitors?"
4. "I don't have the numbers"
5. "Need to validate my assumptions"
6. "How do I size my market?"
7. "Need competitive intelligence"
8. "How to interview customers"
9. "I need to do due diligence"
10. "Don't know where to start with research"
11. "How much should I charge -- I need pricing data"
12. "Need to understand the regulatory landscape"
13. "How do I find out what customers actually want?"
14. "I'm guessing at these numbers"
15. "Where do I get benchmarks for my industry?"

## Intent Classification

| Signal | Intent | Confidence |
|--------|--------|------------|
| Market size, TAM/SAM/SOM, market opportunity | `market-research` | High |
| Competitor analysis, competitive landscape, competitive intelligence | `competitor-research` | High |
| Customer interviews, surveys, churn reasons, user testing | `customer-research` | High |
| Financial models, unit economics, pricing data, willingness-to-pay | `financial-research` | High |
| Technology choices, stack evaluation, build vs. buy | `technical-research` | Medium |
| Regulations, compliance, legal landscape | `regulatory-research` | Medium |
| Due diligence, partner vetting, acquisition research | `due-diligence` | Medium |
| Hiring benchmarks, salary data, talent availability | `talent-research` | Medium |
| Content strategy, audience research, channel analysis | `content-research` | Medium |
| Brand perception, NPS, reputation | `brand-research` | Medium |

## Routing Logic

```
IF intent == market-research:
  --> /research market-sizing-worksheet
  --> /research industry-mapping-guide

IF intent == competitor-research:
  --> /research competitor-research-template

IF intent == customer-research:
  --> /research customer-interview-guide
  --> /research survey-design (if quantitative emphasis)
  --> /research churn-analysis (if retention context)
  --> /research user-testing-protocol (if product testing context)

IF intent == financial-research:
  --> /research financial-modeling
  --> /research pricing-research-guide
  --> /research funding-landscape (if capital-seeking context)

IF intent == technical-research:
  --> /research technology-stack

IF intent == regulatory-research:
  --> /research regulatory-landscape

IF intent == due-diligence:
  --> /research due-diligence-research

IF intent == talent-research:
  --> /research talent-market-research

IF intent == content-research:
  --> /research content-strategy-research

IF intent == brand-research:
  --> /research brand-perception-research
```

**Priority:** Medium

## Disambiguation

The research hook intercepts the need for data, not the need for analysis. Once the entrepreneur has the data, the system routes to skills and diagnostics that use it.

| Overlapping Hook | Overlap Condition | Resolution |
|-----------------|-------------------|------------|
| `revenue-and-sales-hook` | Entrepreneur mentions pricing but lacks data to analyse | Research hook takes priority -- gather data first, then apply pricing frameworks |
| `competition-hook` | Entrepreneur asks about competitors but has no competitive intelligence | Research hook takes priority -- run `/research competitor-research-template` before applying Porter's Five Forces |
| `product-hook` | Entrepreneur wants to validate a feature but has no user data | Research hook takes priority -- run `/research user-testing-protocol` or `/research customer-interview-guide` before product decisions |
| `strategy-hook` | Entrepreneur needs strategic direction but lacks market data | Research hook takes priority -- market sizing and industry mapping precede strategy frameworks |
| `decision-hook` | Entrepreneur cites "not enough information" as the blocker | Shared routing -- decision hook addresses the paralysis pattern, research hook addresses the actual information gap. Both may fire. |

**Disambiguation prompt:** "Are you looking for a framework to analyse data you already have, or do you need guidance on how to gather the data in the first place?"

## Example Conversations

**Example 1: Market sizing need**

> **Founder:** "I keep hearing I need to know my TAM but I have no idea how to calculate it or where to get the numbers."
>
> **Foreman:** Calculating TAM without a method produces a number that impresses no one and informs nothing. The market-sizing worksheet walks you through a bottom-up approach using data you can actually find -- census data, industry reports, proxy metrics from adjacent markets. It takes two to four hours and produces a defensible number rather than a hopeful one.
>
> *Routes to: `/research market-sizing-worksheet`*

**Example 2: Customer research gap**

> **Founder:** "We think customers are churning because of price, but honestly we haven't asked them."
>
> **Foreman:** Assuming the reason for churn is the most expensive form of guessing in business. The customer interview guide gives you a structured protocol -- whom to contact, what to ask, how to interpret evasive answers -- that surfaces the actual reason in five to ten conversations. The churn analysis guide complements it with quantitative methods if you have usage data.
>
> *Routes to: `/research customer-interview-guide`, `/research churn-analysis`*

**Example 3: Competitive intelligence**

> **Founder:** "We're about to enter a new market and I need to understand who's already there and how they're positioned."
>
> **Foreman:** Entering a market without a competitor map is navigating without a chart. The competitor research template structures your intelligence gathering: direct competitors, adjacent threats, their pricing, positioning, and vulnerable flanks. Pair it with the industry mapping guide for the broader landscape.
>
> *Routes to: `/research competitor-research-template`, `/research industry-mapping-guide`*
