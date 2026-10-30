---
layout: doc
title: "10-temperatures-stability"
---

# 10. Temperatures, Stability, and Maintenance

> High FPS is pointless if the PC overheats, throttles, crashes, or throws WHEA errors. Stability and smooth frametime matter more than a few extra frames from aggressive overclocking.

## What to monitor

During gaming or benchmarking, track:

- CPU temperature;
- GPU temperature;
- GPU hotspot (if sensor is available);
- GPU memory temperature (if sensor is available);
- SSD temperature;
- CPU/GPU clocks;
- power limits and throttling;
- CPU/GPU usage;
- RAM and VRAM usage;
- FPS, 1% low, and frametime;
- WHEA errors.

### Useful tools

- HWiNFO
- MSI Afterburner + RivaTuner Statistics Server
- CapFrameX
- OCCT
- SSD/motherboard/GPU vendor utility

> [!NOTE]
> Do not compare temperatures of different CPUs/GPUs directly. Different models have different sensors, limits, power behavior, and boost algorithms. Focus on throttling, clock drops, noise, and stability.

### Fast thermal triage

| Symptom | First check |
|---|---|
| FPS drops over time | CPU/GPU temp + clocks after 30–60 min |
| Fans suddenly loud | Thermal limit / fan curve / dust filters |
| Random stutter under load | Hotspot/VRAM temp + power limit behavior |

---

## 1. What throttling means

Throttling is clock/performance reduction to stay within thermal, power, or other limits.

### Typical signs

- FPS drops after 10–60 minutes of gaming;
- temperature rises while CPU/GPU clocks decrease;
- fans become very loud;
- performance worsens in a hot room;
- results improve after opening side panel or cleaning dust.

### What to do

1. Open monitoring and record temperatures/clocks at session start and end.
2. Check for thermal throttling / power limit indicators.
3. Clean dust and verify airflow.
4. Tune fan curves.
5. Ensure CPU cooler and GPU fans are working.
6. If needed, reduce power limits or apply careful undervolt after testing.

---

## 2. CPU temperature

Modern CPUs automatically boost within available thermal, power, and current limits. High temperature alone does not always mean a fault.

### Look at combined symptoms

Likely problem if:

- temperature constantly hits limits;
- clock speed drops significantly;
- stutters, crashes, or reboots appear;
- cooling runs at maximum noise;
- performance degrades over time;
- airflow is poor or system was not cleaned for long time.

### What to check

- cooler mounting correctness;
- protective film removed from new cooler base;
- even mounting pressure;
- thermal paste condition;
- CPU fan connected to correct header;
- case fans operation;
- heatsink blocked by dust;
- airflow blocked by glass panel, wall proximity, or dense filters.

> [!TIP]
> Do not replace thermal paste too often without reason. Start with cleaning, fan checks, and proper cooler mounting.

---

## 3. GPU temperature

GPU often has separate sensors:

- Core temperature;
- Hotspot temperature;
- Memory temperature;
- VRM temperature;
- Power limit / thermal limit.

### What can hurt GPU behavior

- dust in heatsink;
- weak hot-air exhaust from case;
- high ambient room temperature;
- overly quiet fan curve;
- poor heatsink contact after disassembly;
- unstable overclock/undervolt;
- power limit constraints.

### What to do

1. Check GPU temperature, clock, and load in one game/benchmark.
2. Confirm GPU fans spin under load.
3. Clean case and heatsinks.
4. Improve case intake/exhaust airflow.
5. Revert GPU OC/undervolt if artifacts, crashes, or driver resets appear.
6. Tune a more suitable fan curve if noise is acceptable.

> [!WARNING]
> Do not disassemble GPU for paste/pad replacement without experience. Mistakes can damage the card, pads, or warranty seals.

---

## 4. SSD temperature

NVMe SSD can heat up during game installs, archive extraction, large copies, and level streaming.

### Signs of issue

- sharp stutters during asset loading;
- read/write speed drops after sustained load;
- utility reports high SSD temperature;
- SSD sits under GPU without heatsink and with poor airflow.

### What to do

- use M.2 heatsink if your board provides one;
- remove protective film from heatsink thermal pad;
- avoid blocking SSD with thick cable/component;
- keep free space on drive;
- check SSD firmware only via official vendor source.

---

## 5. Case airflow

Good airflow usually follows a simple pattern:

- front/bottom case area — cool air intake;
- rear/top area — hot air exhaust.

### Basic recommendations

- Do not place case tightly against a wall.
- Do not block ventilation openings.
- Clean dust filters regularly.
- Verify orientation of each fan.
- Do not add many fans without a clear airflow plan: path matters more than count.
- Route cables so they do not block airflow or touch fans.

### Laptop

