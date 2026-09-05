import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { initWorkspace, commandMap } from '../lib/distribution.js';
import { markdownLinks, walk } from '../lib/content.js';
const root=path.resolve(import.meta.dirname,'..');
test('every packaged relative Markdown link resolves within its distribution',()=>{
  const base=path.join(root,'plugins/foreman');let count=0;
  for (const file of walk(base).filter(f=>f.endsWith('.md'))) for (const href of markdownLinks(fs.readFileSync(file,'utf8'))) {
    if (href.includes('$')) continue;
    const target=path.resolve(path.dirname(file),decodeURIComponent(href.split('#')[0]));
    assert.ok(target.startsWith(base+path.sep),`${file}: escaping ${href}`);
    assert.ok(fs.existsSync(target),`${file}: missing ${href}`);count++;
  }
  assert.ok(count>1900,'must actually validate the complete content and skill links');
});
test('native short commands exist and host conflicts are explicitly mapped',()=>{
  const commands=commandMap(root);
  for (const name of ['solo','stoic','language','apply','track','progress','foreman-resume']) {
    assert.ok(commands.has(name));assert.ok(fs.existsSync(path.join(root,'.claude/commands',name+'.md')));
  }
  assert.equal(commands.has('resume'),false);
  assert.equal(commands.has('skill'),false);
  assert.ok(commands.has('foreman-skill'));
  assert.equal(fs.existsSync(path.join(root,'.claude/commands/skill.md')),false,'skill.md must not collapse sibling commands into a single SKILL.md');
  assert.equal(fs.existsSync(path.join(root,'.claude/commands/_schema')),false,'authoring templates must stay outside host command discovery');
  assert.equal(fs.existsSync(path.join(root,'.claude/agents/_schema')),false,'authoring templates must stay outside host agent discovery');
});
test('installation preserves existing workspace files and Codex resources resolve',t=>{
  const dir=fs.mkdtempSync(path.join(os.tmpdir(),'foreman-init-'));t.after(()=>fs.rmSync(dir,{recursive:true,force:true}));
  fs.writeFileSync(path.join(dir,'CLAUDE.md'),'Existing instructions');
  const first=initWorkspace(root,dir,'all'),second=initWorkspace(root,dir,'all');
  assert.ok(first.copied.length>500);assert.equal(second.copied.length,0);
  assert.equal(fs.readFileSync(path.join(dir,'CLAUDE.md'),'utf8'),'Existing instructions');
  assert.ok(fs.existsSync(path.join(dir,'.agents/content/RUNTIME.md')));
  assert.ok(fs.existsSync(path.join(dir,'.agents/skills/foreman/SKILL.md')));
});
test('installation refuses linked directories before writing outside the workspace',t=>{
  const dir=fs.mkdtempSync(path.join(os.tmpdir(),'foreman-link-'));t.after(()=>fs.rmSync(dir,{recursive:true,force:true}));
  fs.mkdirSync(path.join(dir,'outside'));fs.mkdirSync(path.join(dir,'workspace'));
  fs.symlinkSync(path.join(dir,'outside'),path.join(dir,'workspace/.claude'));
  assert.throws(()=>initWorkspace(root,path.join(dir,'workspace'),'claude'),/linked destination/);
  assert.deepEqual(fs.readdirSync(path.join(dir,'outside')),[]);
});
test('compiled entry uses the actual installed OpenClaw SDK and registers executable tools',async t=>{
  const {default:plugin}=await import('../dist/index.js');let factory,options;
  plugin.register({pluginConfig:{defaultLanguage:'tr'},registerTool:(f,o)=>{factory=f;options=o;}});
  assert.equal(plugin.id,'foreman');assert.equal(typeof factory,'function');assert.equal(options.names.length,10);
  const dir=fs.mkdtempSync(path.join(os.tmpdir(),'foreman-sdk-'));t.after(()=>fs.rmSync(dir,{recursive:true,force:true}));
  const tools=factory({workspaceDir:dir,agentId:'test'});
  const list=await tools.find(t=>t.name==='foreman_list_skills').execute('test',{});
  assert.equal(JSON.parse(list.content[0].text).entries.length,158);
  const bad=await tools.find(t=>t.name==='foreman_apply_skill').execute('test',{skill:''});assert.equal(bad.isError,true);
  const profile=await tools.find(t=>t.name==='foreman_profile').execute('test',{mode:'solo'});assert.equal(profile.details.ok,true);
});
