---
name: "language-mode-commands"
description: "Sets the output language for all system responses. Supports any language the underlying model can produce fluently. Persists across sessions."
category: "meta"
commands:
  - name: "/language"
    syntax: "/language [language-name-or-code]"
    description: "Sets the output language"
  - name: "/language default"
    syntax: "/language default"
    description: "Resets to English"
  - name: "/language status"
    syntax: "/language status"
    description: "Reports current language setting"
author: "Fatih Guner"
---

# /language

Sets the language for all system outputs. Every response — skill applications, diagnostic questions, playbook instructions, output templates, system messages — switches to the specified language. Internal processing remains in English; the system thinks in English but speaks in the target language.

---

## /language [language]

### Description

Sets the output language. Accepts full language names (case-insensitive) or ISO 639-1 codes. The change takes effect immediately and persists across sessions.

### Syntax

```
/language [language-name-or-code]
```

### Accepted Inputs

| Input | Resolved Language |
|-------|-------------------|
| `english`, `en`, `default` | English |
| `turkish`, `tr`, `türkçe` | Turkish |
| `spanish`, `es`, `español` | Spanish |
| `french`, `fr`, `français` | French |
| `german`, `de`, `deutsch` | German |
| `portuguese`, `pt`, `português` | Portuguese (Brazilian default) |
| `japanese`, `ja`, `日本語` | Japanese |
| `chinese`, `zh`, `中文` | Chinese (Simplified default) |
| `korean`, `ko`, `한국어` | Korean |
| `arabic`, `ar`, `العربية` | Arabic (MSA) |
| `dutch`, `nl`, `nederlands` | Dutch |
| `italian`, `it`, `italiano` | Italian |
| `russian`, `ru`, `русский` | Russian |
| `hindi`, `hi`, `हिन्दी` | Hindi |
| `pt-br`, `brazilian portuguese` | Portuguese (Brazilian) |
| `pt-pt`, `european portuguese` | Portuguese (European) |
| `zh-tw`, `traditional chinese` | Chinese (Traditional) |
| Any other model-supported language | Attempted — quality depends on model fluency |

### Examples

**Example 1: Switch to Turkish**
```
User: /language turkish
System: Dil Türkçe olarak ayarlandı. Bundan sonraki tüm çıktılar
Türkçe olarak sunulacak. Komut sözdizimi (/apply, /diagnose, /run)
İngilizce kalacaktır.

İngilizce'ye dönmek için: /language default
```

**Example 2: Switch to Spanish**
```
User: /language es
System: Idioma configurado a español. Todas las respuestas del sistema
se entregarán en español a partir de ahora. La sintaxis de los comandos
(/apply, /diagnose, /run) permanece en inglés.

Para volver al inglés: /language default
```

**Example 3: Switch to Japanese**
```
User: /language japanese
System: 言語を日本語に設定しました。以降のすべてのシステム出力は日本語で
提供されます。コマンド構文（/apply、/diagnose、/run）は英語のままです。

英語に戻すには: /language default
```

**Example 4: Skill output in Turkish**
```
User: /language turkish
System: Dil Türkçe olarak ayarlandı.

User: /apply porters-five-forces
System: # Porter'ın Beş Gücü Analizi

Porter'ın Beş Gücü çerçevesi, bir sektördeki rekabet dinamiklerini
beş yapısal güç üzerinden analiz eder...

## Tedarikçi Gücü
[Türkçe analiz...]

## Alıcı Gücü
[Türkçe analiz...]

...
```

**Example 5: Combined with Stoic mode**
```
User: /stoic on
System: Stoic mode active...

User: /language turkish
System: Dil Türkçe olarak ayarlandı. Stoacı mod aktif durumda —
tüm Stoacı yansımalar da Türkçe olarak sunulacak.

User: /apply swot-pest-analysis
System: # SWOT ve PEST Analizi
[Türkçe analiz...]

## Stoacı Yansıma
Bu analiz, kontrolünüz dahilindeki iç güçleri ve zayıflıkları,
kontrolünüz dışındaki dış fırsatları ve tehditleri birbirinden ayırır.
Epiktetos'un hatırlattığı gibi: "Bizi rahatsız eden şeyler değil,
şeyler hakkındaki yargılarımızdır."
— Epictetus, Discourses 2.5.4
```

---

## /language default

### Description

Resets the output language to English. Equivalent to `/language english` or `/language en`.

### Syntax

```
/language default
```

### Confirmation

```
User: /language default
System: Language reset to English. All outputs will be delivered in English.
```

---

## /language status

### Description

Reports the current language setting, when it was set, and what it affects.

### Syntax

```
/language status
```

### Output Examples

**When non-English language is active:**
```
User: /language status
System: Mevcut dil: Türkçe (tr)
Ayarlanma tarihi: 2026-03-29
Aktif modlar: Solo Mode + Stoic Mode + Turkish

Etkiler:
  - Tüm skill çıktıları Türkçe
  - Tüm diagnostik soruları Türkçe
  - Tüm playbook adımları Türkçe
  - Tüm output template'ler Türkçe
  - Sistem mesajları Türkçe
  - Komut sözdizimi İngilizce kalır

Değiştirmek için: /language [dil] veya /language default
```

**When English (default):**
```
User: /language status
System: Current language: English (default)

To change: /language [language-name-or-code]
Supported: Any language the model speaks fluently.
Examples: /language turkish, /language es, /language 日本語
```

---

## Error Handling

| Input | Response |
|-------|----------|
| `/language` (no argument) | "Usage: /language [language-name-or-code]. Examples: /language turkish, /language es, /language default. Use /language status to see current setting." |
| `/language xyz123` (unrecognized) | "Language 'xyz123' not recognized. Use a language name (e.g., 'turkish', 'french') or ISO code (e.g., 'tr', 'fr'). Use /language default for English." |
| `/language english` when already English | "Language is already set to English." |
| `/language turkish` when already Turkish | "Dil zaten Türkçe olarak ayarlı." (responds in current language) |

---

## Memory Integration

| Operation | Memory Layer | Field |
|-----------|-------------|-------|
| Set language | identity | `language: "tr"` (ISO 639-1 code) |
| Set language | identity | `language_set_date: "2026-03-29"` |
| Reset to default | identity | `language: "en"` |
| Session start | session | Orchestrator reads `identity.language`, activates if not "en" |

Language persists across sessions. Once `/language turkish` is invoked, every future session starts in Turkish until the entrepreneur runs `/language default` or `/language english`.

---

## Related Commands

- `/solo` — Filters WHAT content appears. Combines with language mode.
- `/stoic on` — Adds philosophical depth. Stoic reflections translate to target language.
- `/context` — Shows full context including language setting.
- `/help meta` — Lists all meta commands.
