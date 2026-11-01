# Windows 11 Gaming PC Optimization Guide

**Find the bottleneck. Change one setting. Measure the result.**

A practical, data-driven guide to improving gaming performance on Windows 11 — without custom Windows builds, random “FPS boost” scripts, or blindly disabling system services.

[![Read Online](https://img.shields.io/badge/Read_Online-h4zvenn.github.io-3b82f6?style=for-the-badge&logo=github)](https://h4zvenn.github.io/gaming-pc-guide/)
[![GitHub stars](https://img.shields.io/github/stars/h4zvenn/gaming-pc-guide?style=for-the-badge&color=3b82f6)](https://github.com/h4zvenn/gaming-pc-guide/stargazers)
[![License](https://img.shields.io/badge/License-MIT-22c55e?style=for-the-badge)](LICENSE)
[![Русская версия](https://img.shields.io/badge/Русская_версия-In_Progress-f59e0b?style=for-the-badge)](https://h4zvenn.github.io/gaming-pc-guide/ru/)

---

> **Golden rule:** Measure before and after every change. If a setting does not improve frame times or stability, revert it.

## Quick start

1. **Prepare** — create a restore point and record baseline FPS, 1% lows, frame times, and temperatures.  
   → [Before You Start](docs/01-before-you-start.md)

2. **Diagnose** — find whether CPU, GPU, RAM, storage, or thermals are limiting performance.  
   → [Find the Bottleneck](docs/02-find-the-bottleneck.md)

3. **Test one change** — apply a single tweak, benchmark it, then keep or revert it.  
   → [Benchmark Templates](docs/16-benchmark-templates.md)

---

## Choose your problem

| Problem | Start here |
| --- | --- |
| Low FPS or micro-stutters | [Find the Bottleneck](docs/02-find-the-bottleneck.md) |
| Input lag or sluggish controls | [GPU Settings](docs/06-gpu-settings.md) |
| Thermal throttling or loud fans | [Temperatures & Stability](docs/10-temperatures-stability.md) |
| Crashes, BSODs, or game freezes | [Troubleshooting Trees](docs/15-troubleshooting-decision-trees.md) |
| Network spikes and high latency | [PowerShell Diagnostics](docs/09-powershell-diagnostics.md) |
| High disk usage or unused software | [Disk Cleanup](docs/19-ai-software-and-disk-cleanup.md) |

---

## Game guides

Game-specific guides build on the core optimization baseline.

| Game | Status | Focus |
| --- | :---: | --- |
| [Counter-Strike 2](docs/games/cs2.md) | Ready | Source 2 settings, Reflex, FPS cap, VAC safety |
| [Minecraft: Java Edition](docs/games/minecraft-java.md) | Ready | Java settings, mods, chunk rendering |
| [VALORANT](docs/games/valorant.md) | Ready | Vanguard compatibility, Reflex, latency |
| [PUBG: BATTLEGROUNDS](docs/games/pubg.md) | Ready | BattlEye compatibility, DX11 and DX12 |
| [World of Tanks](docs/games/world-of-tanks.md) | Ready | Mod Hub safety, graphics settings |

See all game guides in the [Game Guides index](docs/games/index.html).

---

## Full guide directory

<details>
<summary><b>Core system optimization</b></summary>

- [01. Before You Start](docs/01-before-you-start.md)
- [02. Find the Bottleneck](docs/02-find-the-bottleneck.md)
- [03. BIOS & Hardware](docs/03-bios-and-hardware.md)
- [04. Drivers & Clean Updates](docs/04-drivers-and-updates.md)
- [05. Windows 11 Core](docs/05-windows-11.md)
- [06. GPU Control Panel Settings](docs/06-gpu-settings.md)
- [07. Background Apps](docs/07-background-apps.md)
- [08. Services & Windows Security](docs/08-services-and-security.md)
- [09. PowerShell Diagnostics](docs/09-powershell-diagnostics.md)
- [10. Temperatures & Stability Testing](docs/10-temperatures-stability.md)

</details>

<details>
<summary><b>Safety and troubleshooting</b></summary>

- [11. Dangerous Tweaks: What Not To Do](docs/11-what-not-to-do.md)
- [12. Frequently Asked Questions](docs/12-faq.md)
- [13. Security Hardening Baseline](docs/13-security-hardening-baseline.md)
- [14. Quick-Start Presets](docs/14-quick-start-presets.md)
- [15. Troubleshooting Decision Trees](docs/15-troubleshooting-decision-trees.md)

</details>

<details>
<summary><b>Testing, cleanup, and verification</b></summary>

- [16. Benchmark Templates](docs/16-benchmark-templates.md)
- [17. Common Builds Quick Cards](docs/17-common-builds-quick-cards.md)
- [18. Optimization Tools Evidence](docs/18-optimization-tools-evidence.md)
- [19. Disk Cleanup](docs/19-ai-software-and-disk-cleanup.md)

</details>

---

## Safety rules

- Create a restore point before system-level changes.
- Change one setting at a time.
- Benchmark before and after.
- Do not blindly disable Windows services.
- Do not run `.bat`, `.cmd`, `.ps1`, `.reg`, or `.exe` files from untrusted sources.
- Do not disable Windows Security for marginal FPS gains.

**If you cannot measure it, you cannot know whether it helped.**

---

## Project

- **Website:** [h4zvenn.github.io/gaming-pc-guide](https://h4zvenn.github.io/gaming-pc-guide/)
- **Russian version:** [/ru](https://h4zvenn.github.io/gaming-pc-guide/ru/)
- **Report an issue:** [GitHub Issues](https://github.com/h4zvenn/gaming-pc-guide/issues)
- **Community:** [GitHub Discussions](https://github.com/h4zvenn/gaming-pc-guide/discussions)
- **Contributing:** [CONTRIBUTING.md](CONTRIBUTING.md)
- **Security policy:** [SECURITY.md](SECURITY.md)
- **Changelog:** [CHANGELOG.md](CHANGELOG.md)
- **License:** [MIT](LICENSE)

---

<sub>Made for players who want stable, measurable improvements — not placebo tweaks.</sub>
