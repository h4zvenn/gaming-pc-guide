---
layout: doc
title: "_template"
---

# Game Page Template

> Copy this file to `docs/games/<game-slug>.md` and fill in every section. Do not duplicate common base content вЂ” link to it.

## Applicability

- **Game:** `<Game Name>`
- **Platform:** Steam / Epic / Battle.net / Standalone / Microsoft Store
- **Engine:** `<Engine name and version if known>`
- **Anti-cheat:** VAC / Vanguard / BattlEye / Easy Anti-Cheat / None / Custom
- **Game version tested:** <patch/version>
- **Date checked:** YYYY-MM-DD
- **Status:** draft | needs-verification | verified | deprecated

## Quick Start

1. Complete the common base: [Preparation](../01-before-you-start.md) в†’ [Bottleneck](../02-find-the-bottleneck.md) в†’ [BIOS/Hardware](../03-bios-and-hardware.md) в†’ [Drivers](../04-drivers-and-updates.md) в†’ [Windows](../05-windows-11.md) в†’ [GPU](../06-gpu-settings.md) в†’ [Background](../07-background-apps.md) в†’ [Security/Services](../08-services-and-security.md) в†’ [Diagnostics](../09-powershell-diagnostics.md) в†’ [Thermals/Stability](../10-temperatures-stability.md).
2. Apply only the game-specific items below that match your symptom.
3. Validate with the [Benchmark template](../16-benchmark-templates.md).
4. Keep only what improves your metrics without instability.

## Requirements & Compatibility

- **Anti-cheat constraints:** `what the anti-cheat forbids/requires; e.g., no file modifications, no overlay injection, no unverified launch options, Trusted Mode requirements`
- **OS / API requirements:** `Windows 10/11, DirectX 11/12/Vulkan, specific build if relevant`
- **Known incompatibilities:** `overlays, injectors, specific drivers, OS features that break the game`

## Graphics Settings вЂ” Tradeoffs

| Setting | What it does | GPU/CPU cost | Visual impact | Recommended start |
|---|---|---|---|---|
| Resolution | | | | Native |
| Render scale | | | | 100% |
| Upscaler (DLSS/FSR/XeSS) | | | | Quality в†’ Balanced |
| Anti-aliasing | | | | |
| Shadows | | | | |
| Reflections / RT | | | | |
| Ambient occlusion | | | | |
| Volumetrics / fog | | | | |
| Particles / effects | | | | |
| Texture quality / VRAM | | | | |
| View distance / LOD | | | | |

> Only list settings that exist in this game. Remove rows that do not apply.

## FPS Cap, Sync & Latency Reduction

- **In-game FPS limiter:** `available? behaviour?`
- **V-Sync:** `in-game / driver / both?`
- **VRR (G-SYNC / FreeSync):** `supported? how to enable?`
- **NVIDIA Reflex / AMD Anti-Lag / Intel Low Latency:** `supported in-game? driver fallback?`
- **Frame Generation:** `supported? base FPS requirement?`
- **Recommended sync profile:** `link to GPU guide; game-specific tuning only`

## Configs & Launch Options

- **Config location:** `path or registry`
- **Verified launch options:** `only options confirmed for current patch`
- **Do not use:** `deprecated / harmful / copied from other games`

## Common Issues & Diagnosis

| Symptom | First check | Link |
|---|---|---|
| Low FPS | | [Bottleneck](../02-find-the-bottleneck.md) |
| Stutter / bad frametime | | [Bottleneck](../02-find-the-bottleneck.md) |
| Input latency | | [GPU settings](../06-gpu-settings.md) |
| Network latency / packet loss | | [Network diagnostics](../09-powershell-diagnostics.md#9-network) |
| Crashes / launches fail | | [Troubleshooting](../15-troubleshooting-decision-trees.md) |

> Add game-specific failure modes (shader compilation stutter, asset streaming, specific anti-cheat launch failures).

## Benchmark Scenario

- **Scene:** `workshop map / demo file / practice range / fixed route`
- **Warm-up:** `seconds/minutes`
- **Runs:** в‰Ґ3
- **Metrics:** avg FPS, 1% low, 0.1% low, p99 frametime, GPU busy, CPU core saturation, temps, WHEA
- **Tools:** CapFrameX / PresentMon / HWiNFO / in-game benchmark

## Rollback

1. Restore game config / launch options.
2. Revert driver / Windows / BIOS changes made for this game.
3. Re-run benchmark scenario to confirm baseline.

## Sources

- Primary: `official patch notes, developer blog, vendor docs, support KB`
- Secondary: `technical publications, vendor-adjacent testing`
- Community: `forums, Reddit, videos вЂ” hypothesis only`

> Mark each recommendation with: `verified` | `needs-verification` | `deprecated` and the date.

Back to main guide: [README](../../README.md).
