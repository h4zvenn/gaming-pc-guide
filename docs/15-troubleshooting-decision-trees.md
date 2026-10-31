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

```mermaid
flowchart TD
    A[Low FPS] --> B{FPS cap and V-Sync disabled?}
    B -- No --> B1[Remove FPS cap and V-Sync, then re-test]
    B1 --> B
    B -- Yes --> C{GPU busy time is 95-99 percent?}
    C -- Yes --> D[GPU-bound: reduce ray tracing, shadows, or reflections]
    D --> E[Test DLSS, FSR, or XeSS in Quality or Balanced mode]
    E --> F[Set a realistic FPS cap]
    C -- No --> G{Is one CPU core saturated?}
    G -- Yes --> H[CPU-bound: reduce draw distance, crowd density, or physics]
    H --> I[Close background apps and overlays]
    G -- No --> J[Check RAM, VRAM, SSD space, temperatures, and throttling]
```

> **Important:** Measure the first branch with the FPS cap removed and V-Sync disabled. A capped or V-Sync-limited GPU can show low usage even when it is still the limiting component. Prefer GPU busy time from PresentMon or CapFrameX over Task Manager percentages.

| Signal | First fix |
| --- | --- |
| GPU busy time is 95–99% without a cap, but FPS is low | Reduce GPU-heavy settings |
| GPU is not saturated and one CPU core is maxed | Reduce CPU-heavy settings and background load |
| Average FPS is normal, but 1% lows are poor | Check RAM, VRAM, SSD, shaders, and loading stutter |

---

## Stutter and bad frame times

```mermaid
flowchart TD
    A[Stutter or bad frame times] --> B{Does it appear after 20-60 minutes?}
    B -- Yes --> C[Check temperatures, clocks, and throttling]
    C --> D[Improve airflow or adjust the fan curve]
    B -- No --> E{Does it happen in new areas or during camera movement?}
    E -- Yes --> F[Check shader compilation, asset streaming, and VRAM]
    F --> G[Lower texture quality or render scale]
    E -- No --> H[Check overlay conflicts and background downloads]
    H --> I[Test with minimal overlays]
```

| Pattern | Likely cause |
| --- | --- |
| Gets worse over time | Thermal saturation |
| Spikes in new zones | Shader compilation or storage streaming |
| Spikes with Discord, recording, or browser video | Overlay or capture overhead |

---

## Crashes and black screens

```mermaid
flowchart TD
    A[Crash or black screen] --> B{Was overclocking, undervolting, or XMP/EXPO changed recently?}
    B -- Yes --> C[Revert the latest change to stock]
    C --> D[Re-test the game and check WHEA errors]
    B -- No --> E{Was the GPU driver recently updated?}
    E -- Yes --> F[Roll back to the previous known-stable driver]
    F --> F1[Use a clean driver install only if rollback fails]
    E -- No --> G[Check PSU cables, temperatures, hotspot, and RAM stability]
    G --> H[Run a stress test and a long gaming session]
```

| If this started after… | Do this first |
| --- | --- |
| Curve Optimizer or PBO tuning | Revert to stock and re-test |
| GPU undervolting | Relax the curve or return to defaults |
| A driver update | Roll back first; clean-install only if rollback fails |

---

## High ping and packet loss

```mermaid
flowchart TD
    A[High ping or packet loss] --> B{Are downloads or updates running?}
    B -- Yes --> C[Pause downloads and cloud sync]
    B -- No --> D{Is Wi-Fi weak or unstable?}
    D -- Yes --> E[Test Ethernet or use a better Wi-Fi channel]
    D -- No --> F[Restart the router and check ISP status]
    F --> G[Compare another server or region]
```

| Network issue | First check |
| --- | --- |
| Sudden ping spikes | Background downloads or updates |
| Random packet loss | Wi-Fi quality, Ethernet cable, or router |
| Lag only on one server or region | Server-side routing or load |

> **Note:** Measure ping against the game server region or address you actually play on. A baseline check against `1.1.1.1` does not replace real-game server latency measurement.

---

## No measurable improvement

```mermaid
flowchart TD
    A[No measurable improvement] --> B{Were many settings changed at once?}
    B -- Yes --> C[Roll back and re-test one change at a time]
    B -- No --> D{Was the bottleneck identified correctly?}
    D -- No --> E[Run bottleneck diagnostics again]
    D -- Yes --> F[Keep only changes with a measurable gain]
    F --> G[Document baseline and final results]
```

---

## Safety guardrails

- Do not disable Defender, Firewall, or Windows Update for FPS.
- Do not run unknown scripts.
- Do not stack multiple changes without testing.
- Do not treat a subjective feeling as proof of lower latency.

---

## Next step

[Benchmark Templates](16-benchmark-templates.html)
