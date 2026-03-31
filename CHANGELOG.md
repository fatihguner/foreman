# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/).

## [Unreleased]

No unreleased changes.

## [1.0.0] - 2026-03-29

Initial public release of Foreman -- an AI-powered strategic advisor for entrepreneurs.

### Added

#### Core Content
- 158 skills across 12 categories derived from 12 source books:
  - `frameworks` (50), `leadership` (28), `writing` (13), `ai-leadership` (9)
  - `game-theory` (7), `stoic` (12), `storytelling` (8), `negotiation` (4)
  - `people` (8), `creative` (8), `thinking` (6), `decisions` (5)
- 48 output templates across 5 audiences:
  - `investor` (10), `board` (7), `team` (13), `self` (10), `client` (8)
- 24 diagnostics: 20 core triage systems + 2 organizational politics + 1 board simulation + 1 implementation
- 21 playbooks: 20 core multi-step recipes + 1 organizational alignment playbook
- 17 hooks for natural-language intent classification and routing
- 18 research guides with structured data collection protocols covering market sizing, competitor research, customer interviews, pricing, due diligence, user testing, and industry mapping

#### Orchestration
- 6 agents: orchestrator, diagnostic, skill-executor, playbook-runner, output, memory
- 5-layer memory system:
  - `identity` (yearly), `company` (monthly), `history` (append-only)
  - `active` (weekly), `session` (ephemeral)
- 13 command files defining approximately 45 structured commands across 6 groups:
  - navigation (7), execution (5), memory (8), playbook (5), output (3), meta (5)
  - Plus specialized commands for solo, stoic, language, implementation, research, simulation, and org-politics

#### Modes
- Solo Mode: complete solopreneur adaptation layer with skill relevance scoring, audience remapping, and diagnostic/playbook/hook adaptations
- Stoic Mode: philosophical depth layer framing responses through Stoic principles (dichotomy of control, cardinal virtues, premeditatio malorum, amor fati)
- Language Mode: full output language switch supporting any language the model speaks fluently, with persistent cross-session configuration

#### Industry Packs
- 9 sector-specific overlay packs, each containing 4 YAML files (benchmarks, skill overlays, diagnostic rules, template adaptations):
  - SaaS, Marketplace, E-Commerce, Fintech, AI/ML
  - HealthTech, EdTech, D2C/Consumer, Agency/Consulting

#### Systems
- Implementation tracking: 6-state lifecycle (not-started, in-progress, blocked, completed, abandoned, deferred), blocker categorization across 5 types, weekly check-in protocol, and support system with 14-category stuck protocols
- Board simulation: 10 adversarial personas, 5-dimension scoring framework, post-simulation diagnostic, and memory persistence
- Organizational politics navigation: stakeholder resistance diagnosis, power dynamics mapping, coalition building, and influence strategy design with 6 templates

#### Tooling and Infrastructure
- 21 utility scripts:
  - 7 validation (skills, templates, diagnostics, playbooks, hooks, all, broken-refs)
  - 5 content creation (new-skill, new-template, new-diagnostic, new-playbook, new-hook)
  - 3 analysis (stats, orphan-check, coverage-report)
  - 4 maintenance (update-claude-md, bump-version, rename-category, anonymize-author)
  - 2 community (setup, pre-commit-hook)
- 8 end-to-end example walkthroughs demonstrating complete advisory workflows
- 12 schema files defining structure for all content types
- Complete GitHub configuration: CI workflows, issue templates (bug report, skill request, feature request), pull request template, CODEOWNERS, labels, and funding configuration
- Project documentation: architecture overview, getting-started guide, skill authoring guide, playbook authoring guide, style guide, and stage mapping reference
