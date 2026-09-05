#!/usr/bin/env node
import { runStateCLI } from './state-cli.js';
try { console.log(JSON.stringify(runStateCLI(process.argv.slice(2)),null,2)); }
catch(e) { console.error(e.message); process.exitCode=1; }
