#!/usr/bin/env node
import path from 'node:path';
import { initWorkspace } from '../dist/lib/distribution.js';
import { runStateCLI } from '../dist/lib/state-cli.js';
const root = path.resolve(import.meta.dirname,'..');
const args = process.argv.slice(2);
try {
  if (!args.length || (args[0] !== 'state' && args.includes('--help')) || args[0] === 'help') {
    console.log('Foreman\n  foreman-sh init [--workspace DIR] [--platform claude|codex|all]\n  foreman-sh state <profile|task|track|resume|migrate> [options]\nExisting workspace files are preserved. Run state --help for state commands.');
  } else if (args[0] === 'init') {
    let workspace = process.cwd(), platform = 'claude';
    for (let i=1; i<args.length;i++) {
      if (args[i] === '--workspace' && args[i+1]) workspace = path.resolve(args[++i]);
      else if (args[i] === '--platform' && args[i+1]) platform = args[++i];
      else throw new Error(`Unknown or incomplete argument: ${args[i]}`);
    }
    const result = initWorkspace(root,workspace,platform);
    console.log(`Foreman initialized: ${result.copied.length} files added, ${result.preserved.length} existing files preserved.\n${workspace}`);
  } else if (args[0] === 'state') console.log(JSON.stringify(runStateCLI(args.slice(1)),null,2));
  else throw new Error(`Unknown command: ${args[0]}`);
} catch(e) { console.error(e.message); process.exitCode = 1; }
