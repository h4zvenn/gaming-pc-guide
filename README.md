# Windows 11 Gaming PC Optimization Guide

Evidence-based guide for optimizing Windows 11 gaming performance. Find your bottleneck, apply one change at a time, benchmark results, keep what works.

**No** custom Windows builds • **No** mass service disabling • **No** "FPS boost" scripts

[![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D4?style=flat-square&logo=windows)](docs/05-windows-11.md)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)
[![CI](https://img.shields.io/badge/CI-passing-green?style=flat-square)](.github/workflows/docs-quality.yml)

---

## Quick Start

### 3-Step Process

1. **Baseline** — Create restore point, record FPS/frametime/temps → [Preparation](docs/01-before-you-start.md)
2. **Diagnose** — Identify your actual bottleneck (CPU/GPU/RAM/thermal) → [Find Bottleneck](docs/02-find-the-bottleneck.md)
3. **Optimize** — Change one setting, benchmark, keep or rollback → [Benchmark Templates](docs/16-benchmark-templates.md)

### Fix Common Issues

| Problem | Solution Path |
|---------|---------------|
| **Low FPS** | [Bottleneck](docs/02-find-the-bottleneck.md) → [GPU Settings](docs/06-gpu-settings.md) |
| **Stutter / Bad Frametime** | [Bottleneck](docs/02-find-the-bottleneck.md) → [Thermals](docs/10-temperatures-stability.md) |
| **Input Lag** | [GPU Settings](docs/06-gpu-settings.md) → [Diagnostics](docs/09-powershell-diagnostics.md) |
| **Network Lag / High Ping** | [Network Diagnostics](docs/09-powershell-diagnostics.md#9-network) |
| **Crashes / Freezes** | [Troubleshooting](docs/15-troubleshooting-decision-trees.md) |

---

## Game-Specific Guides

| Game | Status | Notes |
|------|--------|-------|
| [Counter-Strike 2](docs/games/cs2.md) | ✅ Live | VAC, Source 2, Reflex, launch options |
| [Minecraft Java](docs/games/minecraft-java.md) | 🟡 Draft | JVM flags, mods, chunk optimization |
| [VALORANT](docs/games/valorant.md) | 🟡 Draft | Vanguard, Reflex, competitive settings |
| [PUBG](docs/games/pubg.md) | 🟡 Draft | BattlEye, DX11/DX12, texture streaming |
| [World of Tanks](docs/games/world-of-tanks.md) | 🟡 Draft | Mod Hub, SD/HD client |

[Game Guide Template](docs/games/_template.md)

---

## Complete Documentation

### Core Diagnostics

| Guide | What It Covers |
|-------|----------------|
| [01 — Preparation](docs/01-before-you-start.md) | Restore point, baseline metrics, monitor refresh rate |
| [02 — Find Bottleneck](docs/02-find-the-bottleneck.md) | CPU, GPU, RAM, VRAM, SSD, thermal limits |
| [09 — Diagnostics](docs/09-powershell-diagnostics.md) | PowerShell commands for hardware/network/WHEA checks |
| [10 — Thermals](docs/10-temperatures-stability.md) | Throttling detection, airflow, stress testing |
| [15 — Troubleshooting](docs/15-troubleshooting-decision-trees.md) | Fast decision trees for common problems |

### System Optimization

| Guide | What It Covers |
|-------|----------------|
| [03 — BIOS & Hardware](docs/03-bios-and-hardware.md) | XMP/EXPO, ReBAR, PBO, PCIe settings |
| [04 — Drivers](docs/04-drivers-and-updates.md) | Chipset, GPU drivers, clean install process |
| [05 — Windows 11](docs/05-windows-11.md) | Game Mode, power plan, HAGS, overlays |
| [06 — GPU Settings](docs/06-gpu-settings.md) | NVIDIA/AMD/Intel, Reflex, V-Sync, DLSS/FSR/XeSS |
| [07 — Background Apps](docs/07-background-apps.md) | Browser, downloads, cloud sync, overlays |
| [08 — Services & Security](docs/08-services-and-security.md) | What NOT to disable, Defender, Firewall |
| [11 — What NOT to Do](docs/11-what-not-to-do.md) | Debloat scripts, RAM cleaners, registry tweaks |
| [12 — FAQ](docs/12-faq.md) | Common questions answered |

### Validation & Tools

| Guide | What It Covers |
|-------|----------------|
| [16 — Benchmark Templates](docs/16-benchmark-templates.md) | Repeatable testing methodology, metric definitions |
| [13 — Security Baseline](docs/13-security-hardening-baseline.md) | Safe defaults for Defender/Firewall/Updates |
| [14 — Quick Presets](docs/14-quick-start-presets.md) | Ready-to-use optimization paths by hardware tier |
| [17 — Build Cards](docs/17-common-builds-quick-cards.md) | NVIDIA/AMD/Intel starting configurations |
| [18 — Tools Evidence](docs/18-optimization-tools-evidence.md) | Third-party optimizer analysis (claims vs reality) |

---

## Core Principles

✅ **Find bottleneck first** — Random tweaks waste time  
✅ **One change at a time** — Know what actually helped  
✅ **Benchmark every change** — Feelings lie, metrics don't  
✅ **Keep rollback path** — Restore point before major changes  

❌ **No blind service disabling** — Breaks updates/networking/security  
❌ **No universal BIOS presets** — Every system is different  
❌ **No registry scripts** — Unmaintainable and risky  

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

**Quick rules:**

- Evidence-based only (benchmarks required)
- Safe and reversible changes
- No snake oil / "magic FPS" claims
- English language

---

## Project Status

- **Last Updated:** 2026-10-30
- **Windows Version:** Windows 11 (22H2+)
- **License:** MIT
- **Issues:** [Report bugs](https://github.com/h4zvenn/gaming-pc-guide/issues)
- **Discussions:** [Ask questions](https://github.com/h4zvenn/gaming-pc-guide/discussions)

---

## Additional Resources

- [CHANGELOG.md](CHANGELOG.md) — Version history
- [SECURITY.md](SECURITY.md) — Security policy
- [Architecture Report](docs/ARCHITECTURE-REPORT.md) — Project structure and design decisions

---

<sub>Made for gamers who want real performance gains, not placebo tweaks.</sub>
