---
layout: doc
title: "16-benchmark-templates"
---

# 16. Benchmark Templates and Measurement Rules

> If it is not measured, it is not optimization.

## 1. Define the metrics before testing

A number without a definition is not evidence. Record which tool produced each metric and how that tool defines it.

| Metric | Working definition | Notes |
|---|---|---|
| Average FPS | Frames rendered divided by capture duration | Do not average per-second FPS values from different runs |
| 1% low | FPS derived from the 99th percentile frametime: `1000 / P99(frametime_ms)` | Some tools report the mean of the slowest 1% of frames instead; state which definition was used |
| 0.1% low | Same calculation at the 99.9th frametime percentile | More sensitive to single long frames |
| p99 frametime | 99th percentile frame time in milliseconds | Keep it in ms; do not convert back to FPS |
| GPU busy | Time the GPU is busy processing frames | Prefer PresentMon or CapFrameX over a Task Manager percentage |
| CPU core saturation | A specific core/thread staying near 100% | Total CPU usage can look low while one game thread is saturated |

> [!IMPORTANT]
> Do not compare 1% low values produced by different tools or different definitions. Pick one tool, one version, and one definition for the whole comparison.

---

## 2. Fix the test conditions

Before the first run, write down:

- game build/patch and server region;
- GPU driver version and Windows build;
- resolution, render scale, graphics preset, and every changed setting;
- FPS cap and V-Sync/VRR state;
- overlays, recording, and monitoring tools;
- power plan and laptop performance profile;
- ambient temperature and whether the system was cold or warm.

If any of these change between runs, the comparison is invalid.

---

## 3. Run protocol

1. Use the same scene, route, replay, or demo for every run.
2. Warm up for 5–10 minutes so shaders and caches settle.
3. Run at least 3 passes; use 5 for noisy scenes or crowded multiplayer maps.
4. Keep raw frametime logs, not only the summary screen.
5. Report the median and the min–max range. Do not report only the best run.
6. If the first run is visibly different because of shader compilation, mark it and exclude it consistently from both baseline and test.
7. Do not change more than one experimental variable between baseline and test.

> [!NOTE]
> A single 5-minute run is a smoke test, not proof. Stability claims need a longer session and a separate check for WHEA, crashes, and driver resets.

---

## 4. Template A — Quick A/B test (single tweak)

```text
Game / patch:
Map / scene / demo:
Resolution / preset:
FPS cap / V-Sync / VRR:
GPU driver / Windows build:
Tool and version:
Metric definition (1% low):

Tweak tested:
Baseline runs (median):
  Avg FPS:
  1% low:
  0.1% low:
  p99 frametime:
  GPU busy:
  CPU core saturation:
  CPU temp / GPU temp:

After runs (median):
  Avg FPS:
  1% low:
  0.1% low:
  p99 frametime:
  GPU busy:
  CPU core saturation:
  CPU temp / GPU temp:

Run-to-run spread:
New crashes / WHEA / artifacts:
Verdict (Keep / Rollback / Inconclusive):
Reason:
```

---

## 5. Template B — Multi-run table

| Run | Avg FPS | 1% low | 0.1% low | p99 frametime | CPU Temp | GPU Temp | Notes |
|---|---:|---:|---:|---:|---:|---:|---|
| Baseline #1 |  |  |  |  |  |  |  |
| Baseline #2 |  |  |  |  |  |  |  |
| Baseline #3 |  |  |  |  |  |  |  |
| Tweak #1 |  |  |  |  |  |  |  |
| Tweak #2 |  |  |  |  |  |  |  |
| Tweak #3 |  |  |  |  |  |  |  |

> [!TIP]
> Report the median of each column and the range. A change that is smaller than the baseline range is not proven.

---

## 6. Template C — Session stability (30–60 minutes)

Use this when FPS drops over time.

| Time mark | Avg FPS | 1% low | CPU Clock | GPU Clock | CPU Temp | GPU Temp | Stutter? |
|---|---:|---:|---:|---:|---:|---:|---|
| 0–5 min |  |  |  |  |  |  |  |
| 15–20 min |  |  |  |  |  |  |  |
| 30–35 min |  |  |  |  |  |  |  |
| 45–50 min |  |  |  |  |  |  |  |

Also record WHEA events and driver resets for the whole session.

---

## 7. Template D — Input-latency and sync A/B

For Reflex/Anti-Lag/V-Sync/VRR/FPS-cap combinations.

| Setup | Avg FPS | 1% low | p99 frametime | Tearing (yes/no) | Subjective input score (1–5) | Keep? |
|---|---:|---:|---:|---|---:|---|
| Base |  |  |  |  |  |  |
| + Reflex/Anti-Lag |  |  |  |  |  |  |
| + FPS cap |  |  |  |  |  |  |
| + V-Sync/VRR tune |  |  |  |  |  |  |

> [!IMPORTANT]
> Input latency in milliseconds requires a tool such as LDAT or NVIDIA Reflex Analyzer. Without one, mark the result as subjective and do not publish a millisecond claim.

For a subjective comparison, hide which configuration is active, alternate A/B/A/B, and use the same scene. A 1–5 score is a preference, not a measurement.

---

## 8. Verdict rules

| Result pattern | Decision |
|---|---|
| Improvement is inside the run-to-run range | Inconclusive; do not keep it as a proven gain |
| Avg FPS +2, 1% low −10, more stutter | Rollback |
| Avg FPS unchanged, 1% low better, frametime smoother | Keep only if the change is repeatable |
| Better FPS but crashes/WHEA/artifacts | Rollback immediately |
| Better only in a benchmark, worse in the real game | Prefer the real-game result |
| No change, but the setting is required for a feature you use | Keep for functionality, not as a performance claim |

---

## 9. Source and evidence policy

Use three levels:

1. **Primary:** Microsoft Learn/Support, NVIDIA/AMD/Intel documentation, game developer/publisher support and patch notes, motherboard/SSD vendor manuals.
2. **Secondary:** established technical publications and vendor-adjacent testing resources. Mark them as secondary.
3. **Community:** forums, Reddit, YouTube, and screenshots. Use only as a hypothesis to test, never as proof.

For every recommendation, record:

- source link and access date;
- software, driver, Windows, or game version;
- applicability (desktop/laptop, GPU vendor, VRR, anti-cheat, game patch);
- rollback path;
- status: `verified`, `needs-verification`, or `deprecated`.

Do not publish “up to +X% FPS” without your own reproducible measurement. Do not present a patch-specific behavior as a permanent rule.

Third-party tool entries live in [18 Optimization tools evidence](18-optimization-tools-evidence.md).

---

## 10. “Keep or rollback” checklist

- [ ] Metrics and tool definitions are written down.
- [ ] The same scene, patch, driver, settings, and overlays were used.
- [ ] At least 3 runs per configuration were captured.
- [ ] Median and range are reported, not only the best result.
- [ ] 1% low did not regress beyond the run-to-run range.
- [ ] Frametime and subjective smoothness are reported separately.
- [ ] No crash, WHEA, BSOD, driver reset, or artifact appeared.
- [ ] Temperatures and noise remain acceptable.
- [ ] The change has a documented rollback path.

Back to main guide: [README](../README.md).
