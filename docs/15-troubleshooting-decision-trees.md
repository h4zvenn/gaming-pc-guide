---
layout: doc
title: "15-troubleshooting-decision-trees"
---

# 15. Troubleshooting Decision Trees

> Fast path: find symptom → follow decision tree → test one fix at a time.

## How to use

- Start from the tree matching your issue.
- Apply one action.
- Re-test the same game scene.
- If no change, move to next branch.

---

## 1) Low FPS tree

```mermaid
flowchart TD
    A[Low FPS] --> B{Uncapped and V-Sync off?}
    B -- No --> B1[Remove FPS cap and V-Sync, re-test]
    B1 --> B
    B -- Yes --> C{GPU busy 95-99%, uncapped?}
    C -- Yes --> D[GPU-bound: lower RT/shadows/reflections]
    D --> E[Test DLSS/FSR/XeSS Quality/Balanced]
    E --> F[Set realistic FPS cap]
    C -- No --> G{One CPU core saturated?}
    G -- Yes --> H[CPU-bound: reduce draw distance/crowd/physics]
    H --> I[Close background apps + overlays]
    G -- No --> J[Check RAM/VRAM usage + SSD free space]
    J --> K[Validate temperatures and throttling]
```

> [!IMPORTANT]
> Measure the first branch with the frame cap removed and V-Sync off. A capped or V-Sync-limited GPU can show low usage even when it is still the limiting component. Prefer GPU busy time from PresentMon or CapFrameX over a Task Manager percentage.

Quick actions table:

| Signal | First fix |
|---|---|
| GPU busy 95-99% with no cap, low FPS | Reduce GPU-heavy settings first |
| GPU not saturated, one CPU core maxed | Reduce CPU-heavy settings + background load |
| Normal average FPS, bad 1% low | Check RAM/VRAM/SSD + shader/loading stutter |

---

## 2) Stutter / bad frametime tree

```mermaid
flowchart TD
    A[Stutter / bad frametime] --> B{Happens after 20-60 min?}
    B -- Yes --> C[Check thermals, clocks, throttling]
    C --> D[Improve airflow / fan curve]
    B -- No --> E{Happens on new area/camera turns?}
    E -- Yes --> F[Likely shader/streaming/VRAM issue]
    F --> G[Lower textures or render scale]
    E -- No --> H[Check overlay conflicts + background downloads]
    H --> I[Test with minimal overlays]
```

Quick actions table:

| Symptom pattern | Likely cause |
|---|---|
| Gets worse over time | Thermal saturation |
| Spikes on new zones | Shader compile / storage streaming |
| Spikes with Discord/recording | Overlay/capture overhead |

---

## 3) Crash / black screen tree

```mermaid
flowchart TD
    A[Crash / black screen] --> B{Recent OC/undervolt/XMP change?}
    B -- Yes --> C[Revert latest tweak to stock]
    C --> D[Re-test game + check WHEA]
    B -- No --> E{Driver recently updated?}
    E -- Yes --> F[Roll back to the previous known-stable driver]
    F --> F1[Clean install only if rollback fails and symptoms match section 5 of 04]
    E -- No --> G[Check PSU cables, temps, hotspot, RAM stability]
    G --> H[Run stress + long game session]
```

Quick actions table:

| If this happened after… | Do this first |
|---|---|
| Curve Optimizer / PBO tweak | Revert and test stock |
| GPU undervolt | Relax curve or return default |
| Driver update | Roll back first; clean install only if rollback fails |

---

## 4) High ping / packet loss tree

```mermaid
flowchart TD
    A[High ping / packet loss] --> B{Downloads/updates running?}
    B -- Yes --> C[Pause downloads/cloud sync]
    B -- No --> D{Wi-Fi signal weak or unstable?}
    D -- Yes --> E[Test Ethernet or better Wi-Fi channel]
    D -- No --> F[Check router reboot + ISP status]
    F --> G[Compare with another server/region]
```

Quick actions table:

| Network issue | First check |
|---|---|
| Sudden ping spikes | Background downloads/updates |
| Random packet loss | Wi-Fi quality / cable / router |
| Region-specific lag | Server-side routing/load |

---

> [!NOTE]
> Measure ping against the game server region or address you actually play on. Baseline connectivity checks such as `1.1.1.1` do not replace real-game server latency measurement.

---

## 5) “No change after optimization” tree

```mermaid
flowchart TD
    A[No measurable improvement] --> B{Changed many settings at once?}
    B -- Yes --> C[Rollback and retest one-by-one]
    B -- No --> D{Bottleneck identified correctly?}
    D -- No --> E[Re-run bottleneck diagnostics]
    D -- Yes --> F[Keep only changes with measurable gain]
    F --> G[Document baseline and final results]
```

---

## Safety guardrails

- Do not disable Defender/Firewall/Update for FPS.
- Do not apply unknown scripts.
- Do not stack multiple changes without testing.

Next step: [16 Benchmark templates](16-benchmark-templates.md).
