---
name: "command-group-name"
description: "What this command group covers and when these commands apply."
category: "navigation | execution | memory | playbook | output | meta"
commands:
  - name: "/command"
    syntax: "/command [required] [--optional]"
    description: "What it does in one sentence."
  - name: "/another-command"
    syntax: "/another-command [required] [--flag value]"
    description: "What it does in one sentence."
author: "Fatih Guner"
---

<!-- COMMAND GROUP TEMPLATE
     Commands are explicit instructions entrepreneurs give to the Foreman system.
     Unlike hooks (natural language -> interpretation -> routing), commands map
     directly to system operations with predictable, deterministic behavior.

     RULES:
     - Every command group file follows this section structure per command
     - Frontmatter lists all commands in the group with name, syntax, description
     - Category must be one of: navigation, execution, memory, playbook, output, meta
     - Syntax uses brackets: [required], [--optional], [--flag value]
     - Parameters table must cover every argument and flag
     - Minimum 3 examples per command showing realistic entrepreneur usage
     - Error handling must produce actionable messages, not generic failures
     - Writing style: CLI-documentation clarity with Foreman's analytical voice
     - Cross-reference related commands from other groups where relevant
-->

# {Command Group Title}

## `/command`

### Description

{One paragraph explaining what this command does, when to use it, and what it returns.}

### Syntax

```
/command [required-param] [--optional-flag value]
```

### Parameters

| Parameter | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| `required-param` | Yes | string | -- | {What this parameter controls} |
| `--optional-flag` | No | string | `all` | {What this flag filters or modifies} |

### Examples

```
/command value
→ {Expected output summary}

/command value --optional-flag setting
→ {Expected output summary}

/command another-value
→ {Expected output summary}
```

### Related Commands

- `/other-command` — {How it connects to this command}

### Error Handling

| Input | Error Message |
|-------|---------------|
| `/command` (missing required param) | `Missing required parameter. Usage: /command [required-param]` |
| `/command nonexistent` | `No match found for "nonexistent". Run /search to find available options.` |

---

<!-- Repeat the above section structure for each command in the group.
     Maintain consistent heading levels: ## for command name, ### for subsections.
     Keep each command self-contained — a reader should understand one command
     without reading the others. -->