- Use a hard, flat surface.
- Do not game on bed/blanket/pillow.
- Keep air intakes unobstructed.
- Use the original power adapter.
- If needed, check performance mode in vendor utility.

---

## 6. Stability of XMP/EXPO, CPU, and GPU settings

Overclock and undervolt must be validated separately.

### Memory: XMP/EXPO

Instability signs:

- archive extraction errors;
- game crashes;
- BSOD;
- rare freezes;
- WHEA;
- boot issues after shutdown.

### CPU: PBO, Curve Optimizer, undervolt, overclock

Instability signs:

- WHEA Logger events;
- crashes under load;
- random reboots;
- rare freezes;
- stress-test errors.

### GPU: overclock / undervolt

Instability signs:

- artifacts;
- black screen;
- driver reset;
- game crashes;
- hangs;
- issues only in specific heavy games.

> [!IMPORTANT]
> If a setup “passes benchmark” but game crashes or WHEA appears, it is unstable. Relax settings or return to stock.

---

## 7. How to test stability

Testing should match what you changed.

### Pass/fail criteria

For each stress test, record:

- the tool and version used;
- the duration;
- errors reported by the tool;
- WHEA events;
- crashes, reboots, or freezes;
- cold boots after reboot.

One short passing pass is not enough to approve an overclock. Follow it with a long gaming session and check the Event Viewer.

### After RAM tuning

Check:

- multiple cold boots/restarts;
- games that previously had issues;
- memory stress test;
- no WHEA;
- no archive/installer errors.

### After CPU tuning

Check:

- CPU-heavy game scenario;
- looped benchmark;
- CPU stress test;
- temperatures, clocks, and WHEA.

### After GPU tuning

Check:

- heavy game;
- benchmark;
- no artifacts;
- driver stability;
- GPU temperature and clocks.

### Practical sequence

1. Run a short test after each step.
2. If stable, run a long gaming session.
3. Check Event Viewer.
4. Do not apply next overclock step before validating previous one.

---

## 8. WHEA errors

WHEA are Windows hardware error reports. They may relate to CPU, RAM, PBO, Curve Optimizer, undervolt, PCIe, GPU, or other components.

### Check via PowerShell

```powershell
Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    ProviderName = 'Microsoft-Windows-WHEA-Logger'
} -MaxEvents 20 |
Select-Object TimeCreated, Id, LevelDisplayName, Message
```

### What to do

1. If errors started after tuning, revert the latest change.
2. Return PBO/Curve Optimizer/undervolt/XMP-EXPO to stable settings.
3. Check temperatures and power.
4. Re-test.
5. If WHEA persists at stock settings, hardware diagnostics are required.

---

## 9. When cleaning is needed

Signs your PC should be serviced:

- temperature or noise became noticeably worse;
- filters/heatsinks are dusty;
- fans spin poorly;
- heavy dust inside case;
- GPU/CPU starts throttling;
- long period without cleaning, especially near carpets, pets, or smokers.

### Safe cleaning method

1. Fully shut down PC.
2. Unplug power cable.
3. Press case power button for a few seconds.
4. Open case.
5. Hold fan blades to prevent overspin from air flow.
6. Use compressed air in short bursts.
7. Do not use vacuum inside PC: static and mechanical stress may be risky.
8. Reassemble and verify all cables are connected.

> [!WARNING]
> Do not spray liquids or use wet cleaning inside the case. If unsure about laptop/GPU disassembly, use a service center.

---

## 10. When to contact service

Manual tuning will not fix hardware faults. Warning signs:

- persistent black screens;
- burning smell;
- sparks/crackling/damaged cable;
- fan not spinning;
- instant GPU/CPU overheating under load;
- BIOS cannot detect storage;
- PC powers off under load;
- artifacts even at stock settings;
- WHEA/BSOD persists after reverting to stock.

Stop experiments, back up important data, and run hardware diagnostics.

---

## Checklist

- [ ] Temperatures and clocks validated under gaming load.
- [ ] No thermal throttling, critical power limit, or severe clock drops.
- [ ] Case and filters cleaned from dust.
- [ ] Airflow path is not blocked.
- [ ] CPU/GPU/case fans are working.
- [ ] SSD is not overheating and has free space.
- [ ] XMP/EXPO, PBO, Curve Optimizer, GPU OC, and undervolt tested separately.
- [ ] No WHEA, crashes, BSOD, or artifacts after tweaks.
- [ ] On fault symptoms, settings reverted to stock.

---

## Summary

A stable, clean, and properly cooled PC is more valuable than aggressive overclocking. First fix overheating, poor airflow, full SSD, and instability. Only then fine-tuning clocks, voltages, and fan curves makes sense.

Next step: [What not to do](11-what-not-to-do.md).
