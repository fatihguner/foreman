import fs from 'node:fs';
import path from 'node:path';
import { parseDocument } from 'yaml';

export const STAGES = ['idea', 'validation', 'early-traction', 'growth', 'scale'];
export const LAYERS = { skills: 'skill', 'output-templates': 'template', diagnostics: 'diagnostic', playbooks: 'playbook', hooks: 'hook', agents: 'agent', research: 'research' };
export const REQUIRED = {
  skill: ['name', 'description', 'version', 'category', 'complexity', 'stage', 'tags', 'related_skills', 'author'],
  template: ['name', 'description', 'audience', 'applicable_skills', 'format', 'author'],
  diagnostic: ['name', 'description', 'entry_symptoms', 'possible_diagnoses', 'routes_to_skills', 'routes_to_templates', 'author'],
  playbook: ['name', 'description', 'trigger_diagnostics', 'steps', 'final_outputs', 'estimated_duration', 'complexity', 'stage', 'author'],
  hook: ['name', 'description', 'trigger_patterns', 'routes_to', 'priority', 'author'],
  agent: ['name', 'description', 'role', 'triggers', 'dependencies', 'inputs', 'outputs', 'author'],
  research: ['name', 'description', 'author'],
};
export const PROHIBITED = ["In today's fast-paced", "In today's rapidly", "Let's dive in", "Let's explore", 'In this skill, you will learn', 'Without further ado', "It's important to note that", 'At the end of the day'];

export function walk(dir, { schemas = false } = {}) {
  if (!fs.existsSync(dir)) throw new Error(`Missing source directory: ${dir}`);
  const files = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true }).sort((a, b) => a.name.localeCompare(b.name))) {
    if (entry.isSymbolicLink()) continue;
    if (!schemas && entry.name.startsWith('_')) continue;
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) files.push(...walk(full, { schemas }));
    else if (entry.isFile()) files.push(full);
  }
  return files;
}

export function yaml(text, filename = 'YAML') {
  const doc = parseDocument(text, { uniqueKeys: true });
  if (doc.errors.length) throw new Error(`${filename}: ${doc.errors.map(e => e.message).join('; ')}`);
  return doc.toJS({ maxAliasCount: 50 });
}

export function frontmatter(text, filename = 'Markdown') {
  const match = text.match(/^---\r?\n([\s\S]*?)\r?\n---(?:\r?\n|$)/);
  if (!match) {
    if (text.startsWith('---')) throw new Error(`${filename}: Unclosed frontmatter`);
    return { data: null, body: text };
  }
  const data = yaml(match[1], filename);
  if (!data || typeof data !== 'object' || Array.isArray(data)) throw new Error(`${filename}: Frontmatter must be a mapping`);
  return { data, body: text.slice(match[0].length), header: match[0] };
}

export function kindOf(relative, id = '', data = {}) {
  const layer = relative.split('/')[0];
  if (LAYERS[layer]) return LAYERS[layer];
  if (/-diagnos(?:is|tic)$/.test(id)) return 'diagnostic';
  if (id.endsWith('-playbook')) return 'playbook';
  if (data.audience && data.format && Array.isArray(data.applicable_skills)) return 'template';
  if (relative.includes('/templates/')) return 'template';
  if (layer === 'commands') return 'command';
  if (relative.startsWith('simulation/board-personas/')) return 'persona';
  return layer;
}

export function catalog(root) {
  const base = path.resolve(root, '.claude');
  const entries = [], errors = [];
  for (const file of walk(base).filter(f => f.endsWith('.md'))) {
    const relative = path.relative(base, file).split(path.sep).join('/');
    try {
      const text = fs.readFileSync(file, 'utf8');
      const { data, body } = frontmatter(text, relative);
      if (!data?.name) continue;
      entries.push({ id: data.name, kind: kindOf(relative, data.name, data), category: data.category, file, relative, data, body, text });
    } catch (e) { errors.push(String(e.message)); }
  }
  const byKey = new Map();
  for (const item of entries) {
    const key = `${item.kind}:${item.id}`;
    if (byKey.has(key)) errors.push(`${item.relative}: Duplicate identity ${key}`);
    else byKey.set(key, item);
  }
  const aliasFile = path.join(base, 'catalog-aliases.json');
  const aliases = fs.existsSync(aliasFile) ? JSON.parse(fs.readFileSync(aliasFile, 'utf8')) : {};
  return { root: path.resolve(root), base, entries, byKey, aliases, errors };
}

