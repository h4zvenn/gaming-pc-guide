---
layout: doc
title: "Troubleshooting Trees"
description: "Structured troubleshooting paths for crashes, freezes, network issues, and unstable performance."
lang: en
translation_key: troubleshooting-decision-trees
permalink: /docs/15-troubleshooting-decision-trees.html
---


Find the symptom, follow one decision tree, and test one fix at a time.

## How to use

1. Choose the tree that matches your issue.
2. Apply one action.
3. Re-test the same game scene.
4. If nothing changes, move to the next branch.
5. Keep a change only when the result is repeatable.

---

## Low FPS

1. **Is an FPS cap or V-Sync limiting the test?**
   - **Yes:** Record the current settings. If temperatures and power are normal, temporarily remove one limit for a short diagnostic run, then restore it.
   - **No:** Continue to the GPU check.
2. **Is GPU busy time 95–99% during the uncapped run?**
   - **Yes:** Treat it as a likely GPU limit. Reduce one demanding graphics setting and compare; then test an upscaler if available.
   - **No:** Check CPU core activity.
3. **Is one CPU core or thread near full use while GPU busy time stays lower?**
   - **Yes:** Treat it as a likely CPU limit. Check background activity and reduce CPU-heavy settings such as draw distance, crowd density, or physics.
   - **No:** Check RAM, VRAM, SSD activity/free space, temperatures, clocks, and throttling before changing settings.

> **Important:** Measure the first branch with the FPS cap removed and V-Sync disabled. A capped or V-Sync-limited GPU can show low usage even when it is still the limiting component. Prefer GPU busy time from PresentMon or CapFrameX over Task Manager percentages.

| Signal | First fix |
| --- | --- |
| GPU busy time is 95–99% without a cap, but FPS is low | Reduce GPU-heavy settings |
| GPU is not saturated and one CPU core is maxed | Reduce CPU-heavy settings and background load |
| Average FPS is normal, but 1% lows are poor | Check RAM, VRAM, SSD, shaders, and loading stutter |

---

## Stutter and bad frame times

1. **Does stutter appear after 20–60 minutes?**
   - **Yes:** Compare temperatures, clocks, and thermal-limit indicators at the start and end of the session. Check cooling before changing game settings.
   - **No:** Continue to the scene-change check.
2. **Does it happen in new areas, after an update, or during camera movement?**
   - **Yes:** Check shader compilation, asset streaming, VRAM use, and SSD activity. Lower texture quality only if VRAM pressure is observed.
   - **No:** Continue to the background-activity check.
3. **Does it coincide with recording, browser video, downloads, or overlays?**
   - **Yes:** Pause downloads and test with one overlay disabled at a time.
   - **No:** Capture frame times and use [Find the Bottleneck](02-find-the-bottleneck.html) to identify the limiting component.

| Pattern | Likely cause |
| --- | --- |
| Gets worse over time | Thermal saturation |
| Spikes in new zones | Shader compilation or storage streaming |
| Spikes with Discord, recording, or browser video | Overlay or capture overhead |

---

## Crashes and black screens

1. **Did the crash begin after changing CPU, GPU, or memory tuning?**
   - **Yes:** Revert the latest change to stock, then re-test and check for WHEA errors.
   - **No:** Check the driver history.
2. **Did the problem begin after a GPU driver update?**
   - **Yes:** Roll back to the last stable driver first. Use a clean install only if rollback does not resolve the issue.
   - **No:** Check temperatures, GPU power connections, RAM stability, and the Windows System event log.
3. **Does the system shut down, smell hot, or show artifacts at stock settings?**
   - **Yes:** Stop testing and seek hardware service.
   - **No:** Run targeted stability tests, then a long gaming session.

| If this started after… | Do this first |
| --- | --- |
| Curve Optimizer or PBO tuning | Revert to stock and re-test |
| GPU undervolting | Relax the curve or return to defaults |
| A driver update | Roll back first; clean-install only if rollback fails |

---

## High ping and packet loss

1. **Are downloads, updates, or cloud sync active?**
   - **Yes:** Pause them and re-test the same game server.
   - **No:** Check the local network connection.
2. **Is Wi-Fi signal weak or unstable?**
   - **Yes:** Test Ethernet or improve the Wi-Fi connection, then compare again.
   - **No:** Check router status and compare a second server region.
3. **Does the issue occur only on one server or region?**
   - **Yes:** Check the game's server status or routing before changing Windows settings.
   - **No:** Compare another device on the same connection and contact the ISP if local packet loss persists.

| Network issue | First check |
| --- | --- |
| Sudden ping spikes | Background downloads or updates |
| Random packet loss | Wi-Fi quality, Ethernet cable, or router |
| Lag only on one server or region | Server-side routing or load |

> **Note:** Measure ping against the game-server region or address you actually play on. A baseline check against `1.1.1.1` does not replace real game-server latency measurement.

---

## No measurable improvement

1. **Did you change multiple settings at once?**
   - **Yes:** Restore the baseline and test one change at a time.
   - **No:** Confirm the same game build, scene, settings, and measurement tool were used.
2. **Does the measured result exceed the baseline run-to-run variation?**
   - **No:** Mark it inconclusive and repeat the test; do not claim a gain.
   - **Yes:** Keep the change only if stability, frame times, and image quality also meet your goal.
3. **Is the original bottleneck still unclear?**
   - **Yes:** Repeat [Find the Bottleneck](02-find-the-bottleneck.html) before trying another tweak.
   - **No:** Record the final result and rollback path.

---

## Safety guardrails

- Do not disable Defender, Firewall, or Windows Update for FPS.
- Do not run unknown scripts.
- Do not stack multiple changes without testing.
- Do not treat a subjective feeling as proof of lower latency.

## Verify the result

After each branch, repeat the same game scene and check whether the symptom changed. Record the setting, game build, driver version, frame times, temperatures, and any errors. Stop if a thermal warning, artifact, or new stability issue appears.

## Rollback

Undo the latest change before following another branch if it worsens performance, causes a crash, or changes the symptom unexpectedly. Return CPU, GPU, and memory tuning to stock when troubleshooting instability.

## Related guides

- [Benchmark Templates](16-benchmark-templates.html)
- [Find the Bottleneck](02-find-the-bottleneck.html)
- [Temperatures and Stability](10-temperatures-stability.html)
- [Drivers and Updates](04-drivers-and-updates.html)
