---
layout: doc
title: "What Not To Do"
description: "Avoid risky debloat scripts, registry hacks, RAM cleaners, and blanket service disabling."
lang: en
translation_key: what-not-to-do
permalink: /docs/11-what-not-to-do.html
---

> Around Windows “optimization,” many tips promise huge FPS gains with one command. In most cases, they either provide no measurable result or create stability, security, anti-cheat, update, and driver issues.

## Core principle

Do not apply a tweak on your main PC if it:

- Promises “+500 FPS”
- Requires disabling dozens of services
- Asks you to run a large script as administrator
- Removes Windows components
- Does not explain each command
- Has no clear rollback path

> **Important:** Good optimization means measurable results, stability, and rollback capability—not the maximum number of disabled features.

---

## Do not use questionable custom Windows builds

Builds with names such as:

```text
Gaming Windows
FPS Boost Windows
Lite OS
Debloated Windows
Ultra Low Latency Build
```

can contain unknown changes:

- Removed Windows components
- Disabled updates and security features
- Unstable service configurations
- Issues with Microsoft Store, Xbox, anti-cheat, and drivers
- Unverified scripts
- Malware or hidden telemetry from the build author

Use official Windows and tune specific areas instead: startup apps, overlays, drivers, power settings, Game Mode, and real background apps.

---

## Do not run unknown scripts

Be especially careful with these file types:

```text
.bat
.cmd
.ps1
.reg
.exe
```

They are often distributed through Discord, Telegram, YouTube descriptions or comments, file-sharing sites, and unknown GitHub repositories.

### Before running any script

1. Open it in Notepad or VS Code.
2. Read every command.
3. Check the author, repository history, and issues or reviews.
4. Create a restore point.
5. Do not run it as administrator if you do not understand the consequences.
6. Do not enter passwords, tokens, or API keys, and do not disable security just to run a script.

### Red flags

- “Antivirus flags it because this tweak is powerful.”
- “Disable Defender before running.”
- “Don’t read the code, just run it.”
- “You must disable SmartScreen and UAC.”
- “Guaranteed +300 FPS on any PC.”
- “Do not update Windows after running this.”

---

## Do not disable core protection

### Microsoft Defender

Permanently disabling protection is not valid optimization. It increases the risk of miners, password stealers, trojans, and infected mods or cracks.

### Windows Firewall

Firewall does not increase FPS or reduce ping by itself. If a game cannot connect, create a rule for the specific trusted app instead of disabling protection globally.

### UAC

UAC warns when an app requests administrator rights. Disabling it makes unwanted system changes easier.

### Windows Update

Do not disable updates permanently. If updates interfere right now, pause them, configure active hours, or wait until the download completes.

See [Services & Security](08-services-and-security.html).

---

## Do not disable services from lists

Lists such as:

```text
Disable 50 Windows services for FPS
Disable 100 services for low input lag
Best services to disable for gaming
```

ignore your system specifics: laptop versus desktop, drivers, network, Bluetooth, audio, VPN, Xbox features, and anti-cheat requirements.

Most services consume almost nothing while idle. Disabling them usually breaks functionality instead of improving FPS.

Find the specific process causing real load. Then disable startup, configure, or uninstall the associated application.

---

## Do not use RAM cleaners

Programs promising:

```text
Free RAM
Memory Cleaner
RAM Optimizer
Boost Memory
```

usually force memory data eviction.

Windows uses free RAM as cache. After aggressive “cleaning,” apps must reload data from disk, which can cause freezes or stutter.

Instead:

- Close heavy browser sessions and unnecessary apps.
- Disable unnecessary startup items.
- Verify whether physical RAM capacity is enough.
- Do not disable the page file without a reason.

---

## Do not disable the page file

The page file is used by Windows and some applications. Fully disabling it can cause:

- Game or app crashes
- Out-of-memory errors
- Issues with BSOD memory dumps
- Instability under high RAM usage

