# 17. Common Builds Quick Cards (NVIDIA / AMD / Intel)

> Start fast with safe defaults. Then benchmark and tune per game.

## How to use quick cards

1. Pick your platform card.
2. Apply baseline settings only.
3. Run benchmark from [16 Benchmark templates](16-benchmark-templates.md).
4. Tune one setting at a time.

---

## NVIDIA quick card

### Baseline

| Area | Recommended start |
|---|---|
| Windows | Game Mode On, correct refresh rate, clean startup |
| Driver | Stable Game Ready / Studio based on workload |
| In-game | Set graphics first, then FPS cap |
| Latency | Prefer in-game NVIDIA Reflex if available |
| Sync | Tune VRR + V-Sync per game |

### First 5 tweaks to test

1. DLSS mode: Quality -> Balanced.
2. FPS cap near stable floor.
3. Disable extra overlays.
4. Test HAGS on/off.
5. If needed, power mode per-game (`Prefer maximum performance`).

### Avoid by default

- Global forced Low Latency Mode for all apps.
- Global max performance for desktop use.
- Random registry or BCD tweaks.

---

## AMD quick card

### Baseline

| Area | Recommended start |
|---|---|
| Windows | Game Mode On, correct refresh rate, clean startup |
| Driver | Stable Adrenalin release |
| In-game | Set graphics first, then FPS cap |
| Latency | Try in-game latency option first, then Anti-Lag |
| Sync | Tune FreeSync/VRR + frame cap |

### First 5 tweaks to test

1. FSR/XeSS (if available) Quality -> Balanced.
2. Anti-Lag per game profile.
3. FPS cap for stable frametime.
4. Enhanced Sync test with your monitor.
5. Remove overlay stacking.

### Avoid by default

- Enabling Anti-Lag + Chill + multiple sync tweaks at once.
- Blind undervolt curves from other users.

---

## Intel Arc / iGPU quick card

### Baseline

| Area | Recommended start |
|---|---|
| Windows | Game Mode On, high-performance GPU assignment |
| Driver | Latest stable Intel graphics driver |
| API | Test DX11 vs DX12 vs Vulkan when game supports it |
| In-game | Conservative settings + stable FPS cap |
| Laptop | AC power and vendor performance profile |

### First 5 tweaks to test

1. API switch (DX11/DX12/Vulkan).
2. In-game upscaler mode.
3. FPS cap for consistency.
4. Background app cleanup.
5. Overlay minimization.

### Avoid by default

- Mixing many system-level tweaks before API/driver checks.
- Assuming one API is always best for every game.

---

## Mixed audience presets (fast picks)

| Goal | Start here |
|---|---|
| More FPS quickly | Lower GPU-heavy settings + upscaler + FPS cap |
| Better smoothness | Improve 1% low via background cleanup + thermals |
| Lower latency feel | In-game latency tech + stable FPS range |
| Better stability | Stock clocks + driver sanity + WHEA check |

---

## Validation mini-checklist

- [ ] Same test scene before/after.
- [ ] Track avg FPS + 1% low + frametime.
- [ ] No new crashes/WHEA/artifacts.
- [ ] Keep only measurable gains.

Back to main guide: [README](../README.md).
