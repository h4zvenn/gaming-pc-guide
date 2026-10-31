---
layout: default
title: "Home"
description: "A practical guide to optimizing a gaming PC on Windows 11: preparation, bottleneck diagnosis, system settings, and measured testing."
lang: en
translation_key: home
permalink: /
---

<div class="hero">
  <h1>Fewer random tweaks. More measurable results.</h1>
  <p>A practical guide to optimizing a gaming PC on Windows 11: prepare your system, find the actual bottleneck, and verify every change with a repeatable test.</p>
  <p>No custom Windows builds, mass service disabling, or “FPS boost” scripts.</p>
  <p><a href="{{ '/docs/01-before-you-start.html' | relative_url }}">Start with preparation →</a></p>
  <p><a href="#problems">Choose a problem</a> · <a href="#all-guides">Browse all 19 guides</a></p>
</div>

> The English version is the source version.
> The Russian translation is being expanded; links marked **RU** open translated pages.
> Use the EN / RU switch in the site header.

## Three steps instead of dozens of random tweaks

Do not apply every guide in sequence.
Choose the route that matches your problem and measure the result.

<div class="steps">
  <div class="step">
    <h3>1. Prepare the system</h3>
    <p>Check that you can roll back, review display settings, and record your starting performance results.</p>
    <p><a href="{{ '/docs/01-before-you-start.html' | relative_url }}">Preparation →</a></p>
  </div>
  <div class="step">
    <h3>2. Find the limitation</h3>
    <p>Identify what is limiting performance: CPU, GPU, memory, storage, temperatures, or background activity.</p>
    <p><a href="{{ '/docs/02-find-the-bottleneck.html' | relative_url }}">Find the bottleneck →</a></p>
  </div>
  <div class="step">
    <h3>3. Change and verify</h3>
    <p>Apply one change, repeat the same test, and compare results. Keep the change or roll it back.</p>
    <p><a href="{{ '/docs/16-benchmark-templates.html' | relative_url }}">Benchmark templates →</a></p>
  </div>
</div>

<h2 id="problems">What is the problem?</h2>

Choose the closest symptom.
These are diagnostic routes, not guaranteed fixes.

| Problem | Start here | Check next |
| --- | --- | --- |
| Low FPS | [Find the bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck.html) | [GPU settings]({{ site.baseurl }}/docs/06-gpu-settings.html) |
| Stuttering and uneven frame times | [Find the bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck.html) | [Temperatures and stability]({{ site.baseurl }}/docs/10-temperatures-stability.html) |
| Input lag | [GPU settings]({{ site.baseurl }}/docs/06-gpu-settings.html) | [System diagnostics]({{ site.baseurl }}/docs/09-powershell-diagnostics.html) |
| High ping or network instability | [System diagnostics]({{ site.baseurl }}/docs/09-powershell-diagnostics.html) | [Troubleshooting]({{ site.baseurl }}/docs/15-troubleshooting-decision-trees.html) |
| Crashes, freezes, or restarts | [Troubleshooting]({{ site.baseurl }}/docs/15-troubleshooting-decision-trees.html) | [Stability]({{ site.baseurl }}/docs/10-temperatures-stability.html) |
| Low disk space or unwanted software | [Disk cleanup]({{ site.baseurl }}/docs/19-ai-software-and-disk-cleanup.html) | [Background apps]({{ site.baseurl }}/docs/07-background-apps.html) |

## Game guides

Use the system guides for general issues.
Use a game guide for game-specific settings and testing.

<div class="card-grid">
  <div class="card">
    <h3>Counter-Strike 2</h3>
    <p>Graphics settings, latency, FPS caps, configuration, and a repeatable testing scenario.</p>
    <p><a href="{{ '/docs/games/cs2.html' | relative_url }}">Open the CS2 guide →</a></p>
  </div>
  <div class="card">
    <h3>More games</h3>
    <p>Planned: VALORANT, PUBG, Minecraft Java, and World of Tanks.</p>
    <p>Drafts will not be presented as finished guides.</p>
  </div>
</div>

<h2 id="all-guides">All 19 guides</h2>

Guides are grouped by task.
The numbering matches the guide files.

### Preparation and diagnostics

- [01. Before you start]({{ '/docs/01-before-you-start.html' | relative_url }}) — rollback options, baseline measurements, and system checks.
- [02. Find the bottleneck]({{ '/docs/02-find-the-bottleneck.html' | relative_url }}) — identify performance limitations.
- [09. PowerShell diagnostics]({{ '/docs/09-powershell-diagnostics.html' | relative_url }}) — system information and diagnostic checks.
- [10. Temperatures and stability]({{ '/docs/10-temperatures-stability.html' | relative_url }}) — overheating and instability checks.
- [15. Troubleshooting decision trees]({{ '/docs/15-troubleshooting-decision-trees.html' | relative_url }}) — structured troubleshooting for common issues.

### Windows, hardware, and graphics

- [03. BIOS and hardware]({{ '/docs/03-bios-and-hardware.html' | relative_url }}) — hardware configuration and BIOS settings.
- [04. Drivers and updates]({{ '/docs/04-drivers-and-updates.html' | relative_url }}) — driver and update practices.
- [05. Windows 11 settings]({{ '/docs/05-windows-11.html' | relative_url }}) — operating system settings.
- [06. GPU settings]({{ '/docs/06-gpu-settings.html' | relative_url }}) — graphics, synchronization, and latency.
- [07. Background apps]({{ '/docs/07-background-apps.html' | relative_url }}) — check background activity.
- [08. Services and security]({{ '/docs/08-services-and-security.html' | relative_url }}) — system services and limits of safe changes.

### Reference and starting points

- [11. What not to do]({{ '/docs/11-what-not-to-do.html' | relative_url }}) — questionable methods and risky changes.
- [12. FAQ]({{ '/docs/12-faq.html' | relative_url }}) — common questions and explanations.
- [13. Security hardening baseline]({{ '/docs/13-security-hardening-baseline.html' | relative_url }}) — core protection settings.
- [14. Quick-start presets]({{ '/docs/14-quick-start-presets.html' | relative_url }}) — starting points for different PC configurations.

### Testing, tools, and cleanup

- [16. Benchmark templates]({{ '/docs/16-benchmark-templates.html' | relative_url }}) — record results and compare changes.
- [17. Common builds and quick cards]({{ '/docs/17-common-builds-quick-cards.html' | relative_url }}) — reference points for different builds.
- [18. Optimization tools and evidence]({{ '/docs/18-optimization-tools-evidence.html' | relative_url }}) — evaluate third-party tools.
- [19. AI software and disk cleanup]({{ '/docs/19-ai-software-and-disk-cleanup.html' | relative_url }}) — remove unused software and reclaim disk space.

## How to use this guide

1. Record your starting settings and performance results.
2. Choose a change related to the observed problem.
3. Read its limitations and rollback instructions.
4. Change one setting.
5. Repeat the test under the same conditions.
6. Record the result and decision: keep or roll back.

Example log entry:

```text
Game and test scene:
Starting settings:
Change applied:
Result before:
Result after:
Side effects:
Decision: keep / roll back
```

## Project principles

- Diagnosis matters more than the number of tweaks applied.
- Measurements matter more than promises.
- Change one setting at a time.
- Do not use universal BIOS presets for every PC.
- Do not mass-disable services or system protections.
- Keep a rollback path for every change.
