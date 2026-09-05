#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import { initWorkspace } from '../lib/distribution.js';
import { runStateCLI } from '../lib/state-cli.js';

const root = path.resolve(import.meta.dirname,'..');
const pkg = JSON.parse(fs.readFileSync(path.join(root,'package.json'),'utf8'));
const usage = `Foreman ${pkg.version}
Usage:
  foreman-sh init [--workspace DIR] [--platform claude|codex|all]
  foreman-sh state <profile|task|track|resume|migrate> [options]
  foreman-sh --version

init adds Foreman to a project and never overwrites existing files.
state reads or writes local founder records; run "foreman-sh state --help" for options.`;
const args = process.argv.slice(2), [command] = args;
try {
  if (['--version','-v','version'].includes(command)) console.log(pkg.version);
  else if (!command || ['help','--help','-h'].includes(command) || (command !== 'state' && args.includes('--help'))) console.log(usage);
  else if (command === 'init') {
    let workspace = process.cwd(), platform = 'claude';
    for (let i=1; i<args.length;i++) {
      if (args[i] === '--workspace' && args[i+1]) workspace = path.resolve(args[++i]);
      else if (args[i] === '--platform' && args[i+1]) platform = args[++i];
      else throw new Error(`Unknown or incomplete argument: ${args[i]}`);
    }
    const result = initWorkspace(root,workspace,platform);
    const lines = [`Foreman ${pkg.version} initialized in ${workspace}`, `  ${result.copied.length} files added, ${result.preserved.length} existing files preserved.`];
    for (const note of result.notes) lines.push(`  Note: ${note}`);
    lines.push('Next steps:');
    if (platform !== 'codex') lines.push('  Open Claude Code in this directory and run /foreman-help, or describe a business problem in plain language.');
    if (platform !== 'claude') lines.push('  Open Codex in this directory and ask for $foreman with the operation you need.');
    lines.push('  Saved preferences and tasks are stored in .foreman/, which keeps itself out of Git.');
    console.log(lines.join('\n'));
  }
  else if (command === 'state') console.log(JSON.stringify(runStateCLI(args.slice(1)),null,2));
  else throw new Error(`Unknown command: ${command}. Run "foreman-sh --help" for usage.`);
} catch(e) { console.error(e.message); process.exitCode = 1; }
