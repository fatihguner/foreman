#!/usr/bin/env node
// Explicit, opt-in model evaluation. Never invoked by npm test or CI.
import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
const root=path.resolve(import.meta.dirname,'..');
try {
 const args=process.argv.slice(2),opts={};
 if(args.includes('--help')) {console.log('Usage: node scripts/live-eval.mjs --output DIR --total-cap-usd N [--prior-cost-usd N] [--case-cap-usd 0.5] [--model MODEL] [--scenario ID]\nSends fictional scenarios and Foreman content to Claude. Defaults to all eight scenarios, each in a fresh workspace. Existing output directories are refused. Stops on incomplete responses; successful transport still requires a separate quality review.');process.exit(0);}
 for(let i=0;i<args.length;i+=2) {
  const key=args[i].replace(/^--/,'');
  if(!['output','total-cap-usd','prior-cost-usd','case-cap-usd','model','scenario'].includes(key)||args[i+1]===undefined)throw new Error('Invalid or incomplete option');
  opts[key]=args[i+1];
 }
 const cap=Number(opts['total-cap-usd']),prior=Number(opts['prior-cost-usd']||0),caseCap=Number(opts['case-cap-usd']||0.5);
 if(!opts.output||!Number.isFinite(cap)||cap<=0||!Number.isFinite(prior)||prior<0||!Number.isFinite(caseCap)||caseCap<=0)throw new Error('An output directory and valid cost limits are required');
 const reserve=0.15;
 if(prior+caseCap+reserve>cap)throw new Error('Insufficient remaining budget for one case plus the safety reserve');
 const cases=JSON.parse(fs.readFileSync(path.join(root,'tests/advisory-scenarios.json'),'utf8')).filter(c=>c.prompt&&(!opts.scenario||c.id===opts.scenario));
 if(!cases.length)throw new Error('Unknown scenario');
 const output=path.resolve(opts.output);if(fs.existsSync(output))throw new Error('Output directory already exists; refusing to repeat a paid run');
 fs.mkdirSync(output,{recursive:true});
 const settings=path.join(output,'settings.json');fs.writeFileSync(settings,JSON.stringify({disableAllHooks:true,autoMemoryEnabled:false,enabledPlugins:{}}));
 let spent=prior;const runs=[];
 for(const scenario of cases) {
  if(spent+caseCap+reserve>cap)throw new Error('Aggregate budget reserve reached; remaining scenarios were not started');
  const workspace=path.join(output,'workspaces',scenario.id);fs.mkdirSync(workspace,{recursive:true});
  fs.cpSync(path.join(root,'.claude'),path.join(workspace,'.claude'),{recursive:true});
  fs.copyFileSync(path.join(root,'CLAUDE.md'),path.join(workspace,'CLAUDE.md'));
  const prompt='Bu kurgusal Foreman testinde yalnızca bu çalışma alanındaki Foreman içeriklerini kullan. Web, dış dosya, iletişim veya dosya yazma yok. En çok 180 kelime Türkçe yanıt ver; bilinmeyen veri veya yanıt uydurma. Sonda gerçekten kullandığın Foreman dosyalarını belirt. Kurucu: '+scenario.prompt;
  fs.writeFileSync(path.join(output,scenario.id+'.prompt.txt'),prompt);
  const cli=['--print','--no-session-persistence','--output-format','stream-json','--verbose','--setting-sources','project,local','--settings',settings,'--strict-mcp-config','--mcp-config','{"mcpServers":{}}','--no-chrome','--tools','Read,Glob,Grep,Skill','--allowedTools','Read,Glob,Grep,Skill','--permission-mode','dontAsk','--max-budget-usd',String(caseCap)];
  if(opts.model)cli.push('--model',opts.model);
  cli.push(prompt);console.log(JSON.stringify({start:scenario.id,spentUsd:spent,caseCapUsd:caseCap}));
  const started=Date.now(),result=spawnSync('claude',cli,{cwd:workspace,encoding:'utf8',timeout:240000,maxBuffer:32*1024*1024});
  const raw=(result.stdout||'')+(result.stderr||'');fs.writeFileSync(path.join(output,scenario.id+'.jsonl'),raw);
  const events=raw.split('\n').flatMap(line=>{try{return [JSON.parse(line)];}catch{return [];}});
  const final=events.findLast(e=>e.type==='result')||{},cost=final.total_cost_usd;
  if(typeof cost==='number')spent+=cost;
  const row={id:scenario.id,exit:result.status,subtype:final.subtype,costUsd:cost??null,seconds:(Date.now()-started)/1000,result:final.result||'',modelUsage:final.modelUsage||{},permissionDenials:final.permission_denials||[],calls:events.filter(e=>e.type==='assistant').flatMap(e=>e.message?.content||[]).filter(b=>b.type==='tool_use')};
  runs.push(row);fs.writeFileSync(path.join(output,scenario.id+'.response.md'),row.result);
  fs.writeFileSync(path.join(output,'runs.json'),JSON.stringify({priorCostUsd:prior,totalCostUsd:spent,capUsd:cap,modelRequested:opts.model||'host default',isolatedWorkspaces:true,runs},null,2));
  console.log(JSON.stringify({finished:scenario.id,subtype:row.subtype,costUsd:cost,totalCostUsd:spent}));
  if(cost===undefined||result.error||result.status!==0||final.subtype!=='success'||!row.result.trim())throw new Error('Uncertain cost, timeout, process failure, or incomplete response; no further calls started');
 }
}catch(e){console.error(e.message);process.exitCode=1;}
