# Changelog

All notable changes to this project are documented in this file.

## Unreleased

## v1.3.0 - 2026-11-01

### Added

- Read-only Windows diagnostics menu with hardware, process, service, network, security, and event checks.
- Selectable diagnostic report sections, a check-result summary, and an explicitly confirmed local export.
- GitHub Actions workflow that creates a GitHub Release from a matching version-tagged changelog entry.
- Russian translations for the BIOS and hardware, drivers and updates, Windows 11, and security baseline guides.
- Universal PC gaming optimization workflow and Windows 10 legacy guidance in English and Russian.

### Changed

- Consolidated repeated read-only PowerShell examples into the diagnostics guide and linked to its menu from related English and Russian pages.
- Improved README quick-start and linked the diagnostics menu and GitHub Releases.
- Documented that version tags publish releases immediately and require matching changelog notes.
- Repositioned the site as the Ultimate PC Gaming Optimization Guide 2026, with hardware-agnostic guidance and explicit Windows 10 legacy status.

## v1.2.0 - 2026-11-01

### Added

- Contribution guidelines with documentation style, Markdown rules, link conventions, local checks, and pull-request checklist.
- MIT License.
- Security policy with vulnerability reporting, in-scope topics, and safe contribution expectations.
- Completed changelog history for earlier project versions.

### Changed

- Cleaned up core documentation pages:
  - `docs/01-before-you-start.md`
  - `docs/03-bios-and-hardware.md`
  - `docs/04-drivers-and-updates.md`
  - `docs/05-windows-11.md`
  - `docs/06-gpu-settings.md`
  - `docs/07-background-apps.md`
  - `docs/08-services-and-security.md`
  - `docs/09-powershell-diagnostics.md`
  - `docs/10-temperatures-stability.md`
  - `docs/11-what-not-to-do.md`
  - `docs/12-faq.md`
  - `docs/13-security-hardening-baseline.md`
  - `docs/14-quick-start-presets.md`
  - `docs/15-troubleshooting-decision-trees.md`
  - `docs/16-benchmark-templates.md`
  - `docs/17-common-builds-quick-cards.md`
  - `docs/18-optimization-tools-evidence.md`
  - `docs/19-ai-software-and-disk-cleanup.md`
- Removed duplicated top-level headings rendered by Jekyll front matter.
- Removed numbered headings and redundant explanations.
- Standardized quote blocks, lists, tables, and code-block formatting.
- Replaced absolute internal links with relative `.html` links.
- Added explicit `Next step` navigation between guide pages.
- Standardized guide titles across the home page, sidebar, and guide front matter.
- Improved FAQ navigation by linking it to the Security Hardening Baseline.
- Simplified Quick-Start Presets navigation to point to Troubleshooting Decision Trees.
- Updated Benchmark Templates navigation to point to Common Builds Quick Cards.
- Updated Common Builds navigation to point to Optimization Tools Evidence.
- Updated Optimization Tools navigation to point to Disk Cleanup.
- Made Disk Cleanup safer by removing automatic process termination and bulk folder deletion.
- Changed AI-tool removal guidance to use official uninstallers and explicit manual cleanup.
- Separated cache-cleaning commands into safer, clearly scoped examples.
- Improved CONTRIBUTING.md with safer contribution rules and repository checks.

### Fixed

- Fixed broken internal anchor references to the PowerShell diagnostics network section.
- Added a stable `#network` anchor to `docs/09-powershell-diagnostics.md`.
- Fixed malformed quotation marks and corrupted characters in documentation.
- Fixed broken blockquote formatting across multiple guides.
- Fixed incorrect or inconsistent internal links.
- Corrected table formatting in benchmark templates.
- Removed unsafe blanket deletion commands from the disk-cleanup workflow.
- Removed registry-deletion automation from the Background Apps guide.
- Clarified optional service changes and rollback guidance in Services & Security.

### Security

- Added `SECURITY.md` with reporting guidance for unsafe recommendations and supply-chain risks.
- Strengthened guidance against disabling Defender, Firewall, UAC, Windows Update, and virtualization-based security.
- Removed destructive automation patterns that could delete user data or required development tools.

---

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

---

## v0.9.0 - 2026-10-29

### Added

- Initial English documentation structure for Windows 11 gaming optimization.
- Core guides covering preparation, bottleneck analysis, BIOS and hardware, drivers, Windows 11, GPU settings, background apps, services, PowerShell diagnostics, temperatures, and stability.
- PowerShell-based diagnostic commands for hardware, startup, processes, services, network, and event logs.
- Safety guidance against mass service disabling, unknown scripts, RAM cleaners, and random registry edits.

### Changed

- Standardized documentation structure and navigation.
- Improved readability of optimization recommendations.
- Added practical checklists and rollback guidance.

---

## v0.8.0 - 2026-10-28

### Added

- Initial Jekyll documentation site.
- Base layout and navigation for guide pages.
- Initial README with project overview and optimization principles.

### Changed

- Organized optimization content into standalone documentation pages.
- Separated general Windows optimization from game-specific guidance.

---

## v0.1.0 - 2026-10-27

### Added

- Initial repository setup.
- Initial optimization notes and draft documentation.
- Basic project configuration.
