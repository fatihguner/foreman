/**
 * Foreman — OpenClaw Native Plugin
 *
 * Exposes Foreman's skills, diagnostics, playbooks, research guides,
 * board simulation, and implementation tracking as OpenClaw agent tools.
 *
 * Single source of truth: .claude/ directory.
 * This plugin reads from .claude/ at runtime and returns content
 * for the LLM to apply within the conversation context.
 *
 * Author: Fatih Guner
 */

import { definePluginEntry } from "openclaw/plugin-sdk/plugin-entry";
import { Type } from "@sinclair/typebox";
import { readFileSync, readdirSync, existsSync, statSync } from "fs";
import { join, resolve } from "path";

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

const PLUGIN_ROOT = import.meta.dirname;
const CLAUDE_DIR = resolve(PLUGIN_ROOT, ".claude");

function readFileOr(path: string, fallback: string): string {
  try {
    return readFileSync(path, "utf-8");
  } catch {
    return fallback;
  }
}

function listDir(path: string): string[] {
  if (!existsSync(path)) return [];
  return readdirSync(path).filter((f) => !f.startsWith("_"));
}

function listDirRecursive(path: string): string[] {
  if (!existsSync(path)) return [];
  const results: string[] = [];
  for (const entry of readdirSync(path)) {
    if (entry.startsWith("_")) continue;
    const full = join(path, entry);
    if (statSync(full).isDirectory()) {
      for (const child of readdirSync(full)) {
        if (child.startsWith("_")) continue;
        if (child.endsWith(".md")) results.push(`${entry}/${child}`);
      }
    } else if (entry.endsWith(".md")) {
      results.push(entry);
    }
  }
  return results;
}

function fuzzyMatch(needle: string, haystack: string): boolean {
  const n = needle.toLowerCase().replace(/[\s_-]+/g, "");
  const h = haystack.toLowerCase().replace(/[\s_-]+/g, "");
  return h.includes(n) || n.includes(h);
}

function findFile(dir: string, name: string, extensions = [".md", ".yaml", ".yml"]): string | null {
  if (!existsSync(dir)) return null;

  // Direct match first
  for (const ext of extensions) {
    const direct = join(dir, name + ext);
    if (existsSync(direct)) return direct;
    const withSuffix = join(dir, name + "-diagnosis" + ext);
    if (existsSync(withSuffix)) return withSuffix;
  }

  // Scan directory for fuzzy match
  const entries = readdirSync(dir);
  for (const entry of entries) {
    if (entry.startsWith("_")) continue;
    const full = join(dir, entry);
    if (statSync(full).isDirectory()) {
      // Recurse into subdirectories (e.g., skills/frameworks/)
      const sub = findFile(full, name, extensions);
      if (sub) return sub;
    } else if (fuzzyMatch(name, entry)) {
      return full;
    }
  }
  return null;
}

function textResult(text: string) {
  return { content: [{ type: "text" as const, text }] };
}

function errorResult(message: string) {
  return textResult(`Error: ${message}`);
}

// ---------------------------------------------------------------------------
// Plugin Entry
// ---------------------------------------------------------------------------

