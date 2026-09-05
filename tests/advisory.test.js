import test from 'node:test';
import assert from 'node:assert/strict';
import path from 'node:path';
import fs from 'node:fs';
import { invoke } from '../lib/tools.js';
const root=path.resolve(import.meta.dirname,'..');
test('revenue triage delivers evidence guardrails and comparable-period questions',()=>{
 const response=invoke(root,'foreman_diagnose',{area:'revenue'});
 assert.ok(response.includes('does not rule out an acquisition problem'));
 assert.ok(response.includes('revenue bridge'));
 assert.ok(response.includes('timing alone does not establish causation'));
});
test('every registered command loads runtime and policy before its source',()=>{
 const files=fs.readdirSync(path.join(root,'.claude/commands')).filter(f=>f.endsWith('.md'));
 let count=0;
 for(const name of files){const text=fs.readFileSync(path.join(root,'.claude/commands',name),'utf8');if(!text.includes('generated: true'))continue;assert.ok(text.indexOf('policies/advisory.md')<text.indexOf('Then read'));count++;}
 assert.ok(count>=40);
});
