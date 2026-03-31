---
name: "org-politics-commands"
description: "Commands for navigating organizational politics: viewing stakeholder maps, generating power dynamics maps, analyzing resistance to initiatives, and designing coalition strategies. These commands operate on the organizational politics navigation layer and read from and write to the company, active, and history memory layers."
category: "org-politics"
commands:
  - name: "/stakeholders"
    syntax: "/stakeholders [--position <filter>] [--power <filter>] [--initiative <name>]"
    description: "View the current stakeholder influence map from memory, filterable by position, power level, or initiative."
  - name: "/power-map"
    syntax: "/power-map [--initiative <name>] [--refresh]"
    description: "Generate or update the power dynamics map showing formal authority, informal influence, and information flows."
  - name: "/resistance"
    syntax: "/resistance \"<initiative-name>\""
    description: "Analyze stakeholder resistance to a specific initiative by running the stakeholder-resistance-diagnosis."
  - name: "/coalition"
    syntax: "/coalition \"<initiative-name>\" [--status]"
    description: "Design a new coalition strategy or review the status of an existing coalition for a specific initiative."
author: "Fatih Guner"
---

# Organizational Politics Commands

## `/stakeholders`

View the current stakeholder influence map from memory. Default view shows all mapped stakeholders sorted by power level. Filters narrow to specific positions, power levels, or initiatives. If no map exists, prompts the user to create one via the organizational-alignment-playbook.

**Syntax:** `/stakeholders [--position <filter>] [--power <filter>] [--initiative <name>]`

**Parameters:** `--position` (champion/supporter/neutral/skeptic/blocker), `--power` (high/medium/low), `--initiative` (initiative name in quotes).

**Examples:**
```
/stakeholders
/stakeholders --position blocker
/stakeholders --power high
/stakeholders --initiative "Q2 Pivot"
/stakeholders --position champion --initiative "Platform Rewrite"
```

**Related:** `/power-map`, `/resistance`, `/coalition`, `/context`
**Errors:** No map in memory prompts creation. Invalid filter names return valid options.

---

## `/power-map`

Generate or refresh the power dynamics map showing formal authority, informal influence, and information flows. Displays existing map from memory and prompts for updates. The `--refresh` flag forces complete reassessment after organizational changes.

**Syntax:** `/power-map [--initiative <name>] [--refresh]`

**Parameters:** `--initiative` (scope to specific initiative), `--refresh` (force reassessment).

**Examples:**
```
/power-map
/power-map --initiative "Q2 Pivot"
/power-map --refresh
```

**Related:** `/stakeholders`, `/resistance`, `/diagnose`
**Errors:** No organizational data prompts structure description. Unknown initiative lists available ones.

---

## `/resistance`

Analyze stakeholder resistance to a specific initiative by running stakeholder-resistance-diagnosis. Identifies all skeptics and blockers on the stakeholder map and diagnoses root cause for each. Outputs per-stakeholder diagnosis, root cause classification, and recommended engagement strategy. Results persist to active memory.

**Syntax:** `/resistance "<initiative-name>"`

**Parameters:** `initiative-name` (required, quotes for multi-word).

**Examples:**
```
/resistance "Q2 product pivot"
/resistance "board approval for Series B"
/resistance "platform rewrite"
```

**Related:** `/stakeholders`, `/coalition`, `/power-map`, `/apply thomas-kilmann-conflict`
**Errors:** Missing parameter shows usage. No resisters found suggests hidden resistance diagnosis.

---

## `/coalition`

Design a new coalition strategy or review an existing one. Reads the stakeholder influence map, identifies potential supporters, and walks through target selection, value propositions, sequencing, commitment mechanisms, and defection risk. The `--status` flag shows current coalition health without initiating new design.

**Syntax:** `/coalition "<initiative-name>" [--status]`

**Parameters:** `initiative-name` (required, quotes for multi-word), `--status` (review existing coalition).

**Examples:**
```
/coalition "board approval for Series B"
/coalition "Q2 pivot" --status
/coalition "platform rewrite"
/coalition "international expansion" --status
```

**Related:** `/stakeholders`, `/resistance`, `/power-map`, `/apply coalition-and-partnership-games`
**Errors:** Missing parameter shows usage. No existing coalition with `--status` suggests creation command.
