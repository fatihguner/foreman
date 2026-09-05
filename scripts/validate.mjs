#!/usr/bin/env node
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { validate, LAYERS } from '../lib/content.js';

let root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..'), layer, json = false, refsOnly = false;
const args = process.argv.slice(2);
for (let i = 0; i < args.length; i++) {
  const a = args[i];
  if (a === '--help' || a === '-h') { console.log('Usage: validate.mjs [--root PATH] [--layer skills|output-templates|diagnostics|playbooks|hooks|agents|research] [--refs-only] [--json] [--verbose]'); process.exit(0); }
  if (a === '--root' || a === '--layer') {
    const value = args[++i];
    if (!value || value.startsWith('--')) throw new Error(`${a} requires a value`);
    if (a === '--root') root = path.resolve(value); else layer = value;
  } else if (a === '--json') json = true;
  else if (a === '--refs-only') refsOnly = true;
  else if (!['--verbose','--stop-on-first-failure'].includes(a)) throw new Error(`Unknown option: ${a}`);
}
if (layer && !LAYERS[layer]) throw new Error(`Unknown layer: ${layer}`);
const result = validate(root, { layer, refsOnly });
if (json) console.log(JSON.stringify(result, null, 2));
else {
  for (const [name, count] of Object.entries(result.counts)) console.log(`${name}: ${count}`);
  console.log(`Total: ${result.files} files; YAML: ${result.yamlDocuments}; references: ${result.references}; links: ${result.links}`);
  for (const error of result.errors) console.error(`FAIL ${error}`);
  console.log(result.errors.length ? `Validation failed: ${result.errors.length} error(s).` : 'Validation passed.');
}
process.exitCode = result.errors.length ? 1 : 0;
