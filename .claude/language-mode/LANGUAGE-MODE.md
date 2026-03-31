# Language Mode — Orchestrator Instructions

When `/language [code]` is active, ALL system outputs are delivered in the specified language. This is a complete output language switch — not translation of keywords, not partial localization, but full linguistic transformation of every response the system produces.

---

## Core Principle

The underlying content — frameworks, diagnostics, playbooks, skill logic — remains in English internally. The system THINKS in English (skill files, templates, routing logic are all English). But it SPEAKS in the target language. This is the same distinction a bilingual consultant makes: they read the McKinsey report in English, then present findings to the client in their language.

What changes: every word the entrepreneur sees.
What does not change: internal processing, skill selection, routing logic, memory field names.

---

## What Gets Translated

| Component | Translation Scope |
|-----------|------------------|
| **Skill outputs** | Framework explanations, prompts, use cases, anti-patterns, stage guidance — all delivered in target language |
| **Diagnostic questions** | Triage questions rephrased naturally in target language — not word-for-word translation but culturally appropriate phrasing |
| **Playbook instructions** | Step descriptions, checkpoint questions, decision point framing |
| **Output template content** | Section headers, guidance text, placeholder labels — all in target language |
| **System messages** | Confirmations, errors, status reports, help text |
| **Stoic mode additions** | Stoic reflections, virtue framing, premeditatio malorum — in target language |
| **Solo mode messages** | All solo-specific framing and adaptations |

## What Does NOT Get Translated

| Component | Reason |
|-----------|--------|
| **Skill file names** | `porters-five-forces.md` stays as-is — these are system identifiers |
| **Command syntax** | `/apply`, `/diagnose`, `/run` stay in English — they are CLI commands |
| **Frontmatter field names** | `name:`, `description:`, `category:` — internal metadata |
| **Framework proper names** | "Porter's Five Forces" remains "Porter's Five Forces" (with optional target-language explanation in parentheses on first mention) |
| **Memory field names** | `identity.name`, `company.stage` — system internals |
| **Stoic source attributions** | "Marcus Aurelius, Meditations 5.20" — proper names and work titles stay in original |

---

## Framework Name Handling

Framework proper names require special care. The rule:

1. **First mention**: Use the English name followed by a natural target-language explanation.
   - Turkish: "Porter'in Bes Gucü (Porter's Five Forces) analizi..."
   - Spanish: "El análisis de las Cinco Fuerzas de Porter (Porter's Five Forces)..."
   - German: "Porters Fünf-Kräfte-Analyse (Porter's Five Forces)..."
   - Japanese: "ポーターのファイブフォース分析（Porter's Five Forces）..."

2. **Subsequent mentions**: Use whichever form is more natural in the target language. If the framework has an established local name, use it. If not, use the English name.

3. **Acronyms**: Keep in English with target-language expansion.
   - "SWOT analizi (Strengths, Weaknesses, Opportunities, Threats)"
   - "BMC (Business Model Canvas / Is Modeli Tuvali)"

---

## Translation Quality Standards

This is NOT machine-translation quality. The system must produce output that reads as if a native-speaking consultant wrote it:

1. **Natural syntax**: Follow the target language's sentence structure, not English word order imposed on foreign words.
2. **Idiomatic expression**: Use natural idioms and phrasing. "The ball is in your court" does not translate literally — use the local equivalent.
3. **Register consistency**: Maintain the Foreman voice (analytical, institutional, sophisticated) in the target language. If the language has formal/informal registers (tu/vous, sen/siz, du/Sie), default to formal-but-not-stiff.
4. **Business vocabulary**: Use the target language's established business terminology. Do not invent translations for terms that have accepted local forms.
5. **Cultural calibration**: Some frameworks reference culturally specific examples (American sports analogies, Silicon Valley references). Adapt these to be culturally neutral or locally relevant when possible.

---

## Supported Languages

Any language the underlying model supports. No explicit whitelist — if the model can produce fluent output in a language, that language is supported. Common expected languages:

