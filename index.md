---
layout: default
title: Home
---

<div class="hero">
  <h1>Windows 11 Gaming PC Optimization Guide</h1>
  <p>Practical guide for tuning a regular Windows 11 gaming PC or laptop: find the real bottleneck, change one setting at a time, benchmark, keep or rollback. No custom Windows builds, no mass service disabling, no "FPS boost" scripts.</p>
</div>

## Start here

<div class="steps">
  <div class="step">
    <h3>1. Prepare</h3>
    <p>Create a restore point, record baseline FPS, 1% low, frametime, and temperatures.</p>
    <p><a href="{{ '/docs/01-before-you-start/' | relative_url }}">Preparation →</a></p>
  </div>
  <div class="step">
    <h3>2. Find bottleneck</h3>
    <p>Identify whether CPU, GPU, RAM, VRAM, SSD, thermals, or background apps limit performance.</p>
    <p><a href="{{ '/docs/02-find-the-bottleneck/' | relative_url }}">Find the bottleneck →</a></p>
  </div>
  <div class="step">
    <h3>3. Change &amp; verify</h3>
    <p>Apply one targeted tweak, then compare metrics with a repeatable benchmark.</p>
    <p><a href="{{ '/docs/16-benchmark-templates/' | relative_url }}">Benchmark templates →</a></p>
  </div>
</div>

## Choose by problem

| Symptom | Start with |
|---|---|
| Low FPS | [Find bottleneck](docs/02-find-the-bottleneck.md) → [GPU settings](docs/06-gpu-settings.md) |
| Stutter / bad frametime | [Find bottleneck](docs/02-find-the-bottleneck.md) → [Temperatures](docs/10-temperatures-stability.md) |
| Input lag | [GPU settings](docs/06-gpu-settings.md) → [Diagnostics](docs/09-powershell-diagnostics.md) |
| Network lag / ping | [Diagnostics / network](docs/09-powershell-diagnostics.md#9-network) |
| Crash / freeze | [Troubleshooting trees](docs/15-troubleshooting-decision-trees.md) |

## Available game guides

<div class="card-grid">
  <div class="card">
    <h4><a href="{{ '/docs/games/cs2/' | relative_url }}">Counter-Strike 2</a></h4>
    <p>Pilot page — VAC, Source 2, Reflex, FPS cap, launch options.</p>
  </div>
</div>

Planned: VALORANT, PUBG, Minecraft Java, World of Tanks.

## Full guide

See the documentation sidebar or browse all sections:

- [Preparation](docs/01-before-you-start.md) · [Find bottleneck](docs/02-find-the-bottleneck.md) · [BIOS / Hardware](docs/03-bios-and-hardware.md)
- [Drivers](docs/04-drivers-and-updates.md) · [Windows 11](docs/05-windows-11.md) · [GPU settings](docs/06-gpu-settings.md)
- [Background apps](docs/07-background-apps.md) · [Services / Security](docs/08-services-and-security.md) · [Diagnostics](docs/09-powershell-diagnostics.md)
- [Temperatures](docs/10-temperatures-stability.md) · [What not to do](docs/11-what-not-to-do.md) · [FAQ](docs/12-faq.md)
- [Security baseline](docs/13-security-hardening-baseline.md) · [Presets](docs/14-quick-start-presets.md) · [Troubleshooting](docs/15-troubleshooting-decision-trees.md)
- [Benchmark templates](docs/16-benchmark-templates.md) · [Build cards](docs/17-common-builds-quick-cards.md) · [Tools evidence](docs/18-optimization-tools-evidence.md)

## Principles

- Find the bottleneck before changing anything.
- One setting at a time; benchmark after each change.
- No universal BIOS presets, no mass service disables, no registry scripts.
- If it breaks, rollback to baseline.

---

[GitHub repository](https://github.com/h4zvenn/gaming-pc-guide) · [Issues](https://github.com/h4zvenn/gaming-pc-guide/issues) · [Discussions](https://github.com/h4zvenn/gaming-pc-guide/discussions) · [CONTRIBUTING](CONTRIBUTING.md) · [CHANGELOG](CHANGELOG.md) · [LICENSE](LICENSE)
