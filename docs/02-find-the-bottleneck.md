---
layout: doc
title: "02-find-the-bottleneck"
---

# 02. Finding the Bottleneck

> Before changing BIOS options, Windows settings, or driver parameters, identify what actually limits performance: CPU, GPU, memory, storage, thermals, or background load.

## What a bottleneck means

A `bottleneck` is the component or condition that, at a specific moment, prevents your PC from delivering higher FPS or smoother frametime.

It is not a permanent property of the system. The same PC can:

- be GPU-bound in a graphically heavy game;
- be CPU-bound at low settings with very high FPS targets;
- run into VRAM limits with high texture settings;
- stutter due to a full SSD, background processes, or unstable RAM.

> [!IMPORTANT]
> There is no universal bottleneck percentage.
> Diagnostics depend on the game, resolution, settings, FPS cap, and background load.

---

## What to monitor

Use MSI Afterburner + RivaTuner Statistics Server, HWiNFO, CapFrameX, or your GPU driver overlay.

During testing, monitor:

- FPS
- Frametime
- 1% low
- GPU usage
- GPU temperature
- GPU clocks and power draw
- VRAM usage
- Total CPU usage
- Per-thread CPU usage
- CPU temperature and clocks
- RAM usage
- Used/free SSD space

> [!IMPORTANT]
> Measure GPU/CPU balance with the frame cap removed and V-Sync off. A capped or V-Sync-limited GPU can show low usage even when it is still the limiting component. Prefer GPU busy time from PresentMon or CapFrameX over a Task Manager percentage.
>
> Do not rely only on average CPU usage.
> One main game thread can be fully loaded while total CPU usage still looks moderate.

### Fast diagnosis cheat sheet

| You see this | Try this first |
|---|---|
| Low FPS + GPU ~99% | Reduce GPU-heavy settings, test upscaler |
| FPS won’t scale + one CPU thread maxed | Reduce CPU-heavy options, close background apps |
| Stutter with okay average FPS | Check VRAM/RAM/SSD + overlays/downloads |

---

## Quick diagnostic table

| Symptom | Possible cause | Check first |
|---|---|---|
| GPU busy stays around 95–99% with no cap, FPS is too low | GPU limit | Resolution, render scale, RT, shadows, upscaler, GPU temp |
| GPU not saturated, FPS does not increase, one CPU core near 100% | CPU limit | CPU-related settings, background tasks, RAM, CPU temp |
| Average FPS looks fine but hard stutter appears | RAM/VRAM, SSD, shaders, background load, instability | Frametime, memory usage, background downloads, WHEA, temps |
| FPS drops gradually after 20–60 minutes | Thermal or memory saturation | Temps, clocks, VRAM/RAM usage, fan behavior |
| Camera movement feels jerky | Uneven frametime, shader compilation, data streaming | Frametime, SSD, VRAM, background apps |
| PC freezes/reboots or game crashes | Unstable OC, driver issue, RAM, power, thermals | Stock settings, event logs, temperatures |

---

## 1. GPU-bound scenario

### Typical signs

GPU usage is usually around 95–99%, and changing resolution/graphics has a clear FPS impact.

Signs:

- consistently high GPU usage;
- lowering resolution increases FPS;
- enabling ray tracing, heavy shadows, or reflections sharply lowers FPS;
- CPU is not overheating and no single CPU thread is permanently maxed out.

### What to do

1. Reduce the heaviest settings:
   - Ray tracing
   - Resolution or render scale
   - Shadows
   - Reflections
   - Volumetric lighting/fog
   - Ambient occlusion
2. Use DLSS, FSR, or XeSS if available and quality is acceptable.
3. Do not set textures beyond your GPU VRAM capacity.
4. Check GPU temperature, clocks, and power limit behavior.
5. Close GPU-consuming apps: browser video, recording, streaming, extra overlays.

### What not to do

- Do not disable Windows services to fix a GPU limit.
- Do not tune CPU settings when GPU is already pinned at 99%.
- Do not adjust PBO/Curve Optimizer for a game that is clearly GPU-limited.

---

## 2. CPU-bound scenario

### Typical signs

GPU is underutilized, FPS does not scale, and one or more CPU threads are near 100%.

This often happens:

- at low resolution;
- with very high target FPS;
- in games with many objects, physics, NPCs, simulation, or networking logic;
- on older 4-core CPUs;
- when heavy background apps, streaming, or recording are active.

### What to do

1. Close heavy apps and overlays.
2. Verify RAM runs with XMP/EXPO (if supported and stable).
3. Check CPU temperatures and throttling.
4. Lower CPU-heavy game settings:
   - Draw distance
   - Object density
   - Physics quality
   - NPC/crowd count
   - Shadow distance
   - World detail
