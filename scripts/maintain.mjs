#!/usr/bin/env node
import path from 'node:path';
import fs from 'node:fs';
import { execFileSync } from 'node:child_process';
import { createContent,renameCategory,bumpVersion,anonymize,statistics,updateSummary,checkIndex,atomicWrite } from '../lib/maintenance.js';
import { buildPlugins } from '../lib/distribution.js';
const [command,...args]=process.argv.slice(2);
const help={
 'new-skill':'--name NAME --category CATEGORY [--complexity basic|intermediate|advanced] [--stage idea,validation] [--author TEXT]',
 'new-template':'--name NAME --audience investor|board|team|self|client [--format report] [--author TEXT]',
 'new-diagnostic':'--name NAME [--symptom TEXT ...] [--author TEXT]',
 'new-playbook':'--name NAME [--complexity intermediate] [--stage validation,growth] [--author TEXT]',
 'new-hook':'--name NAME [--priority high|medium|low] [--author TEXT]',
 'rename-category':'--from OLD --to NEW [--confirm]', 'bump-version':'--file PATH | --category CATEGORY --to VERSION',
 'anonymize-author':'--name TEXT [--in DIR] [--apply]', 'build-codex':'[--clean] [--verbose] [--dry-run]',
 'stats':'','coverage-report':'','orphan-check':'','update-claude-md':'','pre-commit-hook':'',
 'setup':'[--install-hook]', 'openclaw-build':'',
};
try {
 if(!(command in help))throw new Error(`Unknown maintenance command ${command}`);
 if(args.includes('--help')||args.includes('-h')) {console.log(`Usage: ${command}.sh ${help[command]} [--root DIR]\nCreators produce drafts that must be completed before publishing.`);process.exit(0);}
 const opts={},flags=['confirm','apply','clean','verbose','dry-run','install-hook'];
 for(let i=0;i<args.length;i++) {
   const key=args[i].replace(/^--/,'');
   if(!args[i].startsWith('--') || !['root',...flags,...[...help[command].matchAll(/--([\w-]+)/g)].map(m=>m[1])].includes(key))throw new Error(`Unknown argument ${args[i]}`);
   if(flags.includes(key)){opts[key]=true;continue;}
   if(args[i+1]===undefined)throw new Error(`Missing value for ${args[i]}`);
   const value=args[++i];if(key==='symptom')(opts.symptom ||= []).push(value);else opts[key]=value;
 }
 const root=path.resolve(opts.root || path.join(import.meta.dirname,'..'));let result;
 if(command.startsWith('new-'))result=createContent(root,command.slice(4),opts);
 else if(command==='rename-category'){result=renameCategory(root,opts.from,opts.to,opts.confirm);if(opts.confirm)buildPlugins(root);}
 else if(command==='bump-version')result=bumpVersion(root,opts);
 else if(command==='anonymize-author')result=anonymize(root,opts);
 else if(command==='update-claude-md')result=updateSummary(root);
 else if(command==='pre-commit-hook'){result=checkIndex(root);if(result.errors.length)process.exitCode=1;}
 else if(command==='build-codex')result=opts['dry-run']?{preview:statistics(root).counts}:buildPlugins(root);
 else if(command==='openclaw-build') {
   execFileSync('npm',['run','build'],{cwd:root,stdio:'inherit'});buildPlugins(root);
   execFileSync('npm',['run','check'],{cwd:root,stdio:'inherit'});result={built:true};
 } else if(command==='setup') {
   buildPlugins(root);result={built:true};
   if(opts['install-hook']) {
     const hook=execFileSync('git',['rev-parse','--git-path','hooks/pre-commit'],{cwd:root,encoding:'utf8'}).trim();
     atomicWrite(path.resolve(root,hook),'#!/bin/sh\nexec node "$(git rev-parse --show-toplevel)/scripts/maintain.mjs" pre-commit-hook\n',{create:true});fs.chmodSync(path.resolve(root,hook),0o755);result.hook=hook;
   }
 } else result=statistics(root);
 console.log(JSON.stringify(result,null,2));
} catch(e){console.error(e.message);process.exitCode=1;}
