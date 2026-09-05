---
name: "research-commands"
description: "Commands for discovering, loading, and tracking structured research guides that teach entrepreneurs how to gather the data required by Foreman's skills and frameworks."
category: "research"
commands:
  - name: "/research"
    syntax: "/research"
    description: "List all available research templates with type, time estimate, and connected skills."
  - name: "/research [template-name]"
    syntax: "/research [template-name]"
    description: "Load a specific research template with its full protocol and collection forms."
  - name: "/research for [skill-name]"
    syntax: "/research for [skill-name]"
    description: "Show which research templates feed into a specific skill."
  - name: "/research status"
    syntax: "/research status"
    description: "Show research collection efforts in progress."
author: "Fatih Guner"
---

# Research Commands

## `/research`

Lists every research template in the system with name, type, estimated time, and connected skills.

```
/research
--> 4 research templates available
    pricing-research-guide      | customer  | 8-15 hrs  | Feeds: four-ps-marketing, ...
    due-diligence-research      | financial | 20-40 hrs | Feeds: due-diligence-checklist, ...
    user-testing-protocol       | customer  | 10-20 hrs | Feeds: net-promoter-score, ...
    industry-mapping-guide      | market    | 15-25 hrs | Feeds: porters-five-forces, ...
```

This command takes no parameters and has no failure modes. Related: `/research [name]`, `/research for [skill]`, `/skills`.

---

## `/research [template-name]`

Loads a full research template: purpose, data sources, step-by-step protocol, collection forms, interpretation guide, and output mapping. Partial matches return suggestions.

| Parameter | Required | Type | Description |
|-----------|----------|------|-------------|
| `template-name` | Yes | string | Template identifier in kebab-case |

```
/research pricing-research-guide
--> Loading: Pricing Research Guide
    Type: customer | Time: 8-15 hrs | Feeds: four-ps-marketing, pricing-diagnosis, ...
    [Full template rendered]

/research industry-mapping
--> No exact match. Did you mean: industry-mapping-guide?

/research competitor
--> No exact match. Related: industry-mapping-guide, pricing-research-guide

/research customer-interview
--> No exact match. Related: user-testing-protocol, pricing-research-guide
```

**Error**: `/research nonexistent` returns `No template matching "nonexistent". Run /research to see all.`

Related: `/research`, `/apply [skill]`, `/research status`.

---

## `/research for [skill-name]`

Reverse-lookup: returns all research templates whose `feeds_into_skills` or `feeds_into_templates` include the given name. Use before applying a framework to verify you have the required data.

| Parameter | Required | Type | Description |
|-----------|----------|------|-------------|
| `skill-name` | Yes | string | Skill or template identifier in kebab-case |

```
/research for porters-five-forces
--> Recommended: industry-mapping-guide (market, 15-25 hrs)

/research for unit-economics-snapshot
--> Recommended: pricing-research-guide (8-15 hrs), due-diligence-research (20-40 hrs)

/research for stoic-emotional-mastery
--> No research templates feed into this skill.
```

**Errors**: Missing skill name returns usage hint. Unknown skill name suggests `/skills` or `/templates` to browse.

Related: `/skill [name]`, `/research [template]`, `/diagnose [area]`.

---

## `/research status`

Displays active research efforts from the implementation tracking layer: progress, next steps, and blockers. Returns guidance when nothing is tracked.

```
/research status
--> Active research: 2 items
    pricing-research-guide  | In progress | 3/5 steps | Next: WTP interviews
    industry-mapping-guide  | Not started | 0/6 steps | Next: Define boundaries

/research status
--> No active research. Run /research [name] to load a guide, then /track to begin.
```

Related: `/track`, `/progress [item-id] [%] [note]`, `/blockers`, `/check-in`.