For most users, the best option is:

```text
Page file → Automatically manage paging file size
```

Change it manually only for a specific problem and with a clear understanding of the consequences.

---

## Do not apply timer tweaks blindly

Be careful with advice about:

```text
HPET
bcdedit
useplatformclock
useplatformtick
dynamictick
timer resolution tweaks
MSI mode for all devices
```

These are low-level settings that depend on the Windows version, drivers, and hardware. On one PC they may do nothing; on another, they may worsen frame times, power behavior, stability, or device functionality.

- Do not apply commands based on someone else’s result.
- Do not change multiple BCD parameters at once.
- If already applied, restore defaults first and retest.
- Do not treat such commands as mandatory universal settings.

---

## Do not disable VBS without evaluating risk

Virtualization-based features and kernel protections may affect performance in some scenarios, but they also protect against specific attack classes.

Before changing them:

1. Measure FPS and frame times.
2. Confirm that the issue is actually related to the feature.
3. Create a restore point.
4. Understand which protections you are losing.
5. Measure the result after the change.

If the gain is absent or minimal, keep protection enabled.

---

## Do not copy overclocking values

Do not copy values for:

- Curve Optimizer
- PBO limits
- CPU, SoC, or RAM voltages
- RAM timings
- GPU frequency
- Undervolt curve

from someone else’s video or screenshot. Even identical CPU, GPU, and RAM models have different stability margins.

Signs that settings are bad:

- WHEA errors
- BSODs
- Crashes
- Artifacts
- Reboots
- Archive errors
- Rare freezes
- Performance loss when heated

If any of these appears, relax the settings or return to stock.

---

## Do not edit the registry randomly

The registry stores critical Windows and application settings.

Risky advice often suggests:

- Disabling telemetry through dozens of keys
- Changing `NetworkThrottlingIndex`
- Changing CPU or GPU priorities
- Disabling system features
- Setting unknown QoS values
- Applying “input lag registry packs”

Many tweaks are outdated, no longer work on modern Windows versions, conflict with drivers, or make it unclear which change caused a problem. Rollback without a backup can be difficult.

If a registry change is necessary:

1. Use only a documented tweak for a specific issue.
2. Export the key being changed.
3. Create a restore point.
4. Change one parameter at a time.
5. Record the original value.
6. Validate the result.

---

## Do not misread usage percentages

High GPU usage in a heavy game is usually normal: it means the GPU is being utilized.

High CPU usage can also be normal in CPU-bound scenarios or while background tasks or streaming run.

The problem is not the usage number itself, but:

- Low FPS relative to expectations
- Bad frame times
- Throttling
- Overheating
- Crashes
- RAM or VRAM shortage
- Instability

First identify the bottleneck: [Find the Bottleneck](02-find-the-bottleneck.html).

---

## Do not judge by one metric

“Average FPS increased by 3” does not always mean a tweak is useful.

Always evaluate together:

- Average FPS
- 1% lows
- Frame times
- Latency
- Temperature
- Noise
- Stability
- Image quality

Example:

```text
Average FPS: +2
1% low: -15
GPU temperature: +8°C
Stutters appeared

Result: roll back this tweak.
```

---

## Security checklist

- [ ] Official Windows is used, not an unknown custom build.
- [ ] Unknown scripts are not run as administrator.
- [ ] Defender, Firewall, UAC, and Windows Update are not disabled for FPS.
- [ ] Services are not disabled from generic lists.
- [ ] RAM cleaners are not used.
- [ ] The page file remains on automatic mode unless there is a specific reason.
- [ ] HPET, BCD, and timer tweaks are not applied without diagnostics and a rollback path.
- [ ] The registry is not modified by random packs from the internet.
- [ ] Overclocking and undervolting are tested one parameter at a time.
- [ ] FPS, 1% lows, frame times, and stability are measured.

---

## Next step

[FAQ](12-faq.html)
