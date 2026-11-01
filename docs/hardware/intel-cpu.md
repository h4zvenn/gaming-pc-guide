---
layout: doc
title: "Intel CPU Settings"
description: "Check Intel CPU memory profiles, power limits, temperatures, and stability using model-specific specifications."
lang: en
translation_key: hardware-intel-cpu
permalink: /docs/hardware/intel-cpu.html
---

Use the motherboard manual and the exact processor specifications when changing Intel CPU settings. Keep baseline testing at default CPU power and voltage settings.

## Before you start

- Record the CPU, motherboard model and BIOS version, memory kit, and current settings.
- Save a known-good BIOS profile or photograph the current pages.
- Ensure you have the BitLocker recovery key before BIOS or boot-security changes.
- Check the exact processor's [Intel ARK specifications](https://ark.intel.com/) and the motherboard memory compatibility list.

## Steps

1. **Check the memory profile.** If the memory and platform support Intel XMP, select the kit's documented profile. Do not enter timings or voltages copied from another system.
2. **Verify stability at the selected profile.** If there are boot loops, WHEA errors, game crashes, or application errors, return to default memory settings.
3. **Keep CPU power limits at the motherboard's documented Intel default** while diagnosing performance. Do not use a vendor's “unlimited” setting as a universal gaming optimization.
4. **Change power or boost limits only for a specific measured issue.** Record the original values and change one option at a time; increased power can raise temperature and noise without improving game performance.
5. **Use the exact processor's thermal specification** and monitor thermal-limit/throttling indicators during a sustained game.

## Verify the result

- Confirm the effective memory speed in BIOS or a trusted system-information tool.
- Run a memory test, check cold boots, and test the games that previously showed problems.
- During CPU testing, record clocks, package temperature, power, and any thermal or power-limit flags.
- Review Event Viewer for WHEA errors and compare at least three repeatable game runs.

## Rollback

1. Restore the saved BIOS profile or load the board's defaults.
2. Use the motherboard's documented CMOS reset procedure if memory tuning prevents boot.
3. Restore Intel default CPU power limits if temperature, stability, noise, or performance worsens.
4. Re-test the original configuration before trying another change.

## Related guides

- [BIOS and Hardware](../03-bios-and-hardware.html)
- [Temperatures and Stability](../10-temperatures-stability.html)
- [Benchmark Templates](../16-benchmark-templates.html)

Official reference: [Intel ARK](https://ark.intel.com/). Check the `Tjunction` and memory-support details for your exact CPU rather than using a generic temperature or speed limit.
