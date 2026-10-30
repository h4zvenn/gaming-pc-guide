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
| Low FPS | [Find bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck/) → [GPU settings]({{ site.baseurl }}/docs/06-gpu-settings/) |
| Stutter / bad frametime | [Find bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck/) → [Temperatures]({{ site.baseurl }}/docs/10-temperatures-stability/) |
| Input lag | [GPU settings]({{ site.baseurl }}/docs/06-gpu-settings/) → [Diagnostics]({{ site.baseurl }}/docs/09-powershell-diagnostics/) |
| Network lag / ping | [Diagnostics / network]({{ site.baseurl }}/docs/09-powershell-diagnostics/#9-network) |
| Crash / freeze | [Troubleshooting trees]({{ site.baseurl }}/docs/15-troubleshooting-decision-trees/) |

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

- [Preparation]({{ '/docs/01-before-you-start/' | relative_url }}) · [Find bottleneck]({{ '/docs/02-find-the-bottleneck/' | relative_url }}) · [BIOS / Hardware]({{ '/docs/03-bios-and-hardware/' | relative_url }})
- [Drivers]({{ '/docs/04-drivers-and-updates/' | relative_url }}) · [Windows 11]({{ '/docs/05-windows-11/' | relative_url }}) · [GPU settings]({{ '/docs/06-gpu-settings/' | relative_url }})
- [Background apps]({{ '/docs/07-background-apps/' | relative_url }}) · [Services / Security]({{ '/docs/08-services-and-security/' | relative_url }}) · [Diagnostics]({{ '/docs/09-powershell-diagnostics/' | relative_url }})
- [Temperatures]({{ '/docs/10-temperatures-stability/' | relative_url }}) · [What not to do]({{ '/docs/11-what-not-to-do/' | relative_url }}) · [FAQ]({{ '/docs/12-faq/' | relative_url }})
- [Security baseline]({{ '/docs/13-security-hardening-baseline/' | relative_url }}) · [Presets]({{ '/docs/14-quick-start-presets/' | relative_url }}) · [Troubleshooting]({{ '/docs/15-troubleshooting-decision-trees/' | relative_url }})
- [Benchmark templates]({{ '/docs/16-benchmark-templates/' | relative_url }}) · [Build cards]({{ '/docs/17-common-builds-quick-cards/' | relative_url }}) · [Tools evidence]({{ '/docs/18-optimization-tools-evidence/' | relative_url }})

## Principles

- Find the bottleneck before changing anything.
- One setting at a time; benchmark after each change.
- No universal BIOS presets, no mass service disables, no registry scripts.
- If it breaks, rollback to baseline.

---

[GitHub repository](https://github.com/h4zvenn/gaming-pc-guide) · [Issues](https://github.com/h4zvenn/gaming-pc-guide/issues) · [Discussions](https://github.com/h4zvenn/gaming-pc-guide/discussions) · [CONTRIBUTING](CONTRIBUTING.md) · [CHANGELOG](CHANGELOG.md) · [LICENSE](LICENSE)
