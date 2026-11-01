---
layout: doc
title: "Before You Start"
lang: en
translation_key: before-you-start
description: "Create a restore point, record baseline performance, and prepare Windows 11 before optimization."
permalink: /docs/01-before-you-start.html
---


> Do not start by disabling services, editing the registry, or overclocking. First create rollback options, check the current state of the PC, and record baseline results.

## What to do first

Before optimization:

- Create a Windows restore point.
- Check temperatures and clocks.
- Verify the monitor refresh rate.
- Record current FPS, 1% lows, and frame times.
- Check free SSD space.
- Confirm that the system is stable before tuning.

| If you have only 10 minutes | Do this first |
| --- | --- |
| You have not benchmarked yet | Record baseline FPS and 1% lows |
| You are unsure about system state | Create a restore point and check temperatures |
| The game feels choppy | Verify monitor refresh rate and close heavy background apps |

> **Important:** Change only one setting at a time. If you apply many tweaks at once, you cannot tell what helped and what caused issues.

---

## Create a restore point

A restore point can roll back system settings, drivers, and some Windows changes if optimization causes errors, stutter, or app-launch issues.

1. Press `Win`.
2. Search for `Create a restore point`.
3. Open the matching result.
4. Select the system drive, usually `C:`.
5. If protection is off, select `Configure` → `Turn on system protection`.
6. Select `Create`.
7. Name the point:

   ```text
   Before gaming optimization
   ```

8. Wait for the confirmation message.

> **Note:** A restore point is not a backup of personal files. It is mainly for rolling back system changes.

If BitLocker is enabled, save the recovery key before changing BIOS, TPM, Secure Boot, or boot-order settings. A restore point does not replace that key.

---

## Check monitor refresh rate

Even a powerful PC will not feel smooth on a 144, 165, or 240 Hz monitor if Windows is set to 60 Hz.

1. Open `Settings`.
2. Go to `System → Display → Advanced display`.
3. Select the correct monitor if you use multiple displays.
4. Set the highest stable refresh rate.

Common values:

```text
60 Hz
144 Hz
165 Hz
180 Hz
240 Hz
360 Hz
```

> **Warning:** Do not select a refresh rate that your monitor or cable cannot handle stably. If the screen goes black, artifacts appear, or the signal is lost, return to a known stable value.

---

## Check SSD free space

An overfilled system drive can affect Windows updates, page-file behavior, game loading, and overall responsiveness.

Keep enough free space for updates, the page file, and game installations. A practical starting point is 15–20% free space on the system drive, but the exact requirement depends on the SSD model, firmware, and workload.

Check drive space:

```powershell
Get-PSDrive -PSProvider FileSystem |
Select-Object Name,
@{Name='UsedGB';Expression={[math]::Round($_.Used / 1GB, 1)}},
@{Name='FreeGB';Expression={[math]::Round($_.Free / 1GB, 1)}}
```

| Column | Meaning |
| --- | --- |
| `Name` | Drive letter |
| `UsedGB` | Used space |
| `FreeGB` | Free space |

> **Tip:** Avoid questionable registry cleaners just to free space. Remove unused games, temporary files, old downloads, and software you no longer use.

---

## Record baseline results

Before optimization, record how the system performs now.

### What to record

- Average FPS
- 1% lows
- Frame times
- GPU usage
- CPU usage
- RAM and VRAM usage
- CPU and GPU temperatures
- CPU and GPU clocks

### Tools

- Built-in game benchmark
- MSI Afterburner with RivaTuner Statistics Server
- HWiNFO
- CapFrameX
- NVIDIA App or AMD Software overlay

### Test method

1. Use one game or benchmark.
2. Do not change resolution, graphics settings, or drivers between runs.
3. Test the same scene.
4. Warm up for 5–10 minutes, then run at least 3 passes.
5. Report the median and minimum–maximum range, not only the best run.

See [Benchmark Templates](16-benchmark-templates.html) for metric definitions and the full testing protocol.

### Baseline note template

```text
Date:
Game / benchmark:
Resolution:
Graphics settings:
Average FPS:
1% low:
CPU temperature:
GPU temperature:
Change: Before optimization
```

> **Important:** Average FPS is not the only metric. If average FPS barely changes but 1% lows improve and frame times become smoother, the change may still be useful.

---

## Check basic PC information

### Processor

```powershell
Get-CimInstance Win32_Processor |
Select-Object Name, NumberOfCores, NumberOfLogicalProcessors,
CurrentClockSpeed, MaxClockSpeed
```

### GPU and driver

```powershell
Get-CimInstance Win32_VideoController |
Select-Object Name, DriverVersion, CurrentHorizontalResolution,
CurrentVerticalResolution, CurrentRefreshRate
```

### Memory

```powershell
Get-CimInstance Win32_PhysicalMemory |
Select-Object Manufacturer, PartNumber, Capacity, Speed, ConfiguredClockSpeed
```

### Active power plan

```powershell
powercfg /getactivescheme
```

These commands are diagnostic only; they do not change Windows settings.

---

## Check for obvious issues

Before fine-tuning, fix real hardware or software problems.

Check that:

- The monitor is connected to the discrete GPU, not the motherboard video output.
- CPU and case fans are working.
- The GPU receives proper power.
- The SSD is not nearly full.
- There is no severe overheating or throttling.
- There are no constant crashes, BSODs, or random reboots.
- No heavy downloads, streams, updates, or virtual machines are running during tests.
- Windows uses the actual monitor refresh rate.

If the PC is unstable at stock settings, do not proceed with PBO, Curve Optimizer, XMP/EXPO, undervolting, or manual overclocking. Find and fix the root cause first.

---

## Next step

[Find the Bottleneck](02-find-the-bottleneck.html)
