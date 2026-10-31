# Security Policy

## Supported versions

This project is documentation-first. Security-relevant content and guide optimizations are maintained on the `main` branch.

## Reporting a vulnerability

If you identify a security risk, dangerous tweak, or unsafe recommendation in the guide:

1. Do not post exploit details publicly.
2. Open a GitHub issue using the unified template with the `security` label, or contact the maintainer directly.
3. Include the following in your report:
   - Affected file or section path
   - Description of the security or system risk
   - Safer alternative or proposed fix

## In-scope topics

Security reports are critical for:

- Unsafe optimization advice or risky script execution
- Disabling core protections such as Defender, Firewall, UAC, or Windows Update without explicit warnings
- Supply-chain or malware risks in referenced third-party tools
- Commands that can cause data loss, system instability, or security degradation
- Broken or misleading rollback instructions

## Out-of-scope topics

The following are not treated as security vulnerabilities:

- General Windows performance questions
- Feature requests
- Game-specific tuning advice
- Subjective preferences about settings or UI
- Reports without a specific file, section, or unsafe recommendation

## Safe contribution expectations

Contributions must not:

- Recommend disabling Defender, Firewall, UAC, Windows Update, or VBS by default
- Encourage running unknown scripts or executable files
- Include destructive commands without clear warnings and rollback steps
- Promote third-party tools without documenting risks and rollback paths
