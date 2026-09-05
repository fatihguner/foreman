#!/usr/bin/env node
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { execFileSync } from 'node:child_process';

assert.equal(process.argv.length, 3, 'Usage: package-smoke.mjs /path/to/package.tgz');
const archive = path.resolve(process.argv[2]);
assert.ok(fs.statSync(archive).isFile());
const root = fs.mkdtempSync(path.join(os.tmpdir(), 'foreman-package-'));
const run = (command, args) => execFileSync(command, args, { cwd: root, encoding: 'utf8', timeout: 120000, stdio: ['ignore', 'pipe', 'pipe'] });
try {
  fs.writeFileSync(path.join(root, 'package.json'), '{"private":true}\n');
  run('npm', ['install', archive, '--ignore-scripts', '--no-audit', '--no-fund']);
  const installed = path.join(root, 'node_modules/foreman-sh');
  const pkg = JSON.parse(fs.readFileSync(path.join(installed, 'package.json'), 'utf8'));
  for (const file of ['dist/index.js', '.codex-plugin/plugin.json', '.claude-plugin/plugin.json', 'plugins/foreman/.claude-plugin/plugin.json', 'docs/development.md', 'assets/logo-foreman.svg', 'LICENSE']) {
    assert.ok(fs.statSync(path.join(installed, file)).isFile(), `Missing packaged file: ${file}`);
  }
  for (const file of ['.foreman', '.env', '.npmrc', '.claude/settings.local.json']) {
    assert.equal(fs.existsSync(path.join(installed, file)), false, `Private runtime file shipped: ${file}`);
  }
  const cli = path.join(installed, pkg.bin['foreman-sh']);
  const workspace = path.join(root, 'workspace');
  assert.match(run(process.execPath, [cli, 'init', '--platform', 'all', '--workspace', workspace]), /files added/);
  assert.ok(fs.existsSync(path.join(workspace, '.agents/skills/foreman/SKILL.md')));
  assert.ok(fs.existsSync(path.join(workspace, '.agents/content/RUNTIME.md')));
  assert.ok(fs.existsSync(path.join(workspace, '.claude/commands/solo.md')));
  fs.writeFileSync(path.join(workspace, 'CLAUDE.md'), 'Keep my project instructions');
  assert.match(run(process.execPath, [cli, 'init', '--platform', 'all', '--workspace', workspace]), /0 files added/);
  assert.equal(fs.readFileSync(path.join(workspace, 'CLAUDE.md'), 'utf8'), 'Keep my project instructions');
  const profile = JSON.parse(run(process.execPath, [cli, 'state', 'profile', '--workspace', workspace, '--mode', 'solo', '--language', 'tr']));
  assert.ok(JSON.stringify(profile).includes('solo'));
  const saved = JSON.parse(fs.readFileSync(path.join(workspace, '.foreman/default/state.json'), 'utf8'));
  assert.equal(saved.identity.mode, 'solo');
  assert.equal(saved.identity.language, 'tr');
  console.log(`Packed installation verified: foreman-sh@${pkg.version}; Claude + Codex resources, preserved files and persisted profile`);
} finally {
  fs.rmSync(root, { recursive: true, force: true });
}
