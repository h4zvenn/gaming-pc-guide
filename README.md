# ⚙️ Windows 11 Gaming PC Optimization Guide (FPS, Stutter, Input Lag)

> Build a **smooth, stable, low-drama** gaming setup: **BIOS → drivers → Windows → GPU → background apps → diagnostics → stability**.
>
> No fake “+500 FPS” buttons. Just practical changes you can test, keep, or roll back.
>
> **SEO focus:** Windows 11 gaming optimization, low FPS fix, stutter fix, input lag reduction, 1% low improvement, frametime stability.

![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D4?style=flat-square&logo=windows)
![Language](https://img.shields.io/badge/Language-English-4CAF50?style=flat-square)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

---

## 👋 What this guide is

This repository helps you optimize a **regular Windows 11 gaming PC or laptop** without questionable custom Windows builds, mass service disabling, or unknown “FPS boost” scripts.

The guide is not tied to a single game, CPU, or GPU model. Instead, it explains **how to find the real bottleneck** and tune only what your system actually needs.

Use it if you want to:

- increase or stabilize FPS;
- improve 1% low and frametime;
- reduce real background load;
- correctly enable XMP/EXPO and Resizable BAR;
- tune Windows and NVIDIA/AMD/Intel GPU settings;
- verify temperatures, throttling, and system stability;
- use PowerShell for diagnostics instead of risky “auto-optimization”.

> [!TIP]
> Think of this guide as a playbook: detect bottleneck → apply one change → benchmark → keep or rollback.

---

## 🚀 Start here

Do not apply all tweaks at once. Follow this order:

1. **Preparation:** create a restore point and record baseline FPS/temperatures.
2. **Diagnostics:** identify what limits performance — CPU, GPU, RAM, VRAM, SSD, thermals, or background apps.
3. **Baseline:** verify BIOS, XMP/EXPO, ReBAR, drivers, monitor refresh rate, and Windows settings.
4. **Targeted tuning:** change only settings related to the detected issue.
5. **Validation:** compare FPS, 1% low, frametime, temperatures, and stability.

> [!IMPORTANT]
> Change **one setting at a time**. If you apply ten tweaks at once, it is impossible to know what helped and what caused issues.

### 🎮 Quick start by PC tier

| Your setup | Start with | Then do |
|---|---|---|
| Entry-level / older PC | [02 Bottleneck](docs/02-find-the-bottleneck.md) + [07 Background apps](docs/07-background-apps.md) | [06 GPU settings](docs/06-gpu-settings.md) with smart FPS cap |
| Mid-range gaming PC | [03 BIOS](docs/03-bios-and-hardware.md) + [05 Windows](docs/05-windows-11.md) | [10 Temps & stability](docs/10-temperatures-stability.md) |
| High-end PC (high Hz target) | [06 GPU settings](docs/06-gpu-settings.md) + [10 Temps](docs/10-temperatures-stability.md) | [13 Security baseline](docs/13-security-hardening-baseline.md) |
| Laptop gamer | [05 Windows](docs/05-windows-11.md) + [07 Background apps](docs/07-background-apps.md) | [10 Temps](docs/10-temperatures-stability.md) + fan/power profile checks |

---

## 📚 Full guide

| Step | Section | Contents |
|:--:|---|---|
| 01 | [Preparation](docs/01-before-you-start.md) | Restore point, refresh rate, SSD free space, baseline measurements |
| 02 | [Find the bottleneck](docs/02-find-the-bottleneck.md) | How to identify CPU, GPU, RAM, VRAM, SSD, thermal, or stability limits |
| 03 | [BIOS and hardware](docs/03-bios-and-hardware.md) | XMP/EXPO, ReBAR, Above 4G Decoding, PBO, Curve Optimizer, PCIe |
| 04 | [Drivers and updates](docs/04-drivers-and-updates.md) | Chipset, GPU, Windows Update, clean GPU driver install, SSD firmware |
| 05 | [Windows 11 tuning](docs/05-windows-11.md) | Game Mode, power plan, HAGS, refresh rate, overlays, startup apps |
| 06 | [GPU settings](docs/06-gpu-settings.md) | NVIDIA, AMD, Intel, Reflex, Anti-Lag, FPS cap, V-Sync, VRR, DLSS/FSR/XeSS |
| 07 | [Background apps](docs/07-background-apps.md) | Browser, downloads, cloud sync, RGB software, overlays, OBS, startup |
| 08 | [Services and security](docs/08-services-and-security.md) | What not to disable, Defender, Firewall, Update, process analysis |
| 09 | [PowerShell diagnostics](docs/09-powershell-diagnostics.md) | Safe commands for CPU, GPU, RAM, disks, processes, network, and WHEA |
| 10 | [Temperatures and stability](docs/10-temperatures-stability.md) | Throttling, airflow, cleaning, stress tests, XMP/EXPO, OC/undervolt |
| 11 | [What not to do](docs/11-what-not-to-do.md) | Debloat builds, RAM cleaners, BCD/HPET, registry tweaks, risky scripts |
| 12 | [FAQ](docs/12-faq.md) | Quick answers to common questions |
| 13 | [Security hardening baseline](docs/13-security-hardening-baseline.md) | Secure defaults, Defender/Firewall/Update checks, safe exception workflow |
| 14 | [Quick-start presets](docs/14-quick-start-presets.md) | Ready optimization paths by hardware tier and goals |
| 15 | [Troubleshooting decision trees](docs/15-troubleshooting-decision-trees.md) | Fast “if this → do that” flows for FPS, stutter, crashes, and ping |
| 16 | [Benchmark templates](docs/16-benchmark-templates.md) | Repeatable templates to track tweaks and prove real gains |
| 17 | [Common builds quick cards](docs/17-common-builds-quick-cards.md) | NVIDIA/AMD/Intel starting presets with safe defaults |
| 18 | [Optimization tools evidence](docs/18-optimization-tools-evidence.md) | BoosterX, Hone/HoneCtrl, BRUTAL-FPS, Razer Cortex and tweak tools: claims, docs/code, tests, license |

---

## 🎮 Game-Specific Optimization Guides

**After completing the baseline system optimization above, apply game-specific tweaks:**

| Game | Status | Anticheat | Focus | Last checked |
|------|--------|-----------|-------|--------------|
| [Counter-Strike 2](docs/games/cs2.md) | ✅ Pilot | VAC | Max FPS, min input lag, Source 2 specifics | 2026-10-30 |
| [VALORANT](docs/games/valorant.md) | 📋 Planned | Vanguard | Kernel-level anticheat compatibility | — |
| [PUBG](docs/games/pubg.md) | 📋 Planned | BattlEye | Frametime stability, large maps | — |
| [Minecraft Java](docs/games/minecraft-java.md) | 📋 Planned | Varies | Mod compatibility, shaders | — |
| [World of Tanks](docs/games/world-of-tanks.md) | 📋 Planned | Proprietary | Client optimization, network | — |

**Browse all game guides:** [docs/games/](docs/games/)

### 🔍 Find by symptom

Not sure which guide to use? Start with the symptom:

| Symptom | Diagnostic guide |
|---------|------------------|
| Low average FPS | [Bottleneck diagnostics](docs/02-find-the-bottleneck.md) |
| Stutter / frametime spikes | [Bottleneck diagnostics](docs/02-find-the-bottleneck.md) |
| Input delay | [GPU settings / sync](docs/06-gpu-settings.md) + [Diagnostics](docs/09-powershell-diagnostics.md) |
| High ping / rubber-banding | [Network diagnostics](docs/09-powershell-diagnostics.md#network) |
| Crashes / freezes | [Troubleshooting trees](docs/15-troubleshooting-decision-trees.md) |

**Full diagnostic index:** [docs/15-troubleshooting-decision-trees.md](docs/15-troubleshooting-decision-trees.md)

---

## 🤝 Community pack

- Contribution rules: [CONTRIBUTING.md](CONTRIBUTING.md)
- Open issue template: [General issue](.github/ISSUE_TEMPLATE/general_issue.md)
- New issue page: `https://github.com/h4zvenn/gaming-pc-guide/issues/new/choose`

## 🗂️ Project meta

- Changelog: [CHANGELOG.md](CHANGELOG.md)
- License: [MIT](LICENSE)

---

## ✅ Quick checklist

If you want a safe baseline without deep tweaking, start here:

- [ ] Monitor is connected to the **discrete GPU**, not motherboard video output.
- [ ] Windows is set to the highest stable monitor refresh rate.
- [ ] SSD has enough free space.
- [ ] Chipset driver and stable GPU driver are installed from official sources.
- [ ] XMP/EXPO is enabled in BIOS if the system passes stability tests.
- [ ] Above 4G Decoding and Resizable BAR are enabled if supported.
- [ ] Game Mode is enabled.
- [ ] HAGS and “Optimizations for windowed games” were tested and the better option kept.
- [ ] Downloads, browser video, unnecessary overlays, and heavy background apps are closed.
- [ ] Temperatures, clocks, FPS, 1% low, and frametime were checked.
- [ ] No WHEA errors, crashes, BSODs, artifacts, or random reboots.

---

## 🧠 Core principle: find the cause

| Symptom | Start with |
|---|---|
| GPU sits at 95–99%, FPS is too low | [GPU settings](docs/06-gpu-settings.md): resolution, heavy effects, VRAM, upscaler |
| GPU usage is low and FPS does not scale | [Find the bottleneck](docs/02-find-the-bottleneck.md): CPU threads, RAM, background load, thermals |
| Average FPS is fine but stutter exists | Check [RAM/VRAM/SSD/shader issues](docs/02-find-the-bottleneck.md) and [background apps](docs/07-background-apps.md) |
| FPS drops after 20–60 minutes | Check [temperatures and throttling](docs/10-temperatures-stability.md) |
| Games crash or WHEA appears | Revert OC/undervolt to baseline and validate [stability](docs/10-temperatures-stability.md) |
| Unknown process loads CPU/disk/network | Identify process owner, do not disable services blindly: [services and security](docs/08-services-and-security.md) |

---

## 🛡️ What is intentionally not included

This guide **does not include**:

- ready-made `.bat`, `.reg`, or PowerShell “auto-optimization” scripts;
- mass disabling of Windows services;
- advice to disable Defender, Firewall, UAC, or Windows Update;
- questionable Windows Lite/Gaming builds;
- RAM cleaner software;
- mandatory HPET/BCD/timer tweaks;
- promises of identical results on every PC.

These methods often bring little real benefit but can break updates, networking, anti-cheat, Microsoft Store, drivers, or system security.

---

## 🧪 How to test changes

For fair comparison:

1. Use one game or one benchmark.
2. Keep resolution, graphics settings, and test scene identical.
3. Run 2–3 passes, then report the median and the min–max range.
4. Compare not only average FPS, but also 1% low, frametime, temperatures, clocks, and stability.
5. Revert the change if there is no benefit or new issues appear.

For metric definitions and the full run protocol, see [16 Benchmark templates](docs/16-benchmark-templates.md).

Example of a bad outcome:

```text
Average FPS: +3
1% low: -12
GPU temperature: +9°C
Stutters appeared

Conclusion: rollback this tweak.
```

---

## 💻 PowerShell commands

All commands in this guide are placed in `powershell` blocks, so you can quickly copy them on GitHub using the **Copy** button.

Commands are split into two categories:

- **Diagnostics** — read-only commands that display system information.
- **System recovery** — clearly marked commands that may require administrator rights.

Start with [PowerShell diagnostics](docs/09-powershell-diagnostics.md).

---

## 🤝 Feedback

Found outdated information, an error, or want to suggest an improvement?

Open an **Issue** and include:

```text
Windows version:
CPU:
GPU:
RAM:
Motherboard / laptop model:
GPU driver version:
What exactly was changed:
What happened:
Errors / screenshots / logs:
```

> [!NOTE]
> Do not post serial numbers, passwords, tokens, IP addresses, personal files, or full dumps with sensitive data in Issues.

---

## ⚠️ Disclaimer

Use these settings at your own risk. The guide author is not responsible for data loss, instability, system damage, or hardware damage resulting from these instructions.

Before changing BIOS settings, overclocking, undervolt, registry values, or system-level options, create a restore point, save original values, and verify results.

---

## ⭐ Support

If this guide was useful, give the repository a **Star** to help others find safe and practical PC optimization information.
