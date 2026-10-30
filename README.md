# Windows 11 Gaming PC Optimization Guide

Evidence-based guide for optimizing Windows 11 gaming performance. Find your bottleneck, apply one change at a time, benchmark results, keep what works.

**No** custom Windows builds • **No** mass service disabling • **No** "FPS boost" scripts

[![Read Online](https://img.shields.io/badge/🌐_Read_Online-h4zvenn.github.io-0078D4?style=flat-square)](https://h4zvenn.github.io/gaming-pc-guide/) ![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D4?style=flat-square&logo=windows) [![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE) [![CI](https://img.shields.io/badge/CI-passing-green?style=flat-square)](.github/workflows/docs-quality.yml)

---

## 🚀 Quick Start

### 3-Step Optimization Process

1. **Baseline** — Create restore point, record FPS/frametime/temps → [Preparation Guide](docs/01-before-you-start.md)
2. **Diagnose** — Identify your actual bottleneck (CPU/GPU/RAM/thermal) → [Find Bottleneck](docs/02-find-the-bottleneck.md)
3. **Optimize** — Change one setting, benchmark, keep or rollback → [Benchmark Templates](docs/16-benchmark-templates.md)

### 🎯 Fast Problem Solver

| Issue | Recommended Solution Path |
|:---|:---|
| **Low FPS / Stutter** | [Bottleneck](docs/02-find-the-bottleneck.md) → [GPU Settings](docs/06-gpu-settings.md) → [Thermals](docs/10-temperatures-stability.md) |
| **Input Lag / Delay** | [GPU Settings](docs/06-gpu-settings.md) → [Diagnostics](docs/09-powershell-diagnostics.md) |
| **High Ping / Network Spikes** | [Network Diagnostics](docs/09-powershell-diagnostics.md#9-network) |
| **Crashes & Freezes** | [Troubleshooting Decision Trees](docs/15-troubleshooting-decision-trees.md) |

---

## 🎮 Game-Specific Guides

| Game | Status | Key Topics Covered |
|:---|:---:|:---|
| [Counter-Strike 2](docs/games/cs2.md) | ✅ **Live** | VAC safety, Source 2 tweaks, NVIDIA Reflex, launch options |
| [Minecraft Java](docs/games/minecraft-java.md) | 🟡 Draft | JVM flags, performance mods, chunk render optimization |
| [VALORANT](docs/games/valorant.md) | 🟡 Draft | Vanguard compatibility, Reflex, competitive settings |
| [PUBG](docs/games/pubg.md) | 🟡 Draft | BattlEye, DX11/DX12 comparison, texture streaming |
| [World of Tanks](docs/games/world-of-tanks.md) | 🟡 Draft | Mod Hub safety, SD vs HD client optimization |

---

## 📚 Complete Documentation Index

<details>
<summary>📂 <b>Click to view all 18 Guides & Documentation Sections</b></summary>

<br>

### 🔍 Core Diagnostics

* [01 — Preparation](docs/01-before-you-start.md) — Restore point setup, baseline metrics, refresh rate verification
* [02 — Find Bottleneck](docs/02-find-the-bottleneck.md) — Step-by-step CPU, GPU, RAM, VRAM, and thermal limit detection
* [09 — Diagnostics](docs/09-powershell-diagnostics.md) — Safe PowerShell commands for hardware, network, and WHEA errors
* [10 — Thermals & Stability](docs/10-temperatures-stability.md) — Thermal throttling detection, airflow, stress testing
* [15 — Troubleshooting](docs/15-troubleshooting-decision-trees.md) — Decision trees for system instability and crashes

### ⚙️ System Optimization

* [03 — BIOS & Hardware](docs/03-bios-and-hardware.md) — XMP/EXPO, ReBAR, PBO, and PCIe configurations
* [04 — Drivers & Updates](docs/04-drivers-and-updates.md) — Chipset drivers, GPU clean installation (DDU)
* [05 — Windows 11 Core](docs/05-windows-11.md) — Game Mode, Power Plans, HAGS, and overlay management
* [06 — GPU Settings](docs/06-gpu-settings.md) — NVIDIA/AMD/Intel control panels, Reflex, V-Sync, DLSS/FSR
* [07 — Background Apps](docs/07-background-apps.md) — Taming browsers, sync apps, and background processes
* [08 — Services & Security](docs/08-services-and-security.md) — Safe service practices, Defender & Firewall tuning
* [11 — What NOT to Do](docs/11-what-not-to-do.md) — Debunking debloat scripts, RAM cleaners, and registry hacks
* [12 — FAQ](docs/12-faq.md) — Frequently asked questions and common myths

### 📊 Validation, Templates & Tools

* [13 — Security Baseline](docs/13-security-hardening-baseline.md) — Safe default baseline for system protection
* [14 — Quick Presets](docs/14-quick-start-presets.md) — Ready-to-use optimization presets for different PC tiers
* [16 — Benchmark Templates](docs/16-benchmark-templates.md) — Repeatable testing methodology and metric logs
* [17 — Build Cards](docs/17-common-builds-quick-cards.md) — Optimal starting configurations for NVIDIA/AMD/Intel builds
* [18 — Tools Evidence](docs/18-optimization-tools-evidence.md) — Objective analysis of popular third-party optimizers

</details>

---

## ⚖️ Core Principles

> 🎯 **Find bottleneck first** — Random tweaks waste time  
> 🎯 **One change at a time** — Know exactly what helped or hurt  
> 🎯 **Benchmark every change** — Feelings lie, metrics don't  
> 🎯 **Keep rollback path** — Always create a restore point before changes  
> 
> 🚫 **No blind service disabling** — Avoid breaking Windows Update or networking  
> 🚫 **No universal BIOS presets** — Custom hardware needs custom approaches  
> 🚫 **No registry scripts** — Avoid risky and unmaintainable tweaks  

---

## 🤝 Project Info & Resources

* **Contributing:** Want to add benchmarks or guides? Please review [CONTRIBUTING.md](CONTRIBUTING.md) first.
* **Changelog:** See [CHANGELOG.md](CHANGELOG.md) for version history and updates.
* **License:** Distributed under the [MIT License](LICENSE).

---

`Last Updated: 2026-10-30` • `Target: Windows 11 (22H2+)` • [Report Issue](https://github.com/h4zvenn/gaming-pc-guide/issues) • [Discussions](https://github.com/h4zvenn/gaming-pc-guide/discussions)