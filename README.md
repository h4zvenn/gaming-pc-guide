# Windows 11 Gaming PC Optimization Guide

Practical guide for tuning a regular Windows 11 gaming PC or laptop: find the real bottleneck, change one setting at a time, benchmark, keep or rollback. No custom Windows builds, no mass service disabling, no "FPS boost" scripts.

[![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D4?style=flat-square&logo=windows)](docs/05-windows-11.md)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)
[![CI](https://img.shields.io/badge/CI-markdownlint%2Blychee-green?style=flat-square)](.github/workflows/docs-quality.yml)

## Start here

1. **Prepare and save your baseline.** Create a restore point, record FPS, 1% low, frametime, and temperatures. → [Preparation](docs/01-before-you-start.md)
2. **Find the bottleneck.** Identify whether CPU, GPU, RAM, VRAM, SSD, thermals, or background apps limit performance. → [Find the bottleneck](docs/02-find-the-bottleneck.md)
3. **Change one setting and verify.** Apply a single targeted tweak, then compare metrics. → [Benchmark templates](docs/16-benchmark-templates.md)

## Symptom → where to go

| Symptom | Start with |
|---|---|
| Low FPS | [Find bottleneck](docs/02-find-the-bottleneck.md) → [GPU settings](docs/06-gpu-settings.md) |
| Stutter / bad frametime | [Find bottleneck](docs/02-find-the-bottleneck.md) → [Temperatures](docs/10-temperatures-stability.md) |
| Input lag | [GPU settings](docs/06-gpu-settings.md) → [Diagnostics](docs/09-powershell-diagnostics.md) |
| Network lag / ping | [Diagnostics / network](docs/09-powershell-diagnostics.md#9-network) |
| Crash / freeze | [Troubleshooting trees](docs/15-troubleshooting-decision-trees.md) |

## Game guides

Available:

- [Counter-Strike 2](docs/games/cs2.md) — pilot page (VAC, Source 2, Reflex, FPS cap)

Planned (not yet available):

- VALORANT
- PUBG
- Minecraft Java
- World of Tanks

[Game page template](docs/games/_template.md)

## Principles

- Find the bottleneck before changing anything.
- One setting at a time; benchmark after each change.
- No universal BIOS presets, no mass service disables, no registry scripts.
- If it breaks, rollback to baseline.

## Full guide

### Preparation and diagnostics

- [01 Preparation](docs/01-before-you-start.md) — restore point, refresh rate, SSD space, baseline
- [02 Find the bottleneck](docs/02-find-the-bottleneck.md) — CPU, GPU, RAM, VRAM, SSD, thermal limits
- [09 PowerShell diagnostics](docs/09-powershell-diagnostics.md) — safe commands for CPU, GPU, RAM, disks, network, WHEA
- [10 Temperatures and stability](docs/10-temperatures-stability.md) — throttling, airflow, stress tests
- [15 Troubleshooting decision trees](docs/15-troubleshooting-decision-trees.md) — fast "if this → do that" flows

### System and hardware settings

- [03 BIOS and hardware](docs/03-bios-and-hardware.md) — XMP/EXPO, ReBAR, PBO, PCIe
- [04 Drivers and updates](docs/04-drivers-and-updates.md) — chipset, GPU, Windows Update, clean install
- [05 Windows 11 tuning](docs/05-windows-11.md) — Game Mode, power plan, HAGS, refresh rate, overlays
- [06 GPU settings](docs/06-gpu-settings.md) — NVIDIA, AMD, Intel, Reflex, Anti-Lag, FPS cap, V-Sync, VRR, DLSS/FSR/XeSS
- [07 Background apps](docs/07-background-apps.md) — browser, downloads, cloud sync, overlays, OBS
- [08 Services and security](docs/08-services-and-security.md) — what not to disable, Defender, Firewall, Update
- [11 What not to do](docs/11-what-not-to-do.md) — debloat builds, RAM cleaners, BCD/HPET, registry tweaks
- [12 FAQ](docs/12-faq.md) — quick answers

### Validation and troubleshooting

- [16 Benchmark templates](docs/16-benchmark-templates.md) — repeatable templates to track tweaks and prove gains

<details>
<summary>Additional resources</summary>

- [13 Security hardening baseline](docs/13-security-hardening-baseline.md) — secure defaults, Defender/Firewall/Update checks
- [14 Quick-start presets](docs/14-quick-start-presets.md) — ready optimization paths by hardware tier
- [17 Common builds quick cards](docs/17-common-builds-quick-cards.md) — NVIDIA/AMD/Intel starting presets
- [18 Optimization tools evidence](docs/18-optimization-tools-evidence.md) — BoosterX, Hone, BRUTAL-FPS, Razer Cortex: claims vs docs/code/tests
- [Architecture report](docs/ARCHITECTURE-REPORT.md) — tree, matrix, pilot plan, readiness criteria

</details>

## Community

- [Issues](https://github.com/h4zvenn/gaming-pc-guide/issues) · [Discussions](https://github.com/h4zvenn/gaming-pc-guide/discussions)
- [CONTRIBUTING.md](CONTRIBUTING.md) · [CHANGELOG.md](CHANGELOG.md) · [LICENSE](LICENSE)
