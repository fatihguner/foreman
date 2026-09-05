#!/usr/bin/env node
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve(import.meta.dirname, '..');
const json = file => JSON.parse(fs.readFileSync(path.join(root, file), 'utf8'));
const pkg = json('package.json');
const args = process.argv.slice(2);
assert.ok(args.length === 0 || (args.length === 2 && args[0] === '--tag'), 'Usage: check-release.mjs [--tag vVERSION]');
assert.match(pkg.version, /^\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?$/);
if (args.length) assert.equal(args[1], `v${pkg.version}`, 'Release tag must match package version');
for (const file of ['.claude-plugin/plugin.json', '.codex-plugin/plugin.json', 'plugins/foreman/.claude-plugin/plugin.json', 'openclaw.plugin.json', 'package-lock.json']) {
  assert.equal(json(file).version, pkg.version, `Version mismatch: ${file}`);
}
assert.equal(json('package-lock.json').packages[''].version, pkg.version);
const marketplace = json('.claude-plugin/marketplace.json');
assert.equal(marketplace.metadata.version, pkg.version);
assert.equal(marketplace.plugins.find(p => p.name === 'foreman').version, pkg.version);
assert.equal(pkg.publishConfig.access, 'public');
assert.equal(pkg.publishConfig.tag, pkg.version.includes('-') ? 'next' : 'latest', 'Prereleases must use next; stable releases must use latest');
for (const file of [pkg.bin['foreman-sh'], ...pkg.openclaw.extensions, '.claude/RUNTIME.md', 'plugins/foreman/skills/foreman/SKILL.md', 'LICENSE']) {
  assert.ok(fs.statSync(path.join(root, file)).isFile(), `Missing release file: ${file}`);
}
assert.ok(fs.readFileSync(path.join(root, 'CHANGELOG.md'), 'utf8').includes(`## [${pkg.version}]`), 'Missing changelog entry');
console.log(`Release metadata verified: foreman-sh@${pkg.version} (${pkg.publishConfig.tag})`);
