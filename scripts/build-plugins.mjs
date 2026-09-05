#!/usr/bin/env node
import path from 'node:path';
import { buildPlugins } from '../lib/distribution.js';
const root = path.resolve(import.meta.dirname, '..');
try { console.log(JSON.stringify(buildPlugins(root))); }
catch (e) { console.error(e.message); process.exitCode = 1; }
