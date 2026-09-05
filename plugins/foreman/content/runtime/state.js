// Runtime state is deliberately dependency-free so every distribution uses it.
import fs from 'node:fs';
import path from 'node:path';
import { randomUUID } from 'node:crypto';

export const STATUSES = ['not-started','in-progress','blocked','completed','abandoned','deferred'];
export const SECTORS = ['saas','marketplace','e-commerce','fintech','ai-ml','healthtech','edtech','d2c-consumer','agency-consulting',''];
const LANGUAGES = { english:'en',default:'en',turkish:'tr','türkçe':'tr',spanish:'es',french:'fr',german:'de',japanese:'ja',chinese:'zh',portuguese:'pt',arabic:'ar',korean:'ko',italian:'it',russian:'ru',hindi:'hi',dutch:'nl' };
export function language(value) {
  if (typeof value !== 'string' || !value.trim() || value.length > 60 || /[\x00-\x1f]/.test(value)) throw new Error('Invalid language');
  const v = value.trim().toLowerCase();
  return LANGUAGES[v] || v;
}
export function identifier(id) {
  if (typeof id !== 'string' || !/^[a-z0-9][a-z0-9_-]{0,79}$/i.test(id)) throw new Error('Invalid identifier');
  return id;
}
export function newState(founder = 'default', defaults = {}) {
  identifier(founder);
  return { schema_version:1, founder_id:founder, revision:0,
    identity:{mode:defaults.defaultMode === 'solo' ? 'solo' : 'standard',stoic_mode:defaults.defaultMode === 'stoic',language:language(defaults.defaultLanguage || 'en')},
    company:{sector:defaults.sector || ''}, active:{playbook:null}, implementation_items:[], history:[] };
}
function date(value) {
  if (value === null) return true;
  return typeof value === 'string' && /^\d{4}-\d{2}-\d{2}$/.test(value) && Number.isFinite(Date.parse(value)) && new Date(value).toISOString().slice(0,10) === value;
}
export function validateState(s) {
  if (!s || s.schema_version !== 1) throw new Error('Unsupported state schema; migrate explicitly');
  identifier(s.founder_id);
  if (!Number.isInteger(s.revision) || s.revision < 0) throw new Error('Invalid revision');
  if (!['standard','solo'].includes(s.identity?.mode) || typeof s.identity.stoic_mode !== 'boolean') throw new Error('Invalid operating mode');
  language(s.identity.language);
  if (!s.company || !SECTORS.includes(s.company.sector)) throw new Error('Unknown sector');
  if (!s.active || !Array.isArray(s.implementation_items) || !Array.isArray(s.history)) throw new Error('Invalid state collections');
  if (s.active.playbook !== null) {
    identifier(s.active.playbook?.id);
    if (!Number.isInteger(s.active.playbook.next_step) || s.active.playbook.next_step < 1) throw new Error('Invalid playbook checkpoint');
  }
  const ids = new Set();
  for (const item of s.implementation_items) {
    identifier(item.id);
    if (ids.has(item.id)) throw new Error(`Duplicate task: ${item.id}`);
    ids.add(item.id);
    if (typeof item.description !== 'string' || !item.description.trim()) throw new Error('Task description required');
    if (!STATUSES.includes(item.status) || !Number.isInteger(item.progress) || item.progress < 0 || item.progress > 100) throw new Error('Invalid task status or progress');
    if (item.status === 'completed' && item.progress !== 100) throw new Error('Completed tasks require 100% progress');
    if (item.status === 'not-started' && item.progress !== 0) throw new Error('Not-started tasks require 0% progress');
    if (!date(item.deadline) || !Array.isArray(item.notes) || !Array.isArray(item.state_history)) throw new Error('Invalid task deadline or history');
  }
  return s;
}

