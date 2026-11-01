---
layout: doc
title: "Intel GPU Settings"
description: "Review Intel Arc drivers, XeSS, Resizable BAR, and per-game graphics settings."
lang: en
translation_key: hardware-intel-gpu
permalink: /docs/hardware/intel-gpu.html
---

Configure Intel Arc or integrated graphics with the current Intel graphics software and the game's own settings. Driver and feature support varies by GPU generation.

## Before you start

- Record the exact GPU model, driver version, game settings, and baseline test.
- Download drivers from [Intel Driver & Support Assistant](https://www.intel.com/content/www/us/en/support/detect.html) or the support page for your exact GPU.
- Make a restore point before a driver reinstall or BIOS change.
- Do not assume a feature is supported by every Intel GPU.

## Steps

1. **Check for a stable driver** for your exact GPU and Windows version. Use the current Intel graphics application available for your device; older devices may expose settings through Intel Arc Control.
2. **Create or review a per-game profile** if the installed graphics application provides one. Keep global settings at defaults while troubleshooting.
3. **Enable XeSS inside a supported game** and compare Quality, Balanced, and Performance modes. Check image quality and frame times as well as FPS.
4. **Check Resizable BAR support** in the GPU application or system information. If the CPU, GPU, motherboard, and firmware support it, follow the motherboard vendor's instructions to enable Above 4G Decoding and Resizable BAR. Do not change UEFI/CSM or Secure Boot settings without a verified rollback plan.
5. **Test one graphics option at a time.** If the game has rendering API choices, compare them only to investigate a specific compatibility or performance issue.

## Verify the result

- Repeat the same scene at least three times with the same driver and game build.
- Compare average FPS, 1% lows, frame times, and visible image artifacts.
- Check for driver resets, crashes, and temperature or clock changes.
- Confirm that the intended XeSS and Resizable BAR settings are active.

## Rollback

1. Restore the previous per-game setting or choose the default profile.
2. Disable XeSS or the changed driver feature if the result regresses.
3. If a driver update introduced instability, roll back through Device Manager when available or install the last stable Intel driver for the exact GPU.
4. Restore previous BIOS settings if a Resizable BAR change causes boot or compatibility problems.

## Related guides

- [GPU Settings](../06-gpu-settings.html)
- [Drivers and Updates](../04-drivers-and-updates.html)
- [BIOS and Hardware](../03-bios-and-hardware.html)

Official references: [Intel Support](https://www.intel.com/content/www/us/en/support.html) and [Intel Driver & Support Assistant](https://www.intel.com/content/www/us/en/support/detect.html). Use Intel's support search for feature-specific documentation for your exact GPU generation.
