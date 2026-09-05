# Releasing Foreman

Release candidates use an explicit SemVer prerelease and npm's `next` channel. Promote to a stable version only after the live advisory rubric in `tests/advisory-scenarios.json` has been reviewed and accepted. Automated tests validate delivery and persistence; they do not certify model answer quality.

## Live acceptance

Live checks are opt-in and never run in CI. Use a new output directory for every run and include all previous model usage in the total budget. The advisory runner defaults to eight fictional scenarios, each in a fresh Claude workspace; `--scenario ID` selects a targeted recheck. The state runner starts four separate host processes against one isolated workspace to verify persisted profile, task history and playbook checkpoints.

```sh
node scripts/live-eval.mjs --help
node scripts/live-state-eval.mjs --help
```

Review the saved responses against `tests/advisory-scenarios.json`; a successful process exit does not establish advisory quality. Incomplete responses and uncertain usage stop the runner. Claude records its reported usage valuation. Codex uses the existing ChatGPT login and records an API-equivalent estimate from token usage, not an invoice charge. Keep raw evaluation logs outside the repository and publish a reviewed summary with the host/model and test scope.

## Prepare a release

1. Update the version in `package.json`, both root plugin manifests, the nested Claude plugin manifest, `openclaw.plugin.json`, and both version fields in `.claude-plugin/marketplace.json`. Update the lockfile root versions. Use `publishConfig.tag: next` for prereleases or `latest` for stable versions.
2. Add release notes and a changelog entry, rebuild, and verify:

```sh
npm ci --ignore-scripts
npm run build
npm run build:plugins
npm run check
npm run check:release
npm pack --ignore-scripts
npm run test:package -- ./foreman-sh-*.tgz
```

3. Commit the generated plugin resources, open a PR and wait for the macOS/Linux Node 22/24 CI matrix. Merge the verified change and create a version tag at that commit.
4. Create the GitHub release, mark candidates as prereleases, and attach the verified tarball plus a SHA-256 checksum. Test installation from the public release URL. Keep release artifacts outside the working tree.

## npm trusted publishing

The manual `.github/workflows/publish-npm.yml` workflow only runs against tags in this repository. It verifies the tag against every package manifest, rebuilds, tests, packs, and installs the artifact before publishing. Candidates use `next`; stable releases use `latest`. It uses GitHub OIDC and does not need a stored npm token.

In the npm package settings for `foreman-sh`, add a GitHub Actions trusted publisher with:

| Field | Value |
|---|---|
| Organization or user | `fatihguner` |
| Repository | `foreman` |
| Workflow filename | `publish-npm.yml` |
| Environment name | Leave empty |
| Allowed action | Enable direct `npm publish` |

Only an authorized npm package maintainer can save this configuration. Follow the [official npm trusted publishing documentation](https://docs.npmjs.com/trusted-publishers/). The workflow uses Node 24 and its bundled npm, OIDC permission, and provenance.

After configuring the publisher and creating the GitHub release, dispatch against the release tag:

```sh
gh workflow run publish-npm.yml --ref v1.1.0-rc.1 --repo fatihguner/foreman
```

Check the completed workflow and `npm view foreman-sh@1.1.0-rc.1 version dist.integrity` before advertising `npx foreman-sh@next init`. A workflow file alone does not mean a package was published. Do not move the stable `latest` tag to a release candidate.