function statePath(workspace, founder, create = false) {
  if (!workspace || !path.isAbsolute(workspace)) throw new Error('An absolute workspace directory is required for persistent state');
  identifier(founder);
  let dir = workspace;
  for (const part of ['.foreman',founder]) {
    dir = path.join(dir,part);
    if (fs.existsSync(dir) && fs.lstatSync(dir).isSymbolicLink()) throw new Error(`Linked state directory is not supported: ${dir}`);
    if (create) fs.mkdirSync(dir,{recursive:true,mode:0o700});
  }
  const file = path.join(dir,'state.json');
  try { if (fs.lstatSync(file).isSymbolicLink()) throw new Error('Linked state file is not supported'); }
  catch(e) { if (e.code !== 'ENOENT') throw e; }
  return file;
}
export function readState(workspace, founder = 'default', defaults = {}) {
  const file = statePath(workspace,founder);
  if (!fs.existsSync(file)) return validateState(newState(founder,defaults));
  const s = validateState(JSON.parse(fs.readFileSync(file,'utf8')));
  if (s.founder_id !== founder) throw new Error('State founder does not match selected founder');
  return s;
}
export function changeState(workspace, founder = 'default', mutate, { defaults = {}, expectedRevision } = {}) {
  const file = statePath(workspace,founder,true), lock = file + '.lock';
  let fd;
  try { fd = fs.openSync(lock,'wx',0o600); }
  catch(e) { if (e.code === 'EEXIST') throw new Error('State is locked by another writer; retry after it finishes'); throw e; }
  const tmp = `${file}.${randomUUID()}.tmp`;
  try {
    const state = readState(workspace,founder,defaults);
    if (expectedRevision !== undefined && state.revision !== expectedRevision) throw new Error('State revision conflict; read the latest state before retrying');
    const draft = structuredClone(state);
    const next = mutate(draft) || draft;
    next.revision = state.revision + 1;
    validateState(next);
    if (next.founder_id !== founder) throw new Error('Cannot change founder identity');
    fs.writeFileSync(tmp,JSON.stringify(next,null,2)+'\n',{flag:'wx',mode:0o600});
    const sync = fs.openSync(tmp,'r'); try { fs.fsyncSync(sync); } finally { fs.closeSync(sync); }
    fs.renameSync(tmp,file);
    return next;
  } finally { fs.closeSync(fd); fs.rmSync(lock,{force:true}); fs.rmSync(tmp,{force:true}); }
}
export function updateProfile(state, changes) {
  for (const [key,value] of Object.entries(changes)) {
    if (key === 'mode') state.identity.mode = value;
    else if (key === 'stoic_mode') state.identity.stoic_mode = value;
    else if (key === 'language') state.identity.language = language(value);
    else if (key === 'sector') state.company.sector = value;
    else throw new Error(`Unknown profile field: ${key}`);
  }
  return validateState(state);
}
export function updateTask(state, input, now = new Date()) {
  identifier(input.id);
  const allowed = ['id','description','owner','deadline','status','progress','note'];
  for (const key of Object.keys(input)) if (!allowed.includes(key)) throw new Error(`Unknown task field: ${key}`);
  let item = state.implementation_items.find(x => x.id === input.id);
  if (!item) {
    if (!input.description?.trim()) throw new Error('A new task requires a description');
    item = {id:input.id,description:input.description,owner:'self',deadline:null,status:'not-started',progress:0,notes:[],state_history:[],created:now.toISOString(),updated:now.toISOString()};
    state.implementation_items.push(item);
  }
  const previous = item.status;
  for (const key of ['description','owner','deadline','status','progress']) if (input[key] !== undefined) item[key] = input[key];
  if (input.status === 'completed') item.progress = 100;
  else if (input.status === 'not-started') item.progress = 0;
  else if (input.progress !== undefined && input.status === undefined) item.status = input.progress === 100 ? 'completed' : input.progress > 0 ? 'in-progress' : 'not-started';
  if (input.note !== undefined) {
    if (typeof input.note !== 'string' || !input.note.trim()) throw new Error('A note must be nonempty text');
    item.notes.push({date:now.toISOString(),note:input.note});
  }
  if (previous !== item.status) item.state_history.push({from:previous,to:item.status,date:now.toISOString()});
  item.updated = now.toISOString();
  state.history.push({event:'task-updated',id:item.id,date:now.toISOString()});
  return validateState(state);
}
export function track(state, filter = 'all', now = new Date()) {
  if (!['all','active','overdue','stalled',...STATUSES].includes(filter)) throw new Error(`Unknown tracking filter: ${filter}`);
  const active = t => !['completed','abandoned'].includes(t.status);
  return state.implementation_items.filter(t => filter === 'all' || (filter === 'active' ? active(t) : filter === 'overdue' ? active(t) && t.deadline && t.deadline < now.toISOString().slice(0,10) : filter === 'stalled' ? active(t) && now.getTime() - Date.parse(t.updated || t.created) >= 14*86400000 : t.status === filter));
}
export function migrateState(legacy, founder = 'default') {
  if (legacy.schema_version === 1) return validateState({...structuredClone(legacy),founder_id:founder});
  const s = newState(founder), identity = legacy.identity || {}, prefs = legacy.preferences || identity.preferences || {};
  s.identity = {...identity,mode:identity.mode || ((identity.mode_solo ?? prefs.solo_mode) ? 'solo' : 'standard'),stoic_mode:identity.stoic_mode ?? identity.mode_stoic ?? prefs.stoic_mode ?? false,language:language(identity.language || prefs.language || 'en')};
  if (s.identity.mode === 'stoic') { s.identity.mode='standard'; s.identity.stoic_mode=true; }
  delete s.identity.mode_solo; delete s.identity.mode_stoic; delete s.identity.preferences;
  s.company = {...legacy.company,sector:legacy.company?.sector || ''};
  s.active = {...legacy.active,playbook:legacy.active?.playbook || null};
  for (const old of legacy.implementation_items || legacy.active?.implementation_items || []) {
    const status = old.status || 'not-started';
    const item = {...old,deadline:old.deadline || null,status,progress:old.progress ?? (status === 'completed' ? 100 : 0),notes:old.notes || [],state_history:old.state_history || []};
    s.implementation_items.push(item);
  }
  s.history = Array.isArray(legacy.history) ? legacy.history : [];
  s.legacy = structuredClone(legacy); // Preserve source fields without using two active schemas.
  return validateState(s);
}
