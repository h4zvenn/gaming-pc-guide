---
layout: doc
title: "Common Builds"
description: "Reference starting points for common NVIDIA, AMD, and Intel gaming PC configurations."
lang: en
translation_key: common-builds-quick-cards
permalink: /docs/17-common-builds-quick-cards.html
---

> Start fast with safe defaults. Then benchmark and tune per game.

## How to use quick cards

1. Pick your platform card.
2. Apply baseline settings only.
3. Run a benchmark using [Benchmark Templates](16-benchmark-templates.html).
4. Tune one setting at a time.

---

## NVIDIA quick card

### Baseline

| Area | Recommended start |
| --- | --- |
| Windows | Game Mode on, correct refresh rate, clean startup |
| Driver | Stable Game Ready or Studio driver, based on workload |
| In-game | Set graphics first, then an FPS cap |
| Latency | Prefer in-game NVIDIA Reflex, if available |
| Sync | Tune VRR and V-Sync per game |

### First five tweaks to test

1. Change DLSS mode from Quality to Balanced.
2. Set an FPS cap near the stable minimum FPS.
3. Disable extra overlays.
4. Test HAGS on and off.
5. If needed, set per-game power mode to `Prefer maximum performance`.

### Avoid by default

- Global forced Low Latency Mode for all apps.
- Global maximum performance mode for desktop use.
- Random registry or BCD tweaks.

---

## AMD quick card

### Baseline

| Area | Recommended start |
| --- | --- |
| Windows | Game Mode on, correct refresh rate, clean startup |
| Driver | Stable Adrenalin release |
| In-game | Set graphics first, then an FPS cap |
| Latency | Try the in-game latency option first, then Anti-Lag |
| Sync | Tune FreeSync/VRR and the frame cap |

### First five tweaks to test

1. Change FSR or XeSS, if available, from Quality to Balanced.
2. Enable Anti-Lag in a per-game profile.
3. Set an FPS cap for stable frame times.
4. Test Enhanced Sync with your monitor.
5. Remove overlay stacking.

### Avoid by default

- Enabling Anti-Lag, Chill, and multiple sync tweaks at once.
- Blindly copying undervolt curves from other users.

---

## Intel Arc and iGPU quick card

### Baseline

| Area | Recommended start |
| --- | --- |
| Windows | Game Mode on, high-performance GPU assignment |
| Driver | Latest stable Intel graphics driver |
| API | Test DX11, DX12, and Vulkan when the game supports them |
| In-game | Conservative settings and a stable FPS cap |
| Laptop | AC power and vendor performance profile |

### First five tweaks to test

1. Switch API between DX11, DX12, and Vulkan.
2. Change the in-game upscaler mode.
3. Set an FPS cap for consistency.
4. Clean up background apps.
5. Minimize overlays.

### Avoid by default

- Applying many system-level tweaks before checking API and driver behavior.
- Assuming one API is always best for every game.

---

## Fast picks

| Goal | Start here |
| --- | --- |
| More FPS quickly | Lower GPU-heavy settings, use an upscaler, set an FPS cap |
| Better smoothness | Improve 1% lows through background cleanup and thermals |
| Lower perceived latency | Use in-game latency technology and a stable FPS range |
| Better stability | Return to stock clocks, verify drivers, check WHEA errors |

---

## Validation checklist

- [ ] The same test scene is used before and after.
- [ ] Average FPS, 1% lows, and frame times are tracked.
- [ ] No new crashes, WHEA errors, or artifacts appear.
- [ ] Only measurable gains are kept.

---

## Next step

[Optimization Tools Evidence](18-optimization-tools-evidence.html)
