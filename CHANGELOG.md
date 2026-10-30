# Changelog

All notable changes to this project will be documented in this file.

## v1.1.0 - 2026-10-30

### Added

- **Game-Specific Optimization Guides** — new section with dedicated guides for specific games.
  - Full Counter-Strike 2 optimization guide (`docs/games/counter-strike-2/en.md`):
    - Graphics settings impact table with 12 settings analyzed.
    - 3 presets: Competitive, Balanced, Quality.
    - Launch options with Source 2 engine specifics.
    - NVIDIA Reflex configuration and FPS cap recommendations.
    - Console commands with CS:GO vs CS2 differences documented.
    - VAC anticheat compatibility section.
    - Common CS2 problems and solutions (shader compilation, stutters, etc.).
    - Rollback instructions with 4 methods.
  - CS2 configuration files:
    - `autoexec-competitive.cfg` — maximum FPS, minimum input lag (128-tick ready).
    - `autoexec-balanced.cfg` — balanced performance and quality.
  - CS2 benchmark guide (`benchmarks/testing-guide.md`) with 3 testing methods.
- **Anticheat Compatibility Reference** (`docs/common/anticheat-compatibility.md`):
  - Comprehensive guide for VAC, Riot Vanguard, BattlEye, and Easy Anti-Cheat.
  - What is safe, what requires caution, what is forbidden for each anticheat.
  - Specific examples and false ban appeal process.
- **Diagnostic Symptom Index** (`docs/diagnostics/symptom-index.md`):
  - Fast symptom-to-solution lookup covering low FPS, stutter, input lag, network lag, crashes, and overheating.
  - Quick checks and common causes for each symptom.
  - Links to detailed diagnostic pages and tools reference.
- **Game Guides Infrastructure**:
  - Universal game guide template (`docs/games/_template.md`) for consistent structure.
  - Game navigation hub (`docs/games/README.md`) with status tracking.
  - Directory structure for 5 games (CS2, VALORANT, PUBG, Minecraft Java, World of Tanks).
  - Image directories for future screenshots.
- **Architecture Documentation**:
  - `docs/ARCHITECTURE-GAMES.md` — detailed architecture spec and phasing plan.
  - `docs/IMPLEMENTATION-REPORT.md` — complete implementation report with 10 new files and 18 new directories.

### Changed

- **README.md** updated with new "Game-Specific Optimization Guides" section.
  - Table listing CS2 (ready) and planned games (VALORANT, PUBG, Minecraft Java, World of Tanks).
  - "Find by symptom" quick lookup table linking to diagnostic guides.
  - Navigation to full game guides and diagnostic index.

### Project Structure

New directories:
```
docs/common/              — Shared resources (anticheat compatibility)
docs/diagnostics/         — Symptom-based diagnostic guides
docs/games/               — Game-specific optimization guides
  ├── counter-strike-2/   — CS2 guide, configs, benchmarks
  ├── valorant/           — Placeholder for future content
  ├── pubg/               — Placeholder for future content
  ├── minecraft-java/     — Placeholder for future content
  └── world-of-tanks/     — Placeholder for future content
images/games/             — Game-specific images (empty, ready for screenshots)
```

### Notes

- All new content is in English to maintain consistency with existing documentation.
- Game guides link to existing baseline optimization docs (01-18) to avoid duplication.
- CS2 guide is the pilot — validates template and structure before expanding to other games.
- Planned games: VALORANT (Vanguard anticheat), Minecraft Java (mod compatibility), PUBG, World of Tanks.

---

## v1.0.0 - 2026-10-30

### Added

- Full English migration across README and all guide chapters.
- New security baseline guide: `docs/13-security-hardening-baseline.md`.
- New quick-start presets by hardware tier: `docs/14-quick-start-presets.md`.
- New troubleshooting decision trees with fast action tables: `docs/15-troubleshooting-decision-trees.md`.
- New benchmark templates for repeatable before/after validation: `docs/16-benchmark-templates.md`.
- New common builds quick cards for NVIDIA/AMD/Intel: `docs/17-common-builds-quick-cards.md`.
- Lightweight contribution guide: `CONTRIBUTING.md`.
- Unified issue template: `.github/ISSUE_TEMPLATE/general_issue.md`.
- Image usage guidelines: `images/README.md`.
- Repository hygiene file: `.gitignore`.

### Changed

- README rewritten in a balanced tech + gamer style.
- Navigation updated for docs 01-17.
- Added SEO-focused title/subtitle and community block.
- Editorial readability pass with quick tables/cheat sheets in key chapters.
- `docs/09-powershell-diagnostics.md` refreshed and normalized for readability.

### Removed / Simplified

- Replaced multiple issue templates with one unified issue template.
- Removed redundant structure complexity for lighter maintenance.
