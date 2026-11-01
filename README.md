<div align="center">

# 🎮 Gaming PC Guide

**A practical, evidence-based guide to optimizing Windows 11 for gaming.**

Find the real bottleneck. Change one setting. Measure the result.

[![Jekyll](https://img.shields.io/badge/Jekyll-4.x-CC0000?logo=jekyll&logoColor=white)](https://jekyllrb.com/)
[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live-181717?logo=github&logoColor=white)](https://h4zvenn.github.io/gaming-pc-guide/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/h4zvenn/gaming-pc-guide/pulls)

[**Read the guide**](https://h4zvenn.github.io/gaming-pc-guide/) ·
[**Game guides**](https://h4zvenn.github.io/gaming-pc-guide/docs/games/) ·
[**Report an issue**](https://github.com/h4zvenn/gaming-pc-guide/issues)

</div>

---

## ✨ What is this?

Most “FPS optimization” advice is random: disable services, edit the registry, install a debloat script, hope for the best.

This project takes a different approach:

- Find the actual bottleneck.
- Change one setting at a time.
- Benchmark before and after.
- Keep changes that help.
- Roll back changes that do not.

No “FPS boost” scripts. No mass service disabling. No universal BIOS presets.

## 🚀 Quick start

1. [Create a restore point](https://h4zvenn.github.io/gaming-pc-guide/docs/01-before-you-start.html)
2. [Find your bottleneck](https://h4zvenn.github.io/gaming-pc-guide/docs/02-find-the-bottleneck.html)
3. [Choose one relevant setting](https://h4zvenn.github.io/gaming-pc-guide/docs/)
4. [Benchmark the result](https://h4zvenn.github.io/gaming-pc-guide/docs/16-benchmark-templates.html)

> **Rule:** if you cannot measure it, you cannot confidently say it helped.

## 🧭 What’s inside

| Area | What you get |
| --- | --- |
| 🩺 **Diagnostics** | CPU, GPU, RAM, storage, temperatures, background load |
| ⚙️ **Windows 11** | Practical system settings without risky tweaks |
| 🎨 **GPU settings** | NVIDIA, AMD, VRR, latency and graphics options |
| 🧪 **Benchmarking** | Repeatable FPS, frame-time and stability testing |
| 🎮 **Game guides** | CS2, VALORANT, PUBG, Minecraft Java, World of Tanks |
| 🛡️ **Safety** | Rollback paths, security basics and what not to do |

## 🎮 Game guides

<div align="center">

[![Counter-Strike 2](https://img.shields.io/badge/Counter--Strike%202-Guide-orange?logo=steam&logoColor=white)](https://h4zvenn.github.io/gaming-pc-guide/docs/games/cs2.html)
[![VALORANT](https://img.shields.io/badge/VALORANT-Guide-red)](https://h4zvenn.github.io/gaming-pc-guide/docs/games/valorant.html)
[![PUBG](https://img.shields.io/badge/PUBG-Guide-blue?logo=steam&logoColor=white)](https://h4zvenn.github.io/gaming-pc-guide/docs/games/pubg.html)
[![Minecraft Java](https://img.shields.io/badge/Minecraft%20Java-Guide-brightgreen?logo=minecraft&logoColor=white)](https://h4zvenn.github.io/gaming-pc-guide/docs/games/minecraft-java.html)
[![World of Tanks](https://img.shields.io/badge/World%20of%20Tanks-Guide-yellow)](https://h4zvenn.github.io/gaming-pc-guide/docs/games/world-of-tanks.html)

</div>

---

## 📚 Core guides

### Preparation and diagnostics

- [01 · Before You Start](https://h4zvenn.github.io/gaming-pc-guide/docs/01-before-you-start.html)
- [02 · Find the Bottleneck](https://h4zvenn.github.io/gaming-pc-guide/docs/02-find-the-bottleneck.html)
- [09 · PowerShell Diagnostics](https://h4zvenn.github.io/gaming-pc-guide/docs/09-powershell-diagnostics.html)
- [10 · Temperatures & Stability](https://h4zvenn.github.io/gaming-pc-guide/docs/10-temperatures-stability.html)
- [15 · Troubleshooting Trees](https://h4zvenn.github.io/gaming-pc-guide/docs/15-troubleshooting-decision-trees.html)

### Windows, hardware and graphics

- [03 · BIOS & Hardware](https://h4zvenn.github.io/gaming-pc-guide/docs/03-bios-and-hardware.html)
- [04 · Drivers & Updates](https://h4zvenn.github.io/gaming-pc-guide/docs/04-drivers-and-updates.html)
- [05 · Windows 11 Core](https://h4zvenn.github.io/gaming-pc-guide/docs/05-windows-11.html)
- [06 · GPU Settings](https://h4zvenn.github.io/gaming-pc-guide/docs/06-gpu-settings.html)
- [07 · Background Apps](https://h4zvenn.github.io/gaming-pc-guide/docs/07-background-apps.html)
- [08 · Services & Security](https://h4zvenn.github.io/gaming-pc-guide/docs/08-services-and-security.html)

### Reference and starting points

- [11 · What Not To Do](https://h4zvenn.github.io/gaming-pc-guide/docs/11-what-not-to-do.html)
- [12 · FAQ](https://h4zvenn.github.io/gaming-pc-guide/docs/12-faq.html)
- [13 · Security Hardening](https://h4zvenn.github.io/gaming-pc-guide/docs/13-security-hardening-baseline.html)
- [14 · Quick-Start Presets](https://h4zvenn.github.io/gaming-pc-guide/docs/14-quick-start-presets.html)

### Testing, tools and cleanup

- [16 · Benchmark Templates](https://h4zvenn.github.io/gaming-pc-guide/docs/16-benchmark-templates.html)
- [17 · Common Builds](https://h4zvenn.github.io/gaming-pc-guide/docs/17-common-builds-quick-cards.html)
- [18 · Optimization Tools](https://h4zvenn.github.io/gaming-pc-guide/docs/18-optimization-tools-evidence.html)
- [19 · Disk Cleanup](https://h4zvenn.github.io/gaming-pc-guide/docs/19-ai-software-and-disk-cleanup.html)

---

## 🌍 Languages

| Language | Status |
| --- | --- |
| 🇬🇧 English | Source version |
| 🇷🇺 Russian | Partial translation in progress |

[Read in Russian →](https://h4zvenn.github.io/gaming-pc-guide/ru/)

## 🛠️ Local development

### Requirements

- Ruby
- Bundler
- Jekyll

### Run locally

```powershell
bundle install
bundle exec jekyll serve
```

Open:

```text
http://localhost:4000/gaming-pc-guide/
```

### Lint Markdown

```powershell
npx markdownlint-cli2
```

## 🤝 Contributing

Contributions are welcome. Read [CONTRIBUTING.md](CONTRIBUTING.md) for the project’s contribution guidelines.

- Fix typos or unclear explanations.
- Add benchmarks or evidence.
- Improve game-specific guides.
- Report outdated settings or broken links.

Please do not submit:

- Cheats or injectors.
- Unverified “FPS boost” scripts.
- Mass service-disabling presets.
- Registry tweaks without a clear explanation and rollback path.

## 📄 License

Released under the [MIT License](LICENSE).

---

<div align="center">

**Find the bottleneck. Change one setting. Measure the result.**

</div>