export default definePluginEntry((api) => {

  // =========================================================================
  // 1. foreman_apply_skill — Apply a specific business framework skill
  // =========================================================================

  api.registerTool(
    "foreman_apply_skill",
    {
      description:
        "Apply a Foreman business framework skill. Returns the full skill content (framework explanation, application prompts, use cases, anti-patterns, stage guidance) for the LLM to apply to the entrepreneur's context. 158 skills across 12 categories: frameworks, leadership, writing, ai-leadership, game-theory, stoic, storytelling, negotiation, people, creative, thinking, decisions.",
      parameters: Type.Object({
        skill: Type.String({ description: "Skill name or keyword to search for (e.g., 'okr', 'pricing-power', 'swot-analysis')" }),
        context: Type.Optional(Type.String({ description: "Entrepreneur's situation context to tailor the skill application" })),
      }),
    },
    async ({ skill, context }) => {
      const skillsDir = join(CLAUDE_DIR, "skills");
      const found = findFile(skillsDir, skill);

      if (!found) {
        const available = listDirRecursive(skillsDir);
        return errorResult(
          `Skill "${skill}" not found. Available skills (${available.length}):\n${available.join("\n")}`
        );
      }

      const content = readFileOr(found, "");
      const preamble = context
        ? `Apply the following skill to this context:\n---\n${context}\n---\n\n`
        : "";
      return textResult(preamble + content);
    }
  );

  // =========================================================================
  // 2. foreman_diagnose — Run a diagnostic triage
  // =========================================================================

  api.registerTool(
    "foreman_diagnose",
    {
      description:
        "Run a Foreman diagnostic to identify root causes through structured triage questions. Areas include: revenue, team, growth, product-market-fit, fundraising, pricing, customer-churn, hiring, leadership, culture, cofounder-conflict, operational-chaos, competitive-threat, innovation, communication, decision-paralysis, market-entry, partnership, negotiation, strategic-drift.",
      parameters: Type.Object({
        area: Type.String({
          description: "Diagnostic area (e.g., 'revenue', 'team', 'growth', 'pricing', 'hiring', 'fundraising')",
        }),
      }),
    },
    async ({ area }) => {
      const diagDir = join(CLAUDE_DIR, "diagnostics");
      const found = findFile(diagDir, area);

      if (!found) {
        const available = listDir(diagDir)
          .filter((f) => f.endsWith(".md"))
          .map((f) => f.replace("-diagnosis.md", "").replace(".md", ""));
        return errorResult(
          `Diagnostic "${area}" not found. Available diagnostics:\n${available.join("\n")}`
        );
      }

      const content = readFileOr(found, "");
      return textResult(content);
    }
  );

  // =========================================================================
  // 3. foreman_run_playbook — Start a multi-step playbook
  // =========================================================================

  api.registerTool(
    "foreman_run_playbook",
    {
      description:
        "Start a Foreman playbook — a multi-step recipe that chains skills sequentially with checkpoints and decision points. Playbooks include: fundraising, product-market-fit, launch, pivot, scaling, crisis, team-rebuild, competitive-response, strategy-reset, innovation-sprint, first-100-customers, pricing-strategy, partnership, negotiation, personal-brand, board-formation, remote-team, founder-transition, acquisition-evaluation, international-expansion.",
      parameters: Type.Object({
        playbook: Type.String({
          description: "Playbook name (e.g., 'fundraising', 'launch', 'pivot', 'pricing-strategy')",
        }),
      }),
    },
    async ({ playbook }) => {
      const playbookDir = join(CLAUDE_DIR, "playbooks");
      const found = findFile(playbookDir, playbook);

      if (!found) {
        // Try appending -playbook
        const withSuffix = findFile(playbookDir, playbook + "-playbook");
        if (withSuffix) {
          const content = readFileOr(withSuffix, "");
          return textResult(content);
        }

        const available = listDir(playbookDir)
          .filter((f) => f.endsWith(".md"))
          .map((f) => f.replace("-playbook.md", "").replace(".md", ""));
        return errorResult(
          `Playbook "${playbook}" not found. Available playbooks:\n${available.join("\n")}`
        );
      }

      const content = readFileOr(found, "");
      return textResult(content);
    }
  );

  // =========================================================================
  // 4. foreman_list_skills — List available skills with optional filtering
  // =========================================================================

  api.registerTool(
    "foreman_list_skills",
    {
      description:
        "List all available Foreman skills, optionally filtered by category. Returns skill names organized by category. Categories: frameworks (50), leadership (28), writing (13), ai-leadership (9), game-theory (7), stoic (12), storytelling (8), negotiation (4), people (8), creative (8), thinking (6), decisions (5).",
      parameters: Type.Object({
        category: Type.Optional(
          Type.String({
            description: "Filter by category (e.g., 'frameworks', 'leadership', 'writing'). Omit to list all.",
          })
        ),
      }),
    },
    async ({ category }) => {
      const skillsDir = join(CLAUDE_DIR, "skills");
      if (!existsSync(skillsDir)) {
        return errorResult("Skills directory not found at .claude/skills/");
      }

      const categories = listDir(skillsDir).filter((d) =>
        statSync(join(skillsDir, d)).isDirectory()
      );

      if (category) {
        const target = categories.find(
          (c) => c.toLowerCase() === category.toLowerCase()
        );
        if (!target) {
          return errorResult(
            `Category "${category}" not found. Available: ${categories.join(", ")}`
          );
        }
        const skills = listDir(join(skillsDir, target))
          .filter((f) => f.endsWith(".md"))
          .map((f) => f.replace(".md", ""));
        return textResult(
          `## ${target} (${skills.length} skills)\n\n${skills.map((s) => `- ${s}`).join("\n")}`
        );
      }

      // List all categories with skill counts
      const lines: string[] = ["## Foreman Skills Library\n"];
      let total = 0;
      for (const cat of categories) {
        const skills = listDir(join(skillsDir, cat))
          .filter((f) => f.endsWith(".md"))
          .map((f) => f.replace(".md", ""));
        total += skills.length;
        lines.push(`### ${cat} (${skills.length})`);
        lines.push(skills.map((s) => `- ${s}`).join("\n"));
        lines.push("");
      }
      lines.unshift(`Total: ${total} skills across ${categories.length} categories\n`);
      return textResult(lines.join("\n"));
    }
  );

  // =========================================================================
  // 5. foreman_research — Get a structured research guide
  // =========================================================================

  api.registerTool(
    "foreman_research",
    {
      description:
        "Get a Foreman research guide that teaches entrepreneurs how to gather data needed for frameworks. Guides include: market-sizing, competitor-research, customer-interview, data-collection, pricing-research, due-diligence, user-testing, industry-mapping, financial-modeling, regulatory-landscape, survey-design, technology-stack, partnership-research, talent-market, content-strategy, funding-landscape, churn-analysis, brand-perception.",
      parameters: Type.Object({
        topic: Type.String({
          description: "Research topic (e.g., 'market-sizing', 'competitor-research', 'pricing-research')",
        }),
      }),
    },
    async ({ topic }) => {
      const researchDir = join(CLAUDE_DIR, "research");
      const found = findFile(researchDir, topic);

      if (!found) {
        const available = listDir(researchDir)
          .filter((f) => f.endsWith(".md"))
          .map((f) => f.replace(".md", ""));
        return errorResult(
          `Research guide "${topic}" not found. Available guides:\n${available.join("\n")}`
        );
      }

      const content = readFileOr(found, "");
      return textResult(content);
    }
  );

  // =========================================================================
  // 6. foreman_simulate — Start a board simulation
  // =========================================================================

  api.registerTool(
    "foreman_simulate",
    {
      description:
        "Start a Foreman board simulation for adversarial role-play practice. Supports board presentations, investor pitches, and due diligence sessions. 10 board personas available: skeptic-investor, operational-expert, financial-hawk, industry-veteran, friendly-challenger, legal-counsel, customer-advocate, growth-strategist, technical-advisor, culture-guardian.",
      parameters: Type.Object({
        type: Type.Union(
          [
            Type.Literal("board"),
            Type.Literal("investor-pitch"),
            Type.Literal("due-diligence"),
          ],
          { description: "Simulation type" }
        ),
        persona: Type.Optional(
          Type.String({
            description: "Specific board persona to use (e.g., 'skeptic-investor', 'financial-hawk'). Omit for a mixed panel.",
          })
        ),
      }),
    },
    async ({ type, persona }) => {
      const simDir = join(CLAUDE_DIR, "simulation");

      if (!existsSync(simDir)) {
        return errorResult("Simulation directory not found at .claude/simulation/");
      }

      const parts: string[] = [];

      // Load master simulation doc
      const masterPath = join(simDir, "SIMULATION.md");
      if (existsSync(masterPath)) {
        parts.push(readFileOr(masterPath, ""));
      }

      // Load scoring framework
      const scoringPath = join(simDir, "simulation-scoring.yaml");
      if (existsSync(scoringPath)) {
        parts.push("\n---\n## Scoring Framework\n\n" + readFileOr(scoringPath, ""));
      }

      // Load persona if specified
      if (persona) {
        const personaDir = join(simDir, "board-personas");
        const personaFile = findFile(personaDir, persona);
        if (personaFile) {
          parts.push("\n---\n## Active Persona\n\n" + readFileOr(personaFile, ""));
        } else {
          const available = listDir(personaDir)
            .filter((f) => f.endsWith(".md"))
            .map((f) => f.replace(".md", ""));
          parts.push(
            `\n---\nPersona "${persona}" not found. Available: ${available.join(", ")}`
          );
        }
      }

      // Load post-simulation diagnostic
      const postDiagPath = join(simDir, "post-simulation-diagnostic.md");
      if (existsSync(postDiagPath)) {
        parts.push(
          "\n---\n## Post-Simulation Diagnostic\n\n" + readFileOr(postDiagPath, "")
        );
      }

      return textResult(
        `Simulation type: ${type}\n\n${parts.join("\n")}`
      );
    }
  );

  // =========================================================================
  // 7. foreman_track — View implementation tracking
  // =========================================================================

  api.registerTool(
    "foreman_track",
    {
      description:
        "View Foreman implementation tracking — the accountability layer that tracks execution of playbook steps and skill recommendations through 6 states (not-started, in-progress, blocked, completed, abandoned, deferred). Includes dashboard, weekly reports, and blocker analysis.",
      parameters: Type.Object({
        filter: Type.Optional(
          Type.Union(
            [
              Type.Literal("all"),
              Type.Literal("blocked"),
              Type.Literal("in-progress"),
              Type.Literal("overdue"),
            ],
            {
              description:
                "Filter tracking items. 'all' returns everything, 'blocked' shows blockers, 'in-progress' shows active items, 'overdue' shows missed deadlines. Defaults to 'all'.",
            }
          )
        ),
      }),
    },
    async ({ filter }) => {
      const implDir = join(CLAUDE_DIR, "implementation");

      if (!existsSync(implDir)) {
        return errorResult(
          "Implementation directory not found at .claude/implementation/"
        );
      }

      const parts: string[] = [];
      const activeFilter = filter || "all";

      // Load master implementation doc
      const masterPath = join(implDir, "IMPLEMENTATION.md");
      if (existsSync(masterPath)) {
        parts.push(readFileOr(masterPath, ""));
      }

      // Load schema
      const schemaPath = join(implDir, "implementation-schema.yaml");
      if (existsSync(schemaPath)) {
        parts.push("\n---\n## Tracking Schema\n\n" + readFileOr(schemaPath, ""));
      }

      // Load relevant template based on filter
      const templatesDir = join(implDir, "templates");
      if (existsSync(templatesDir)) {
        if (activeFilter === "all" || activeFilter === "overdue") {
          const dashboard = join(templatesDir, "implementation-dashboard.md");
          if (existsSync(dashboard)) {
            parts.push("\n---\n## Dashboard Template\n\n" + readFileOr(dashboard, ""));
          }
        }
        if (activeFilter === "all" || activeFilter === "in-progress") {
          const weekly = join(templatesDir, "weekly-progress-report.md");
          if (existsSync(weekly)) {
            parts.push("\n---\n## Weekly Report Template\n\n" + readFileOr(weekly, ""));
          }
        }
        if (activeFilter === "blocked") {
          const blocker = join(templatesDir, "blocker-analysis.md");
          if (existsSync(blocker)) {
            parts.push("\n---\n## Blocker Analysis Template\n\n" + readFileOr(blocker, ""));
          }
        }
      }

      // Load support files for blocked items
      if (activeFilter === "blocked") {
        const supportDir = join(implDir, "support");
        if (existsSync(supportDir)) {
          const blockerDiag = join(supportDir, "blocker-diagnosis.md");
          if (existsSync(blockerDiag)) {
            parts.push(
              "\n---\n## Blocker Diagnosis Guide\n\n" + readFileOr(blockerDiag, "")
            );
          }
          const stuckProtocols = join(supportDir, "stuck-protocols.yaml");
          if (existsSync(stuckProtocols)) {
            parts.push(
              "\n---\n## Stuck Protocols\n\n" + readFileOr(stuckProtocols, "")
            );
          }
        }
      }

      return textResult(
        `Implementation tracking (filter: ${activeFilter})\n\n${parts.join("\n")}`
      );
    }
  );
});
