# Windows 11 Gaming PC — Optimization Guide

> Build a stable, low-lag gaming setup. No fake FPS buttons. One change → benchmark → keep or rollback.

[![Repo](https://img.shields.io/badge/Repo-gaming--pc--guide-1e1e2e?style=for-the-badge&logo=github&logoColor=white)](https://github.com/h4zvenn/gaming-pc-guide)
[![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D4?style=for-the-badge&logo=windows)](docs/05-windows-11.md)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![CI](https://img.shields.io/badge/CI-markdownlint%2Blychee-green?style=for-the-badge)](.github/workflows/docs-quality.yml)

---

## Quick access

[▶ Start (Prep → Bottleneck → BIOS → Drivers → Windows → GPU → Background → Security → Diagnostics → Stability)](docs/01-before-you-start.md)
[▶ Find bottleneck](docs/02-find-the-bottleneck.md) · [▶ BIOS / Hardware](docs/03-bios-and-hardware.md) · [▶ Drivers](docs/04-drivers-and-updates.md) · [▶ Windows 11](docs/05-windows-11.md)
[▶ GPU settings (profiles, Reflex, cap, VRR)](docs/06-gpu-settings.md) · [▶ Background apps](docs/07-background-apps.md) · [▶ Services / Security](docs/08-services-and-security.md)
[▶ PowerShell diagnostics](docs/09-powershell-diagnostics.md) · [▶ Temps / Stability](docs/10-temperatures-stability.md)
[▶ What not to do](docs/11-what-not-to-do.md) · [▶ FAQ](docs/12-faq.md) · [▶ Security baseline](docs/13-security-hardening-baseline.md)
[▶ Presets by tier](docs/14-quick-start-presets.md) · [▶ Troubleshooting trees](docs/15-troubleshooting-decision-trees.md)
[▶ Benchmark templates](docs/16-benchmark-templates.md) · [▶ Build cards](docs/17-common-builds-quick-cards.md) · [▶ Tools evidence](docs/18-optimization-tools-evidence.md)

---

## Game guides (delays only — common base first)

| Game | Status | Focus | Checked |
|---|---|---|---|
| [Counter-Strike 2](docs/games/cs2.md) | ✅ Pilot | VAC / Source 2 / Reflex / FPS cap | 2026-10-30 |
| [VALORANT](docs/games/valorant.md) | 📋 Planned | Vanguard / kernel anti-cheat | — |
| [PUBG](docs/games/pubg.md) | 📋 Planned | BattlEye / frametime / large maps | — |
| [Minecraft Java](docs/games/minecraft-java.md) | 📋 Planned | Mods / shaders / Java runtime / GC | — |
| [World of Tanks](docs/games/world-of-tanks.md) | 📋 Planned | Client / network | — |

[Template for new games](docs/games/_template.md) · [All guides](docs/games/)

---

## Symptom → Start

| Symptom | Start with |
|---|---|
| Low FPS | [Find bottleneck](docs/02-find-the-bottleneck.md) → [GPU settings](docs/06-gpu-settings.md) |
| Stutter / bad frametime | [Bottleneck](docs/02-find-the-bottleneck.md) → [Temperatures](docs/10-temperatures-stability.md) |
| Input lag | [GPU sync / Reflex](docs/06-gpu-settings.md) → [Diagnostics](docs/09-powershell-diagnostics.md#network) |
| Network lag / ping | [Diagnostics / network](docs/09-powershell-diagnostics.md#network) |
| Crash / freeze | [Troubleshooting trees](docs/15-troubleshooting-decision-trees.md) |

---

## Principles

- Find the bottleneck before changing anything.
- One setting at a time. Benchmark after each change.
- No universal BIOS presets, no mass service disables, no registry scripts.
- If it breaks, rollback to baseline (Restore point + config backups).
- Evidence tagged per recommendation: `verified` / `needs-verification` / `deprecated` + date.

---

## Structure (flattened, EN for now, RU planned)

`docs/01–18.md` — common base (prep → BIOS → drivers → Windows → GPU → background → security → diagnostics → stability → tests → troubleshooting → benchmarks → cards → evidence).
`docs/games/*.md` — only deltas; link to base.
`docs/ARCHITECTURE-REPORT.md` — tree, matrix, pilot plan, readiness criteria.

---

## Community

- [Issues / PR](https://github.com/h4zvenn/gaming-pc-guide/issues) · [Discussions](https://github.com/h4zvenn/gaming-pc-guide/discussions)
- [CONTRIBUTING.md](CONTRIBUTING.md) · [CHANGELOG.md](CHANGELOG.md) · [LICENSE](LICENSE)
