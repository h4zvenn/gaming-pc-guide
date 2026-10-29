# 16. Benchmark Templates (Prove Real Gains)

> If it is not measured, it is not optimization.

## Benchmark rules

- Same game build/version.
- Same map/scene/path.
- Same resolution and graphics settings.
- Same overlays/tools each run.
- 2–3 runs minimum.

---

## Template A — Quick A/B test (single tweak)

Copy this block:

```text
Game:
Map/Scene:
Resolution:
Preset:
Driver version:

Tweak tested:
Before:
  Avg FPS:
  1% low:
  Frametime feel:
  CPU temp:
  GPU temp:
After:
  Avg FPS:
  1% low:
  Frametime feel:
  CPU temp:
  GPU temp:

Verdict (Keep/Rollback):
Reason:
```

---

## Template B — Multi-run table

| Run | Avg FPS | 1% low | 0.1% low | CPU Temp | GPU Temp | Notes |
|---|---:|---:|---:|---:|---:|---|
| Baseline #1 |  |  |  |  |  |  |
| Baseline #2 |  |  |  |  |  |  |
| Tweak #1 |  |  |  |  |  |  |
| Tweak #2 |  |  |  |  |  |  |

> [!TIP]
> 1% low and frametime stability usually matter more than tiny average FPS gains.

---

## Template C — Session stability (30–60 min)

Use this when FPS drops over time.

| Time mark | Avg FPS | 1% low | CPU Clock | GPU Clock | CPU Temp | GPU Temp | Stutter? |
|---|---:|---:|---:|---:|---:|---:|---|
| 0–5 min |  |  |  |  |  |  |  |
| 15–20 min |  |  |  |  |  |  |  |
| 30–35 min |  |  |  |  |  |  |  |
| 45–50 min |  |  |  |  |  |  |  |

---

## Template D — Input-latency tuning test

For Reflex/Anti-Lag/V-Sync/VRR/FPS cap combos.

| Setup | Avg FPS | 1% low | Smoothness | Input feel | Tearing | Keep? |
|---|---:|---:|---|---|---|---|
| Base |  |  |  |  |  |  |
| + Reflex/Anti-Lag |  |  |  |  |  |  |
| + FPS cap |  |  |  |  |  |  |
| + V-Sync/VRR tune |  |  |  |  |  |  |

---

## Fast verdict logic

| Result pattern | Decision |
|---|---|
| Avg FPS +2, 1% low -10, more stutter | Rollback |
| Avg FPS unchanged, 1% low better, frametime smoother | Keep |
| Better FPS but crashes/WHEA/artifacts | Rollback immediately |
| Better only in benchmark, worse in real game | Prefer real-game result |

---

## “Keep or rollback” checklist

- [ ] Improvement is repeatable in 2–3 runs.
- [ ] 1% low did not regress hard.
- [ ] Frametime feels smoother or equal.
- [ ] No crash/WHEA/BSOD/artifacts.
- [ ] Temperatures and noise remain acceptable.

Back to main guide: [README](../README.md).
