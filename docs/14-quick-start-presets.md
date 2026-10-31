---
layout: doc
title: "Quick-Start Presets"
description: "Starting optimization checklists for common gaming PC configurations."
lang: en
translation_key: quick-start-presets
permalink: /docs/14-quick-start-presets.html
---

Use a preset to get reliable results without random tweaking. Pick the closest hardware tier, apply one change at a time, benchmark it, and keep only what improves FPS, 1% lows, or frame-time consistency.

> **Important:** Use one preset at a time. Do not mix presets in one session. A preset is an ordered checklist, not a batch script.

## How to use a preset

1. Choose the preset that matches your PC and problem.
2. Apply one step.
3. Test it with the same scene and settings.
4. Record the result using [Benchmark Templates](16-benchmark-templates.html).
5. Keep the change only if it improves performance or stability without side effects.

## Choose a preset

| If your main problem is… | Start with |
| --- | --- |
| Low FPS in demanding scenes | [Entry-Level PC](#entry-level-pc) or [Mid-Range PC](#mid-range-pc) |
| Stutter after long sessions | [Gaming Laptop](#gaming-laptop) or [High-Refresh PC](#high-refresh-pc) |
| Random crashes after tuning | Stop preset changes and use [Temperatures & Stability](10-temperatures-stability.html) |
| Unclear bottleneck | Start with [Find the Bottleneck](02-find-the-bottleneck.html) |

---

## Entry-Level PC

**Goal:** improve smoothness and 1% lows without risky tuning.

| Step | Action | Why |
| --- | --- | --- |
| 1 | Set the correct monitor refresh rate | Avoid an unnecessary 60 Hz limit |
| 2 | Close browser video, downloads, and overlays | Free CPU, RAM, and GPU resources |
| 3 | Enable Game Mode | May help Windows prioritize the game; results vary |
| 4 | Set an in-game FPS cap to a stable level | Improves frame-time consistency |
| 5 | Lower heavy GPU settings first: ray tracing, shadows, reflections | Usually provides the largest FPS gain per visual cost |
| 6 | Test DLSS, FSR, or XeSS in Quality or Balanced mode | Increases FPS with an image-quality trade-off |

**Avoid:** manual RAM timing changes, aggressive undervolting, and disabling services.

---

## Mid-Range PC

**Goal:** balance visual quality and stable high FPS.

| Step | Action | Why |
| --- | --- | --- |
| 1 | Check that XMP or EXPO is enabled and stable | Avoid running RAM at default JEDEC speeds |
| 2 | Enable Above 4G Decoding and Resizable BAR if supported | Can improve performance in some games |
| 3 | Update chipset drivers and install a stable GPU driver | Improves compatibility and consistency |
| 4 | Test HAGS and Optimizations for Windowed Games | Keep the configuration that performs better |
| 5 | Create a per-game GPU profile | Avoid conflicts from global settings |
| 6 | Check thermals during a longer session | Prevent performance drops over time |

**Avoid:** setting every application to maximum performance and using all-in-one optimizer scripts.

---

## High-Refresh PC

**Goal:** maintain consistent performance at high FPS targets, such as 165–360 Hz.

| Step | Action | Why |
| --- | --- | --- |
| 1 | Confirm CPU and GPU clocks remain stable under load | Detect hidden throttling |
| 2 | Set an FPS cap within the system’s stable range | Produces more consistent frame times than uncapped spikes |
| 3 | Tune VRR and V-Sync behavior per game | Balances smoothness and latency |
| 4 | Test low-latency options such as Reflex or Anti-Lag | Can reduce latency; measure the result or treat it as subjective |
| 5 | Remove overlapping overlays | Reduce capture and overlay conflicts |
| 6 | Check Event Viewer for WHEA errors after testing | Detect instability early |

**Avoid:** copying PBO or Curve Optimizer values from random videos and assuming stability from one benchmark run.

---

## Gaming Laptop

**Goal:** keep stable FPS while controlling heat and noise.

| Step | Action | Why |
| --- | --- | --- |
| 1 | Play while connected to AC power and select the performance profile | Prevent battery-related power limits |
| 2 | Force the game to use the discrete GPU | Avoid an integrated-GPU bottleneck |
| 3 | Clean startup apps and background load | Preserve thermal headroom |
| 4 | Cap FPS to a sustainable level | Reduce heat spikes |
| 5 | Keep air intakes clear and use a hard surface | Prevent thermal throttling |
| 6 | Check temperatures after a 30–60 minute session | Detect thermal fade |

**Avoid:** gaming on soft surfaces and removing fan or cooling services without understanding the consequences.

---

## Validation checklist

- [ ] Used only one preset.
- [ ] Measured before and after using the same scene.
- [ ] Compared FPS, 1% lows, and frame times.
- [ ] No new crashes, WHEA errors, or BSODs appeared.
- [ ] Rolled back changes that made results worse.

---

## Next step

[Troubleshooting Decision Trees](15-troubleshooting-decision-trees.html)
