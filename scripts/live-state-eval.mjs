#!/usr/bin/env node
// Opt-in live integration test. Each turn is a new host process.
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { initWorkspace } from '../lib/distribution.js';
import { changeState, readState, track, updateProfile } from '../lib/state.js';

const root = path.resolve(import.meta.dirname, '..');
try {
  const args = process.argv.slice(2), opts = {};
  if (args.includes('--help')) {
    console.log('Usage: live-state-eval.mjs --host claude|codex --output DIR --total-cap-usd N [--prior-cost-usd N] [--call-cap-usd 0.8]\nRuns four fictional state and resume scenarios in fresh host sessions. Codex uses gpt-5.4-mini via the existing ChatGPT login; usage is recorded at published API-equivalent rates, not as an invoice charge. No user configuration or external connectors are loaded.');
    process.exit(0);
  }
  for (let i = 0; i < args.length; i += 2) {
    assert.ok(['--host', '--output', '--total-cap-usd', '--prior-cost-usd', '--call-cap-usd'].includes(args[i]) && args[i + 1], 'Invalid option');
    opts[args[i].slice(2)] = args[i + 1];
  }
  assert.ok(['claude', 'codex'].includes(opts.host) && opts.output, 'Host and output are required');
  const cap = Number(opts['total-cap-usd']), prior = Number(opts['prior-cost-usd'] || 0), callCap = Number(opts['call-cap-usd'] || 0.8);
  assert.ok(Number.isFinite(cap) && cap > 0 && Number.isFinite(prior) && prior >= 0 && Number.isFinite(callCap) && callCap > 0, 'Invalid budget');
  const reserve = Math.max(0.2, callCap * 0.25);
  assert.ok(prior + callCap + reserve <= cap, 'Insufficient budget');
  const output = path.resolve(opts.output), workspace = path.join(output, 'workspace');
  assert.equal(fs.existsSync(output), false, 'Output exists; refusing to repeat live calls');
  fs.mkdirSync(output, { recursive: true });
  initWorkspace(root, workspace, opts.host === 'codex' ? 'codex' : 'claude');
  changeState(workspace, 'other-founder', s => updateProfile(s, { language: 'es', mode: 'standard' }));
  const canary = fs.readFileSync(path.join(workspace, '.foreman/other-founder/state.json'), 'utf8');
  const settings = path.join(output, 'claude-settings.json');
  fs.writeFileSync(settings, JSON.stringify({ disableAllHooks: true, autoMemoryEnabled: false, enabledPlugins: {} }));
  const intro = 'Bu kurgusal bir Foreman kabul testidir. Yalnızca bu çalışma alanındaki Foreman kaynaklarını kullan. Web, dış dosyalar, dış hizmetler ve alt ajanlar yok. Yalnızca default kurucunun gerçek kayıtlarıyla çalış. Dosyaya yazmak için Foreman runtime kullan; kaynak dosyalarını veya state.json dosyasını elle değiştirme. En çok 120 kelime Türkçe yanıt ver. ';
  const steps = [
    { id: '01-create', prompt: 'Kalıcı tercihlerimi solo, Türkçe ve SaaS olarak kaydet. impl-accept-interview kimliğiyle "Müşteri görüşmelerini tamamla" görevini oluştur; son tarih 2020-01-01. Bu kayıtları oluşturmamı onaylıyorum.' },
    { id: '02-block-and-checkpoint', prompt: 'impl-accept-interview görevini blocked durumuna getir; "Randevular bekleniyor" notunu ekle. Pivot playbook ilk adımını ben tamamladım ve bunu onaylıyorum. Bir sonraki oturumda ikinci adımdan devam etmek üzere checkpoint kaydet.' },
    { id: '03-fresh-recall', prompt: 'Yeni oturumdayım. Kalıcı çalışma modumu, dilimi ve engelli görevlerimi gerçek kayıtlardan özetle. Kayıtlı playbook hangi adımdan devam edecek ve o adımda hangi kaynak kullanılacak? Bu okumada hiçbir kaydı ilerletme veya değiştirme.' },
    { id: '04-complete', prompt: 'impl-accept-interview görevini bitirdim; completed olarak kaydet. Ardından gecikmiş görevleri göster. Mevcut görev notlarını ve playbook checkpoint bilgisini koru.' },
  ];
  let spent = prior;
  const runs = [];
  for (const step of steps) {
    assert.ok(spent + callCap + reserve <= cap, 'Aggregate budget reserve reached');
    const before = readState(workspace, 'default');
    const prompt = intro + (opts.host === 'codex' ? '$foreman kullan. ' : 'Foreman kullan. ') + step.prompt;
    fs.writeFileSync(path.join(output, step.id + '.prompt.txt'), prompt);
    let cli;
    if (opts.host === 'claude') {
      cli = ['--print', '--no-session-persistence', '--output-format', 'stream-json', '--verbose', '--setting-sources', 'project,local', '--settings', settings, '--strict-mcp-config', '--mcp-config', '{"mcpServers":{}}', '--no-chrome', '--tools', 'Read,Glob,Grep,Bash', '--allowedTools', 'Read,Glob,Grep,Bash(node:*)', '--permission-mode', 'dontAsk', '--max-budget-usd', String(callCap), prompt];
    } else {
      cli = ['exec', '--ignore-user-config', '--ephemeral', '--skip-git-repo-check', '--sandbox', 'workspace-write', '--model', 'gpt-5.4-mini', '--json', '-C', workspace,
        '-c', 'approval_policy="never"', '-c', 'web_search="disabled"', '-c', 'sandbox_workspace_write.network_access=false', '-c', 'model_reasoning_effort="low"',
        '-c', 'features.rollout_budget.enabled=true', '-c', `features.rollout_budget.limit_tokens=${Math.floor(callCap / 0.0000045)}`, '-c', 'features.rollout_budget.prefill_token_weight=0.1666666667', '-c', 'features.rollout_budget.sampling_token_weight=1',
        ...['apps', 'hooks', 'remote_plugin', 'multi_agent', 'browser_use', 'computer_use', 'image_generation', 'shell_snapshot'].flatMap(f => ['--disable', f]), prompt];
    }
    console.log(JSON.stringify({ start: step.id, host: opts.host, spentUsd: spent }));
    const result = spawnSync(opts.host, cli, { cwd: workspace, encoding: 'utf8', timeout: 240000, maxBuffer: 32 * 1024 * 1024 });
    fs.writeFileSync(path.join(output, step.id + '.jsonl'), (result.stdout || '') + (result.stderr || ''));
    const events = (result.stdout || '').split('\n').flatMap(line => { try { return [JSON.parse(line)]; } catch { return []; } });
    const final = events.findLast(e => e.type === (opts.host === 'claude' ? 'result' : 'turn.completed'));
    const usage = final?.usage;
    const cost = opts.host === 'claude' ? final?.total_cost_usd : usage ? ((usage.input_tokens - (usage.cached_input_tokens || 0)) * 0.75 + (usage.cached_input_tokens || 0) * 0.075 + usage.output_tokens * 4.5) / 1e6 : undefined;
    const answer = opts.host === 'claude' ? final?.result || '' : events.filter(e => e.type === 'item.completed' && e.item?.type === 'agent_message').map(e => e.item.text).join('\n');
    const row = { id: step.id, host: opts.host, model: opts.host === 'codex' ? 'gpt-5.4-mini' : 'host default', exit: result.status, costUsd: cost ?? null, costBasis: opts.host === 'codex' ? 'API-equivalent estimate (ChatGPT subscription)' : 'Claude CLI reported valuation', usage: usage || final?.modelUsage, answer, checks: 'pending' };
    if (Number.isFinite(cost)) spent += cost;
    runs.push(row);
    const save = () => fs.writeFileSync(path.join(output, 'runs.json'), JSON.stringify({ priorCostUsd: prior, totalCostUsd: spent, capUsd: cap, runs }, null, 2));
    save();
    fs.writeFileSync(path.join(output, step.id + '.response.md'), answer);
    assert.ok(final && Number.isFinite(cost) && result.status === 0 && !result.error && answer.trim(), 'Incomplete live response or uncertain cost');
    if (opts.host === 'claude') assert.equal(final.subtype, 'success', 'Claude response did not complete');
    const state = readState(workspace, 'default'), item = state.implementation_items.find(x => x.id === 'impl-accept-interview');
    assert.equal(state.identity.mode, 'solo'); assert.equal(state.identity.language, 'tr'); assert.equal(state.company.sector, 'saas');
    assert.ok(item); assert.equal(item.deadline, '2020-01-01');
    if (step.id === '01-create') assert.equal(item.status, 'not-started');
    if (step.id !== '01-create') {
      assert.equal(state.active.playbook.id, 'pivot-playbook'); assert.equal(state.active.playbook.next_step, 2);
      assert.ok(JSON.stringify(item.notes).includes('Randevular bekleniyor'));
      assert.equal(item.status, step.id === '04-complete' ? 'completed' : 'blocked');
    }
    if (step.id === '03-fresh-recall') {
      assert.deepEqual(state, before, 'Recall must not mutate state');
      assert.match(answer, /Randevular|randevu/); assert.match(answer, /SWOT|swot-pest/);
    }
    if (step.id === '04-complete') { assert.equal(item.progress, 100); assert.equal(track(state, 'overdue').length, 0); assert.ok(item.state_history.length >= 2); }
    assert.equal(fs.readFileSync(path.join(workspace, '.foreman/other-founder/state.json'), 'utf8'), canary);
    row.checks = 'passed'; save();
    console.log(JSON.stringify({ finished: step.id, costUsd: cost, totalCostUsd: spent, checks: row.checks }));
  }
} catch (e) { console.error(e.message); process.exitCode = 1; }
