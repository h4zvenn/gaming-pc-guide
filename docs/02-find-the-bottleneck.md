---
layout: doc
title: "Find the Bottleneck"
description: "Identify whether CPU, GPU, memory, storage, thermals, or background activity limits gaming performance."
lang: en
translation_key: find-the-bottleneck
permalink: /docs/02-find-the-bottleneck.html
---

Before changing BIOS options, Windows settings, or driver parameters, identify what actually limits performance: CPU, GPU, memory, storage, thermals, or background load.

A bottleneck is the component or condition that prevents your PC from delivering higher FPS or smoother frame times at a specific moment.

It is not a permanent property of your system. The same PC can be GPU-bound in a graphically demanding game, CPU-bound at low settings, limited by VRAM with high textures, or stutter because of background activity.

> **Important:** There is no universal bottleneck percentage. Diagnostics depend on the game, resolution, settings, FPS cap, and background load.

---

## What to monitor

Use MSI Afterburner with RivaTuner Statistics Server, HWiNFO, CapFrameX, or your GPU driver overlay.

Monitor:

- FPS
- Frame time
- 1% lows
- GPU usage
- GPU temperature
- GPU clocks and power draw
- VRAM usage
- Total CPU usage
- Per-core CPU usage
- CPU temperature and clocks
- RAM usage
- Free SSD space

> **Important:** Measure GPU and CPU balance with the FPS cap removed and V-Sync disabled. A capped or V-Sync-limited GPU can show low usage even when it is still the limiting component. Prefer GPU busy time from PresentMon or CapFrameX over Task Manager percentages.

Do not rely only on average CPU usage. One main game thread can be fully loaded while total CPU usage still looks moderate.

---

## Fast diagnosis

| Symptom | Likely cause | Check first |
| --- | --- | --- |
| GPU usage stays around 95–99% without an FPS cap, but FPS is too low | GPU limit | Resolution, render scale, ray tracing, shadows, upscaling, GPU temperature |
| GPU is not saturated, FPS does not increase, and one CPU core is near 100% | CPU limit | Background tasks, CPU-heavy settings, RAM, CPU temperature |
| Average FPS looks fine, but hard stutter appears | RAM, VRAM, SSD, shaders, or background load | Frame time, memory usage, downloads, WHEA errors, temperatures |
| Performance drops after 20–60 minutes | Thermal throttling or memory saturation | Temperatures, clocks, VRAM and RAM usage, fan behavior |
| Camera movement feels jerky | Uneven frame times, shader compilation, or asset streaming | Frame time, SSD, VRAM, background apps |
| Game crashes, freezes, or the PC reboots | Unstable overclock, driver issue, RAM, power, or thermals | Stock settings, Event Viewer, temperatures |

---

## GPU bottleneck

### Signs

- GPU usage is consistently around 95–99%.
- Lowering resolution or graphics settings clearly increases FPS.
- Ray tracing, shadows, or reflections sharply reduce FPS.
- No single CPU thread is permanently maxed out.

### What to do

1. Reduce the heaviest settings:
   - Ray tracing
   - Resolution or render scale
   - Shadows
   - Reflections
   - Volumetric lighting and fog
   - Ambient occlusion
2. Use DLSS, FSR, or XeSS if available and image quality is acceptable.
3. Do not use texture settings that exceed available VRAM.
4. Check GPU temperature, clocks, and power-limit behavior.
5. Close GPU-heavy apps such as browser video, recording, streaming, and extra overlays.

### What to avoid

- Do not disable Windows services to fix a GPU limit.
- Do not tune CPU settings when the GPU is already pinned at 99%.
- Do not adjust PBO or Curve Optimizer for a clearly GPU-limited game.

---

## CPU bottleneck

### Signs

- GPU usage is lower than expected.
- FPS does not increase when graphics settings are lowered.
- One or more CPU cores stay near 100%.
- The issue is more visible at low resolution or with high FPS targets.

This often happens in games with many objects, physics, NPCs, simulation, or networking logic. It can also appear when streaming, recording, or heavy background apps are running.

### What to do

1. Close heavy apps and overlays.
2. Verify that XMP or EXPO is enabled and stable.
3. Check CPU temperature and throttling.
4. Lower CPU-heavy settings:
   - Draw distance
   - Object density
   - Physics quality
   - NPC and crowd count
   - Shadow distance
   - World detail
5. Set an FPS cap your system can hold steadily.
6. Check WHEA errors if you use overclocking or memory tuning.

### Important nuance