export function lookup(cat, kind, input) {
  if (typeof input !== 'string' || !input.trim() || /[/.\\\0]/.test(input)) throw new Error('Provide a nonempty catalog name, without a path or extension.');
  const name = input.trim().toLowerCase();
  const items = cat.entries.filter(e => e.kind === kind);
  const direct = cat.byKey.get(`${kind}:${name}`);
  if (direct) return direct;
  const alias = cat.aliases[kind]?.[name];
  if (alias && cat.byKey.has(`${kind}:${alias}`)) return cat.byKey.get(`${kind}:${alias}`);
  const normalized = s => s.toLowerCase().replace(/[\s_-]+/g, '');
  const exact = items.filter(e => normalized(e.id) === normalized(name));
  if (exact.length === 1) return exact[0];
  const candidates = items.filter(e => normalized(e.id).includes(normalized(name)));
  if (candidates.length === 1) return candidates[0];
  if (candidates.length > 1) throw new Error(`Ambiguous ${kind} "${input}". Choose: ${candidates.map(e => e.id).join(', ')}`);
  throw new Error(`Unknown ${kind} "${input}".`);
}

const REF_FIELDS = {
  related_skills: 'skill', routes_to_skills: 'skill', applicable_skills: 'skill', feeds_into_skills: 'skill',
  routes_to_templates: 'template', feeds_into_templates: 'template', final_outputs: 'template',
  trigger_diagnostics: 'diagnostic', related_diagnostics: 'diagnostic', routes_to_diagnostics: 'diagnostic',
  related_playbooks: 'playbook', routes_to_playbooks: 'playbook',
  feeds_into_playbooks: 'playbook', applicable_diagnostics: 'diagnostic',
};
export function references(data) {
  const refs = [];
  const add = (kind, ref, field) => refs.push({ kind, ref, field });
  function visit(value, field = '') {
    if (Array.isArray(value)) { value.forEach((x, i) => visit(x, `${field}[${i}]`)); return; }
    if (!value || typeof value !== 'object') return;
    if (typeof value.kind === 'string' && 'ref' in value) add(value.kind, value.ref, field);
    for (const [key, v] of Object.entries(value)) {
      if (key in REF_FIELDS) for (const ref of Array.isArray(v) ? v : [v]) add(REF_FIELDS[key], ref, `${field}.${key}`);
      else if (['skill', 'skill_name', 'diagnostic', 'diagnostic_name', 'template', 'template_name'].includes(key) && typeof v === 'string') add(key.replace('_name', ''), v, `${field}.${key}`);
      else if (key === 'routes_to' && v && typeof v === 'object') {
        for (const [plural, targets] of Object.entries(v)) for (const ref of Array.isArray(targets) ? targets : [targets]) add(({skills:'skill', diagnostics:'diagnostic', playbooks:'playbook', templates:'template',output_templates:'template'})[plural] || plural, ref, `${field}.routes_to.${plural}`);
      } else visit(v, field ? `${field}.${key}` : key);
    }
  }
  visit(data);
  return refs;
}

