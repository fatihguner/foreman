import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { execFileSync } from 'node:child_process';
import { createContent,renameCategory,bumpVersion,anonymize,checkIndex } from '../lib/maintenance.js';
import { catalog,frontmatter,markdownLinks } from '../lib/content.js';
const root=path.resolve(import.meta.dirname,'..');
function fixture(t){const dir=fs.mkdtempSync(path.join(os.tmpdir(),'foreman-maintain-'));t.after(()=>fs.rmSync(dir,{recursive:true,force:true}));fs.cpSync(path.join(root,'.claude'),path.join(dir,'.claude'),{recursive:true});return dir;}
test('all creators use canonical paths, preserve special authors and reject invalid or duplicate writes',t=>{
 const dir=fixture(t),author="O'Brien & Partners / Research";
 for(const kind of ['skill','template','diagnostic','playbook','hook']) {
  const opts={name:`test-${kind}`,category:'frameworks',audience:'self',symptom:['A symptom'],author};
  const result=createContent(dir,kind,opts),file=path.join(dir,result.created),text=fs.readFileSync(file,'utf8');
  assert.ok(result.created.startsWith('.claude/'));assert.equal(frontmatter(text).data.author,author);
  assert.throws(()=>createContent(dir,kind,opts),/EEXIST/);assert.equal(fs.readFileSync(file,'utf8'),text);
 }
 assert.throws(()=>createContent(dir,'skill',{name:'partial',category:'frameworks',complexity:'wrong'}));
 assert.equal(fs.existsSync(path.join(dir,'.claude/skills/frameworks/partial.md')),false);
});
test('category rename keeps identities, rewrites links and is read-only until confirmed',t=>{
 const dir=fixture(t),before=catalog(dir).entries.filter(e=>e.kind==='skill').map(e=>e.id).sort();
 renameCategory(dir,'writing','business-writing');assert.ok(fs.existsSync(path.join(dir,'.claude/skills/writing')));
 renameCategory(dir,'writing','business-writing',true);
 const after=catalog(dir);assert.deepEqual(after.entries.filter(e=>e.kind==='skill').map(e=>e.id).sort(),before);
 for(const e of after.entries)for(const link of markdownLinks(e.text))assert.ok(fs.existsSync(path.resolve(path.dirname(e.file),link.split('#')[0])),`${e.relative}: ${link}`);
 assert.throws(()=>renameCategory(dir,'frameworks','business-writing',true));
});
test('version and author edits handle zero matches and leave files unchanged after invalid arguments',t=>{
 const dir=fixture(t),file='.claude/skills/frameworks/emotional-intelligence.md';
 const before=fs.readFileSync(path.join(dir,file),'utf8');
 assert.throws(()=>bumpVersion(dir,{file,to:'v3'}));assert.equal(fs.readFileSync(path.join(dir,file),'utf8'),before);
 bumpVersion(dir,{file,to:'2.0.1'});assert.equal(frontmatter(fs.readFileSync(path.join(dir,file),'utf8')).data.version,'2.0.1');
 assert.deepEqual(anonymize(dir,{name:'Nobody & Nowhere / Unknown',apply:true}),{files:0,occurrences:0,applied:true});
});
test('pre-commit validates the staged blob, accepts README, and ignores unstaged repairs',t=>{
 const dir=fixture(t),git=args=>execFileSync('git',args,{cwd:dir,encoding:'utf8'});
 git(['init','-q']);fs.writeFileSync(path.join(dir,'README.md'),'# Documentation\n');git(['add','README.md']);
 assert.equal(checkIndex(dir).errors.length,0);
 const file=path.join(dir,'.claude/skills/frameworks/emotional-intelligence.md'),original=fs.readFileSync(file,'utf8');
 fs.writeFileSync(file,'---\nname: [broken\n---\n# Broken\n');git(['add','.claude']);fs.writeFileSync(file,original);
 assert.ok(checkIndex(dir).errors.some(e=>e.includes('emotional-intelligence.md')));
});
