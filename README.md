# 🖥️ Windows 11 Gaming PC Optimization Guide

**Find the bottleneck. Change one setting. Measure the result.**

A practical, data-driven guide to improving gaming performance on Windows 11 — without custom Windows builds, random “FPS boost” scripts, or blindly disabling system services.

[![Read Online](https://img.shields.io/badge/Read_Online-h4zvenn.github.io-3b82f6?style=for-the-badge&logo=github)](https://h4zvenn.github.io/gaming-pc-guide/)
[![GitHub stars](https://img.shields.io/github/stars/h4zvenn/gaming-pc-guide?style=for-the-badge&color=3b82f6)](https://github.com/h4zvenn/gaming-pc-guide/stargazers)
[![License](https://img.shields.io/badge/License-MIT-22c55e?style=for-the-badge)](LICENSE)
[![Русская версия](https://img.shields.io/badge/Русская_версия-In_Progress-f59e0b?style=for-the-badge)](https://h4zvenn.github.io/gaming-pc-guide/ru/)

---

> **Golden Rule of Optimization:** Always measure performance before and after every change. If a setting does not measurably improve frame times or stability, revert it.

---

## 🚀 Quick Start Pipeline

```text
[1. Restore Point] ──► [2. Benchmark Baseline] ──► [3. Find Bottleneck] ──► [4. Test One Setting]
```

1. **Prepare** — create a Windows restore point and record baseline FPS, 1% lows, frame times, and temperatures.  
   → [Before You Start](docs/01-before-you-start.md)

2. **Diagnose** — identify whether CPU, GPU, RAM, storage, or thermal limits are capping performance.  
   → [Find the Bottleneck](docs/02-find-the-bottleneck.md)

3. **Verify** — apply one tweak at a time and measure it with a repeatable benchmark.  
   → [Benchmark Templates](docs/16-benchmark-templates.md)

---

## 🧭 Target Your Issue

| Problem | Recommended starting point |
| --- | --- |
| **Low FPS or micro-stutters** | [Find the Bottleneck](docs/02-find-the-bottleneck.md) |
| **Input lag or sluggish controls** | [GPU Settings & Reflex](docs/06-gpu-settings.md) |
| **Thermal throttling or loud fans** | [Temperatures & Stability](docs/10-temperatures-stability.md) |
| **Crashes, BSODs, or game freezes** | [Troubleshooting Trees](docs/15-troubleshooting-decision-trees.md) |
| **Network spikes and high latency** | [PowerShell Diagnostics](docs/09-powershell-diagnostics.md) |
| **High disk usage or bloatware** | [AI Software & Disk Cleanup](docs/19-ai-software-and-disk-cleanup.md) |

---

## 🎮 Game-Specific Guides

| Game | Status | Optimization focus |
| --- | :---: | --- |
| **[Counter-Strike 2](docs/games/cs2.md)** | ✅ Live | VAC safety, Source 2 settings, Reflex, launch options |
| **[Minecraft Java](docs/games/minecraft-java.md)** | 🟡 Draft | JVM flags, Sodium/Iris mods, chunk render profiling |
| **[VALORANT](docs/games/valorant.md)** | 🟡 Draft | Vanguard compatibility, Reflex, competitive latency |
| **[PUBG: Battlegrounds](docs/games/pubg.md)** | 🟡 Draft | Anti-cheat compatibility, DX11 Enhanced vs DX12 |
| **[World of Tanks](docs/games/world-of-tanks.md)** | 🟡 Draft | Mod Hub safety, SD vs HD client optimization |

---

## 📚 Complete Guide Directory

<details open>
<summary><b>⚙️ Core System Optimization</b></summary>

- [01. Before You Start](docs/01-before-you-start.md)
- [02. Find the Bottleneck](docs/02-find-the-bottleneck.md)
- [03. BIOS & Hardware Baseline](docs/03-bios-and-hardware.md)
- [04. Drivers & Clean Updates](docs/04-drivers-and-updates.md)
- [05. Windows 11 Core](docs/05-windows-11.md)
- [06. GPU Control Panel Settings](docs/06-gpu-settings.md)
- [07. Background Apps & Telemetry](docs/07-background-apps.md)
- [08. Services & Windows Security](docs/08-services-and-security.md)
- [09. PowerShell Diagnostics](docs/09-powershell-diagnostics.md)
- [10. Temperatures & Stability Testing](docs/10-temperatures-stability.md)

</details>

<details>
<summary><b>🛡️ Safety & Troubleshooting</b></summary>

- [11. Dangerous Tweaks: What NOT To Do](docs/11-what-not-to-do.md)
- [12. Frequently Asked Questions](docs/12-faq.md)
- [13. Security Hardening Baseline](docs/13-security-hardening-baseline.md)
- [14. Quick-Start Presets](docs/14-quick-start-presets.md)
- [15. Step-by-Step Decision Trees](docs/15-troubleshooting-decision-trees.md)

</details>

<details>
<summary><b>📊 Testing, Cleanup & Verification</b></summary>

- [16. Benchmark & Log Templates](docs/16-benchmark-templates.md)
- [17. Common Hardware Build Cards](docs/17-common-builds-quick-cards.md)
- [18. Optimization Tools Evidence](docs/18-optimization-tools-evidence.md)
- [19. AI Software & Deep Disk Cleanup](docs/19-ai-software-and-disk-cleanup.md)

</details>

---

## 🛡️ Core Safety Principles

> **Warning:** Never run raw `.bat` or `.ps1` scripts from YouTube descriptions, Discord messages, or untrusted forums.

- **Always create a system restore point** before changing Windows services or the registry.
- **Isolate variables:** change exactly one setting at a time.
- **Trust objective data:** 1% low FPS and frame times matter more than how a game “feels”.
- **Keep security intact:** do not disable Windows Security or anti-malware features for marginal gains.

---

## 🔗 Project Links

- **Live documentation:** [h4zvenn.github.io/gaming-pc-guide](https://h4zvenn.github.io/gaming-pc-guide/)
- **Russian translation:** [h4zvenn.github.io/gaming-pc-guide/ru/](https://h4zvenn.github.io/gaming-pc-guide/ru/)
- **Report an issue:** [GitHub Issues](https://github.com/h4zvenn/gaming-pc-guide/issues)
- **Community discussions:** [GitHub Discussions](https://github.com/h4zvenn/gaming-pc-guide/discussions)
- **Contribution guidelines:** [CONTRIBUTING.md](CONTRIBUTING.md)
- **Changelog:** [CHANGELOG.md](CHANGELOG.md)

---

<sub>`Windows 11 22H2 / 23H2 / 24H2` · `19 core guides + game profiles` · `MIT License`</sub>
