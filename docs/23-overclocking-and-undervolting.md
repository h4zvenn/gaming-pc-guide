---
layout: doc
title: "Overclocking and Undervolting"
description: "A cautious, optional approach to memory profiles, GPU tuning, and power limits with stability testing and rollback."
lang: en
translation_key: overclocking-and-undervolting
permalink: /docs/23-overclocking-and-undervolting.html
---

Overclocking and undervolting are optional and carry risk: instability, data corruption, higher heat, and possible warranty or support consequences. Complete the [standard workflow](ultimate-pc-gaming-guide-2026.html) first. Many systems gain more from fixing cooling, drivers, and memory settings than from manual tuning.

## Start with supported, low-risk steps

| Step | Risk | Notes |
| --- | --- | --- |
| Enable the memory vendor's XMP or EXPO profile | Low to medium | Confirm it is on, then validate stability. See [BIOS and Hardware](03-bios-and-hardware.html). |
| Fix cooling and fan curves | Low | Lower temperatures often improve sustained clocks. |
| Use the GPU maker's supported tuning tool | Medium | Change one value at a time with small steps. |
| Manual CPU or memory timing overclocking | High | Not covered here; use manufacturer documentation. |

## Rules

1. **Back up first** and have a [restore plan](01-before-you-start.html). Know how to clear CMOS on your motherboard.
2. **Change one value** per test. Record the previous value.
3. **Test stability** with the games you play plus a dedicated stress or memory test for a meaningful duration. A tool that runs for a minute does not prove stability.
4. **Watch temperatures and power**. Do not exceed the limits published by the CPU or GPU manufacturer. See [Temperatures and Stability](10-temperatures-stability.html).
5. **Treat crashes, driver resets, or WHEA errors as failure.** Revert to the last stable value. Do not keep a setting that sometimes crashes.
6. **Verify the gain.** Keep a setting only if the repeatable benchmark improves beyond its normal variation.

## Undervolting

Undervolting aims to lower voltage at the same clocks to reduce heat and power. It is vendor- and model-specific. Use only the tool and method the CPU or GPU vendor or system manufacturer documents for your product, and test for stability. A setting that seems fine in one game can fail in another or at idle.

## Signs to stop

- Random restarts, black screens, graphical artifacts, or application crashes.
- Temperatures near the manufacturer's maximum under normal gaming load.
- Corrupted files or repeated Windows errors after a memory change.

If any of these appear, return to default settings and test again. See [Troubleshooting Decision Trees](15-troubleshooting-decision-trees.html).

## What to avoid

- Raising voltage to chase stability without knowing the safe limits.
- Disabling protections such as thermal or power limits.
- Copying someone else's values: silicon varies between individual chips.
- Flashing unofficial firmware or BIOS modifications.
