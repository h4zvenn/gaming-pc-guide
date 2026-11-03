# Contributing Guidelines

Thanks for improving this guide. This repository prioritizes safe, testable, and rollback-friendly Windows 11 gaming optimizations.

## Community and Support

Join our [Discord community](https://discord.gg/U7uGQzK48F) for general discussion, gaming PC questions, and troubleshooting help.

Use [GitHub Issues](https://github.com/h4zvenn/gaming-pc-optimization-guide/issues) for documentation errors, project bugs, and actionable improvement requests. Please follow our [Code of Conduct](CODE_OF_CONDUCT.md).

## Contribution principles

- English only: all content and documentation must be in English.
- Tone: balanced technical precision with gamer-friendly language.
- Keep it focused: one clear change or topic per pull request.
- Format: prefer short actionable steps, checklists, tables, and code blocks.
- Test before recommending: a tweak should be measurable, safe, and reversible.

## Quality criteria

A contribution should meet these requirements:

| Requirement | Description |
| --- | --- |
| Measurable | Supported by FPS, 1% lows, frame times, or a clear behavior change |
| Safe | Free of risky blanket tweaks or destructive scripts |
| Reversible | Includes rollback steps or restore-point instructions |
| Compatible | Does not break anti-cheat, Windows Update, networking, audio, or drivers |
| Documented | Uses official sources where available and explains the reason for the change |

## What is not accepted

- “Magic FPS” claims without benchmark evidence.
- Scripts or tweaks that blindly disable system security or services.
- Recommendations to disable Defender, Firewall, UAC, Windows Update, or VBS by default.
- Copy-paste registry packs, unknown executables, or unverified `.bat`, `.cmd`, `.ps1`, or `.reg` files.
- Any new automation must state its permissions and effects, avoid changing system settings by default, and provide a clear confirmation and rollback path for changes.
- Claims such as “+500 FPS” or “universal best settings.”

## Documentation style

### Page structure

- Do not add a manual `# Title` at the top of a documentation page; Jekyll renders the title from front matter.
- Start with a short explanation of the page’s purpose.
- Use `##` for main sections and `###` for subsections.
- Do not number headings unless sequence is essential.
- End each page with a single `Next step` link where appropriate.

### Writing

- Write clear, practical English.
- Use short sentences and active voice.
- Recommend one change at a time.
- Explain how to test the result.
- Include a rollback path for risky changes.
- Use tables for settings, comparisons, and decision rules.
- Use `-` for unordered lists.

### Code blocks

Always specify a language:

```powershell
Get-Service
```

```text
Settings → System → Display → Advanced display
```

Put blank lines before and after headings, lists, tables, and fenced code blocks.

## Links

Use relative `.html` links between documentation pages:

```markdown
See [Benchmark Templates](16-benchmark-templates.html).
```

Use anchors only when the target heading exists:

```markdown
See [Network](09-powershell-diagnostics.html#network).
```

For external sources, link directly to the official page:

```markdown
[Microsoft Learn](https://learn.microsoft.com/)
```

Do not use absolute links to pages inside this repository.

## Images

Images are optional. Add one only when it explains something that text cannot show clearly, such as a BIOS setting or a hardware airflow diagram.

Place files in:

```text
images/
```

Use lowercase kebab-case names:

```text
bios-xmp-expo.webp
bios-resizable-bar.webp
nvidia-app-reflex.webp
```

Requirements:

- Prefer WebP for screenshots and SVG for diagrams.
- Keep screenshots around 1200–1600 px wide.
- Compress images before committing.
- Prefer files under 500 KB.
- Do not include personal data, usernames, serial numbers, tokens, IPs, or email addresses.
- Do not commit unused images.

Usage example:

```markdown

```

## Local checks

Install dependencies once:

```bash
bundle install
npm install
```

Build the site:

```bash
bundle exec jekyll build
```

Run Markdown lint:

```bash
npx markdownlint-cli2 "docs/**/*.md"
```

Run the link checker:

```bash
powershell -ExecutionPolicy Bypass -File .\check-links.ps1
```

## Releases

Releases are published automatically when a valid version tag is pushed. This immediately creates a public GitHub Release; anyone with permission to push a matching tag can trigger publication, and the workflow currently has no manual approval gate.

1. Move the completed `Unreleased` notes in `CHANGELOG.md` to a heading matching the release tag, such as `## v1.3.0 - YYYY-MM-DD`.
2. Commit the changelog update and all release changes.
3. Create and push the matching tag:

   ```powershell
   git tag v1.3.0
   git push origin v1.3.0
   ```

The release workflow validates the version-tag format, requires one matching changelog heading, and uses only that section as the GitHub Release notes. It attaches only the contents of the `tools/` folder as `GamingPCGuide-Diagnostics-<tag>.zip` with a `.sha256` checksum. The release job uses the `release` GitHub Environment. To require human approval, add required reviewers to that environment in repository Settings before pushing version tags.

Before committing, remove generated output:

```bash
Remove-Item -Recurse -Force .jekyll-cache, _site -ErrorAction SilentlyContinue
```

## Reporting issues

- Use the unified issue template: `.github/ISSUE_TEMPLATE/general_issue.md`.
- Include Windows version, hardware, driver version, game, and exact steps to reproduce.
- Include benchmark results when reporting a performance issue.
- Never post passwords, tokens, API keys, serial numbers, or personal data.

## Pull request checklist

- [ ] The change is focused and necessary.
- [ ] Documentation builds successfully.
- [ ] Markdown lint passes or does not add new issues.
- [ ] Internal links resolve correctly.
- [ ] Commands are safe and explained.
- [ ] Risky changes include warnings and rollback steps.
- [ ] Claims are supported by evidence or clearly marked as needing verification.
- [ ] No personal data or secrets are included.
