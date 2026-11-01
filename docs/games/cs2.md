---
layout: doc
title: "Counter-Strike 2"
description: "Counter-Strike 2 settings, latency, FPS caps, configuration, and testing guidance."
lang: en
translation_key: game-cs2
permalink: /docs/games/cs2.html
---


> Complete guide for improving Counter-Strike 2 performance on Source 2: reduce stutter, improve frame-time consistency, and establish a stable FPS floor. Test every change on your own system.

## Applicability

| Item | Value |
| --- | --- |
| Game | Counter-Strike 2 |
| Platform | Steam |
| Engine | Source 2 |
| APIs | DirectX 11 and Vulkan |
| Anti-cheat | VAC |
| Status | Needs verification per game patch |

## Before tuning

Complete the general preparation flow first:

1. [Before You Start](../01-before-you-start.html)
2. [Find the Bottleneck](../02-find-the-bottleneck.html)
3. [BIOS & Hardware](../03-bios-and-hardware.html)
4. [Drivers & Updates](../04-drivers-and-updates.html)
5. [Windows 11 Core](../05-windows-11.html)
6. [GPU Settings](../06-gpu-settings.html)
7. [Background Apps](../07-background-apps.html)
8. [Temperatures & Stability](../10-temperatures-stability.html)

Do not change CS2 settings until the system is stable and the monitor refresh rate, drivers, temperatures, and background load are checked.

---

## Compatibility

- VAC can flag unauthorized third-party software that interacts with the game process.
- Do not modify core game files or use unapproved external tools.
- Avoid third-party overlays during troubleshooting, especially Discord Overlay, Xbox Game Bar, NVIDIA Overlay, and RTSS.
- If you use `-allow_third_party_software`, understand that it can affect Trust Factor and is not required for normal optimization.

Use DirectX 11 as the default renderer. Test Vulkan only if you have a specific compatibility or performance reason; shader compilation and stutter behavior can differ between systems.

---

## Graphics settings

Graphics settings affect FPS, visual clarity, and model visibility. Start with a stable baseline, then change one setting at a time.

| Setting | Recommended start | Why |
| --- | --- | --- |
| Resolution | Native resolution | Best clarity; lower only if you need more FPS |
| Display mode | Fullscreen | Usually the most predictable presentation mode |
| Boost Player Contrast | Enabled | Can improve player-model visibility |
| Wait for V-Sync | Disabled | Avoids added latency; use VRR separately if supported |
| Multisampling Anti-Aliasing | 2x MSAA to start | Balance between edge quality and GPU cost |
| Global Shadow Quality | High | Shadows can provide useful gameplay information |
| Model / Texture Detail | Medium | Reasonable VRAM and visual-quality balance |
| Shader Detail | Low | Reduces GPU load with limited competitive impact |
| Particle Detail | Low | Reduces CPU and GPU load from effects |
| Ambient Occlusion | Disabled | Saves GPU resources |
| FidelityFX Super Resolution | Disabled | Use native rendering unless you need more FPS |
| NVIDIA Reflex | Enabled + Boost, if supported | Can reduce system latency on supported NVIDIA GPUs |

If FPS is low, reduce settings in this order:

1. Shader Detail
2. Particle Detail
3. Ambient Occlusion
4. MSAA
5. Shadow Quality

Keep Shadow Quality higher if you rely on shadow information, but test the FPS cost in your usual maps.

---

## FPS cap and latency

Use the in-game FPS limiter before external limiters.

A high ceiling such as `fps_max 400` is a common CS2 starting point because it usually does not restrict performance on modern hardware:

```text
fps_max 400
```

If frame delivery is unstable, test a cap near a sustainable FPS level instead of leaving it unlimited. The best cap depends on your CPU, GPU, monitor, and the map.

For NVIDIA GPUs that support Reflex:

- Enable Reflex in-game.
- Test both `On` and `On + Boost`.
- Do not force NVIDIA Low Latency Mode globally at the same time.

For VRR monitors:

- Enable G-SYNC or FreeSync in the GPU control panel and monitor OSD.
- Keep in-game V-Sync disabled unless you need to tune VRR behavior for a specific monitor.
- Use an FPS cap within the VRR range if frame pacing is inconsistent.

---

## Launch options

Config location:

```text
...\steamapps\common\Counter-Strike 2\game\csgo\cfg\
```

Common launch options:

| Option | Purpose | Recommendation |
| --- | --- | --- |
| `-novid` | Skips the intro video | Safe |
| `-nojoy` | Disables joystick input polling | Optional |
| `-high` | Requests high process priority | Test only; not universally beneficial |
| `-threads <N>` | Forces a thread count | Avoid unless you have a specific reason |

Do not copy a full launch-options string from a video or forum post. Add one option at a time and test it.

---

## Network settings

CS2 handles most network behavior automatically. Do not copy old CS:GO network commands without understanding them.

If you experience packet loss or high ping:

1. Pause downloads, cloud sync, torrents, and streaming.
2. Use Ethernet if possible.
3. Restart the router if the issue is local.
4. Test another server region.
5. Measure latency to the server region you actually play on.

See [PowerShell Diagnostics](../09-powershell-diagnostics.html#network) for basic connectivity checks.

---

## Common issues

| Symptom | First check |
| --- | --- |
| Low FPS with GPU busy time at 95–99% | Reduce shader, particle, MSAA, or shadow settings |
| Low FPS with one CPU core saturated | Close background apps and reduce CPU-heavy settings |
| Stutter on new maps | Allow shader compilation, verify game files, use an SSD |
| Sluggish mouse or high latency | Enable Reflex, disable V-Sync, remove overlays |
| Packet loss or high ping | Check downloads, Ethernet, router, ISP, and server region |
| Crash on launch or VAC error | Verify game files in Steam and remove unapproved third-party software |

Source 2 compiles shaders dynamically during early gameplay. After a GPU driver update or major setting change, play a complete practice or Deathmatch session before benchmarking.

---

## Benchmark scenario

Use one repeatable scenario for every test.

| Item | Recommendation |
| --- | --- |
| Scene | Aim Botz workshop map or a recorded competitive demo |
| Warm-up | 5 minutes |
| Runs | At least 3 |
| Metrics | Average FPS, 1% lows, 0.1% lows, frame times |
| Tools | CapFrameX, PresentMon, or HWiNFO |
| Controls | Same resolution, settings, driver, overlays, and background load |

See [Benchmark Templates](../16-benchmark-templates.html) for the full protocol.

---

## Rollback

1. Remove or rename `autoexec.cfg`.
2. Remove custom Steam launch options.
3. Return changed in-game settings to their previous values.
4. If issues began after a driver update, roll back to the previous stable driver before considering a clean installation.
5. Reboot and repeat the benchmark scenario.

---

## Evidence status

| Recommendation | Status |
| --- | --- |
| Use native resolution and fullscreen | Verified |
| Disable V-Sync for lower latency | Verified |
| Use in-game FPS limiter before external limiters | Needs verification per system |
| Enable Reflex on supported NVIDIA GPUs | Needs verification per system |
| Use `-high` or `-threads` | Needs verification; not universally beneficial |
| Change `rate`, `cl_cmdrate`, or `cl_updaterate` | Deprecated; do not copy old CS:GO values |

---

## Related guides

- [Game Guides](index.html)
- [Benchmark Templates](../16-benchmark-templates.html)
- [Troubleshooting Trees](../15-troubleshooting-decision-trees.html)
