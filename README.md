# Windows 11 Gaming PC Optimization Guide

Evidence-based guide for optimizing Windows 11 gaming performance. Find your bottleneck, apply one change at a time, benchmark results, and keep only what works.

**No** custom Windows builds • **No** mass service disabling • **No** “FPS boost” scripts

[![Read Online](https://img.shields.io/badge/🌐_Read_Online-h4zvenn.github.io-0078D4?style=flat-square)](https://h4zvenn.github.io/gaming-pc-guide/) ![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D4?style=flat-square&logo=windows) [![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE) [![CI](https://img.shields.io/badge/CI-passing-green?style=flat-square)](.github/workflows/docs-quality.yml) [![RU translation](https://img.shields.io/badge/🇷🇺_RU_translation-in_progress-orange?style=flat-square)](https://h4zvenn.github.io/gaming-pc-guide/ru/)

**Languages:** [English](https://h4zvenn.github.io/gaming-pc-guide/) · [Русский](https://h4zvenn.github.io/gaming-pc-guide/ru/)  
The English version is the source version. The Russian translation is being expanded.

---

## 🚀 Quick Start

### Three-step optimization process

1. **Baseline** — Create a restore point, record FPS, frame times, and temperatures → [Preparation Guide](docs/01-before-you-start.md)
2. **Diagnose** — Identify the actual bottleneck: CPU, GPU, RAM, storage, or thermals → [Find Bottleneck](docs/02-find-the-bottleneck.md)
3. **Optimize** — Change one setting, benchmark it, then keep or roll back → [Benchmark Templates](docs/16-benchmark-templates.md)

### Fast problem solver

| Issue | Recommended path |
| :--- | :--- |
| Low FPS / stutter | [Bottleneck](docs/02-find-the-bottleneck.md) → [GPU settings](docs/06-gpu-settings.md) → [Thermals](docs/10-temperatures-stability.md) |
| Input lag / delay | [GPU settings](docs/06-gpu-settings.md) → [Diagnostics](docs/09-powershell-diagnostics.md) |
| High ping / network spikes | [Network diagnostics](docs/09-powershell-diagnostics.md#9-network) |
| Crashes and freezes | [Troubleshooting decision trees](docs/15-troubleshooting-decision-trees.md) |
| Low disk space / unwanted software | [Disk cleanup](docs/19-ai-software-and-disk-cleanup.md) → [Background apps](docs/07-background-apps.md) |

---

## 🎮 Game-specific guides

| Game | Status | Key topics |
| :--- | :---: | :--- |
| [Counter-Strike 2](docs/games/cs2.md) | ✅ Live | VAC safety, Source 2 tweaks, NVIDIA Reflex, launch options |
| [Minecraft Java](docs/games/minecraft-java.md) | 🟡 Draft | JVM flags, performance mods, chunk render optimization |
| [VALORANT](docs/games/valorant.md) | 🟡 Draft | Vanguard compatibility, Reflex, competitive settings |
| [PUBG](docs/games/pubg.md) | 🟡 Draft | BattlEye, DX11/DX12 comparison, texture streaming |
| [World of Tanks](docs/games/world-of-tanks.md) | 🟡 Draft | Mod Hub safety, SD vs HD client optimization |

---

## 📚 Complete documentation index

<details>
<summary>📂 <b>Click to view all 19 guides and documentation sections</b></summary>

<br>

### 🔍 Preparation and diagnostics

- [01 — Before you start](docs/01-before-you-start.md) — Restore point, baseline metrics, refresh-rate verification
- [02 — Find the bottleneck](docs/02-find-the-bottleneck.md) — CPU, GPU, RAM, VRAM, storage, and thermal limits
- [09 — PowerShell diagnostics](docs/09-powershell-diagnostics.md) — Hardware, network, and WHEA-error checks
- [10 — Temperatures and stability](docs/10-temperatures-stability.md) — Thermal throttling, airflow, and stress testing
- [15 — Troubleshooting decision trees](docs/15-troubleshooting-decision-trees.md) — Structured troubleshooting for instability and crashes

### ⚙️ Windows, hardware, and graphics

- [03 — BIOS and hardware](docs/03-bios-and-hardware.md) — XMP/EXPO, Resizable BAR, PBO, and PCIe configuration
- [04 — Drivers and updates](docs/04-drivers-and-updates.md) — Chipset drivers and clean GPU-driver installation
- [05 — Windows 11 core](docs/05-windows-11.md) — Game Mode, power plans, HAGS, and overlays
- [06 — GPU settings](docs/06-gpu-settings.md) — NVIDIA/AMD/Intel control panels, Reflex, V-Sync, DLSS/FSR
- [07 — Background apps](docs/07-background-apps.md) — Browsers, sync apps, and background processes
- [08 — Services and security](docs/08-services-and-security.md) — Safe service practices, Defender, and firewall tuning

### 📖 Reference and starting points

- [11 — What not to do](docs/11-what-not-to-do.md) — Debloat scripts, RAM cleaners, and registry hacks
- [12 — FAQ](docs/12-faq.md) — Frequent questions and common myths
- [13 — Security hardening baseline](docs/13-security-hardening-baseline.md) — Safe default protection settings
- [14 — Quick-start presets](docs/14-quick-start-presets.md) — Starting configurations for different PC tiers

### 📊 Testing, tools, and cleanup

- [16 — Benchmark templates](docs/16-benchmark-templates.md) — Repeatable testing methodology and metric logs
- [17 — Common builds and quick cards](docs/17-common-builds-quick-cards.md) — Starting points for NVIDIA, AMD, and Intel builds
- [18 — Optimization tools and evidence](docs/18-optimization-tools-evidence.md) — Objective analysis of third-party optimizers
- [19 — AI software and disk cleanup](docs/19-ai-software-and-disk-cleanup.md) — Removing unused software and reclaiming disk space

</details>

---

## ⚖️ Core principles

- **Find the bottleneck first** — random tweaks waste time.
- **Change one setting at a time** — know exactly what helped or hurt.
- **Benchmark every change** — feelings lie; metrics do not.
- **Keep a rollback path** — create a restore point before system changes.
- **Do not blindly disable services** — avoid breaking Windows Update or networking.
- **Do not use universal BIOS presets** — hardware-specific changes need hardware-specific checks.
- **Do not run registry scripts** — avoid risky and unmaintainable tweaks.

---

## 🤝 Project information

- **Contributing:** See [CONTRIBUTING.md](CONTRIBUTING.md).
- **Changelog:** See [CHANGELOG.md](CHANGELOG.md).
- **License:** [MIT License](LICENSE).
- **Issues:** [Report an issue](https://github.com/h4zvenn/gaming-pc-guide/issues).
- **Discussions:** [GitHub Discussions](https://github.com/h4zvenn/gaming-pc-guide/discussions).

---

`Last updated: 2026-10-31` • `Target: Windows 11 22H2+` • `Guides: 19 system sections + game guides`
