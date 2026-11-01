---
layout: doc
title: "AMD CPU Settings"
description: "Check AMD CPU memory profiles, PBO risks, thermal limits, and stability without copying unsafe tuning values."
lang: en
translation_key: hardware-amd-cpu
permalink: /docs/hardware/amd-cpu.html
---

Use the motherboard manual and the exact processor's specifications when changing AMD CPU settings. Memory profiles and boost tuning can affect stability and warranty coverage.

## Before you start

- Record the CPU, motherboard model and BIOS version, memory kit, and current settings.
- Save a known-good BIOS profile or photograph the current pages.
- Ensure you have the BitLocker recovery key before BIOS or boot-security changes.
- Keep CPU voltages and boost settings at defaults unless you understand the risk and have time to test.
- Check AMD's [EXPO information](https://www.amd.com/en/products/processors/technologies/expo.html) and the motherboard memory compatibility list.

## Steps

1. **Check the memory profile.** If the memory kit and motherboard support AMD EXPO, select the kit's EXPO profile. On other platforms, use only a profile documented as compatible with that board and CPU. Do not enter manual timings or voltages from another system.
2. **Boot and test at the selected profile.** If boot loops, crashes, WHEA errors, or application errors occur, return to default memory settings before troubleshooting further.
3. **Leave Precision Boost Overdrive (PBO) and Curve Optimizer at default for baseline testing.** These are optional tuning features, not required for gaming. Changes may increase temperature or power draw and can cause errors without an obvious crash.
4. **If deliberately testing PBO or Curve Optimizer, change one setting at a time** and keep a saved stock profile. Do not copy values from another CPU or assume a short benchmark proves stability.
5. **Use the processor's model-specific thermal specification.** Check the exact CPU product page and monitor the reported thermal-limit or throttling indicators during a sustained game.

## Verify the result

- Confirm the effective memory speed in BIOS or a trusted system-information tool.
- Run a memory stability test, then test games and cold boots.
- For CPU tuning, monitor temperatures and clocks, check Windows WHEA events, and complete a long gaming session.
- Keep the BIOS version and every changed setting in the test log.

## Rollback

1. Restore the saved BIOS profile or load the board's default settings.
2. If memory tuning prevents boot, use the motherboard's documented CMOS reset procedure.
3. Return PBO and Curve Optimizer to `Auto` or their previous values after errors, crashes, unexpected shutdowns, or thermal throttling.
4. Re-test at stock settings before changing drivers or Windows.

## Related guides

- [BIOS and Hardware](../03-bios-and-hardware.html)
- [Temperatures and Stability](../10-temperatures-stability.html)
- [Benchmark Templates](../16-benchmark-templates.html)

Official references: [AMD EXPO](https://www.amd.com/en/products/processors/technologies/expo.html) and [AMD processor specifications](https://www.amd.com/en/products/processors/desktops/ryzen.html). Verify the limits and support for your exact processor and motherboard.
