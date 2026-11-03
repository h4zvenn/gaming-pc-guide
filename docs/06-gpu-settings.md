---
layout: doc
title: "GPU Settings"
description: "Configure NVIDIA, AMD, and Intel graphics settings for performance, latency, and visual quality."
lang: en
translation_key: gpu-settings
permalink: /docs/06-gpu-settings.html
last_checked: 2026-11-03
applicable_to: Windows 11, Windows 10 (legacy), NVIDIA, AMD, Intel GPU and CPU
---

Configure graphics driver settings per game, not globally. One game may benefit from a setting while another gets bugs, image degradation, or instability.

## Core principle

1. Tune resolution, graphics quality, FPS cap, latency, and upscaling inside the game first.
2. Create a profile for that game in the NVIDIA, AMD, or Intel control panel.
3. Change one setting at a time.
4. Measure FPS, 1% lows, frame times, image quality, and stability.

> **Important:** A driver panel does not create performance from nothing. It helps use available GPU power correctly, reduce latency in suitable scenarios, and avoid conflicting settings.

---

## Fast setup order

| Order | Action |
| --- | --- |
| 1 | Set in-game resolution and quality |
| 2 | Choose an upscaler mode: Quality, Balanced, or Performance |
| 3 | Set an FPS cap for stable frame times |
| 4 | Tune VRR and V-Sync behavior |
| 5 | Apply only one driver tweak at a time |

---

## Settings for any GPU

### Resolution and render scale

- Native monitor resolution usually gives the sharpest image.
- Lowering resolution or render scale reduces GPU load and can increase FPS.
- If the game supports DLSS, FSR, or XeSS, compare Quality, Balanced, and Performance modes first.
- Avoid the most aggressive scaling mode unless you need the extra FPS; image quality can drop noticeably.

### Textures and VRAM

Texture quality is often limited by VRAM capacity.

- If VRAM is nearly full and stutter appears, reduce texture quality.
- Do not use texture packs that exceed your GPU’s VRAM capacity.
- High textures do not always reduce average FPS, but they can cause stutter when VRAM is insufficient.

### GPU-heavy settings

If the system is GPU-bound, test these settings first:

- Ray tracing
- Path tracing
- Resolution or render scale
- Shadows
- Reflections
- Volumetric lighting and fog
- Ambient occlusion
- Draw distance
- Hair, grass, particle, and water quality

You do not need to set everything to Low. Reduce settings that cost a lot of FPS but have a small visible impact.

---

## FPS cap

Frame limiting can improve frame-time consistency and reduce heat, noise, and power consumption.

### Where to cap FPS

Use this priority:

1. In-game FPS limiter.
2. GPU driver limiter.
3. RTSS, if you need precise external limiting and understand its behavior.

### How to choose a value

- If FPS is unstable, cap it to a value the system can sustain in demanding scenes.
- If you use VRR, tune the FPS cap after configuring VRR and V-Sync.
- Do not set a cap above what the system can maintain just to see a higher number in an overlay.

Example:

```text
The system produces 180–260 FPS but often drops to 165 FPS.
A 165 or 170 FPS cap may provide smoother frame times than uncapped fluctuations.
```

> **Note:** There is no universal perfect FPS cap. It depends on monitor refresh rate, VRR, game behavior, system performance, and personal preference.

---

## V-Sync, VRR, G-SYNC, and FreeSync

### V-Sync

V-Sync synchronizes frame output with the monitor refresh rate. It can remove tearing, but may increase latency and limit FPS.

### VRR

VRR means Variable Refresh Rate. It may be branded as:

- NVIDIA G-SYNC or G-SYNC Compatible
- AMD FreeSync
- Adaptive-Sync

VRR helps smooth motion when FPS varies within the monitor’s VRR range.

### How to test

- Enable VRR in the monitor’s on-screen display.
- Enable the corresponding setting in the GPU driver.
- Test the game with V-Sync on and off.
- Tune the FPS cap and V-Sync combination for your monitor and game.