| Code | Language | Notes |
|------|----------|-------|
| `english` / `en` | English | Default. Also activated by `/language default`. |
| `turkish` / `tr` | Turkish | Formal register (siz). Business Turkish conventions. |
| `spanish` / `es` | Spanish | Latin American vs. Castilian — use neutral Spanish unless specified. |
| `french` / `fr` | French | Formal (vous). |
| `german` / `de` | German | Formal (Sie). |
| `portuguese` / `pt` | Portuguese | Brazilian vs. European — default to Brazilian unless specified. |
| `japanese` / `ja` | Japanese | Desu/masu form. Business keigo where appropriate. |
| `chinese` / `zh` | Chinese | Simplified Mandarin default. |
| `korean` / `ko` | Korean | Formal (합니다체). |
| `arabic` / `ar` | Arabic | Modern Standard Arabic (fusha). |
| `dutch` / `nl` | Dutch | Formal (u). |
| `italian` / `it` | Italian | Formal (Lei). |
| `russian` / `ru` | Russian | Formal (Вы). |
| `hindi` / `hi` | Hindi | Formal register. |

Both full language names and ISO 639-1 codes are accepted. Case-insensitive.

---

## Interaction with Other Modes

### Language + Industry Packs

Language mode translates sector-specific content from industry packs identically to any other content. SaaS benchmarks in Turkish, fintech regulatory terms in Spanish, marketplace take-rate metrics in Japanese — the language switch applies to industry pack overlays, diagnostic rules, and template adaptations. Sector-specific terminology uses the target language's established business vocabulary where it exists. Framework proper names follow the same first-mention convention described above.

### Language + Solo Mode

Both active simultaneously. Solo mode filters WHAT content appears. Language mode determines WHICH LANGUAGE that content appears in. No conflict.

Example: `/solo` + `/language turkish` = solopreneur-adapted content delivered entirely in Turkish.

### Language + Stoic Mode

Both active simultaneously. Stoic mode adds philosophical depth. Language mode translates that depth into the target language — including Stoic quotes.

Stoic quote handling in non-English languages:
1. Present the quote in the TARGET language (translated naturally).
2. Follow with the original language attribution: "— Marcus Aurelius, Meditations 5.20"
3. Do NOT present the English translation unless the target language reader would benefit from seeing the original Latin/Greek-derived English version.

Example in Turkish:
> "Engel yolu olur. Yolunda duran sey, yolun kendisi olur."
> — Marcus Aurelius, Meditations 5.20

### Language + Commands

Command SYNTAX stays in English: `/apply`, `/diagnose`, `/run`, `/stoic on`, `/solo`.
Command OUTPUT switches to the target language.

Example:
```
User: /skills frameworks
System (if /language turkish):
  Frameworks kategorisinde 50 skill mevcut:
  - porters-five-forces — Rekabetci sanayi dinamiklerini analiz eder...
  - swot-pest-analysis — Ic ve dis stratejik analiz cerceveleri...
  ...
```

---

## Memory Integration

| Field | Layer | Value |
|-------|-------|-------|
| `language` | identity | ISO 639-1 code or full name (e.g., "tr" or "turkish") |
| `language_set_date` | identity | ISO 8601 date |

Language preference persists across sessions. Once set, every future session starts in the selected language until changed.

The memory-agent reads `identity.language` at session start. If present and not "en"/"english", the orchestrator activates language mode automatically — no need to re-invoke `/language` each session.

---

## Edge Cases

**Mixed-language input**: If the entrepreneur writes in Turkish but language mode is set to English, respond in the SET language (English), not the input language. The mode determines output language, not the input.

**Language not recognized**: If the code/name is not recognizable, respond: "Language '[input]' not recognized. Use a language name (e.g., 'turkish', 'spanish') or ISO 639-1 code (e.g., 'tr', 'es'). Use '/language default' for English."

**Partial language names**: Accept common variations. "türkçe" = "turkish" = "tr". "deutsch" = "german" = "de". "español" = "spanish" = "es".

**Regional variants**: If a user specifies "pt-BR" or "brazilian portuguese", honor the variant. If just "portuguese", default to Brazilian. If "zh-TW", use Traditional Chinese. If just "chinese", use Simplified Mandarin.
