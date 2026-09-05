import fs from 'node:fs';
import path from 'node:path';
import { catalog, frontmatter, walk } from './content.js';

// Source guides that releases before 1.1.1 placed directly in the host command directory,
// where Claude Code exposed each of them as an extra slash command.
export const LEGACY_GUIDES = ['execution-commands','implementation-commands','language-command','memory-commands','meta-commands','navigation-commands','org-politics-commands','output-commands','playbook-commands','research-commands','simulation-commands','solo-command','stoic-command'];
// Built-in host commands that a Foreman command must not shadow.
const HOST_RESERVED = ['skill','run','context','help','status','resume','clear','reset','config','memory'];

export function write(file, text) {
  fs.mkdirSync(path.dirname(file), { recursive: true });
  fs.writeFileSync(file, text);
}

// Host-private files, OS metadata and plugin-only wrappers never leave the repository
// through a content bundle or an installed workspace.
export function distributable(relative) {
  return !relative.split(/[\\/]/).some(part => part === 'settings.local.json' || part === 'plugin-commands' || (part.startsWith('.') && part !== '.'));
}

export function commandMap(root) {
  const commands = new Map();
  for (const file of walk(path.join(root, '.claude/command-guides')).filter(f => f.endsWith('.md'))) {
    const { data, body } = frontmatter(fs.readFileSync(file, 'utf8'));
    if (data?.generated) continue;
    const names = [...(data?.commands || []).map(c => c.name), ...[...body.matchAll(/^##+\s+`?\/(\w[\w-]*)/gm)].map(m => `/${m[1]}`)];
    for (const name of names) {
      const id = name.replace(/^\//, '').split(/\s/)[0];
      if (!/^[a-z][a-z0-9-]*$/.test(id)) continue;
      // skill.md is interpreted as SKILL.md on case-insensitive filesystems:
      // it turns the whole commands directory into one skill and hides siblings.
      const exposed = HOST_RESERVED.includes(id) ? `foreman-${id}` : id;
      if (!commands.has(exposed)) commands.set(exposed, { id, source: `command-guides/${path.basename(file)}` });
    }
  }
  return commands;
}

function commandText(name, spec, base, plugin = false) {
  const diagnostic = spec.id === 'diagnose' ? '\nBefore answering, apply the diagnostic first-response contract: label the cause unconfirmed until comparable measurements distinguish the branches. Nonzero acquisition does not establish healthy acquisition. Ask for a revenue bridge before locating a revenue loss; do not invent metric targets. Check every causal sentence against an observed fact.\n' : '';
  const stateHint = ['solo','stoic','language'].includes(spec.id) ? '\nFor a mode or language change, use the profile command in RUNTIME.md directly. A directory listing or a full catalog read is unnecessary. Read the returned profile to confirm the write, then answer briefly.\n' : '';
  return `---\ndescription: "Foreman /${spec.id} command"\ngenerated: true\nargument-hint: "[arguments]"\n---\n\n# Foreman /${spec.id}\n\nRead ${base}/RUNTIME.md and ${base}/policies/advisory.md first. Then read ${base}/${spec.source} and execute only /${spec.id} with the user's arguments: $ARGUMENTS.\n\nUse ${base}/catalog.json to resolve exact content names before aliases or unique matches. Load all required supporting files from ${base}. All paths in the source instructions are relative to this content directory. Persist confirmed changes through the runtime described in RUNTIME.md; never claim a write succeeded without reading its result.\n\n${plugin ? 'Other Foreman commands use /foreman:COMMAND (for example /foreman:apply); built-in name conflicts use foreman- prefixes. ' : ''}Use the command map in catalog.json to recommend only registered commands.\n${diagnostic}${stateHint}`;
}

export function buildPlugins(root) {
  for (const name of ['state.js','state-cli.js']) write(path.join(root,'.claude/runtime',name),fs.readFileSync(path.join(root,'lib',name),'utf8'));
  write(path.join(root,'.claude/runtime/run.mjs'),fs.readFileSync(path.join(root,'scripts/state-runtime.mjs'),'utf8'));
  write(path.join(root,'.claude/runtime/package.json'),'{"type":"module","private":true}\n');
  const commands = commandMap(root);
  const hostCommands = path.join(root,'.claude/commands');
  if (fs.existsSync(hostCommands)) for (const file of walk(hostCommands).filter(f=>f.endsWith('.md'))) {
    // Every file here is a slash command in Claude Code, so only generated wrappers may live here.
    if (!frontmatter(fs.readFileSync(file,'utf8')).data?.generated) throw new Error(`Only generated wrappers belong in .claude/commands; move ${path.relative(root,file)} to .claude/command-guides/`);
    if (!commands.has(path.basename(file,'.md'))) fs.rmSync(file);
  }
  for (const [name, spec] of commands) write(path.join(hostCommands, `${name}.md`), commandText(name, spec, '.claude'));
  fs.rmSync(path.join(root,'.claude/plugin-commands'),{recursive:true,force:true});
  for (const [name,spec] of commands) write(path.join(root,'.claude/plugin-commands',`${name}.md`),commandText(name,spec,'${CLAUDE_PLUGIN_ROOT}/.claude',true));
  // Read-only distribution metadata; user state is never stored here.
  const cat = catalog(root);
  const manifest = path.join(root, 'package.json');
  const pkg = fs.existsSync(manifest) ? JSON.parse(fs.readFileSync(manifest, 'utf8')) : null;
  const release = pkg ? { version: pkg.version, license: pkg.license, repository: pkg.repository?.url, homepage: pkg.homepage } : undefined;
  const entries = cat.entries.map(({ id, kind, relative, category, data }) => ({ id, kind, path: relative, category, ...(kind === 'playbook' && Array.isArray(data.steps) ? { steps: data.steps.length } : {}) }));
  const index = { release, entries, aliases: cat.aliases, commands: Object.fromEntries([...commands].map(([k,v]) => [v.id,k])) };
  write(path.join(root, '.claude/catalog.json'), JSON.stringify(index, null, 2) + '\n');
  const target = path.join(root, 'plugins/foreman');
  for (const dir of ['content','skills','commands']) fs.rmSync(path.join(target, dir), { recursive: true, force: true });
  const content = path.join(root, '.claude');
  fs.cpSync(content, path.join(target, 'content'), { recursive: true, dereference: true, filter: source => distributable(path.relative(content, source)) });
  for (const skill of cat.entries.filter(e => e.kind === 'skill')) {
    const dest = path.join(target, 'skills', skill.id, 'SKILL.md');
    const text = skill.text.replace(/\]\(([^)\s]+)([^)]*)\)/g, (match, href, tail) => {
      if (/^(?:[a-z]+:|#)/i.test(href)) return match;
      const [file, anchor] = href.split('#');
      const relative = path.relative(cat.base, path.resolve(path.dirname(skill.file), decodeURIComponent(file)));
      if (relative.startsWith('..')) throw new Error(`Skill link escapes content: ${skill.relative}: ${href}`);
      const link = path.relative(path.dirname(dest), path.join(target, 'content', relative)).split(path.sep).join('/');
      return `](${link}${anchor ? '#' + anchor : ''}${tail})`;
    });
    const { header, body } = frontmatter(text);
    write(dest, header + '\nRead [runtime](../../content/RUNTIME.md) and [advisory rules](../../content/policies/advisory.md) before applying this skill. Other Foreman layers and the catalog are in `../../content/`, relative to this SKILL.md.\n\n' + body);
  }
  // One router makes every layer available to skill-only hosts, including Codex.
  const router = [
    '---', 'name: foreman',
    'description: "Use Foreman diagnostics, playbooks, research, board simulations, solo and language modes, or persistent implementation tracking for an entrepreneur."',
    '---', '', '# Foreman', '',
    'Resolve every resource path relative to this SKILL.md file, not the workspace root. In an initialized Codex project, this file is `<workspace>/.agents/skills/foreman/SKILL.md` and the content root is `<workspace>/.agents/content/`. The runtime is `<workspace>/.agents/content/runtime/run.mjs`. In a plugin, content is the sibling `../../content/` directory. Use these known paths directly; do not search state folders to find content.', '',
    'Read [runtime](../../content/RUNTIME.md), [advisory rules](../../content/policies/advisory.md), and the matching entry in [catalog](../../content/catalog.json). Resolve the requested command or content from that catalog, then read its source under the content root. Apply its instructions to the user context.', '',
    'Founder boundary: `.foreman/` contains private records, not Foreman instructions. Use only the explicitly requested founder, or `default` when none is given. Never list, search, read or infer records belonging to another founder. A missing default record means a new profile; it is not a reason to inspect another founder. Read the requested profile with the runtime and an explicit `--founder` argument.', '',
    'Never invent state or a successful write. Use the local runtime for profile and task changes. Run mutations for the same founder sequentially, using the returned revision before the next mutation. If a compound shell command is denied, try the direct Node runtime command rather than broadening permissions or inspecting other records.', ''
  ].join('\n');
  write(path.join(target, 'skills/foreman/SKILL.md'), router);
  for (const [name,spec] of commands) write(path.join(target, 'commands', `${name}.md`), commandText(name,spec,'${CLAUDE_PLUGIN_ROOT}/content',true));
  return { skills: cat.entries.filter(e => e.kind === 'skill').length + 1, commands: commands.size };
}

export function initWorkspace(root, workspace, platform = 'claude') {
  if (!['claude','codex','all'].includes(platform)) throw new Error('platform must be claude, codex, or all');
  const copied = [], preserved = [], notes = [];
  const put = (source, destination) => {
    // lstat detects dangling links too. Never follow an existing workspace link.
    const rel = path.relative(workspace, destination);
    let ancestor = workspace;
    for (const part of rel.split(path.sep).slice(0,-1)) {
      ancestor = path.join(ancestor,part);
      try { if (fs.lstatSync(ancestor).isSymbolicLink()) throw new Error(`Refusing linked destination: ${ancestor}`); }
      catch(e) { if (e.code !== 'ENOENT') throw e; }
    }
    fs.mkdirSync(path.dirname(destination), {recursive:true});
    try { fs.copyFileSync(source,destination,fs.constants.COPYFILE_EXCL); copied.push(rel); }
    catch (e) { if (e.code === 'EEXIST') preserved.push(rel); else throw e; }
  };
  fs.mkdirSync(workspace,{recursive:true});
  const tree = (source,dest) => {
    for (const file of walk(source,{schemas:true})) {
      const relative = path.relative(source,file);
      if (distributable(relative)) put(file,path.join(dest,relative));
    }
  };
  if (platform !== 'codex') {
    tree(path.join(root,'.claude'),path.join(workspace,'.claude'));
    // The workspace instructions are written for the founder's project, not for developing Foreman.
    const template = path.join(root,'templates/CLAUDE.md');
    if (!fs.existsSync(template)) throw new Error(`Missing workspace instructions template: ${template}`);
    put(template,path.join(workspace,'CLAUDE.md'));
    if (preserved.includes('CLAUDE.md')) notes.push('CLAUDE.md already existed and was kept. Add this line to it so Claude loads Foreman: "Before advising or running any Foreman command, read .claude/RUNTIME.md and .claude/policies/advisory.md."');
    const legacy = LEGACY_GUIDES.filter(name => fs.existsSync(path.join(workspace,'.claude/commands',`${name}.md`)));
    if (legacy.length) notes.push(`An earlier Foreman version placed command guides in .claude/commands/, where each one appears as an extra slash command. They now live in .claude/command-guides/. Remove the old copies: ${legacy.map(name => `.claude/commands/${name}.md`).join(', ')}`);
  }
  if (platform !== 'claude') {
    const dest = path.join(workspace,'.agents/skills');
    tree(path.join(root,'plugins/foreman/skills'),dest);
    // Generated skill links address ../../content from each skill directory.
    tree(path.join(root,'plugins/foreman/content'),path.join(workspace,'.agents/content'));
  }
  return { workspace, platform, copied, preserved, notes };
}
