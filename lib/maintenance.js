import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { randomUUID } from 'node:crypto';
import { execFileSync } from 'node:child_process';
import { parseDocument, stringify } from 'yaml';
import { catalog, frontmatter, walk, validate, STAGES, references } from './content.js';

export function slug(value) { if (!/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(value || '')) throw new Error('Expected a kebab-case name');return value; }
export function within(root,file) {
  const target=path.resolve(root,file),relative=path.relative(root,target);
  if (relative.startsWith('..') || path.isAbsolute(relative)) throw new Error('Path must stay inside the repository');
  let current=root;
  for (const part of relative.split(path.sep)) {
    current=path.join(current,part);
    try { if (fs.lstatSync(current).isSymbolicLink()) throw new Error(`Linked maintenance target: ${current}`); }
    catch(e) { if (e.code !== 'ENOENT') throw e; }
  }
  return target;
}
export function atomicWrite(file,text,{create=false}={}) {
  fs.mkdirSync(path.dirname(file),{recursive:true});
  const tmp=`${file}.${randomUUID()}.tmp`;
  try {
    fs.writeFileSync(tmp,text,{flag:'wx',mode:fs.existsSync(file)?fs.statSync(file).mode:0o644});
    if (create) fs.linkSync(tmp,file); else fs.renameSync(tmp,file);
  } finally { fs.rmSync(tmp,{force:true}); }
}
export function editFrontmatter(text,edit) {
  const fm=frontmatter(text);
  if (!fm.header) throw new Error('Missing frontmatter');
  const doc=parseDocument(fm.header.replace(/^---\r?\n/,'').replace(/\r?\n---\r?\n?$/,''));
  edit(doc);
  return `---\n${doc.toString()}---\n${fm.body}`;
}
export function createContent(root,kind,opts) {
  const name=slug(opts.name),category=opts.category,author=opts.author || 'Fatih Guner';
  const complex=opts.complexity || 'intermediate',stages=opts.stage ? opts.stage.split(',') : [...STAGES];
  if (!['basic','intermediate','advanced'].includes(complex)) throw new Error('Invalid complexity');
  if (stages.some(s=>!STAGES.includes(s)) || !stages.length) throw new Error('Invalid stage');
  const configs={skill:['skills','skill-template.md'],template:['output-templates','output-template.md'],diagnostic:['diagnostics','diagnostic-template.md'],playbook:['playbooks','playbook-template.md'],hook:['hooks','hook-template.md']};
  if (!configs[kind]) throw new Error('Unknown content kind');
  const [layer,template]=configs[kind];
  let sub='';
  if (kind === 'skill') {slug(category);if(!fs.statSync(within(root,`.claude/skills/${category}`)).isDirectory()) throw new Error('Unknown category');sub=category;}
  if (kind === 'template') {if(!['investor','board','team','self','client'].includes(opts.audience)) throw new Error('Invalid audience');sub=opts.audience;}
  if (kind === 'hook' && !['high','medium','low'].includes(opts.priority || 'medium')) throw new Error('Invalid priority');
  const source=within(root,`.claude/${layer}/_schema/${template}`),dest=within(root,`.claude/${layer}/${sub}/${name}.md`);
  const fm=frontmatter(fs.readFileSync(source,'utf8'));
  const data={...fm.data,name,author,draft:true,description:`Draft ${kind}: ${name}. Complete the content before publishing.`};
  for(const key of ['related_skills','applicable_skills','routes_to_skills','routes_to_templates','trigger_diagnostics','steps','final_outputs','possible_diagnoses']) if(key in data)data[key]=[];
  if(kind==='skill') {data.category=category;data.version='1.0.0';data.tags=[];}
  if(kind==='skill'||kind==='playbook') {data.complexity=complex;data.stage=stages;}
  if(kind==='template') {data.audience=opts.audience;data.format=opts.format || 'report';}
  if(kind==='diagnostic') data.entry_symptoms=opts.symptom || [];
  if(kind==='hook') {data.priority=opts.priority || 'medium';data.trigger_patterns=[];data.routes_to={skills:[],diagnostics:[],templates:[]};}
  const body=fm.body.replace(/<!--[\s\S]*?-->/g,'').replace(/^# .+$/m,`# ${name.split('-').map(w=>w[0].toUpperCase()+w.slice(1)).join(' ')}`);
  const text=`---\n${stringify(data)}---\n${body}`;
  frontmatter(text);
  atomicWrite(dest,text,{create:true});
  return {created:path.relative(root,dest),draft:true};
}
function transaction(changes) {
  const previous=new Map(changes.map(([f])=>[f,fs.readFileSync(f,'utf8')]));
  try { for(const [f,text] of changes) atomicWrite(f,text); }
  catch(e) {for(const [f,text] of previous)atomicWrite(f,text);throw e;}
}
export function renameCategory(root,from,to,confirm=false) {
  slug(from);slug(to);
  const oldDir=within(root,`.claude/skills/${from}`),newDir=within(root,`.claude/skills/${to}`);
  if(!fs.existsSync(oldDir)||fs.existsSync(newDir))throw new Error('Source must exist and destination must not exist');
  const changes=[];
  for(const file of walk(path.join(root,'.claude'),{schemas:true}).filter(f=>/\.(md|ya?ml)$/.test(f))) {
    let text=fs.readFileSync(file,'utf8'),next=text;
    if(file.startsWith(oldDir+path.sep)) next=editFrontmatter(next,doc=>doc.set('category',to));
    // Rewrite only path segments, never framework identities or ordinary words.
    next=next.split(`skills/${from}/`).join(`skills/${to}/`);
    if(file.endsWith('.md')) next=next.replace(/\]\(([^)\s]+)([^)]*)\)/g,(all,href,tail)=>{
      if(/^(?:[a-z]+:|#)/i.test(href))return all;
      const [p,anchor]=href.split('#');
      let target=path.resolve(path.dirname(file),decodeURIComponent(p));
      if(target.startsWith(oldDir+path.sep))target=newDir+target.slice(oldDir.length);
      const origin=file.startsWith(oldDir+path.sep)?newDir+file.slice(oldDir.length):file;
      return `](${path.relative(path.dirname(origin),target).split(path.sep).join('/')}${anchor?'#'+anchor:''}${tail})`;
    });
    if(/\.ya?ml$/.test(file)) next=next.replace(new RegExp(`^(\\s*)${from}:`,'gm'),`$1${to}:`);
    if(next!==text)changes.push([file,next]);
  }
  if(confirm) {
    const original=changes.map(([f])=>[f,fs.readFileSync(f,'utf8')]);
    transaction(changes);
    try {fs.renameSync(oldDir,newDir);}catch(e){transaction(original);throw e;}
  }
  return {from,to,files:changes.length,applied:confirm};
}
export function bumpVersion(root,opts) {
  if(!/^\d+\.\d+\.\d+$/.test(opts.to || ''))throw new Error('Invalid semantic version');
  if(Boolean(opts.file)===Boolean(opts.category))throw new Error('Provide exactly one of --file or --category');
  const files=opts.file?[within(root,opts.file)]:walk(within(root,`.claude/skills/${slug(opts.category)}`)).filter(f=>f.endsWith('.md'));
  if(!files.length)throw new Error('No versioned files selected');
  const changes=files.map(file=>[file,editFrontmatter(fs.readFileSync(file,'utf8'),doc=>{if(!doc.has('version'))throw new Error(`No version in ${file}`);doc.set('version',opts.to);})]);
  transaction(changes);return {updated:files.length,version:opts.to};
}
export function anonymize(root,opts) {
  if(!opts.name)throw new Error('--name is required');
  const files=walk(within(root,opts.in || '.claude'),{schemas:true}).filter(f=>/\.(md|ya?ml)$/.test(f)),changes=[];
  let occurrences=0;
  for(const file of files) {
    const text=fs.readFileSync(file,'utf8'),count=text.split(opts.name).length-1;
    if(count){occurrences+=count;changes.push([file,text.split(opts.name).join('Anonymous')]);}
  }
  if(opts.apply)transaction(changes);
  return {files:changes.length,occurrences,applied:Boolean(opts.apply)};
}
export function statistics(root) {
  const cat=catalog(root);if(cat.errors.length)throw new Error(cat.errors.join('\n'));
  const counts={},categories={},incoming=new Map();
  for(const e of cat.entries){counts[e.kind]=(counts[e.kind]||0)+1;if(e.kind==='skill')categories[e.category]=(categories[e.category]||0)+1;for(const r of references(e.data)){const key=`${r.kind}:${r.ref}`;incoming.set(key,(incoming.get(key)||0)+1);}}
  if(!counts.skill)throw new Error('No skills found');
  return {counts,categories,unreferenced:cat.entries.filter(e=>e.kind==='skill'&&!incoming.has(`skill:${e.id}`)).map(e=>e.id)};
}
export function updateSummary(root) {
  const stats=statistics(root),file=path.join(root,'CLAUDE.md'),text=fs.readFileSync(file,'utf8');
  const block=`<!-- foreman-counts:start -->\nCurrent catalog: ${Object.entries(stats.counts).map(([k,v])=>`${v} ${k} entries`).join('; ')}.\n<!-- foreman-counts:end -->`;
  atomicWrite(file,text.includes('<!-- foreman-counts:start -->')?text.replace(/<!-- foreman-counts:start -->[\s\S]*?<!-- foreman-counts:end -->/,block):text+'\n'+block+'\n');
  return stats.counts;
}
export function checkIndex(root) {
  const git=args=>execFileSync('git',args,{cwd:root,encoding:'utf8',maxBuffer:20*1024*1024});
  const changed=git(['diff','--cached','--name-only','-z']).split('\0').filter(Boolean);
  if(!changed.some(f=>f.startsWith('.claude/')))return {checked:0,errors:[]};
  const tmp=fs.mkdtempSync(path.join(os.tmpdir(),'foreman-index-'));
  try {
    const names=git(['ls-files','--cached','-z','--','.claude']).split('\0').filter(Boolean);
    for(const file of names) {const dest=path.join(tmp,file);fs.mkdirSync(path.dirname(dest),{recursive:true});fs.writeFileSync(dest,git(['show',`:${file}`]));}
    const result=validate(tmp);return {checked:result.files,errors:result.errors};
  } finally {fs.rmSync(tmp,{recursive:true,force:true});}
}
