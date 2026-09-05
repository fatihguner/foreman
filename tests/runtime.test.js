import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { execFileSync } from 'node:child_process';
import { readState, changeState, updateProfile, updateTask, migrateState, track } from '../lib/state.js';
import { invoke } from '../lib/tools.js';
import { runStateCLI } from '../lib/state-cli.js';

const root=path.resolve(import.meta.dirname,'..');
function workspace(t) { const dir=fs.mkdtempSync(path.join(os.tmpdir(),'foreman-state-'));t.after(()=>fs.rmSync(dir,{recursive:true,force:true}));return dir; }
test('profile changes survive a separate process and remain founder-isolated',t=>{
  const dir=workspace(t);
  changeState(dir,'alice',s=>updateProfile(s,{mode:'solo',stoic_mode:true,language:'Turkish',sector:'saas'}));
  const result=JSON.parse(execFileSync(process.execPath,['bin/cli.js','state','profile','--workspace',dir,'--founder','alice'],{cwd:root,encoding:'utf8'}));
  assert.deepEqual(result.identity,{mode:'solo',stoic_mode:true,language:'tr'});
  assert.equal(readState(dir,'bob').identity.mode,'standard');
});
test('task lifecycle has actual filters, history, completion and rollback on invalid writes',t=>{
  const dir=workspace(t), update=input=>changeState(dir,'alice',s=>updateTask(s,input));
  update({id:'one',description:'Interview customers',deadline:'2020-01-01'});
  update({id:'one',status:'blocked',note:'Waiting for appointments'});
  assert.equal(track(readState(dir,'alice'),'blocked').length,1);
  assert.equal(track(readState(dir,'alice'),'overdue').length,1);
  const before=fs.readFileSync(path.join(dir,'.foreman/alice/state.json'),'utf8');
  assert.throws(()=>update({id:'one',progress:101}));
  assert.equal(fs.readFileSync(path.join(dir,'.foreman/alice/state.json'),'utf8'),before);
  update({id:'one',status:'completed'});
  assert.equal(track(readState(dir,'alice'),'overdue').length,0);
  assert.equal(readState(dir,'alice').implementation_items[0].progress,100);
  assert.equal(readState(dir,'alice').implementation_items[0].state_history.length,2);
  assert.throws(()=>changeState(dir,'alice',s=>s,{expectedRevision:1}),/revision conflict/);
});
test('invalid identity, corrupt file, and linked state never become fresh memory',t=>{
  const dir=workspace(t);
  assert.throws(()=>readState(dir,'../alice'),/identifier/);
  changeState(dir,'alice',s=>s);
  fs.writeFileSync(path.join(dir,'.foreman/alice/state.json'),'{bad');
  assert.throws(()=>readState(dir,'alice'));
  fs.symlinkSync(path.join(dir,'.foreman/alice'),path.join(dir,'.foreman/bob'));
  assert.throws(()=>readState(dir,'bob'),/Linked/);
});
test('legacy fields migrate without losing original data or sharing active aliases',()=>{
  const legacy={identity:{mode_solo:true,mode_stoic:true},preferences:{language:'turkish'},company:{sector:'saas',name:'Acme'},implementation_items:[{id:'old',description:'Research',status:'completed'}]};
  const s=migrateState(legacy,'alice');
  assert.equal(s.identity.mode,'solo');assert.equal(s.identity.stoic_mode,true);assert.equal(s.identity.language,'tr');
  assert.equal(s.identity.mode_solo,undefined);assert.deepEqual(s.legacy,legacy);assert.equal(s.implementation_items[0].progress,100);
});
test('tools load actual profiles and all simulation personas; checkpoints resume',t=>{
  const dir=workspace(t), options={workspace:dir,defaults:{defaultMode:'solo',defaultLanguage:'tr',sector:'saas'}};
  assert.equal(invoke(root,'foreman_track',{},options).items.length,0);
  const skill=invoke(root,'foreman_apply_skill',{skill:'emotional-intelligence'},options);
  assert.ok(skill.includes('Source: skills/frameworks/emotional-intelligence.md'));assert.match(skill,/"language":"tr"/);assert.match(skill,/SaaS/i);
  const simulation=invoke(root,'foreman_simulate',{type:'board'},options);
  assert.match(simulation,/skeptic-investor/);assert.match(simulation,/legal-counsel/);
  invoke(root,'foreman_resume',{playbook:'pivot-playbook',next_step:2},options);
  assert.equal(invoke(root,'foreman_resume',{},options).next_step,2);
  assert.throws(()=>invoke(root,'foreman_resume',{playbook:'pivot-playbook',next_step:999},options));
  assert.throws(()=>invoke(root,'foreman_apply_skill',{skill:'../../README'},options));
  assert.ok(invoke(root,'foreman_list_skills',{kind:'template'},options).entries.some(e=>e.id==='implementation-retrospective'));
});
test('the store ignores itself in Git, checkpoints name catalog playbooks and the CLI reports its version',t=>{
  const dir=workspace(t), cli=args=>runStateCLI([...args,'--workspace',dir,'--founder','alice']);
  cli(['profile','--mode','solo']);
  assert.equal(fs.readFileSync(path.join(dir,'.foreman/.gitignore'),'utf8'),'*\n');
  assert.throws(()=>cli(['resume','--playbook','nope','--step','1']),/Unknown playbook/);
  assert.throws(()=>cli(['resume','--playbook','pivot-playbook','--step','99']),/outside/);
  assert.throws(()=>cli(['resume','--playbook','pivot-playbook']),/both/);
  assert.equal(cli(['resume','--playbook','Pivot_Playbook','--step','2']).active.playbook.id,'pivot-playbook');
  assert.deepEqual(readState(dir,'alice').active.playbook,{id:'pivot-playbook',next_step:2});
  const version=JSON.parse(fs.readFileSync(path.join(root,'package.json'),'utf8')).version;
  assert.equal(execFileSync(process.execPath,['bin/cli.js','--version'],{cwd:root,encoding:'utf8'}).trim(),version);
  assert.match(execFileSync(process.execPath,['bin/cli.js','init','--workspace',path.join(dir,'project')],{cwd:root,encoding:'utf8'}),/Next steps/);
  assert.equal(fs.existsSync(path.join(dir,'project/.claude/plugin-commands')),false);
});
