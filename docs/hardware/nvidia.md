---
layout: doc
title: "NVIDIA GPU Settings"
description: "Configure NVIDIA App and Control Panel settings, Reflex, DLSS, G-SYNC, and drivers one game at a time."
lang: en
translation_key: hardware-nvidia
permalink: /docs/hardware/nvidia.html
---

Use the NVIDIA App or NVIDIA Control Panel to configure a per-game profile. Prefer supported in-game features and test changes with the same scene.

## Before you start

- Record your driver version, monitor refresh rate, game settings, and baseline test.
- Create a restore point before a driver reinstall.
- Download drivers and the NVIDIA App only from [NVIDIA](https://www.nvidia.com/en-us/geforce/drivers/) or the [official NVIDIA App page](https://www.nvidia.com/en-us/software/nvidia-app/).
- Setting names and locations can differ by driver release and GPU.

## Steps

1. **Create a per-game profile.** Open NVIDIA App or NVIDIA Control Panel and select the game profile. Keep global settings at their defaults unless you need a specific global behavior.
2. **Enable NVIDIA Reflex in the game** when it is supported. Compare `On` with `On + Boost` only if the game exposes both. Do not force Low Latency Mode at the same time without testing the combination.
3. **Choose DLSS in the game's graphics menu** when available. Start with Quality, then compare Balanced or Performance only if more FPS is needed. Check image quality and frame times, not just average FPS. See [NVIDIA DLSS](https://developer.nvidia.com/rtx/dlss).
4. **Configure G-SYNC only for a supported display.** Enable the monitor's Adaptive-Sync/G-SYNC option if required, then enable the matching NVIDIA setting. Compare V-Sync and a sustainable FPS cap for the game and monitor. Check NVIDIA's [G-SYNC display information](https://www.nvidia.com/en-us/geforce/products/g-sync-monitors/).
5. **Leave Power Management Mode at its default** unless a repeatable test identifies a clock or power-state issue. If testing `Prefer maximum performance`, apply it only to that game's profile and check power use, temperature, and noise.
6. **Reinstall a driver only to resolve a driver problem.** First try the vendor installer or rollback to the last stable version. If the NVIDIA installer offers `Custom` and `Perform a clean installation`, use it only when resetting driver profiles is relevant; it does not replace a Windows restore point.

## Verify the result

- Repeat the same benchmark scene at least three times.
- Compare average FPS, 1% lows, frame times, image quality, and input feel.
- Check GPU temperature, clock behavior, fan noise, and game stability.
- Record the driver version and profile settings that produced the result.

## Rollback

1. Restore the changed profile setting to its previous value or choose the default profile.
2. Disable Reflex, DLSS, G-SYNC, V-Sync, or the FPS cap one at a time if the test regresses.
3. If a driver update caused the problem, use Device Manager's `Roll Back Driver` when available or reinstall the previously stable driver from NVIDIA.
4. Re-test the same scene before making another change.

## Related guides

- [GPU Settings](../06-gpu-settings.html)
- [Drivers and Updates](../04-drivers-and-updates.html)
- [Temperatures and Stability](../10-temperatures-stability.html)

Official references: [NVIDIA Reflex](https://developer.nvidia.com/performance-rendering-tools/reflex), [NVIDIA DLSS](https://developer.nvidia.com/rtx/dlss), [G-SYNC displays](https://www.nvidia.com/en-us/geforce/products/g-sync-monitors/), [NVIDIA App](https://www.nvidia.com/en-us/software/nvidia-app/), and [GeForce drivers](https://www.nvidia.com/en-us/geforce/drivers/).
