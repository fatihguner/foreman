# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 1.0.x   | Yes       |

Only the latest release receives security updates.

## Reporting a Vulnerability

**Do not open a public issue for security vulnerabilities.**

Report security concerns privately by emailing **fatihguner** via GitHub's private contact methods, or by using GitHub's [private vulnerability reporting](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability) feature on this repository.

Include the following in your report:

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix, if you have one

## What Constitutes a Security Issue

Foreman is a content project (Markdown and YAML files consumed by an AI agent), not a running application. Security concerns differ from typical software projects. Relevant threats include:

- **Malicious content injection**: Skill files, diagnostics, playbooks, or templates containing prompt injection attacks, hidden instructions, or adversarial content designed to manipulate AI agent behavior
- **Compromised scripts**: Modifications to any file in `scripts/` that introduce destructive commands, data exfiltration, or unauthorized system access
- **Supply chain risks in CI workflows**: Tampered GitHub Actions workflows, poisoned dependencies, or compromised third-party actions in `.github/workflows/`
- **Sensitive data exposure**: Accidental inclusion of API keys, credentials, or private information in any committed file

## Response Timeline

- **Acknowledgment**: Within 48 hours of receiving the report
- **Initial assessment**: Within 5 business days
- **Resolution or mitigation**: Dependent on severity, targeting 14 days for critical issues

## Responsible Disclosure

We request that reporters:

1. Allow reasonable time for investigation and remediation before public disclosure
2. Make a good-faith effort to avoid privacy violations, data destruction, and disruption of service
3. Do not access or modify other contributors' data beyond what is necessary to demonstrate the vulnerability

We commit to:

1. Acknowledging receipt of your report promptly
2. Providing regular updates on our progress
3. Crediting the reporter in the security advisory (unless anonymity is requested)
