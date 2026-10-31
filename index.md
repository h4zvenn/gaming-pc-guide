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
    <p><a href="{{ '/docs/01-before-you-start.html' | relative_url }}">Preparation →</a></p>
  </div>
  <div class="step">
    <h3>2. Find bottleneck</h3>
    <p>Identify whether CPU, GPU, RAM, VRAM, SSD, thermals, or background apps limit performance.</p>
    <p><a href="{{ '/docs/02-find-the-bottleneck.html' | relative_url }}">Find the bottleneck →</a></p>
  </div>
  <div class="step">
    <h3>3. Change &amp; verify</h3>
    <p>Apply one targeted tweak, then compare metrics with a repeatable benchmark.</p>
    <p><a href="{{ '/docs/16-benchmark-templates.html' | relative_url }}">Benchmark templates →</a></p>
  </div>
</div>

## Choose by problem

| Symptom | Start with |
| --- | --- |
| Low FPS | [Find bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck.html) → [GPU settings]({{ site.baseurl }}/docs/02-find-the-bottleneck.html) |
| Stutter / bad frametime | [Find bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck.html) → [Temperatures]({{ site.baseurl }}/docs/02-find-the-bottleneck.html) |
| Input lag | [GPU settings]({{ site.baseurl }}/docs/06-gpu-settings.html) → [Diagnostics]({{ site.baseurl }}/docs/06-gpu-settings.html) |
| Network lag / ping | [Diagnostics / network]({{ site.baseurl }}/docs/09-powershell-diagnostics.html#9-network) |
| Crash / freeze | [Troubleshooting trees]({{ site.baseurl }}/docs/15-troubleshooting-decision-trees.html) |

- Need to remove unused AI tools or free disk space → [AI Software and Disk Cleanup]({{ '/docs/19-ai-software-and-disk-cleanup.html' | relative_url }})

## Available game guides

<div class="card-grid">
  <div class="card">
    <h4><a href="{{ '/docs/games/cs2.html' | relative_url }}">Counter-Strike 2</a></h4>
    <p>Pilot page — VAC, Source 2, Reflex, FPS cap, launch options.</p>
  </div>
</div>

Planned: VALORANT, PUBG, Minecraft Java, World of Tanks.

## Full guide

See the documentation sidebar or browse all sections:

- [Preparation]({{ '/docs/01-before-you-start.html' | relative_url }}) · [Find bottleneck]({{ '/docs/01-before-you-start.html' | relative_url }}) · [BIOS / Hardware]({{ '/docs/01-before-you-start.html' | relative_url }})
- [Drivers]({{ '/docs/04-drivers-and-updates.html' | relative_url }}) · [Windows 11]({{ '/docs/04-drivers-and-updates.html' | relative_url }}) · [GPU settings]({{ '/docs/04-drivers-and-updates.html' | relative_url }})
- [Background apps]({{ '/docs/07-background-apps.html' | relative_url }}) · [Services / Security]({{ '/docs/07-background-apps.html' | relative_url }}) · [Diagnostics]({{ '/docs/07-background-apps.html' | relative_url }})
- [Temperatures]({{ '/docs/10-temperatures-stability.html' | relative_url }}) · [What not to do]({{ '/docs/10-temperatures-stability.html' | relative_url }}) · [FAQ]({{ '/docs/10-temperatures-stability.html' | relative_url }})
- [Security baseline]({{ '/docs/13-security-hardening-baseline.html' | relative_url }}) · [Presets]({{ '/docs/13-security-hardening-baseline.html' | relative_url }}) · [Troubleshooting]({{ '/docs/13-security-hardening-baseline.html' | relative_url }})
- [Benchmark templates]({{ '/docs/16-benchmark-templates.html' | relative_url }}) · [Build cards]({{ '/docs/16-benchmark-templates.html' | relative_url }}) · [Tools evidence]({{ '/docs/16-benchmark-templates.html' | relative_url }})
- [AI Software and Disk Cleanup]({{ '/docs/19-ai-software-and-disk-cleanup.html' | relative_url }})

## Principles

- Find the bottleneck before changing anything.
- One setting at a time; benchmark after each change.
- No universal BIOS presets, no mass service disables, no registry scripts.
- If it breaks, rollback to baseline.

---

[GitHub repository](https://github.com/h4zvenn/gaming-pc-guide) ·
[Issues](https://github.com/h4zvenn/gaming-pc-guide/issues) ·
[Discussions](https://github.com/h4zvenn/gaming-pc-guide/discussions) ·
[CONTRIBUTING](CONTRIBUTING.md) ·
[CHANGELOG](CHANGELOG.md) ·
[LICENSE](LICENSE)
