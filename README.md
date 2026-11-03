# 🎮 Ultimate PC Gaming Optimization Guide 2026

A universal, evidence-based guide to optimizing gaming PCs across hardware and games.

Find the real bottleneck. Change one setting. Measure the result.

<p align="center">
  <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/ultimate-pc-gaming-guide-2026.html"><img src="https://img.shields.io/badge/📖_Main_guide-2563eb?style=for-the-badge" alt="Main guide"></a>
  <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/games/"><img src="https://img.shields.io/badge/🎯_Game_guides-16a34a?style=for-the-badge" alt="Game guides"></a>
  <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/search/"><img src="https://img.shields.io/badge/🔍_Search-7c3aed?style=for-the-badge" alt="Search"></a>
  <br>
  <a href="https://discord.gg/U7uGQzK48F"><img src="https://img.shields.io/badge/💬_Discord-5865f2?style=for-the-badge" alt="Discord"></a>
  <a href="https://github.com/h4zvenn/gaming-pc-optimization-guide/releases"><img src="https://img.shields.io/badge/📦_Releases-ea580c?style=for-the-badge" alt="Releases"></a>
  <a href="https://github.com/h4zvenn/gaming-pc-optimization-guide/issues"><img src="https://img.shields.io/badge/🐛_Issues-dc2626?style=for-the-badge" alt="Report an issue"></a>
</p>

## ✨ What is this?

Gaming optimization advice ranges from measured fixes to one-size-fits-all tweaks. This project focuses on changes you can test across desktops and gaming laptops, CPU/GPU vendors, and different game workloads.

The method is simple:

1. Find the actual bottleneck.
2. Change one setting at a time.
3. Benchmark before and after.
4. Keep changes that help.
5. Roll back changes that do not.

> **No "FPS boost" scripts. No mass service disabling. No universal BIOS presets.**

Windows 11 is the primary operating system covered. Windows 10 is treated as a legacy platform because Microsoft ended standard support on October 14, 2025. OS-, vendor-, and game-specific advice is clearly labeled instead of being presented as universal.

## 🚀 Quick start

| 01 Prepare | 02 Diagnose | 03 Choose | 04 Verify |
| --- | --- | --- | --- |
| Create a restore point and record your baseline.<br>[Before You Start →](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/01-before-you-start.html) | Find the component or setting causing the problem.<br>[Find the Bottleneck →](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/02-find-the-bottleneck.html) | Pick the guide for the issue you diagnosed.<br>[Quick-Start Presets →](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/14-quick-start-presets.html) | Benchmark the result. Keep or revert the change.<br>[Benchmark Templates →](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/16-benchmark-templates.html) |

> **Rule:** If you cannot measure it, you cannot confidently say it helped.

## 🧭 What's inside

| Area | What you get |
| --- | --- |
| 🩺 **Diagnostics** | CPU, GPU, RAM, storage, temperatures, background load |
| ⚙️ **Windows & hardware** | Windows 11 guidance, Windows 10 legacy notes, BIOS and component settings |
| 🎨 **GPU settings** | NVIDIA, AMD, VRR, latency and graphics options |
| 🧪 **Benchmarking** | Repeatable FPS, frame-time and stability testing |
| 🎮 **Game guides** | CS2, VALORANT, PUBG, Minecraft Java, World of Tanks |
| 🛡️ **Safety** | Rollback paths, security basics and what not to do |
| 🧰 **Tools** | Read-only Windows diagnostics menu (never changes settings) |

## 🎯 Game guides

Available guides:

- Counter-Strike 2
- VALORANT
- PUBG
- Minecraft Java
- World of Tanks

Browse them in the [game guides](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/games/). Want a guide for another game? Open a request or read the [Contributing](#-contributing) section.

## 🛠️ Diagnostics tool

A read-only Windows diagnostics menu is available in the tools folder. It is also attached as a zip with a checksum to each release.

- Never changes any settings.
- Lets you export selected sections to a local report after you review the data notice and confirm.
- Reports are not uploaded anywhere.
- Before sharing a report, check it for device names, network details, usernames, startup commands, and file paths.

To verify the download, run:

```powershell
Get-FileHash .\\gaming-diagnostics.zip -Algorithm SHA256
```

Compare the result with the checksum published in the release notes.

## 📚 Guide library

<details>
<summary>Click to expand guide library</summary>

- Universal workflow
  - [Ultimate PC Gaming Optimization Guide 2026](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/ultimate-pc-gaming-guide-2026.html)
  - [Windows 10 Legacy Notes](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/windows-10-legacy.html)
- Preparation and diagnostics
  - [01 · Before You Start](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/01-before-you-start.html)
  - [02 · Find the Bottleneck](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/02-find-the-bottleneck.html)
  - [09 · PowerShell Diagnostics](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/09-powershell-diagnostics.html)
  - [10 · Temperatures & Stability](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/10-temperatures-stability.html)
  - [15 · Troubleshooting Trees](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/15-troubleshooting-decision-trees.html)
- Windows, hardware and graphics
  - [03 · BIOS & Hardware](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/03-bios-and-hardware.html)
  - [04 · Drivers & Updates](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/04-drivers-and-updates.html)
  - [05 · Windows 11 Gaming Settings](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/05-windows-11.html)
  - [06 · GPU Settings](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/06-gpu-settings.html)
  - [07 · Background Apps](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/07-background-apps.html)
  - [08 · Services & Security](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/08-services-and-security.html)
- Reference and starting points
  - [11 · What Not To Do](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/11-what-not-to-do.html)
  - [12 · FAQ](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/12-faq.html)
  - [13 · Security Hardening](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/13-security-hardening-baseline.html)
  - [14 · Quick-Start Presets](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/14-quick-start-presets.html)
- Testing, tools and cleanup
  - [16 · Benchmark Templates](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/16-benchmark-templates.html)
  - [17 · Common Builds](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/17-common-builds.html)
  - [18 · Optimization Tools](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/18-optimization-tools.html)
  - [19 · Disk Cleanup](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/19-disk-cleanup.html)

</details>

## 📁 Repository structure

```text
gaming-pc-optimization-guide/
├── docs/                 # English guides (Jekyll pages)
│   ├── games/            # Per-game guides
│   └── ...
├── ru/                   # Russian translation
├── tools/                # Read-only diagnostics scripts
├── search/               # Site search page
├── LICENSE
└── README.md
```

## 🌍 Languages

| Language | Status |
| --- | --- |
| 🇬🇧 English | Source version |
| 🇷🇺 Russian | Translation in progress |

## ❓ FAQ

- **Will this void my warranty or break my PC?**
  The guide focuses on reversible changes and always describes a rollback path. Still, create a restore point first (see Before You Start).
- **Do I need to follow every step?**
  No. Diagnose first, then apply only what matches your bottleneck.
- **Is Windows 10 supported?**
  Only as a legacy platform. See Windows 10 Legacy Notes.

## 🤝 Contributing

Contributions are welcome: fixes, new game guides, translations, and benchmark data.

1. Fork the repository.
2. Create a branch: `git checkout -b feature/my-change`
3. Make your changes and include evidence (benchmarks, sources, screenshots).
4. Open a pull request.

Guidelines:

- One claim, one source or one measurement.
- Label vendor-, OS-, and game-specific advice.
- No "magic" tweaks without before/after results.

Found a mistake? Open an issue.

## ⚠️ Disclaimer

This guide is provided as-is. You apply changes at your own risk. Always back up important data and create a restore point before modifying system settings, drivers, or BIOS options.

## 📄 License

Released under the MIT License.

> Find the bottleneck. Change one setting. Measure the result.