| Goal | V-Sync | VRR | FPS cap | What to compare |
| --- | --- | --- | --- | --- |
| Lowest latency | Off | Off | Test uncapped against a sustainable cap | P99 frame time, tearing, subjective input feel |
| Smoothest motion | On in the driver; off in game if the game has its own option | On | Slightly below the monitor’s maximum refresh rate | Frame time, VRR range, flicker, subjective smoothness |

These are starting points, not universal settings. Confirm your monitor’s VRR range and current driver behavior before keeping a profile.

> **Warning:** V-Sync, VRR, and FPS-cap settings affect smoothness, tearing, and latency at the same time. There is no single best mode for every monitor and game.

---

## Vendor-specific settings

Use the guide for your GPU vendor for control-panel features, driver tools, and vendor-specific rollback steps.

| GPU vendor | Guide |
| --- | --- |
| NVIDIA | [NVIDIA GPU settings](hardware/nvidia.html) |
| AMD | [AMD GPU settings](hardware/amd.html) |
| Intel | [Intel GPU settings](hardware/intel-gpu.html) |

Keep driver changes per game and start with defaults. Do not force global latency, synchronization, power, or image-quality overrides without a specific test.

---

## Upscalers and Frame Generation

### DLSS, FSR, and XeSS

These upscaling technologies can increase FPS by rendering internally at a lower resolution.

Test in this order:

1. Native resolution
2. Quality
3. Balanced
4. Performance, if FPS is still insufficient

Compare:

- FPS and 1% lows
- Fine-detail sharpness
- Motion quality
- Artifacts on thin objects, foliage, hair, and UI

### Frame Generation

Frame Generation can increase displayed FPS, but it does not replace sufficient base performance. Its effect on latency must be measured with suitable hardware or software; do not judge it only by the FPS counter.

Before enabling Frame Generation:

- Achieve solid native or base FPS.
- Enable available in-game latency reduction.
- Evaluate image quality and responsiveness yourself.
- Do not judge the result only by the FPS overlay.

> **Important:** Frame Generation is mainly useful for visual smoothness in compatible games. It does not fix a CPU bottleneck, stutter, overheating, or instability.

---

## GPU issue diagnostics

If you have stutter, crashes, or clock drops, check:

- GPU temperature
- GPU hotspot and memory temperature, if sensors are available
- Clock behavior and power limits
- VRAM usage
- Driver version
- Overclock or undervolt status
- GPU power delivery
- Overlays, recording software, and browser video
- Stability in another game or benchmark

For artifacts, black screens, or crashes, return the GPU to stock settings first. Do not try to fix an unstable undervolt with new Windows tweaks.

---

## Verify the result

- [ ] Graphics are tuned in-game first.
- [ ] Driver settings use a per-game profile.
- [ ] A reasonable FPS cap is selected.
- [ ] VRR and V-Sync are tested on the specific monitor and game.
- [ ] Reflex is enabled in-game when supported.
- [ ] AMD features are enabled one at a time and validated.
- [ ] Texture quality matches available VRAM.
- [ ] The upscaler is chosen based on FPS and image quality, not only the FPS number.
- [ ] Frame Generation is not used as a substitute for solid base performance.
- [ ] There is no unstable overclock, overheating, or conflicting overlay.

Compare at least three runs of the same game scene. Keep a setting only when performance, image quality, and stability meet your goal.

## Rollback

Restore the last known-good per-game profile or the specific setting changed. If artifacts, driver resets, crashes, or thermal warnings appear, return the GPU to stock settings before testing Windows changes.

## Related guides

- [NVIDIA GPU settings](hardware/nvidia.html)
- [AMD GPU settings](hardware/amd.html)
- [Intel GPU settings](hardware/intel-gpu.html)
- [Background Apps](07-background-apps.html)
- [Benchmark Templates](16-benchmark-templates.html)
