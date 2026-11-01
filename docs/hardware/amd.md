---
layout: doc
title: "AMD GPU Settings"
description: "Configure AMD Software: Adrenalin Edition, Anti-Lag, FSR, FreeSync, Smart Access Memory, and drivers safely."
lang: en
translation_key: hardware-amd
permalink: /docs/hardware/amd.html
---

Use AMD Software: Adrenalin Edition to review driver status and configure a per-game profile. Enable one feature at a time and verify it in the game you play.

## Before you start

- Record the driver version, game settings, monitor refresh rate, and baseline test.
- Download graphics drivers and Adrenalin only from [AMD Support](https://www.amd.com/en/support) or the [official Adrenalin page](https://www.amd.com/en/products/software/adrenalin.html).
- Make a restore point before reinstalling a driver or changing BIOS settings.
- Feature availability depends on the GPU, game, driver, and display.

## Steps

1. **Create a per-game profile** in Adrenalin. Keep global settings at their defaults unless a specific application needs a documented change.
2. **Test Radeon Anti-Lag** only in a supported game. If the game has its own latency feature, compare that first and avoid stacking latency options without an A/B test.
3. **Enable FSR in the game** when available. Compare Quality, Balanced, and Performance modes for image quality and frame-time consistency. Do not treat generated frames as a substitute for stable base performance. Check AMD's [FSR overview](https://www.amd.com/en/technologies/fidelityfx-super-resolution).
4. **Configure FreeSync for a compatible monitor.** Enable it in the monitor's on-screen menu and in Adrenalin. Verify that the game runs within the monitor's variable-refresh range. See AMD's [FreeSync setup instructions](https://www.amd.com/en/resources/support-articles/faqs/DH3-013.html).
5. **Check Smart Access Memory/Resizable BAR** only when the CPU, motherboard, GPU, and firmware support it. Follow the motherboard manual; do not change boot mode, CSM, TPM, or Secure Boot without understanding the consequences. AMD's [Smart Access Memory support](https://www.amd.com/en/support/kb/faq/pa-120) describes its platform requirements.
6. **Use [AMD Cleanup Utility](https://www.amd.com/en/support/kb/faq/gpu-601) only when driver troubleshooting requires a clean removal.** Prefer a normal installer or rollback first. Follow AMD's [driver installation guidance](https://www.amd.com/driverinstall); avoid third-party removal utilities unless the official process cannot resolve the issue.

## Verify the result

- Repeat the same test scene at least three times.
- Compare average FPS, 1% lows, frame times, image quality, and input feel.
- Check GPU temperature, clocks, power use, and stability.
- Record the driver version, profile, and features enabled.

## Rollback

1. Restore the previous per-game profile or reset only the setting that changed.
2. Disable Anti-Lag, FreeSync, or the selected upscaler one at a time if results worsen.
3. If the driver update caused the issue, use Windows driver rollback when available or reinstall the last stable AMD driver.
4. Restore the original BIOS setting if a supported SAM/Resizable BAR change causes boot or stability problems.

## Related guides

- [GPU Settings](../06-gpu-settings.html)
- [BIOS and Hardware](../03-bios-and-hardware.html)
- [Drivers and Updates](../04-drivers-and-updates.html)

Official references: [AMD Software: Adrenalin Edition](https://www.amd.com/en/products/software/adrenalin.html), [FSR](https://www.amd.com/en/technologies/fidelityfx-super-resolution), [FreeSync setup](https://www.amd.com/en/resources/support-articles/faqs/DH3-013.html), [Smart Access Memory](https://www.amd.com/en/support/kb/faq/pa-120), and [AMD driver installation](https://www.amd.com/driverinstall).
