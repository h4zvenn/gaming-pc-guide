# Copilot Instructions

You are assisting with a static Jekyll documentation site about Windows gaming PC optimization.

## Project structure

- `docs/` contains the main documentation.
- `docs/games/` contains game-specific guides.
- `index.md` is the site landing page.
- `_config.yml` contains Jekyll configuration.
- `.markdownlint-cli2.jsonc` contains Markdown linting rules.

## Documentation style

- Use clear, practical, evidence-based advice.
- Prefer step-by-step instructions.
- Use tables for settings, comparisons, and checklists.
- Use code blocks for commands, paths, and configuration examples.
- Avoid unsupported claims and do not recommend risky system changes.
- Keep security and stability in mind.

## Markdown rules

- Use ATX headings: `#`, `##`, `###`.
- Use dashes for unordered lists.
- Use two spaces for nested list indentation.
- Use at most one consecutive blank line.
- End every file with a single newline.
- Separate tables and lists with blank lines.
- Do not add unnecessary HTML unless needed for Jekyll layout.

## Commands

Run Markdown linting:

```powershell
npx markdownlint-cli2
```

Run link checks:

```powershell
powershell -ExecutionPolicy Bypass -File .\check-links.ps1
```

Build the site:

```powershell
bundle exec jekyll build
```
