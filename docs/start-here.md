---
layout: doc
title: "Start Here"
description: "Choose a safe, measurable troubleshooting route for common gaming PC problems across hardware and games."
lang: en
translation_key: start-here
permalink: /docs/start-here.html
---

Choose the route that matches the symptom. Diagnose before changing settings, then measure one change at a time.

For the complete cross-hardware workflow, start with the [Ultimate PC Gaming Optimization Guide 2026](ultimate-pc-gaming-guide-2026.html). It explains what applies broadly and what depends on Windows, GPU vendor, game, or hardware. Windows 11 is the primary OS; see [Windows 10 legacy notes](windows-10-legacy.html) for its support status and version-specific limitations.

| Problem | Start here | Then |
| --- | --- | --- |
| Low FPS | [Find the bottleneck](02-find-the-bottleneck.html) | [GPU settings](06-gpu-settings.html) |
| Stuttering | [Find the bottleneck](02-find-the-bottleneck.html) | [Background apps](07-background-apps.html) |
| High temperatures | [Temperatures and stability](10-temperatures-stability.html) | [BIOS and hardware](03-bios-and-hardware.html) |
| Crashes or freezes | [Troubleshooting decision trees](15-troubleshooting-decision-trees.html) | [Drivers and updates](04-drivers-and-updates.html) |
| Input lag | [GPU settings](06-gpu-settings.html) | [PowerShell diagnostics](09-powershell-diagnostics.html) |
| Ping spikes, rubber-banding, disconnects | [Network, Wi-Fi, and online latency](20-network-and-wifi.html) | [Benchmark templates](16-benchmark-templates.html) |
| Laptop or handheld runs slower than expected | [Laptops and handhelds](21-laptops-and-handhelds.html) | [Temperatures and stability](10-temperatures-stability.html) |
| Recording or streaming costs FPS | [Streaming and capture](22-streaming-and-capture.html) | [Benchmark templates](16-benchmark-templates.html) |
| I want to test a safe, reversible change | [Safe Optimization Playbook](24-safe-optimization-playbook.html) | [Benchmark templates](16-benchmark-templates.html) |
| I do not know where to start | [Before you start](01-before-you-start.html) | [Quick-start presets](14-quick-start-presets.html) |

## Before you change anything

1. Record the game, scene, settings, FPS, frame-time results, and temperatures.
2. Change only one setting that relates to the observed symptom.
3. Repeat the same test and keep the change only if the result is measurable and stable.

For the full measurement process, use [Benchmark Templates](16-benchmark-templates.html). For system and game guide lists, see [Windows optimization](index.html) and [Game optimization](games/index.html).

To collect basic hardware, process, network, or security details before asking for help, use the [read-only diagnostics menu](09-powershell-diagnostics.html).

## Safety

- Do not disable Defender, Firewall, Windows Update, or anti-cheat protections to improve FPS.
- Do not run unknown debloat or “FPS boost” scripts.
- Keep a rollback path before changing drivers, BIOS settings, or tuning values.
