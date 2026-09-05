#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import { execFileSync } from 'node:child_process';
import { buildPlugins } from '../lib/distribution.js';
import { within, atomicWrite } from '../lib/maintenance.js';
const root=path.resolve(import.meta.dirname,'..');
try {
 const args=process.argv.slice(2);let workspace=process.cwd(),skipTemplates=false;
 if(args.includes('--help')||args.includes('-h')) {console.log('Usage: openclaw-setup.sh [--workspace DIR] [--skip-templates] [--skip-bootstrap]\nBuilds and installs the plugin, preserving existing workspace templates. No model call is started.');process.exit(0);}
 for(let i=0;i<args.length;i++) {
  if(args[i]==='--workspace'&&args[i+1])workspace=path.resolve(args[++i]);
  else if(args[i]==='--skip-templates')skipTemplates=true;
  else if(args[i]!=='--skip-bootstrap')throw new Error(`Unknown or incomplete option: ${args[i]}`);
 }
 execFileSync('npm',['run','build'],{cwd:root,stdio:'inherit'});buildPlugins(root);
 execFileSync('openclaw',['plugins','install',root],{stdio:'inherit'});
 execFileSync('openclaw',['plugins','inspect','foreman'],{stdio:'inherit'});
 if(!skipTemplates) {
  fs.mkdirSync(workspace,{recursive:true});let copied=0,preserved=0;
  for(const name of fs.readdirSync(path.join(root,'openclaw-templates')).filter(n=>n.endsWith('.md'))) {
   const dest=within(workspace,name);
   try {atomicWrite(dest,fs.readFileSync(path.join(root,'openclaw-templates',name),'utf8'),{create:true});copied++;}
   catch(e){if(e.code==='EEXIST')preserved++;else throw e;}
  }
  console.log(`${copied} templates added; ${preserved} existing files preserved.`);
 }
 console.log('Foreman installed. Start an OpenClaw conversation when ready.');
}catch(e){console.error(e.message);process.exitCode=1;}