Total CPU usage of 30–50% does not rule out a CPU bottleneck. A game may be limited by one busy thread while other cores are lightly used.

---

## RAM capacity limit

### Signs

- Stuttering appears after a long gaming session.
- Windows heavily uses the page file.
- Disk activity spikes during gameplay.
- RAM usage is close to available capacity.
- Browser, Discord, launchers, streaming, and other apps are open together.

### What to do

1. Close heavy apps before gaming.
2. Disable unnecessary startup apps.
3. Confirm that XMP or EXPO is enabled and stable.
4. Keep the page file enabled unless you have a specific reason to change it.
5. Add more RAM only if your games and background workload genuinely require it.

### What to avoid

Do not use RAM cleaners or forced memory-cleanup tools. They can evict useful cached data and reduce smoothness.

---

## VRAM capacity limit

### Signs

- Sharp stutter appears when rotating the camera or entering new areas.
- Problems begin after increasing texture quality or resolution.
- Frame times become uneven even when GPU usage is not at 99%.
- The game warns about VRAM overuse or nearly fills available VRAM.

### What to do

1. Lower texture quality.
2. Lower resolution or render scale.
3. Disable or reduce ray tracing.
4. Close GPU-heavy apps and overlays.
5. Restart the game after major texture-setting changes.
6. Avoid texture packs that clearly require more VRAM than your GPU has.

> **Note:** In-game VRAM indicators are useful references, but they are not always exact limits. Evaluate them together with frame times, stutter, and monitoring data.

---

## Storage and shader compilation

### Signs

- Short freezes occur when entering new areas or triggering new effects.
- Frame times become uneven after a game or GPU-driver update.
- Disk activity is high during world streaming.
- The game is installed on a slow HDD or nearly full SSD.

### What to do

1. Install modern games on an SSD when possible.
2. Keep enough free space on the SSD.
3. Let shader compilation finish on first launch.
4. Avoid downloads, torrents, cloud sync, and updates while playing.
5. Check drive health with the manufacturer utility or SMART monitoring.

> **Tip:** Not every stutter is fixed by Windows tweaks. Some issues are caused by the game itself, its engine, a patch, or shader compilation behavior.

---

## Overheating and throttling

### Signs

- Performance drops after the game runs for a while.
- CPU or GPU temperature rises and clocks begin to fall.
- Fans become loud and the case gets hot.
- Performance temporarily improves after cleaning dust or opening the side panel.

### What to do

1. Check temperatures and clocks in HWiNFO or MSI Afterburner.
2. Clean dust from filters, fans, and heatsinks.
3. Ensure the case has proper intake and exhaust airflow.
4. Check CPU cooler mounting and thermal paste if overheating persists.
5. Configure a reasonable fan curve.
6. On laptops, use a hard surface, keep air intakes clear, and play while connected to AC power.

> **Important:** High temperature does not always mean a fault. Evaluate clocks, power limits, throttling, noise, and stability together.

---

## System instability

### Signs

- Games or drivers crash.
- You see BSODs, reboots, or black screens.
- Visual artifacts appear.
- Archive extraction or game installation fails.
- WHEA errors appear in Event Viewer.
- Freezes started after enabling XMP, EXPO, PBO, Curve Optimizer, undervolting, or GPU overclocking.

### What to do

1. Return CPU, GPU, and RAM overclocks to stock settings.
2. Test stability without tweaks.
3. Open `Event Viewer → Windows Logs → System` and check WHEA entries.
4. Verify temperatures and power delivery.
5. Test each change in real games and stress tests.

> **Warning:** “Works on the desktop” does not mean “stable in games.” Rare memory errors or Curve Optimizer instability can appear only under specific load patterns.

---

## Diagnostic workflow

1. Remove the FPS cap and V-Sync, then record FPS, 1% lows, frame times, and temperatures.
2. Check GPU busy time, not only Task Manager percentages.
3. If GPU busy time is near 99%, start with graphics settings, resolution, and VRAM.
4. If GPU usage is lower, check CPU cores, RAM, background processes, and CPU temperature.
5. For stuttering, check RAM, VRAM, SSD, shader compilation, and background downloads.
6. If performance degrades over time, check thermals.
7. For crashes or WHEA errors, remove overclocks and investigate stability before applying FPS tweaks.

---

## Next steps

- [BIOS and Hardware](03-bios-and-hardware.html)
- [Drivers and Updates](04-drivers-and-updates.html)
- [Windows 11 Core](05-windows-11.html)
- [GPU Settings](06-gpu-settings.html)
- [Temperatures and Stability](10-temperatures-stability.html)
