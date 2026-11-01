---
layout: doc
title: "Temperatures & Stability"
description: "Check temperatures, throttling, cooling, and system stability before changing performance settings."
lang: en
translation_key: temperatures-stability
permalink: /docs/10-temperatures-stability.html
---


> High FPS is pointless if the PC overheats, throttles, crashes, or reports WHEA errors. Stability and consistent frame times matter more than a few extra frames from aggressive overclocking.

Do not compare temperatures between different CPUs and GPUs directly. Different models use different sensors, limits, power behavior, and boost algorithms. Focus on throttling, clock drops, noise, and stability.

## What to monitor

During gaming or benchmarking, track:

- CPU temperature
- GPU temperature
- GPU hotspot and memory temperature, if available
- SSD temperature
- CPU and GPU clocks
- Power limits and throttling
- CPU and GPU usage
- RAM and VRAM usage
- FPS, 1% lows, and frame times
- WHEA errors

Useful tools:

- HWiNFO
- MSI Afterburner with RivaTuner Statistics Server
- CapFrameX
- OCCT
- SSD, motherboard, or GPU vendor utility

## Fast thermal triage

| Symptom | Check first |
| --- | --- |
| FPS drops over time | CPU and GPU temperatures and clocks after 30–60 minutes |
| Fans suddenly become loud | Thermal limit, fan curve, dust filters |
| Random stutter under load | GPU hotspot, VRAM temperature, power-limit behavior |
| Crashes or WHEA errors after tuning | Overclock, undervolt, XMP/EXPO, temperatures |

---

## Practical temperature thresholds

There is no single safe temperature for every CPU, GPU, hotspot sensor, or SSD. Look up the maximum operating temperature for the exact component in its manufacturer specifications. Use **within 5°C of that published limit for five minutes during a gaming load** as a conservative investigation trigger, not as a universal damage threshold.

| Component | Trigger to investigate | First actions |
| --- | --- | --- |
| CPU | Temperature remains within 5°C of the model's `Tjunction max`/maximum operating temperature, or a thermal-throttling flag appears during a game. | Check cooler/fan operation and mounting, airflow, BIOS tuning, and CPU clocks. Return CPU tuning to stock if the trigger followed a change. |
| GPU | Temperature remains within 5°C of the card's documented thermal target, or the driver/monitoring tool reports thermal limiting with falling clocks. Check core and hotspot separately. | Check GPU fans, dust, case exhaust, power/clock behavior, and any overclock or undervolt. Return tuning to stock before adjusting Windows. |
| SSD | Reported temperature remains within 5°C of the drive's maximum operating temperature, or SMART/monitoring reports thermal throttling. | Check the drive specification, M.2 heatsink and thermal-pad contact, and airflow. Stop sustained write testing until it cools. |

