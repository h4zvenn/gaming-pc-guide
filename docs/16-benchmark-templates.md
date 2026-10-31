---
layout: doc
title: "Benchmark Templates"
description: "Measure performance changes with repeatable tests and record results before and after optimization."
lang: en
translation_key: benchmark-templates
permalink: /docs/16-benchmark-templates.html
---

If it is not measured, it is not optimization.

Use the same game build, settings, scene, and measurement method before and after every change. A tweak is proven only when the result is repeatable.

> **Important:** Do not compare 1% low values produced by different tools or definitions. Choose one tool, one version, and one metric definition for the entire comparison.

## Metrics to record

| Metric | Definition | Notes |
| --- | --- | --- |
| Average FPS | Frames rendered divided by capture duration | Do not average per-second FPS values from different runs |
| 1% low | FPS calculated from the 99th-percentile frame time: `1000 / P99(frame time in ms)` | Some tools report the mean of the slowest 1% of frames instead; record which definition you use |
| 0.1% low | Same calculation at the 99.9th-percentile frame time | More sensitive to single long frames |
| P99 frame time | 99th-percentile frame time in milliseconds | Keep it in milliseconds; do not convert it back to FPS |
| GPU busy | Time the GPU spends processing frames | Prefer PresentMon or CapFrameX over Task Manager usage |
| CPU core saturation | A specific core or thread staying near 100% | Total CPU usage can look low while one game thread is saturated |

---

## Test conditions

Write down these details before the first run:

- Game build, patch, and server region
- GPU driver version and Windows build
- Resolution, render scale, graphics preset, and every changed setting
- FPS cap, V-Sync, and VRR state
- Overlays, recording software, and monitoring tools
- Power plan or laptop performance profile
- Whether the system was cold or already warmed up

If any of these conditions change between runs, the comparison is invalid.

---

## Run protocol

1. Use the same scene, route, replay, or demo for every run.
2. Warm up for 5–10 minutes so shaders and caches settle.
3. Run at least 3 passes; use 5 passes for noisy scenes or crowded multiplayer maps.
4. Keep raw frame-time logs, not only the summary screen.
5. Report the median and the minimum–maximum range, not only the best run.
6. If the first run differs because of shader compilation, exclude it consistently from both baseline and test runs.
7. Change only one setting between the baseline and test runs.

> **Note:** A single 5-minute run is a smoke test, not proof. Stability claims require a longer session and separate checks for WHEA errors, crashes, and driver resets.

---

## Quick A/B test

Use this template when testing one tweak.

```text
Game / patch:
Map / scene / demo:
Resolution / preset:
FPS cap / V-Sync / VRR:
GPU driver / Windows build:
Tool and version:
1% low definition:

Tweak tested:

Baseline median:
  Average FPS:
  1% low:
  0.1% low:
  P99 frame time:
  GPU busy:
  CPU core saturation:
  CPU temperature:
  GPU temperature:

Test median:
  Average FPS:
  1% low:
  0.1% low:
  P99 frame time:
  GPU busy:
  CPU core saturation:
  CPU temperature:
  GPU temperature:

Run-to-run spread:
New crashes / WHEA errors / artifacts:
Verdict: Keep / Rollback / Inconclusive
Reason:
```

---

## Multi-run results

Use this table for baseline and test runs.

| Run | Avg FPS | 1% low | 0.1% low | P99 frame time | CPU temp | GPU temp | Notes |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| Baseline 1 | | | | | | | |
| Baseline 2 | | | | | | | |
| Baseline 3 | | | | | | | |
| Test 1 | | | | | | | |
| Test 2 | | | | | | | |
| Test 3 | | | | | | | |

> **Tip:** Report the median of each column and the run-to-run range. A change smaller than the baseline range is not a proven improvement.

---

## Long-session stability

Use this template when checking whether performance drops over time.

| Time | Avg FPS | 1% low | CPU clock | GPU clock | CPU temp | GPU temp | Stutter |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| 0–5 min | | | | | | | |
| 15–20 min | | | | | | | |
| 30–35 min | | | | | | | |
| 45–50 min | | | | | | | |

Also record WHEA events, driver resets, crashes, and visual artifacts for the entire session.

---

## Input latency and sync

Use this template for Reflex, Anti-Lag, V-Sync, VRR, and FPS-cap comparisons.

| Setup | Avg FPS | 1% low | P99 frame time | Tearing | Subjective input score | Keep |
| --- | ---: | ---: | ---: | --- | ---: | --- |
| Base | | | | | | |
| Reflex or Anti-Lag | | | | | | |
| FPS cap | | | | | | |
| V-Sync or VRR tuning | | | | | | |

> **Important:** Input latency in milliseconds requires hardware such as LDAT or NVIDIA Reflex Analyzer. Without it, mark the result as subjective and do not publish a millisecond claim.

For a subjective comparison, hide which configuration is active, alternate A/B/A/B, and use the same scene. A 1–5 score is a preference, not a measurement.

---

## Verdict rules

| Result | Decision |
| --- | --- |
| Improvement is inside the run-to-run range | Inconclusive; do not treat it as a proven gain |
| Average FPS improves, but 1% lows or stutter worsen | Roll back |
| Average FPS is unchanged, but 1% lows and frame times improve | Keep only if the result is repeatable |
| FPS improves, but crashes, WHEA errors, or artifacts appear | Roll back immediately |
| Result is better in a benchmark but worse in the real game | Prefer the real-game result |
| No performance change, but the setting is required for a feature | Keep it for functionality, not as a performance claim |

---

## Evidence policy

Use these source levels:

1. **Primary:** Microsoft Learn or Support, NVIDIA, AMD, Intel, game developer or publisher documentation, patch notes, and hardware vendor manuals.
2. **Secondary:** Established technical publications and vendor-adjacent testing resources.
3. **Community:** Forums, Reddit, YouTube, and screenshots. Use them only as hypotheses to test, never as proof.

For every recommendation, record:

- Source link and access date
- Software, driver, Windows, or game version
- Applicability: desktop or laptop, GPU vendor, VRR, anti-cheat, game patch
- Rollback path
- Status: `verified`, `needs verification`, or `deprecated`

Do not publish “up to +X% FPS” claims without your own reproducible measurement. Do not present patch-specific behavior as a permanent rule.

Third-party tools are covered in [Optimization Tools Evidence](18-optimization-tools-evidence.html).

---

## Keep or rollback checklist

- [ ] Metrics and tool definitions are recorded.
- [ ] The same scene, patch, driver, settings, and overlays were used.
- [ ] At least 3 runs per configuration were captured.
- [ ] Median and range are reported, not only the best result.
- [ ] 1% lows did not regress beyond the run-to-run range.
- [ ] Frame times and subjective smoothness are reported separately.
- [ ] No crash, WHEA error, BSOD, driver reset, or artifact appeared.
- [ ] Temperatures and noise remain acceptable.
- [ ] The change has a documented rollback path.

---

## Next step

[Common Builds Quick Cards](17-common-builds-quick-cards.html)
