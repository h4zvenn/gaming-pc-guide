---
layout: doc
title: "VALORANT"
description: "VALORANT settings, Vanguard compatibility, latency, and competitive performance guidance."
lang: en
translation_key: game-valorant
permalink: /docs/games/valorant.html
---
> Improve VALORANT performance by reducing input latency, stabilizing frame times, and testing graphics settings one at a time. Do not modify Vanguard, game files, or use unapproved third-party software.

## Applicability

| Item | Value |
| --- | --- |
| Game | VALORANT |
| Platform | Riot Client |
| Engine | Unreal Engine 4 |
| Anti-cheat | Riot Vanguard |
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

Do not change VALORANT settings until drivers, temperatures, background load, and monitor refresh rate are checked.

---

## Vanguard compatibility

Vanguard is Riot’s kernel-level anti-cheat. Do not disable, modify, or block its services.

- Do not modify game files.
- Do not use injectors, cheats, unsigned drivers, or test-signed drivers.
- Do not disable Vanguard services.
- If Vanguard reports an error, follow the official Riot support guidance for that specific error code.
- Some overlays and monitoring tools can conflict with Vanguard. Test with them disabled.

On Windows 11, VALORANT and Vanguard may require TPM 2.0 and Secure Boot. Check Riot’s current system requirements before changing BIOS, TPM, Secure Boot, or boot-order settings. Save your BitLocker recovery key before making such changes.

---

## Graphics settings

Start with these values, then change one setting at a time.

| Setting | Recommended start | Why |
| --- | --- | --- |
| Resolution | Native | Best clarity and predictable scaling |
| Render Scale | 100% | Avoids blur from internal upscaling |
| Limit FPS | Test a stable cap | Improves frame-time consistency |
| V-Sync | Off | Avoids added latency; use VRR separately if supported |
| Multithreaded Rendering | On | Can improve CPU utilization |
| Material Quality | Low to Medium | Reduces GPU load |
| Texture Quality | Low to Medium | Depends on available VRAM |
| Detail Quality | Low | Reduces GPU load |
| UI Quality | Low | Reduces GPU load |
| Vignette | Off | Removes a visual effect with no gameplay benefit |
| Bloom | Off | Reduces GPU load |
| Distortion | Off | Reduces GPU load |
| First Person Shadows | Off | Reduces GPU load |

If FPS is low, reduce settings in this order:

1. Detail Quality
2. Material Quality
3. Texture Quality
4. Vignette, Bloom, and Distortion
5. First Person Shadows

---

## FPS cap and latency

Use the in-game FPS limiter before external limiters.

A practical starting point is a cap slightly above your monitor refresh rate. If frame delivery is unstable, test a cap at a level your system can sustain during fights.

For NVIDIA GPUs that support Reflex:

- Enable Reflex Low Latency in-game.
- Test both `On` and `On + Boost`.
- Do not force NVIDIA Low Latency Mode globally at the same time.

For AMD GPUs:

- Test AMD Anti-Lag in a per-game driver profile.
- Do not enable multiple latency-related driver features at once.

For VRR monitors:

- Enable G-SYNC or FreeSync in the GPU control panel and monitor OSD.
- Keep in-game V-Sync disabled unless you need to tune VRR behavior.
- Set an FPS cap within the VRR range if frame pacing is inconsistent.

Test Raw Input Buffer separately. Keep it only if mouse behavior and frame times remain stable.

---

## Launch options

VALORANT has few documented launch options. Prefer in-game settings.

Do not copy launch options from other games, especially `-high`, `-threads`, or legacy Unreal Engine options. Add one option at a time only if it is documented by Riot or another reliable source.

---

## Common issues

| Symptom | First check |
| --- | --- |
| Vanguard error or initialization failure | Check Riot status, Vanguard services, TPM 2.0, and Secure Boot requirements |
| VAN error code | Search the exact code in official Riot support documentation |
| Low FPS with GPU not saturated | Check CPU-bound settings, background apps, and per-core usage |
| High input latency | Enable Reflex, disable V-Sync, remove overlays, test an FPS cap |
| Network spikes | Pause downloads, use Ethernet, check Riot server region and routing |
| Crash after changing settings | Return Video settings to defaults and remove custom launch options |

---

## Benchmark scenario

Use one repeatable scenario for every test.

| Item | Recommendation |
| --- | --- |
| Scene | The Range with a fixed bot count and route, or a custom game with bots |
| Warm-up | 3–5 minutes |
| Runs | At least 3 |
| Metrics | Average FPS, 1% lows, 0.1% lows, frame times, GPU busy time, temperatures |
| Controls | Same map, settings, driver, overlays, and background load |

See [Benchmark Templates](../16-benchmark-templates.html) for the full protocol.

---

## Verification

Record the game version and test date. Use the same map or Range route, settings, driver, overlays, and background load for at least three runs. Compare frame times, FPS, temperatures, and stability; record subjective input feel separately from measured latency.

Confirm current Riot guidance for Vanguard, Secure Boot, TPM, and any patch-sensitive settings before changing system security options.

## Rollback

1. Reset in-game Video settings to defaults.
2. Remove custom launch options in Riot Client.
3. Return Reflex, Anti-Lag, and VRR settings to their previous values.
4. If issues began after a driver update, roll back to the previous stable driver.
5. Reboot and repeat the benchmark scenario.

---

## Related guides

- [Game Guides](index.html)
- [Benchmark Templates](../16-benchmark-templates.html)
- [Troubleshooting Trees](../15-troubleshooting-decision-trees.html)
