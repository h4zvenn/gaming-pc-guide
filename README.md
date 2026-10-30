# Windows 11 Gaming PC Optimization Guide

Evidence-based guide for optimizing Windows 11 gaming performance. Find your bottleneck, apply one change at a time, benchmark results, keep what works.

**No** custom Windows builds вЂў **No** mass service disabling вЂў **No** "FPS boost" scripts

[![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D4?style=flat-square&logo=windows)](docs/05-windows-11.html)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)
[![CI](https://img.shields.io/badge/CI-passing-green?style=flat-square)](.github/workflows/docs-quality.yml)

---

## Quick Start

### 3-Step Process

1. **Baseline** вЂ” Create restore point, record FPS/frametime/temps в†’ [Preparation](docs/01-before-you-start.html)
2. **Diagnose** вЂ” Identify your actual bottleneck (CPU/GPU/RAM/thermal) в†’ [Find Bottleneck](docs/02-find-the-bottleneck.html)
3. **Optimize** вЂ” Change one setting, benchmark, keep or rollback в†’ [Benchmark Templates](docs/16-benchmark-templates.html)

### Fix Common Issues

| Problem | Solution Path |
|---------|---------------|
| **Low FPS** | [Bottleneck](docs/02-find-the-bottleneck.html) в†’ [GPU Settings](docs/06-gpu-settings.html) |
| **Stutter / Bad Frametime** | [Bottleneck](docs/02-find-the-bottleneck.html) в†’ [Thermals](docs/10-temperatures-stability.html) |
| **Input Lag** | [GPU Settings](docs/06-gpu-settings.html) в†’ [Diagnostics](docs/09-powershell-diagnostics.html) |
| **Network Lag / High Ping** | [Network Diagnostics](docs/09-powershell-diagnostics.html#9-network) |
| **Crashes / Freezes** | [Troubleshooting](docs/15-troubleshooting-decision-trees.html) |

---

## Game-Specific Guides

| Game | Status | Notes |
|------|--------|-------|
| [Counter-Strike 2](docs/games/cs2.html) | вњ… Live | VAC, Source 2, Reflex, launch options |
| [Minecraft Java](docs/games/minecraft-java.html) | рџџЎ Draft | JVM flags, mods, chunk optimization |
| [VALORANT](docs/games/valorant.html) | рџџЎ Draft | Vanguard, Reflex, competitive settings |
| [PUBG](docs/games/pubg.html) | рџџЎ Draft | BattlEye, DX11/DX12, texture streaming |
| [World of Tanks](docs/games/world-of-tanks.html) | рџџЎ Draft | Mod Hub, SD/HD client |

[Game Guide Template](docs/games/_template.html)

---

## Complete Documentation

### Core Diagnostics

| Guide | What It Covers |
|-------|----------------|
| [01 вЂ” Preparation](docs/01-before-you-start.html) | Restore point, baseline metrics, monitor refresh rate |
| [02 вЂ” Find Bottleneck](docs/02-find-the-bottleneck.html) | CPU, GPU, RAM, VRAM, SSD, thermal limits |
| [09 вЂ” Diagnostics](docs/09-powershell-diagnostics.html) | PowerShell commands for hardware/network/WHEA checks |
| [10 вЂ” Thermals](docs/10-temperatures-stability.html) | Throttling detection, airflow, stress testing |
| [15 вЂ” Troubleshooting](docs/15-troubleshooting-decision-trees.html) | Fast decision trees for common problems |

### System Optimization

| Guide | What It Covers |
|-------|----------------|
| [03 вЂ” BIOS & Hardware](docs/03-bios-and-hardware.html) | XMP/EXPO, ReBAR, PBO, PCIe settings |
| [04 вЂ” Drivers](docs/04-drivers-and-updates.html) | Chipset, GPU drivers, clean install process |
| [05 вЂ” Windows 11](docs/05-windows-11.html) | Game Mode, power plan, HAGS, overlays |
| [06 вЂ” GPU Settings](docs/06-gpu-settings.html) | NVIDIA/AMD/Intel, Reflex, V-Sync, DLSS/FSR/XeSS |
| [07 вЂ” Background Apps](docs/07-background-apps.html) | Browser, downloads, cloud sync, overlays |
| [08 вЂ” Services & Security](docs/08-services-and-security.html) | What NOT to disable, Defender, Firewall |
| [11 вЂ” What NOT to Do](docs/11-what-not-to-do.html) | Debloat scripts, RAM cleaners, registry tweaks |
| [12 вЂ” FAQ](docs/12-faq.html) | Common questions answered |

### Validation & Tools

| Guide | What It Covers |
|-------|----------------|
| [16 вЂ” Benchmark Templates](docs/16-benchmark-templates.html) | Repeatable testing methodology, metric definitions |
| [13 вЂ” Security Baseline](docs/13-security-hardening-baseline.html) | Safe defaults for Defender/Firewall/Updates |
| [14 вЂ” Quick Presets](docs/14-quick-start-presets.html) | Ready-to-use optimization paths by hardware tier |
| [17 вЂ” Build Cards](docs/17-common-builds-quick-cards.html) | NVIDIA/AMD/Intel starting configurations |
| [18 вЂ” Tools Evidence](docs/18-optimization-tools-evidence.html) | Third-party optimizer analysis (claims vs reality) |

---

## Core Principles

вњ… **Find bottleneck first** вЂ” Random tweaks waste time  
вњ… **One change at a time** вЂ” Know what actually helped  
вњ… **Benchmark every change** вЂ” Feelings lie, metrics don't  
вњ… **Keep rollback path** вЂ” Restore point before major changes  

вќЊ **No blind service disabling** вЂ” Breaks updates/networking/security  
вќЊ **No universal BIOS presets** вЂ” Every system is different  
вќЊ **No registry scripts** вЂ” Unmaintainable and risky  

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.html) for guidelines.

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

- [CHANGELOG.md](CHANGELOG.html) вЂ” Version history
- [SECURITY.md](SECURITY.html) вЂ” Security policy
- [Architecture Report](docs/ARCHITECTURE-REPORT.html) вЂ” Project structure and design decisions

---

<sub>Made for gamers who want real performance gains, not placebo tweaks.</sub>
