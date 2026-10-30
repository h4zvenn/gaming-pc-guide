# 14. Quick-Start Presets by PC Tier

> Want fast results without random tweaking? Pick your tier, follow one preset, benchmark, then adjust.

## How to use presets

1. Pick the closest hardware tier.
2. Apply only the listed steps.
3. Benchmark with the template from [16 Benchmark templates](16-benchmark-templates.md).
4. Keep only changes that improve FPS/1% low/frametime without instability.

> [!IMPORTANT]
> One preset at a time. Do not mix all presets in one session.
>
> A preset is an ordered checklist, not a batch script. Apply one row, verify it in the same scene, then continue. If a row changes several inseparable settings, treat the whole row as one experiment and record it.

---

## Preset A — Entry-level / older gaming PC

### Goal

Improve smoothness and 1% low without risky tuning.

### Apply in this order

| Step | Action | Why |
|---|---|---|
| 1 | Set correct monitor refresh rate | Avoid fake 60 Hz bottleneck |
| 2 | Close browser video/downloads/overlays | Free CPU/RAM/GPU headroom |
| 3 | Enable Game Mode | May help Windows prioritize gameplay; effect varies |
| 4 | Set in-game FPS cap to stable floor | Better frametime consistency |
| 5 | Lower heavy GPU options first (RT, shadows, reflections) | Usually a large FPS gain per visual cost in GPU-bound scenes; verify in your game |
| 6 | Use DLSS/FSR/XeSS Quality/Balanced | FPS gain with an image-quality tradeoff; compare |

### Do not do in this preset

- No manual RAM timing tweaks.
- No aggressive undervolt.
- No service disabling.

---

## Preset B — Mid-range gaming PC

### Goal

Balance visual quality and stable high FPS.

### Apply in this order

| Step | Action | Why |
|---|---|---|
| 1 | Check XMP/EXPO is enabled and stable (see [03](03-bios-and-hardware.md)) | Avoid JEDEC baseline in CPU-limited scenes |
| 2 | Enable Above 4G + ReBAR (if supported) | Potential uplift in some titles |
| 3 | Update chipset + stable GPU driver | Better compatibility/perf consistency |
| 4 | Test HAGS and Windowed Optimizations | Keep whichever performs better |
| 5 | Tune per-game GPU profile | Avoid global conflicts |
| 6 | Validate thermals under long session | Prevent performance drop over time |

### Do not do in this preset

- No global “max performance” for all apps.
- No all-in-one optimizer scripts.

---

## Preset C — High-end / high-refresh target

### Goal

Maximize consistency at high FPS (165–360 Hz class).

### Apply in this order

| Step | Action | Why |
|---|---|---|
| 1 | Confirm CPU/GPU clocks are stable under load | Remove hidden throttling |
| 2 | Tune FPS cap around real stable range | Smoother frametime than uncapped spikes |
| 3 | Tune VRR + V-Sync behavior per game | Better smoothness/latency balance |
| 4 | Use low-latency in-game options (Reflex/Anti-Lag) | May reduce latency; measure it or treat the result as subjective |
| 5 | Remove overlay stacking | Reduce capture/overlay conflicts |
| 6 | Run WHEA check after tweaks | Catch hidden instability early |

### Do not do in this preset

- No copied CO/PBO values from random videos.
- No stability assumptions from one benchmark pass.

---

## Preset D — Gaming laptop (performance + thermals)

### Goal

Keep stable FPS while controlling heat and noise.

### Apply in this order

| Step | Action | Why |
|---|---|---|
| 1 | Play on AC power, performance profile on | Prevent battery power limits |
| 2 | Force game to high-performance GPU | Avoid iGPU bottleneck |
| 3 | Clean startup/background load | Preserve thermal budget |
| 4 | Cap FPS to sustainable level | Lower heat spikes |
| 5 | Check intake vents and surface | Prevent thermal choking |
| 6 | Validate temps after 30–60 min session | Detect thermal fade |

### Do not do in this preset

- No gaming on soft surfaces.
- No blind fan-service removal.

---

## Fast “what preset should I choose?”

| If your problem is… | Start with |
|---|---|
| Low FPS in heavy scenes | Preset A or B |
| Stutter after long sessions | Preset D or C |
| Random crashes after tuning | Stop presets, run [10 Temperatures and stability](10-temperatures-stability.md) |
| Unclear bottleneck | Start from [02 Find the bottleneck](02-find-the-bottleneck.md) |

---

## Validation checklist

- [ ] Used one preset only.
- [ ] Measured before/after with same scene.
- [ ] Compared FPS + 1% low + frametime.
- [ ] No new crashes/WHEA/BSOD.
- [ ] Rolled back changes that made results worse.

Next step: [15 Troubleshooting decision trees](15-troubleshooting-decision-trees.md).
