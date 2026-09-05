import fs from 'node:fs';
import path from 'node:path';
import { catalog, frontmatter, walk } from './content.js';

export function write(file, text) {
  fs.mkdirSync(path.dirname(file), { recursive: true });
  fs.writeFileSync(file, text);
}

export function commandMap(root) {
  const commands = new Map();
  for (const file of walk(path.join(root, '.claude/commands')).filter(f => f.endsWith('.md'))) {
    const { data, body } = frontmatter(fs.readFileSync(file, 'utf8'));
    if (data?.generated) continue;
    const names = [...(data?.commands || []).map(c => c.name), ...[...body.matchAll(/^##+\s+`?\/(\w[\w-]*)/gm)].map(m => `/${m[1]}`)];
    for (const name of names) {
      const id = name.replace(/^\//, '').split(/\s/)[0];
      if (!/^[a-z][a-z0-9-]*$/.test(id)) continue;
      // skill.md is interpreted as SKILL.md on case-insensitive filesystems:
      // it turns the whole commands directory into one skill and hides siblings.
      const exposed = ['skill','run','context','help','status','resume','clear','reset','config','memory'].includes(id) ? `foreman-${id}` : id;
      if (!commands.has(exposed)) commands.set(exposed, { id, source: `commands/${path.basename(file)}` });
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
  for (const file of walk(path.join(root,'.claude/commands')).filter(f=>f.endsWith('.md'))) {
    if (frontmatter(fs.readFileSync(file,'utf8')).data?.generated && !commands.has(path.basename(file,'.md'))) fs.rmSync(file);
  }
  for (const [name, spec] of commands) write(path.join(root, '.claude/commands', `${name}.md`), commandText(name, spec, '.claude'));
  fs.rmSync(path.join(root,'.claude/plugin-commands'),{recursive:true,force:true});
  for (const [name,spec] of commands) write(path.join(root,'.claude/plugin-commands',`${name}.md`),commandText(name,spec,'${CLAUDE_PLUGIN_ROOT}/.claude',true));
  // Read-only distribution metadata; user state is never stored here.
  const cat = catalog(root);
  const index = { entries: cat.entries.map(({ id, kind, relative, category }) => ({ id, kind, path: relative, category })), aliases: cat.aliases, commands: Object.fromEntries([...commands].map(([k,v]) => [v.id,k])) };
  write(path.join(root, '.claude/catalog.json'), JSON.stringify(index, null, 2) + '\n');
  const target = path.join(root, 'plugins/foreman');
  for (const dir of ['content','skills','commands']) fs.rmSync(path.join(target, dir), { recursive: true, force: true });
  fs.cpSync(path.join(root, '.claude'), path.join(target, 'content'), { recursive: true, dereference: true });
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
  write(path.join(target,'skills/foreman/SKILL.md'), '---\nname: foreman\ndescription: "Use Foreman diagnostics, playbooks, research, board simulations, solo and language modes, or persistent implementation tracking for an entrepreneur."\n---\n\n# Foreman\n\nRead [runtime](../../content/RUNTIME.md), [advisory rules](../../content/policies/advisory.md), and [catalog](../../content/catalog.json). Resolve the requested command or content from that catalog, then read its source under ../../content/. Apply its instructions to the user context. Never invent state or a successful write. Use the local runtime for profile and task changes.\n');
  for (const [name,spec] of commands) write(path.join(target, 'commands', `${name}.md`), commandText(name,spec,'${CLAUDE_PLUGIN_ROOT}/content',true));
  return { skills: cat.entries.filter(e => e.kind === 'skill').length + 1, commands: commands.size };
}

export function initWorkspace(root, workspace, platform = 'claude') {
  if (!['claude','codex','all'].includes(platform)) throw new Error('platform must be claude, codex, or all');
  const copied = [], preserved = [];
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
  const tree = (source,dest) => { for (const file of walk(source,{schemas:true})) put(file,path.join(dest,path.relative(source,file))); };
  if (platform !== 'codex') {
    tree(path.join(root,'.claude'),path.join(workspace,'.claude'));
    put(path.join(root,'CLAUDE.md'),path.join(workspace,'CLAUDE.md'));
  }
  if (platform !== 'claude') {
    const dest = path.join(workspace,'.agents/skills');
    tree(path.join(root,'plugins/foreman/skills'),dest);
    // Generated skill links address ../../content from each skill directory.
    tree(path.join(root,'plugins/foreman/content'),path.join(workspace,'.agents/content'));
  }
  return { workspace, platform, copied, preserved };
}