If a sensor reaches its published maximum, a thermal-protection flag stays active, or the PC shuts down, stop the test and let the component cool. Do not rely on an arbitrary internet temperature chart; check [Intel ARK](https://ark.intel.com/), the exact [AMD processor specifications](https://www.amd.com/en/products/processors/desktops/ryzen.html), and the GPU or SSD manufacturer's page for the installed model. A high temperature without throttling or instability does not by itself prove a fault.

---

## Throttling

Throttling is a reduction in clock speed or performance to stay within thermal, power, or current limits.

Typical signs:

- FPS drops after 10–60 minutes of gaming
- Temperature rises while CPU or GPU clocks decrease
- Fans become very loud
- Performance worsens in a hot room
- Results improve after cleaning dust or opening the side panel

What to do:

1. Record temperatures and clocks at the start and end of a session.
2. Check for thermal or power-limit indicators.
3. Clean dust and verify airflow.
4. Configure reasonable fan curves.
5. Ensure the CPU cooler and GPU fans are working.
6. If necessary, reduce power limits or apply a carefully tested undervolt.

---

## CPU temperature

Modern CPUs automatically boost within available thermal, power, and current limits. High temperature alone does not always indicate a fault.

A problem is likely if:

- Temperature constantly reaches its limit
- Clock speed drops significantly
- Stutter, crashes, or reboots appear
- Cooling runs at maximum noise
- Performance degrades over time
- Airflow is poor or the system has not been cleaned for a long time

Check:

- Cooler mounting and mounting pressure
- Protective film removed from a new cooler base
- Thermal paste condition
- CPU fan connected to the correct header
- Case fans and airflow
- Dust in the heatsink
- Airflow blocked by a glass panel, wall, or dense filters

> **Tip:** Do not replace thermal paste too often without a reason. Start with cleaning, fan checks, and proper cooler mounting.

---

## GPU temperature

A GPU can report several separate sensors:

- Core temperature
- Hotspot temperature
- Memory temperature
- VRM temperature
- Power or thermal limit

Common causes of GPU heat issues:

- Dust in the heatsink
- Weak hot-air exhaust from the case
- High ambient room temperature
- An overly quiet fan curve
- Poor heatsink contact after disassembly
- Unstable overclock or undervolt
- Power-limit constraints

What to do:

1. Check GPU temperature, clocks, and load in one game or benchmark.
2. Confirm that GPU fans spin under load.
3. Clean the case and heatsinks.
4. Improve case intake and exhaust airflow.
5. Revert GPU overclocking or undervolting if artifacts, crashes, or driver resets appear.
6. Adjust the fan curve if noise is acceptable.

> **Warning:** Do not disassemble a GPU for thermal paste or pad replacement without experience. Mistakes can damage the card, pads, or warranty seals.

---

## SSD temperature

NVMe SSDs can heat up during game installations, archive extraction, large file copies, and level streaming.

Signs of an issue:

- Sharp stutter during asset loading
- Read or write speed drops after sustained load
- A monitoring utility reports high SSD temperature
- The SSD sits under the GPU without a heatsink and has poor airflow

What to do:

- Use an M.2 heatsink if the motherboard provides one.
- Remove the protective film from the heatsink thermal pad.
- Avoid blocking the SSD with cables or other components.
- Keep free space on the drive.
- Update SSD firmware only through the official vendor utility.

---

## Case airflow

A typical airflow pattern is:

- Front and bottom areas bring in cool air.
- Rear and top areas exhaust hot air.

### Desktop

- Do not place the case tightly against a wall.
- Do not block ventilation openings.
- Clean dust filters regularly.
- Verify the orientation of every fan.
- Do not add fans without an airflow plan; airflow path matters more than fan count.
- Route cables so they do not block airflow or touch fans.

### Laptop

- Use a hard, flat surface.
- Do not game on a bed, blanket, or pillow.
- Keep air intakes unobstructed.
- Use the original power adapter.
- Check the performance profile in the laptop vendor utility.

---

## Memory, CPU, and GPU stability

Validate memory, CPU, and GPU tuning separately.

### XMP or EXPO

Instability can appear as:

- Archive extraction errors
- Game crashes
- BSODs
- Rare freezes
- WHEA errors
- Boot issues after shutdown

### PBO, Curve Optimizer, undervolting, overclocking

Instability can appear as:

- WHEA Logger events
- Crashes under load
- Random reboots
- Rare freezes
- Stress-test errors

### GPU overclocking or undervolting

Instability can appear as:

- Visual artifacts
- Black screens
- Driver resets
- Game crashes
- Hangs
- Issues only in specific demanding games

> **Important:** If a setup passes a benchmark but games crash or WHEA errors appear, it is unstable. Relax the settings or return to stock.

---

## How to test stability

Testing should match the change you made.

For every stress test, record:

- Tool and version used
- Test duration
- Errors reported by the tool
- WHEA events
- Crashes, reboots, or freezes
- Cold-boot behavior after a restart

One short successful test is not enough to approve an overclock. Follow it with a long gaming session and check Event Viewer.

### After RAM tuning

Check:

- Multiple cold boots and restarts
- Games that previously had issues
- A memory stress test
- Absence of WHEA errors
- Absence of archive or installer errors

### After CPU tuning

Check:

- A CPU-heavy game scenario
- A looped benchmark
- A CPU stress test
- Temperatures, clocks, and WHEA errors

### After GPU tuning

Check:

- A demanding game
- A benchmark
- Absence of artifacts
- Driver stability
- GPU temperature and clocks

### Practical sequence

1. Run a short test after each change.
2. If stable, run a long gaming session.
3. Check Event Viewer.
4. Do not apply the next tuning step before validating the previous one.

---

## WHEA errors

WHEA errors are Windows hardware error reports. They may relate to the CPU, RAM, PBO, Curve Optimizer, undervolting, PCIe, GPU, or another component.

Check recent WHEA events:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    ProviderName = 'Microsoft-Windows-WHEA-Logger'
} -MaxEvents 20 |
Select-Object TimeCreated, Id, LevelDisplayName, Message
```

What to do:

1. If errors started after tuning, revert the latest change.
2. Return PBO, Curve Optimizer, undervolting, or XMP/EXPO to stable settings.
3. Check temperatures and power delivery.
4. Re-test.
5. If WHEA errors persist at stock settings, run hardware diagnostics.

---

## Cleaning

Service the PC if:

- Temperature or noise became noticeably worse
- Filters or heatsinks are dusty
- Fans spin poorly
- There is heavy dust inside the case
- The GPU or CPU starts throttling
- The PC has not been cleaned for a long time, especially near carpets, pets, or smokers

### Safe cleaning method

1. Fully shut down the PC.
2. Unplug the power cable.
3. Press the case power button for a few seconds.
4. Open the case.
5. Hold fan blades to prevent them from overspinning.
6. Use compressed air in short bursts.
7. Do not use a vacuum inside the PC; static electricity and mechanical stress can be risky.
8. Reassemble the PC and verify that all cables are connected.

> **Warning:** Do not spray liquids or use wet cleaning inside the case. If you are unsure about laptop or GPU disassembly, use a service center.

---

## When to contact service

Manual tuning will not fix hardware faults. Stop experimenting and seek service if you see:

- Persistent black screens
- Burning smell
- Sparks, crackling, or damaged cables
- A fan that does not spin
- Immediate CPU or GPU overheating under load
- BIOS cannot detect storage
- The PC powers off under load
- Artifacts at stock settings
- WHEA errors or BSODs that persist after returning to stock

Back up important data before further diagnostics.

---

## Checklist

- [ ] Temperatures and clocks are validated under gaming load.
- [ ] There is no thermal throttling, critical power limit, or severe clock drop.
- [ ] Case and dust filters are clean.
- [ ] The airflow path is not blocked.
- [ ] CPU, GPU, and case fans are working.
- [ ] The SSD is not overheating and has free space.
- [ ] XMP/EXPO, PBO, Curve Optimizer, GPU overclocking, and undervolting are tested separately.
- [ ] No WHEA errors, crashes, BSODs, or artifacts appear after tuning.
- [ ] Settings are reverted to stock when fault symptoms appear.

## Verify the result

Log the exact sensor names, component models, room conditions, game or test, driver/BIOS settings, and elapsed time. Compare temperatures, clocks, and throttling indicators at the start and after at least 30 minutes of the same workload. Use the manufacturer limit for the exact part, not a generic chart.

## Rollback

Return the latest CPU, GPU, or memory tuning change to its saved value or stock defaults if temperatures approach the model-specific limit, throttling appears, or stability worsens. Stop the test if a thermal-protection flag remains active or the PC shuts down; do not continue stress testing until the cause is addressed.

## Related guides

- [Find the Bottleneck](02-find-the-bottleneck.html)
- [BIOS and Hardware](03-bios-and-hardware.html)
- [AMD CPU settings](hardware/amd-cpu.html)
- [Intel CPU settings](hardware/intel-cpu.html)
- [What Not To Do](11-what-not-to-do.html)
