---
layout: doc
title: "Game Template"
description: "Template for creating consistent game-specific optimization guides."
lang: en
translation_key: game-template
permalink: /docs/games/template.html
---

> Copy this file to `docs/games/<game-slug>.md` and fill in every section. Do not duplicate common base content; link to it.

## Applicability

| Item | Value |
| --- | --- |
| Game | `<Game Name>` |
| Platform | Steam, Epic Games, Battle.net, standalone, or Microsoft Store |
| Engine | `<Engine name and version, if known>` |
| Anti-cheat | VAC, Vanguard, BattlEye, Easy Anti-Cheat, none, or custom |
| Game version tested | `<patch or version>` |
| Date checked | `YYYY-MM-DD` |
| Status | `draft`, `needs-verification`, `verified`, or `deprecated` |

## Before tuning

Complete the general preparation flow first:

1. [Before You Start](../01-before-you-start.html)
2. [Find the Bottleneck](../02-find-the-bottleneck.html)
3. [BIOS & Hardware](../03-bios-and-hardware.html)
4. [Drivers & Updates](../04-drivers-and-updates.html)
5. [Windows 11 Core](../05-windows-11.html)
6. [GPU Settings](../06-gpu-settings.html)
7. [Background Apps](../07-background-apps.html)
8. [Services & Security](../08-services-and-security.html)
9. [PowerShell Diagnostics](../09-powershell-diagnostics.html)
10. [Temperatures & Stability](../10-temperatures-stability.html)

Apply only the game-specific items below that match your symptom. Validate every change with the [Benchmark Templates](../16-benchmark-templates.html).

---

## Requirements and compatibility

- **Anti-cheat constraints:** What the anti-cheat forbids or requires, such as no file modifications, no overlay injection, no unverified launch options, or Trusted Mode requirements.
- **OS and API requirements:** Windows 10 or 11, DirectX 11, DirectX 12, Vulkan, or a specific build if relevant.
- **Known incompatibilities:** Overlays, injectors, specific drivers, or OS features that break the game.

---

## Graphics settings

Only list settings that exist in the game. Remove rows that do not apply.

| Setting | What it does | GPU/CPU cost | Visual impact | Recommended start |
| --- | --- | --- | --- | --- |
| Resolution | Internal rendering resolution | GPU | Sharpness | Native |
| Render scale | Internal resolution multiplier | GPU | Sharpness | 100% |
| Upscaler | DLSS, FSR, or XeSS | GPU | Sharpness and FPS | Quality, then Balanced |
| Anti-aliasing | Edge smoothing | GPU | Jagged edges | Test |
| Shadows | Shadow quality and distance | GPU/CPU | Visibility | Test |
| Reflections or ray tracing | Reflective surfaces and lighting | GPU | Visual fidelity | Test |
| Ambient occlusion | Contact shadows | GPU | Depth | Test |
| Volumetrics or fog | Atmospheric effects | GPU | Atmosphere | Test |
| Particles or effects | Explosions, smoke, and effects | GPU/CPU | Effect detail | Test |
| Texture quality | Surface detail and VRAM use | GPU/VRAM | Surface clarity | Test |
| View distance or LOD | Object and terrain draw distance | CPU/GPU | Visibility | Test |

---

## FPS cap, sync, and latency

- **In-game FPS limiter:** Available or unavailable; describe its behavior.
- **V-Sync:** In-game, driver-level, or both.
- **VRR:** G-SYNC or FreeSync support and setup.
- **NVIDIA Reflex, AMD Anti-Lag, or Intel low latency:** In-game support or driver fallback.
- **Frame Generation:** Support, base-FPS requirement, and latency trade-offs.
- **Recommended sync profile:** Link to the GPU guide and describe only game-specific tuning.

---

## Configuration and launch options

- **Config location:** Configuration file path or registry location.
- **Verified launch options:** Only options confirmed for the current game patch.
- **Do not use:** Deprecated, harmful, or copied launch options from other games.

---

## Common issues

| Symptom | First check | Link |
| --- | --- | --- |
| Low FPS | Identify GPU or CPU bottleneck | [Find the Bottleneck](../02-find-the-bottleneck.html) |
| Stutter or bad frame times | Check shaders, storage, VRAM, and background load | [Find the Bottleneck](../02-find-the-bottleneck.html) |
| Input latency | Check FPS cap, V-Sync, Reflex, Anti-Lag, and overlays | [GPU Settings](../06-gpu-settings.html) |
| Network latency or packet loss | Check downloads, Ethernet, router, ISP, and server region | [PowerShell Diagnostics](../09-powershell-diagnostics.html#network) |
| Crashes or launch failure | Check anti-cheat, game files, drivers, and recent changes | [Troubleshooting Trees](../15-troubleshooting-decision-trees.html) |

Add game-specific failure modes, such as shader-compilation stutter, asset-streaming issues, or anti-cheat launch failures.

---

## Benchmark scenario

| Item | Recommendation |
| --- | --- |
| Scene | Workshop map, demo file, practice range, or fixed route |
| Warm-up | Specify minutes |
| Runs | At least 3 |
| Metrics | Average FPS, 1% lows, 0.1% lows, P99 frame time, GPU busy time, CPU core saturation, temperatures, WHEA errors |
| Tools | CapFrameX, PresentMon, HWiNFO, or an in-game benchmark |

---

## Rollback

1. Restore the game configuration and launch options.
2. Revert driver, Windows, or BIOS changes made for this game.
3. Re-run the benchmark scenario to confirm baseline performance.

---

## Sources

- **Primary:** Official patch notes, developer blogs, vendor documentation, and support articles.
- **Secondary:** Technical publications and vendor-adjacent testing resources.
- **Community:** Forums, Reddit, and videos; use only as hypotheses to test.

Mark each recommendation as `verified`, `needs-verification`, or `deprecated`, and record the date checked.

---

## Related guides

- [Game Guides](README.html)
- [Benchmark Templates](../16-benchmark-templates.html)
- [Troubleshooting Decision Trees](../15-troubleshooting-decision-trees.html)
