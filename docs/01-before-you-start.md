# 01. Preparation Before Optimization

> Do not start with disabling services, registry edits, or overclocking.
> First, ensure rollback options exist, verify your current PC state, and record baseline results.

## What to do first

Before optimization:

- Create a Windows restore point
- Check temperatures and clocks
- Verify monitor refresh rate is correct
- Record current FPS, 1% low, and frametime
- Check free SSD space
- Confirm system stability before tuning

### Quick win table

| If you only have 10 minutes | Do this first |
|---|---|
| You did not benchmark yet | Record baseline FPS + 1% low |
| You are not sure about system state | Create restore point + check temps |
| Game feels choppy | Verify monitor refresh rate + close heavy background apps |

> [!IMPORTANT]
> Change only one setting at a time.
>
> If you apply many tweaks at once, you cannot tell what actually helped and what caused issues.

---

## Before you change anything

Use this as a mandatory pre-change checklist:

- Record your current settings and baseline metrics before editing anything.
- Save a copy of every config file before you modify it.
- Define rollback steps in advance for each planned change.
- Apply one change at a time, then test and log results.

### Baseline log (minimum)

- Windows version/build
- Game + scene/benchmark used for testing
- Resolution and graphics settings
- Driver version(s)
- Baseline metrics relevant to your issue (FPS/frametime only when relevant)

### Config backup examples

- Export game config or profile files to a dated backup folder.
- Copy current GPU profile/settings before changing global options.
- Save BIOS values you plan to modify as photos/notes first.

### Rollback planning rules

- For each tweak, write: what changed, where, and exact rollback steps.
- Do not rely only on memory when changing multiple areas.
- Do not queue multiple untested changes.

> [!WARNING]
> A Windows restore point is not a full backup of your files.
> It also does not roll back BIOS settings.

---

## 1. Create a restore point

A restore point helps roll back system settings, drivers, and some Windows changes if optimization causes errors, stutter, or app launch issues.

### How to create it

1. Press `Win`.
2. Search for: `Create a restore point`.
3. Open the matching result.
4. Select the system drive, usually `C:`.
5. If protection is off, click `Configure` → `Turn on system protection`.
6. Click `Create`.
7. Name the point, for example:

```text
Before gaming optimization
```

8. Wait for the success message.

> [!NOTE]
> A restore point is not a backup of personal files.
> It is mainly for rolling back system changes.

---

## 2. Check monitor refresh rate

Even a powerful PC will not feel smooth on a 144/165/240 Hz monitor if Windows is set to 60 Hz.

### How to verify

1. Open `Settings`.
2. Go to: `System → Display → Advanced display`.
3. Select the correct monitor if you use multiple displays.
4. Set the highest stable refresh rate.

Examples:

```text
60 Hz
144 Hz
165 Hz
180 Hz
240 Hz
360 Hz
```

> [!WARNING]
> Do not select a refresh rate your monitor/cable cannot handle stably.
> If screen blackout, artifacts, or signal loss appears, revert to a known stable value.

---

## 3. Free up SSD space

An overfilled system drive can hurt update installation, page file behavior, game loading, and overall responsiveness.

### Recommendation

Keep about 15–20% free space on the system SSD.

### Check using PowerShell

Open Windows Terminal or PowerShell and run:

```powershell
Get-PSDrive -PSProvider FileSystem |
Select-Object Name,
@{Name='UsedGB';Expression={[math]::Round($_.Used / 1GB, 1)}},
@{Name='FreeGB';Expression={[math]::Round($_.Free / 1GB, 1)}}
```

### Output meaning

- `Name` — drive letter
- `UsedGB` — used space
- `FreeGB` — free space

> [!TIP]
> Avoid questionable “registry cleaners” just to free space.
> Remove unused games, temporary files, old downloads, and software you do not use.

---

## 4. Record baseline results

Before optimization, you need a clear picture of current behavior.

### What to record

- Average FPS
- 1% low
- Frametime
- GPU usage
- CPU usage
- RAM and VRAM usage
- CPU and GPU temperatures
- CPU and GPU clocks

### Tools you can use

- Built-in game benchmark
- MSI Afterburner + RivaTuner Statistics Server
- HWiNFO
- CapFrameX
- NVIDIA App / AMD Software overlay

### Correct test method

1. Use one game or one benchmark.
2. Do not change resolution, graphics settings, or driver between runs.
3. Test the same scene.
4. Run 2–3 passes.
5. Record the average result.

Sample note:

```text
Date: 22.08.2026
Game / benchmark: __________
Resolution: __________
Graphics settings: __________
Average FPS: __________
1% low: __________
CPU temperature: __________
GPU temperature: __________
Change: Before optimization
```

> [!IMPORTANT]
> Average FPS is not the only metric.
> If average FPS barely changes but 1% low improves and frametime is smoother, the optimization may still be useful.

---

## 5. Check basic PC info

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

> [!NOTE]
> Commands in this section are diagnostic only; they do not change Windows settings.
> On GitHub, code blocks can be copied with the **Copy** button.

---

## 6. Check for obvious system issues

Before fine-tuning, fix real hardware/software problems first.

Check that:

- Monitor is connected to the discrete GPU, not motherboard video output
- CPU/case fans are working
- GPU receives proper power
- SSD is not nearly full
- There is no severe overheating or throttling
- There are no constant crashes, BSODs, or random reboots
- No heavy downloads/streams/updates/VMs are running during tests
- Windows is set to the actual monitor refresh rate

If the PC is unstable at stock settings, do not proceed with PBO, Curve Optimizer, XMP/EXPO, undervolt, or manual overclocking. Find and fix root cause first.

---

## Summary

You now have:

- A restore point
- Baseline performance metrics
- Component information
- Visibility into temperatures and likely issues
- A way to compare each change reliably

Next step: [Find the bottleneck: CPU, GPU, RAM, VRAM, SSD, or thermals](02-find-the-bottleneck.md).
