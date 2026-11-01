---
layout: doc
title: "World of Tanks"
description: "World of Tanks settings, Mod Hub safety, client options, and performance testing."
lang: en
translation_key: game-world-of-tanks
permalink: /docs/games/world-of-tanks.html
---
> Improve World of Tanks performance by finding the CPU or GPU bottleneck, reducing stutter, and testing graphics settings one at a time. Use only mods allowed by Wargaming’s current policy.

## Applicability

| Item | Value |
| --- | --- |
| Game | World of Tanks |
| Platform | Wargaming Game Center or Steam |
| Engine | Core engine |
| Anti-cheat | Wargaming client-integrity and server-side checks |
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

Do not install mods or change graphics settings until drivers, temperatures, background load, and monitor refresh rate are checked.

---

## Mods and integrity

Use only mods from the official [Wargaming Mod Hub](https://modhub.wargaming.com/).

- Check the current Wargaming mod policy before installing XVM or other interface mods.
- Do not use mods from unknown websites, Discord channels, or file-sharing services.
- Do not modify game files outside allowed mod folders.
- Do not copy another player’s `engine_config.xml` or other configuration files.
- If the game reports an integrity-check failure, remove mods and verify game files through Wargaming Game Center or Steam.

Some overlays, injectors, and monitoring tools can trigger integrity issues. Test the game with them disabled.

---

## Graphics settings

Start with these values, then change one setting at a time.

| Setting | Recommended start | Why |
| --- | --- | --- |
| Render Scale | 100% | Avoids blur from internal upscaling |
| Graphics Preset | Medium or High | Starting point depends on GPU performance |
| Anti-Aliasing | 2x MSAA | Balance between edge quality and GPU cost |
| Texture Quality | High | Usually has a larger visual impact than FPS impact if VRAM is sufficient |
| Shadow Quality | Medium | Major GPU cost |
| Water Quality | Medium | Reduces GPU load |
| Particle Quality | Medium | Reduces GPU and CPU load from explosions and smoke |
| Grass and Vegetation | Medium | Can affect CPU and GPU load |
| Post-Processing | Off or Low | Reduces GPU load |
| Motion Blur | Off | Improves visual clarity |
| Flare and Lens Effects | Off | Reduces GPU load |

If FPS is low, reduce settings in this order:

1. Shadow Quality
2. Particle Quality
3. Water Quality
4. Grass and Vegetation
5. Post-Processing
6. Anti-Aliasing

Keep Texture Quality higher if you have enough VRAM; it usually affects visual quality more than FPS.

---

## FPS cap and VRR

Use the in-game FPS limiter before external limiters.

A practical starting point is a cap slightly above your monitor refresh rate. If frame delivery is unstable, test a cap at a level your system can sustain during combat.

For VRR monitors:

- Enable G-SYNC or FreeSync in the GPU control panel and monitor OSD.
- Keep in-game V-Sync disabled unless you need to tune VRR behavior.
- Set an FPS cap within the VRR range if frame pacing is inconsistent.

World of Tanks does not have native NVIDIA Reflex or AMD Anti-Lag support. Test driver-level latency options only in a per-game profile if you use those GPUs.

---

## Configuration files

World of Tanks configuration files are commonly located in:

```text
%APPDATA%\Wargaming.net\WorldOfTanks\
```

Back up `preferences.xml` before manually editing it. Prefer changing settings in-game unless you have a specific reason to edit configuration files.

Do not copy configuration files from other players. They can contain settings that do not match your hardware, client version, or Wargaming policy.

---

## Common issues

| Symptom | First check |
| --- | --- |
| Game integrity check failed | Remove mods and verify game files |
| Low FPS with GPU busy time near 100% | Lower Render Scale, Particle Quality, Water Quality, and Post-Processing |
| Low FPS with high CPU usage | Lower Grass, View Distance, and Shadow Quality |
| Stutter during battle | Check SSD free space, texture streaming, and background downloads |
| High ping or packet loss | Pause downloads, use Ethernet, check server region and routing |
| Crash after changing settings | Reset graphics settings and remove recently added mods |

---

## Benchmark scenario

Use one repeatable scenario for every test.

| Item | Recommendation |
| --- | --- |
| Scene | Training Room with a fixed route, or a replay with a fixed battle and camera path |
| Warm-up | 3–5 minutes |
| Runs | At least 3 |
| Metrics | Average FPS, 1% lows, 0.1% lows, frame times, GPU busy time, temperatures |
| Controls | Same map, settings, mods, driver, overlays, and background load |

See [Benchmark Templates](../16-benchmark-templates.html) for the full protocol.

---

## Verification

Record the client version, mod list, and test date. Use the same map or replay, route, graphics settings, driver, overlays, and background load for at least three runs. Compare FPS, frame times, GPU busy time, temperatures, and stability.

Recheck Wargaming's current mod policy and client options before applying patch-sensitive guidance.

## Rollback

1. Reset in-game graphics settings to defaults.
2. Remove recently added mods.
3. Verify game files through Wargaming Game Center or Steam.
4. Restore `preferences.xml` from a backup, if you modified it.
5. Reboot and repeat the benchmark scenario.

---

## Related guides

- [Game Guides](index.html)
- [Benchmark Templates](../16-benchmark-templates.html)
- [Troubleshooting Trees](../15-troubleshooting-decision-trees.html)
