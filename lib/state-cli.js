import fs from 'node:fs';
import path from 'node:path';
import { changeState, readState, updateProfile, updateTask, track, migrateState, identifier } from './state.js';

// The generated catalog sits beside the bundled runtime (`.claude/runtime/../catalog.json`)
// and beside the repository library (`lib/../.claude/catalog.json`).
function catalogFile() {
  for (const candidate of ['../catalog.json','../.claude/catalog.json']) {
    const file = path.resolve(import.meta.dirname,candidate);
    if (fs.existsSync(file)) return file;
  }
  return null;
}

// A checkpoint must name a real playbook and a reachable step; without a catalog only the identifier shape is checked.
export function resolvePlaybook(name, step) {
  identifier(name);
  const file = catalogFile();
  if (!file) return { id:name };
  const cat = JSON.parse(fs.readFileSync(file,'utf8'));
  const playbooks = (cat.entries || []).filter(e => e.kind === 'playbook');
  const key = name.toLowerCase(), normalized = s => s.toLowerCase().replace(/[\s_-]+/g,'');
  let entry = playbooks.find(e => e.id === key) || playbooks.find(e => e.id === cat.aliases?.playbook?.[key]);
  if (!entry) { const matches = playbooks.filter(e => normalized(e.id) === normalized(key)); if (matches.length === 1) entry = matches[0]; }
  if (!entry) throw new Error(`Unknown playbook "${name}"; use a playbook identifier from catalog.json`);
  if (Number.isInteger(entry.steps) && step > entry.steps + 1) throw new Error(`Step ${step} is outside ${entry.id}, which has ${entry.steps} steps`);
  return entry;
}

export function runStateCLI(args) {
  const [command,...rest] = args;
  if (!command || command === '--help' || rest.includes('--help')) return {usage:'profile [--mode standard|solo] [--stoic on|off] [--language tr] [--sector saas]; task --id ID [--description TEXT] [--status STATE] [--progress 0..100] [--deadline YYYY-MM-DD] [--note TEXT]; track [--filter all|active|overdue|stalled|STATE]; resume [--playbook ID --step N]; migrate --input legacy.json. Common: --workspace DIR --founder ID --revision N'};
  const opts = {};
  for(let i=0;i<rest.length;i+=2) {
    if (!/^--[a-z-]+$/.test(rest[i]) || rest[i+1] === undefined) throw new Error(`Expected --option value: ${rest[i]}`);
    if (rest[i].slice(2) in opts) throw new Error(`Duplicate option ${rest[i]}`);
    opts[rest[i].slice(2)] = rest[i+1];
  }
  const workspace = path.resolve(opts.workspace || process.cwd()), founder=opts.founder || 'default';
  const allowed = {profile:['mode','stoic','language','sector'],task:['id','description','status','progress','deadline','note','owner'],track:['filter'],resume:['playbook','step'],migrate:['input']}[command];
  if (!allowed) throw new Error(`Unknown state command ${command}`);
  for (const key of Object.keys(opts)) if (![...allowed,'workspace','founder','revision'].includes(key)) throw new Error(`Unknown option --${key}`);
  const mutate = fn => changeState(workspace,founder,fn,{expectedRevision: opts.revision === undefined ? undefined : Number(opts.revision)});
  if (command === 'profile') {
    const changes = {};
    for (const key of ['mode','language','sector']) if (opts[key] !== undefined) changes[key]=opts[key];
    if (opts.stoic !== undefined) { if (!['on','off'].includes(opts.stoic)) throw new Error('stoic must be on or off'); changes.stoic_mode=opts.stoic==='on'; }
    return Object.keys(changes).length ? mutate(s=>updateProfile(s,changes)) : readState(workspace,founder);
  }
  if (command === 'task') {
    const input = Object.fromEntries(allowed.filter(k => opts[k] !== undefined).map(k=>[k,opts[k]]));
    if (input.progress !== undefined) input.progress=Number(input.progress);
    if (input.deadline === 'none') input.deadline=null;
    return mutate(s=>updateTask(s,input));
  }
  if (command === 'track') return {items:track(readState(workspace,founder),opts.filter || 'all')};
  if (command === 'resume') {
    if (opts.playbook === undefined && opts.step === undefined) return readState(workspace,founder).active.playbook;
    if (opts.playbook === undefined || opts.step === undefined) throw new Error('resume requires both --playbook and --step');
    const step = Number(opts.step);
    if (!Number.isInteger(step) || step < 1) throw new Error('Invalid playbook step');
    const playbook = resolvePlaybook(opts.playbook,step);
    return mutate(s=>{s.active.playbook={id:playbook.id,next_step:step};return s;});
  }
  if (!opts.input) throw new Error('migrate requires --input legacy.json');
  const legacy = JSON.parse(fs.readFileSync(path.resolve(opts.input),'utf8'));
  return mutate(s=>{if (s.revision !== 0) throw new Error('Migration requires an unused founder destination');return migrateState(legacy,founder);});
}
