---
layout: doc
title: "PUBG: BATTLEGROUNDS"
description: "PUBG settings, anti-cheat considerations, graphics options, and performance testing."
lang: en
translation_key: game-pubg
permalink: /docs/games/pubg.html
---
> Improve PUBG performance by finding the CPU or GPU bottleneck, reducing stutter, and testing graphics settings one at a time. Do not modify game files or use unapproved third-party software.

## Applicability

| Item | Value |
| --- | --- |
| Game | PUBG: BATTLEGROUNDS |
| Platform | Steam |
| Engine | Unreal Engine 4 |
| Anti-cheat | BattlEye |
| Status | Needs verification per game patch |

## Before tuning

Complete the general preparation flow first:

1. [Before You Start](../01-before-you-start.html)
2. [Find the Bottleneck](../02-find-the-bottleneck.html)
3. [Drivers & Updates](../04-drivers-and-updates.html)
4. [Windows 11 Core](../05-windows-11.html)
5. [GPU Settings](../06-gpu-settings.html)
6. [Background Apps](../07-background-apps.html)
7. [Temperatures & Stability](../10-temperatures-stability.html)

Do not change PUBG settings until drivers, temperatures, background load, and monitor refresh rate are checked.

---

## Anti-cheat compatibility

BattlEye protects the game process and may block software that injects code or modifies game files.

- Do not modify game files.
- Do not use injectors, cheats, or unapproved overlays.
- Do not disable BattlEye services.
- If BattlEye fails to initialize, verify game files in Steam and reinstall BattlEye through its official installer if prompted.
- Some overlays or screen-capture tools can cause conflicts. Test with them disabled.

---

## Graphics settings

Start with these values, then change one setting at a time.

| Setting | Recommended start | Why |
| --- | --- | --- |
| Resolution | Native | Best clarity and predictable scaling |
| Render Scale | 100% | Avoids blur from internal upscaling |
| FPS Cap | Test a stable cap | Improves frame-time consistency |
| V-Sync | Off | Avoids added latency; use VRR separately if supported |
| Anti-Aliasing | Medium | Balance between edge quality and GPU cost |
| Post-Processing | Low | Reduces GPU load |
| Shadows | Low to Medium | Major GPU cost |
| Textures | Medium to High | Depends on available VRAM |
| Effects | Low to Medium | Reduces GPU load during fights |
| Foliage | Low to Medium | Reduces GPU and CPU load |
| View Distance | Medium to High | Can affect visibility; test the FPS cost |
| Motion Blur | Off | Improves visual clarity |

If FPS is low, reduce settings in this order:

1. Shadows
2. Effects
3. Foliage
4. Post-Processing
5. Anti-Aliasing
6. View Distance

Keep textures higher if you have enough VRAM; they usually affect visual quality more than FPS.

---

## FPS cap and latency

Use the in-game FPS limiter before external limiters.

A practical starting point is a cap slightly above your monitor refresh rate. If frame delivery is unstable, test a cap at a level your system can sustain in demanding areas.

For VRR monitors:

- Enable G-SYNC or FreeSync in the GPU control panel and monitor OSD.
- Keep in-game V-Sync disabled unless you need to tune VRR behavior.
- Set an FPS cap within the VRR range if frame pacing is inconsistent.

PUBG does not have native NVIDIA Reflex support. Test AMD Anti-Lag or Intel low-latency options only in a per-game driver profile if you use those GPUs.

---

## DirectX 11 and DirectX 12

Use DirectX 11 as the default renderer. Test DirectX 12 only if you have a specific performance or stability reason.

To test DirectX 12, add this launch option in Steam:

```text
-d3d12
```

Test both APIs with the same settings, map, and benchmark scenario. DirectX 12 may behave differently depending on CPU, GPU, driver, and game patch.

Do not copy legacy Unreal Engine 4 launch options from old guides.

---

## Config location

PUBG settings are stored in:

```text
%LOCALAPPDATA%\TslGame\Saved\Config\WindowsNoEditor\GameUserSettings.ini
```

Back up this file before manually editing it. Prefer changing settings in-game unless you have a specific reason to edit the configuration file.

---

## Common issues

| Symptom | First check |
| --- | --- |
| BattlEye initialization failed | Verify game files in Steam and reinstall BattlEye if prompted |
| Low FPS with high CPU usage | Lower View Distance, Foliage, and Effects |
| Low FPS with GPU busy time near 100% | Lower Shadows, Effects, Post-Processing, and Anti-Aliasing |
| Stutter in new areas | Check SSD free space, texture streaming, and shader cache |
| High ping or packet loss | Pause downloads, use Ethernet, check router and server region |
| Crash after changing renderer | Remove `-d3d12` and return to DirectX 11 |

---

## Benchmark scenario

Use one repeatable scenario for every test.

| Item | Recommendation |
| --- | --- |
| Scene | Training Mode with a fixed route, or a replay with a fixed timestamp and camera path |
| Warm-up | 3–5 minutes |
| Runs | At least 3 |
| Metrics | Average FPS, 1% lows, 0.1% lows, frame times, GPU busy time, temperatures |
| Controls | Same map, settings, driver, overlays, and background load |

See [Benchmark Templates](../16-benchmark-templates.html) for the full protocol.

---

## Verification

Record the game version and test date. Use the same map or training route, renderer, graphics settings, driver, overlays, and background load for at least three runs. Compare average FPS, 1% lows, frame times, GPU busy time, temperatures, and crashes.

Renderer and graphics recommendations can change with game patches; verify current in-game options and anti-cheat requirements before applying them.

## Rollback

1. Reset in-game graphics settings to defaults.
2. Remove custom Steam launch options.
3. Restore `GameUserSettings.ini` from a backup, if you modified it.
4. Remove `-d3d12` if you tested DirectX 12.
5. Reboot and repeat the benchmark scenario.

---

## Related guides

- [Game Guides](index.html)
- [Benchmark Templates](../16-benchmark-templates.html)
- [Troubleshooting Trees](../15-troubleshooting-decision-trees.html)
