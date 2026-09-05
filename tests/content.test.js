import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { catalog, lookup, validate, frontmatter } from '../lib/content.js';

function fixture(t) {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'foreman-content-'));
  t.after(() => fs.rmSync(root, { recursive: true, force: true }));
  return root;
}
function skill(root, category, name, extra = '') {
  const dir = path.join(root, '.claude/skills', category); fs.mkdirSync(dir, { recursive: true });
  fs.writeFileSync(path.join(dir, `${name}.md`), `---\nname: ${name}\ndescription: A complete test framework\ncategory: ${category}\nversion: 1.0.0\ncomplexity: basic\nstage: [idea]\ntags: []\nrelated_skills: []\nauthor: Test\n${extra}---\n# Test framework\n\nUseful body.\n`);
}
test('validation rejects absent and empty sources instead of returning a zero-file pass', t => {
  const root = fixture(t);
  assert.ok(validate(root, { layer:'skills' }).errors.length);
  fs.mkdirSync(path.join(root,'.claude/skills'), {recursive:true});
  assert.ok(validate(root, { layer:'skills' }).errors.some(x => /Empty/.test(x)));
});
test('validation scans actual .claude source and catches a malformed new file', t => {
  const root=fixture(t); skill(root,'frameworks','example');
  let report=validate(root,{layer:'skills'}); assert.equal(report.files,1);assert.deepEqual(report.errors,[]);
  fs.writeFileSync(path.join(root,'.claude/skills/frameworks/broken.md'),'No metadata');
  report=validate(root,{layer:'skills'});assert.equal(report.files,2);assert.ok(report.errors.some(x=>x.includes('Missing YAML')));
});
test('YAML parsing rejects malformed syntax, duplicate keys and unclosed frontmatter', () => {
  for (const text of ['---\nname: [\n---\n# Bad','---\nname: a\nname: b\n---\n# Bad','---\nname: a']) assert.throws(()=>frontmatter(text));
});
test('typed references reject a real item of the wrong kind', t => {
  const root=fixture(t);skill(root,'frameworks','example','routes_to_templates: [example]\n');
  assert.ok(validate(root,{layer:'skills'}).errors.some(x=>x.includes('unknown template:example')));
});
test('metadata identity and field types are validated', t => {
  const root=fixture(t);skill(root,'frameworks','example');const f=path.join(root,'.claude/skills/frameworks/example.md');
  fs.writeFileSync(f,fs.readFileSync(f,'utf8').replace('name: example','name: wrong').replace('stage: [idea]','stage: imaginary').replace('related_skills: []','related_skills: example'));
  const errors=validate(root,{layer:'skills'}).errors.join('\n');assert.match(errors,/name must match/);assert.match(errors,/Invalid stage/);assert.match(errors,/must be an array/);
});
test('known references still require arrays and playbook steps require a complete target',t=>{
  const root=fixture(t);skill(root,'frameworks','example','routes_to_skills: example\nsteps: [example]\n');
  const errors=validate(root,{layer:'skills'}).errors.join('\n');
  assert.match(errors,/routes_to_skills must be an array/);
  assert.match(errors,/Each step requires a typed target/);
});
test('catalog lookup prefers global exact matches and rejects ambiguity, empty names and paths', t => {
  const root=fixture(t);skill(root,'ai','ai-emotional-intelligence');skill(root,'frameworks','emotional-intelligence');
  const cat=catalog(root);assert.equal(lookup(cat,'skill','emotional-intelligence').category,'frameworks');
  for (const name of ['', ' ', '../../README','example.md','/tmp/data','intelligence']) assert.throws(()=>lookup(cat,'skill',name));
});
