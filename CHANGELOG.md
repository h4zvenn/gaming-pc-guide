# Changelog

All notable changes to this project are documented in this file.

## v1.1.0 - 2026-10-30

### Added

- Game-specific optimization guides:
  - Counter-Strike 2 guide with graphics-settings impact table, Competitive/Balanced/Quality presets, launch options, NVIDIA Reflex guidance, FPS-cap recommendations, console commands, VAC compatibility notes, and common problem solutions.
  - Universal game guide template at `docs/games/_template.md`.
  - Game navigation hub at `docs/games/README.md`.
  - Initial pages for VALORANT, PUBG, Minecraft Java, and World of Tanks.
- CS2 configuration examples:
  - `autoexec-competitive.cfg` for maximum FPS and low input latency.
  - `autoexec-balanced.cfg` for a balance of performance and visual quality.
- Anti-cheat and game compatibility guidance across game pages and `docs/08-services-and-security.md`.
- Diagnostic methodology:
  - Symptom-based troubleshooting trees in `docs/15-troubleshooting-decision-trees.md`.
  - PowerShell diagnostics in `docs/09-powershell-diagnostics.md`.
  - Coverage for low FPS, stutter, input lag, network issues, crashes, and overheating.
- Benchmark methodology in `docs/16-benchmark-templates.md`, including repeatable A/B testing and multi-run result templates.
- Architecture and implementation notes for the game-guides section.

### Changed

- Updated `README.md` with a Game-Specific Optimization Guides section.
- Added a symptom-based quick lookup table linking to diagnostic guides.
- Updated navigation for game guides and the diagnostic index.
- Linked game guides to the existing baseline documentation to avoid duplication.

### Project structure

- Added `docs/games/` for game-specific guides.
- Added `docs/games/_template.md` as the canonical template for new game pages.
- Added `docs/games/README.md` for game-guide navigation and status tracking.
- Added `images/` for shared visual assets.

### Notes

- All new content is in English.
- Counter-Strike 2 is the pilot guide and validates the game-page structure.
- Planned game guides include VALORANT, Minecraft Java, PUBG, and World of Tanks.

---

## v1.0.0 - 2026-10-30

### Added

- Full English migration across `README.md` and all guide chapters.
- Security baseline guide: `docs/13-security-hardening-baseline.md`.
- Quick-start presets by hardware tier: `docs/14-quick-start-presets.md`.
- Troubleshooting decision trees: `docs/15-troubleshooting-decision-trees.md`.
- Benchmark templates: `docs/16-benchmark-templates.md`.
- Common-build quick cards for NVIDIA, AMD, and Intel systems: `docs/17-common-builds-quick-cards.md`.
- Contribution guide: `CONTRIBUTING.md`.
- Unified issue template: `.github/ISSUE_TEMPLATE/general_issue.md`.
- Image usage guidelines: `images/README.md`.
- Repository hygiene file: `.gitignore`.

### Changed

- Rewrote `README.md` in a balanced technical and gamer-friendly style.
- Updated navigation for guides 01–17.
- Added SEO-focused title and subtitle.
- Improved readability with quick tables and cheat sheets in key chapters.
- Refreshed and normalized `docs/09-powershell-diagnostics.md`.

### Removed

- Replaced multiple issue templates with one unified issue template.
- Removed redundant structural complexity for easier maintenance.