export function markdownLinks(text) {
  return [...text.matchAll(/\]\(([^)\s]+)(?:\s+"[^"]*")?\)/g)].map(m => m[1]).filter(x => !/^(?:[a-z]+:|#)/i.test(x));
}

export function validate(root, { layer, refsOnly = false } = {}) {
  const report = { files: 0, yamlDocuments: 0, references: 0, links: 0, errors: [], warnings: [], counts: {} };
  let cat;
  try { cat = catalog(root); } catch (e) { report.errors.push(e.message); return report; }
  report.errors.push(...cat.errors);
  const layers = layer ? [layer] : Object.keys(LAYERS);
  for (const l of layers) {
    const dir = path.join(cat.base, l);
    if (!fs.existsSync(dir)) { report.errors.push(`Missing source directory: .claude/${l}`); continue; }
    const files = walk(dir).filter(f => f.endsWith('.md'));
    report.counts[l] = files.length;
    if (!files.length) report.errors.push(`Empty source directory: .claude/${l}`);
    for (const file of files) {
      report.files++;
      if (refsOnly) continue;
      try {
        const text = fs.readFileSync(file, 'utf8');
        const { data, body } = frontmatter(text, file);
        if (!data) { report.errors.push(`${file}: Missing YAML frontmatter`); continue; }
        for (const key of REQUIRED[LAYERS[l]] || []) if (!(key in data)) report.errors.push(`${file}: Missing field ${key}`);
        if (data.draft === true) report.errors.push(`${file}: Unfinished draft`);
        if (data.name !== path.basename(file, '.md')) report.errors.push(`${file}: name must match filename`);
        if (typeof data.description !== 'string' || !data.description.trim() || data.description.length > 1024) report.errors.push(`${file}: Invalid description`);
        if (!/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(data.name || '')) report.errors.push(`${file}: Invalid name`);
        if (!/^# /m.test(body)) report.errors.push(`${file}: Missing body title`);
        if (data.complexity && !['basic','intermediate','advanced'].includes(data.complexity)) report.errors.push(`${file}: Invalid complexity`);
        if (data.stage && (!Array.isArray(data.stage) || !data.stage.length || data.stage.some(s => !STAGES.includes(s)))) report.errors.push(`${file}: Invalid stage list`);
        if (l === 'skills' && data.category !== path.basename(path.dirname(file))) report.errors.push(`${file}: category must match directory`);
        if (l === 'skills' && !/^\d+\.\d+\.\d+$/.test(String(data.version))) report.errors.push(`${file}: Invalid version`);
        for (const field of new Set(['stage','tags','related_content','entry_symptoms','possible_diagnoses','trigger_patterns','steps','triggers','dependencies','inputs','outputs',...Object.keys(REF_FIELDS)])) if (field in data && !Array.isArray(data[field])) report.errors.push(`${file}: ${field} must be an array`);
        if (Array.isArray(data.steps)) for (const step of data.steps) {
          if (!step || typeof step !== 'object' || !((typeof step.skill === 'string') || (typeof step.kind === 'string' && typeof step.ref === 'string')) || typeof step.purpose !== 'string' || typeof step.output !== 'string') report.errors.push(`${file}: Each step requires a typed target, purpose, and output`);
        }
        if ('routes_to' in data && (!data.routes_to || typeof data.routes_to !== 'object' || Array.isArray(data.routes_to))) report.errors.push(`${file}: routes_to must be a mapping`);
        for (const phrase of PROHIBITED) if (body.toLowerCase().includes(phrase.toLowerCase())) report.errors.push(`${file}: Prohibited phrase: ${phrase}`);
      } catch (e) { report.errors.push(e.message); }
    }
  }
  const entries = layer ? cat.entries.filter(e => e.relative.startsWith(`${layer}/`)) : cat.entries;
  const checkRefs = (data, file) => {
    for (const ref of references(data)) {
      report.references++;
      if (typeof ref.ref !== 'string' || !cat.byKey.has(`${ref.kind}:${ref.ref}`)) report.errors.push(`${file}: ${ref.field} -> unknown ${ref.kind}:${ref.ref}`);
    }
  };
  for (const item of entries) {
    checkRefs(item.data, item.relative);
    // Hooks contain executable routing paths in code fences, not Markdown links.
    if (item.kind === 'hook') for (const match of item.body.matchAll(/\b(?:\.claude\/)?(?:skills|diagnostics|playbooks|output-templates|research)\/[a-z0-9_.\/-]+/g)) {
      const route = match[0].replace(/^\.claude\//,'').replace(/\.$/,'');
      if (!['','.md','.yaml','.yml'].some(ext => fs.existsSync(path.join(cat.base,route+ext)))) report.errors.push(`${item.relative}: Broken routing path ${route}`);
    }
    for (const link of markdownLinks(item.text)) {
      report.links++;
      let dest;
      try { dest = decodeURIComponent(link.split('#')[0]); } catch { report.errors.push(`${item.relative}: Invalid link ${link}`); continue; }
      if (!fs.existsSync(path.resolve(path.dirname(item.file), dest))) report.errors.push(`${item.relative}: Broken link ${link}`);
    }
  }
  if (!layer) {
    for (const file of walk(cat.base, { schemas: true }).filter(f => /\.ya?ml$/.test(f))) {
      report.yamlDocuments++;
      try { const data = yaml(fs.readFileSync(file, 'utf8'), file); if (!file.includes(`${path.sep}_`)) checkRefs(data, path.relative(cat.base, file)); }
      catch (e) { report.errors.push(e.message); }
    }
    for (const [kind, aliases] of Object.entries(cat.aliases)) for (const [alias, target] of Object.entries(aliases)) if (!cat.byKey.has(`${kind}:${target}`) || cat.byKey.has(`${kind}:${alias}`)) report.errors.push(`Invalid alias ${kind}:${alias} -> ${target}`);
  }
  if (!report.files) report.errors.push('No content files were validated.');
  return report;
}