5. Set a realistic FPS cap your system can hold steadily.
6. Validate CPU/RAM overclock stability and check WHEA errors.

### Important nuance

Total CPU usage at 30–50% does not rule out a CPU bottleneck. A game may be blocked by one busy thread while other cores are lightly used.

---

## 3. RAM capacity limit

### Signs

- The game starts stuttering after a long session.
- Windows heavily uses the page file.
- Disk activity spikes during gameplay.
- Browser, Discord, stream, launchers, and other heavy apps are open together.
- RAM usage is near available capacity.

### What to do

1. Close heavy apps before gaming.
2. Disable unnecessary startup apps.
3. Do not disable the page file without a specific reason.
4. Confirm XMP/EXPO is enabled and memory is stable.
5. If capacity is physically insufficient for your games/tasks, consider adding more RAM.

### What not to do

Do not use “RAM cleaners” or forced memory cleanup tools. They can evict useful cached data and reduce smoothness.

---

## 4. VRAM capacity limit

### Signs

- Sharp stutters when rotating camera or entering new areas.
- Problems start after increasing textures or resolution.
- GPU may not be at 99%, but frametime becomes uneven.
- Game warns about VRAM overuse or nearly fills available VRAM.

### What to do

1. Lower texture quality.
2. Lower resolution or render scale.
3. Disable/reduce ray tracing.
4. Close GPU-heavy apps and overlays.
5. Restart the game after major texture-setting changes.
6. Do not enable texture packs that clearly require more VRAM than your GPU has.

> [!NOTE]
> In-game VRAM indicators are useful references, but not always exact limits. Evaluate together with real stutter, frametime, and monitoring data.

---

## 5. SSD, asset streaming, and shader compilation

### Signs

- Short freezes on first visit to new areas/effects/cutscenes.
- Uneven frametime after a game or GPU driver update.
- High disk activity during world streaming.
- Game installed on a slow HDD or nearly full SSD.

### What to do

1. Install modern games on SSD when possible.
2. Keep free space available on SSD.
3. Let shader compilation finish if the game performs it on first launch.
4. Avoid game downloads, torrents, cloud sync, and updates while playing.
5. Check drive health via vendor utility or SMART monitoring.

> [!TIP]
> Not every stutter is fixed by Windows tweaks. Some issues are in the game itself, its engine, a patch, or shader compilation behavior.

---

## 6. Overheating and throttling

### Signs

- Performance drops after the game runs for a while.
- CPU/GPU temperature rises and clocks begin to fall.
- Fans spin fast and the case gets hot.
- Performance temporarily improves after cleaning or opening the side panel.

### What to do

1. Check temperatures and clocks in HWiNFO or MSI Afterburner.
2. Clean dust from filters, fans, and heatsinks.
3. Ensure case airflow provides proper intake and exhaust.
4. Check CPU cooler mounting and thermal paste condition if suspected.
5. Tune a reasonable fan curve.
6. On laptops, use a hard surface, keep air intakes clear, and play on AC power.

> [!IMPORTANT]
> High temperature does not always mean a fault. Evaluate real clocks, power limits, throttling, noise, and stability together.

---

## 7. System instability

### Signs

- Game or driver crashes.
- BSOD, reboots, black screens.
- Visual artifacts.
- Archive extraction or game install errors.
- WHEA errors in Event Viewer.
- Rare freezes after enabling XMP/EXPO, PBO, Curve Optimizer, undervolt, or GPU OC.

### What to do

1. Return CPU/GPU/RAM overclocks to stock.
2. Verify stability without tweaks.
3. Open `Event Viewer → Windows Logs → System` and check WHEA entries.
4. Verify temperatures and power delivery.
5. After each change, test in real games and stress tests.

> [!WARNING]
> “Works on desktop” does not mean “stable in games”.
> Rare memory errors or Curve Optimizer instability can appear only under specific load patterns.

---

## Diagnostic workflow

Use this order:

1. Remove the FPS cap and V-Sync, then record FPS, 1% low, frametime, and temperatures.
2. Check GPU busy time, not only the Task Manager percentage.
3. If GPU busy is near 99% — start with graphics, resolution, and VRAM.
4. If GPU busy is lower, check CPU cores/threads, RAM, background processes, and CPU temperature.
5. For stutters, check RAM, VRAM, SSD, shader compilation, and background downloads.
6. If performance degrades over time, check thermals.
7. For crashes and WHEA, remove overclocks and investigate instability instead of applying new FPS tweaks.

---

## Summary

Do not apply every tweak from the guide at once. First find the real root cause, then go to the relevant section:

- [BIOS and hardware](03-bios-and-hardware.md)
- [Drivers and updates](04-drivers-and-updates.md)
- [Windows 11](05-windows-11.md)
- [GPU settings](06-gpu-settings.md)
- [Temperatures and stability](10-temperatures-stability.md)
