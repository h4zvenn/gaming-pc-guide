---
layout: doc
title: "pubg"
---

# PUBG: BATTLEGROUNDS вЂ” Game Page (Stub)

> Pilot expansion. Fill after source audit and template agreement.

## Applicability

- **Game:** PUBG: BATTLEGROUNDS
- **Platform:** Steam
- **Engine:** Unreal Engine 4
- **Anti-cheat:** BattlEye
- **Game version tested:** needs-verification
- **Date checked:** 2026-10-30
- **Status:** draft

## Quick Start

1. Common base first (see [CS2 Quick Start](cs2.md#quick-start)).
2. BattlEye: do not modify game files, do not inject, do not disable its service.
3. Apply only PUBG-specific items below.
4. Validate with [Benchmark template]({{ '/docs/16-benchmark-templates/' | relative_url }}).

## Requirements & Compatibility

- **Anti-cheat constraints:** BattlEye kernel driver. No file modifications, no overlay injection, no unsigned drivers. Replay system may conflict with some overlays.
- **OS / API requirements:** Windows 10 1809+ / Windows 11; DirectX 11 (default) / DirectX 12 (optional, `-d3d12`).
- **Known incompatibilities:** ReShade and some injectors blocked. Discord/Steam/NVIDIA overlays may cause crashes вЂ” test clean.

## Graphics Settings вЂ” Tradeoffs

| Setting | What it does | GPU/CPU cost | Visual impact | Recommended start |
|---|---|---|---|---|
| Resolution | | | | Native |
| Render Scale | | GPU | | 100% |
| FPS Cap | | | | Test |
| V-Sync | | | | Off |
| Anti-Aliasing | | GPU | | Medium / High |
| Post-Processing | | GPU | | Low / Very Low |
| Shadows | | GPU | | Low / Medium |
| Textures | | GPU/VRAM | | Medium / High |
| Effects | | GPU | | Low / Medium |
| Foliage | | GPU/CPU | | Low / Medium |
| View Distance | | CPU/GPU | | Medium / High |
| Motion Blur | | GPU | | Off |

> Verify setting names in current patch. DX11 vs DX12 behaviour may differ.

## FPS Cap, Sync & Latency Reduction

- **In-game FPS limiter:** Available (`FPS Cap` in Graphics settings).
- **V-Sync:** In-game + driver.
- **VRR:** Supported. Test with V-Sync off (driver) + cap inside VRR range.
- **NVIDIA Reflex:** Not supported.
- **AMD Anti-Lag / Intel Low Latency:** Driver-level only.
- **DX11 vs DX12:** Test both (`-d3d12` launch option for DX12). DX12 may improve CPU scaling on some configs.

## Configs & Launch Options

- **Config location:** `%LOCALAPPDATA%\TslGame\Saved\Config\WindowsNoEditor\` (`GameUserSettings.ini`).
- **Verified launch options (current patch):**
  - `-USEALLAVAILABLECORES` вЂ” attempt to use all cores (test).
  - `-d3d12` вЂ” force DirectX 12 (test stability).
  - `-novid` вЂ” skip intro.
- **Do not use:** `-high`, `-malloc=system`, `-sm4`, `-nomansky`, legacy UE4 options copied from other games.

## Common Issues & Diagnosis

| Symptom | First check | Link |
|---|---|---|
| BattlEye initialization failed | Verify game files, reinstall BattlEye via launcher | вЂ” |
| Low FPS, CPU-bound | Lower View Distance, Foliage, Effects; test DX12 | [Bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck/) |
| Stutter on new areas | Texture streaming, SSD space, shader cache | [Bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck/) |
| Input latency | FPS cap, disable V-Sync, test DX12 | [GPU settings]({{ site.baseurl }}/docs/06-gpu-settings/) |
| Network desync / high ping | Region selection, Ethernet, background traffic | [Network diagnostics]({{ site.baseurl }}/docs/09-powershell-diagnostics/#9-network) |

## Benchmark Scenario

- **Scene:** Replay file (fixed timestamp, fixed camera route) or Training Mode (fixed bot route).
- **Warm-up:** 3вЂ“5 minutes (asset streaming).
- **Runs:** в‰Ґ3.
- **Metrics:** avg FPS, 1% low, p99 frametime, GPU busy, CPU core saturation, temps.

## Rollback

1. Reset in-game Graphics to defaults.
2. Remove launch options in Steam.
3. Restore `GameUserSettings.ini` from backup.
4. If DX12 tested: remove `-d3d12`.

## Sources

- Primary: PUBG patch notes, BattlEye FAQ, NVIDIA/AMD driver notes for PUBG.
- Secondary: вЂ”
- Community: вЂ”

Back to main guide: [README]({{ '/' | relative_url }}).
