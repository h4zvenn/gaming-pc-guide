---
layout: doc
title: "11-what-not-to-do"
---

# 11. What Not to Do

> Around Windows “optimization” there are many tips promising huge FPS gains with one command. In most cases, they either provide no measurable result or create stability, security, anti-cheat, update, and driver issues.

## Core principle

If a tweak:

- promises “+500 FPS”;
- requires disabling dozens of services;
- asks to run a large script as administrator;
- removes Windows components;
- does not explain each command;
- has no clear rollback path;

do not apply it on your main PC.

> [!IMPORTANT]
> Good optimization means measurable results, stability, and rollback capability—not maximum number of disabled features.

---

## 1. Do not use questionable custom Windows builds

Builds with names like:

```text
Gaming Windows
FPS Boost Windows
Lite OS
Debloated Windows
Ultra Low Latency Build
```

can contain unknown changes:

- removed Windows components;
- disabled updates and security features;
- unstable service configurations;
- issues with Microsoft Store, Xbox, anti-cheat, and drivers;
- unverified scripts;
- malware or hidden telemetry from build author.

### What to do instead

Use official Windows and tune specific areas: startup apps, overlays, drivers, power settings, Game Mode, and real background apps.

---

## 2. Do not run unknown BAT, REG, and PowerShell scripts

Especially dangerous files:

```text
.bat
.cmd
.ps1
.reg
.exe
```

distributed in Discord, Telegram, YouTube descriptions/comments, file-sharing sites, and unknown GitHub repositories.

### Before running any script

1. Open it in Notepad or VS Code.
2. Read every command.
3. Check author, repository history, and issues/reviews.
4. Create a restore point.
5. Do not run as administrator if you do not understand consequences.
6. Do not enter passwords/tokens/API keys or disable security just to run a script.

### Red flags

- “Antivirus flags it because this tweak is powerful”;
- “Disable Defender before running”;
- “Don’t read code, just run it”;
- “You must disable SmartScreen and UAC”;
- “Guaranteed +300 FPS on any PC”;
- “Do not update Windows after running this”.

---

## 3. Do not disable Defender, Firewall, UAC, and Windows Update

### Microsoft Defender

Permanently disabling protection is not valid optimization. It increases risk of miners, password stealers, trojans, and infected mods/cracks.

### Windows Firewall

Firewall does not increase FPS or reduce ping by itself. If a game cannot connect, create a rule for the specific trusted app instead of disabling protection globally.

### UAC

UAC warns when an app requests admin rights. Disabling it makes unwanted changes easier.

### Windows Update

Do not disable updates permanently. If updates interfere right now, use pause, active hours, or wait until download completes.

More details: [Services and security](08-services-and-security.md).

---

## 4. Do not disable services by copy-paste lists

Lists like:

```text
Disable 50 Windows services for FPS
Disable 100 services for low input lag
Best services to disable for gaming
```

ignore your system specifics: laptop/desktop, drivers, network, Bluetooth, audio, VPN, Xbox features, and anti-cheat requirements.

### Why it fails

Most services consume nearly nothing when idle. Disabling them usually breaks functionality instead of improving FPS.

### What to do instead

Find the specific process causing real load. Then disable startup, configure, or uninstall the associated application.

---

## 5. Do not use RAM cleaners

Programs promising:

```text
Free RAM
Memory Cleaner
RAM Optimizer
Boost Memory
```

usually force memory data eviction.

### Why this can reduce smoothness

Windows uses free RAM as cache. After aggressive “cleaning,” apps must reload data from disk, causing freezes/stutter.

### What to do instead

- Close heavy browser sessions and unnecessary apps.
- Disable unnecessary startup items.
- Verify whether physical RAM capacity is enough.
- Do not disable page file without reason.

---

## 6. Do not disable page file “because RAM is large”

Page file is used by Windows and some applications. Fully disabling it can cause:

- game/app crashes;
- out-of-memory errors;
- issues with BSOD memory dumps;
- instability under high RAM usage.

### What to do

For most users, best option is:

```text
Page file → Automatically manage paging file size
```

Change manually only for a specific problem with clear understanding of consequences.

---

## 7. Do not apply timer tweaks without diagnostics

Be careful with advice about:

```text
HPET
bcdedit
useplatformclock
useplatformtick
dynamictick
timer resolution tweaks
MSI mode “for all devices”
```

### Why

These are low-level settings dependent on Windows version, drivers, and hardware. On one PC they may do nothing; on another they may worsen frametime, power behavior, stability, or device functionality.

### Correct approach

- Do not apply commands based on someone else’s result.
- Do not change multiple BCD parameters at once.
- If already applied, restore defaults first and retest.
- Do not present such commands as mandatory universal settings.

---

## 8. Do not disable VBS, core isolation, and security protections without risk evaluation

Virtualization-based features and kernel protections may affect performance in some scenarios, but they also protect against specific attack classes.

### Before changing

1. Measure FPS and frametime.
2. Confirm issue is actually related to this feature.
3. Create restore point.
4. Understand which protections you are losing.
5. Measure results after change.

If gain is absent or minimal, keep protection enabled.

---

## 9. Do not do aggressive overclocking without testing

Do not copy values for:

- Curve Optimizer;
- PBO limits;
- CPU/SoC/RAM voltages;
- RAM timings;
- GPU frequency;
- undervolt curve;

from someone else’s video or screenshot.

Even identical CPU/GPU/RAM models have different stability margins.

### Signs that settings are bad

- WHEA;
- BSOD;
- crashes;
- artifacts;
- reboots;
- archive errors;
- rare freezes;
- performance loss when heated.

If any of these appears, relax settings or return to stock.

---

## 10. Do not edit registry for random “gaming tweaks”

Registry stores critical Windows and application settings.

Risky advice often suggests:

- disabling telemetry through dozens of keys;
- changing NetworkThrottlingIndex;
- changing CPU/GPU priorities;
- disabling system features;
- setting unknown QoS values;
- applying “input lag registry packs”.

### Why this is risky

- many tweaks are outdated;
- some no longer work on modern Windows versions;
- settings can conflict with drivers;
- it becomes unclear which tweak caused the problem;
- rollback without backup can be difficult.

### If registry change is necessary

1. Use only documented tweak for a specific issue.
2. Export the key being changed.
3. Create restore point.
4. Change one parameter at a time.
5. Record original value.
6. Validate result.

---

## 11. Do not trust “100% CPU/GPU usage fix” without understanding root cause

High GPU usage in a heavy game is usually normal: it means GPU is being utilized.

High CPU usage can also be normal in CPU-bound scenarios or while background tasks/streaming run.

The problem is not the usage number itself, but:

- low FPS relative to expectations;
- bad frametime;
- throttling;
- overheating;
- crashes;
- RAM/VRAM shortage;
- instability.

First identify bottleneck: [Find the bottleneck](02-find-the-bottleneck.md).

---

## 12. Do not evaluate result by one metric only

“Average FPS increased by 3” does not always mean tweak is useful.

Always evaluate together:

- Average FPS;
- 1% low;
- frametime;
- latency;
- temperature;
- noise;
- stability;
- image quality.

Example:

```text
Average FPS: +2
1% low: -15
GPU temperature: +8°C
Stutters appeared

Result: better to rollback this tweak.
```

---

## Security checklist

- [ ] Official Windows is used, not unknown custom build.
- [ ] Unknown scripts are not run as administrator.
- [ ] Defender, Firewall, UAC, and Windows Update are not disabled for FPS.
- [ ] Services are not disabled from generic lists.
- [ ] RAM cleaners are not used.
- [ ] Page file stays on automatic mode unless a specific reason exists.
- [ ] HPET/BCD/timer tweaks are not applied without diagnostics and rollback path.
- [ ] Registry is not modified by random packs from internet.
- [ ] Overclock/undervolt is tested one parameter at a time.
- [ ] FPS, 1% low, frametime, and stability are measured.

---

## Summary

The most dangerous “optimizations” often look like quick and easy solutions. Real optimization is less flashy but safer: update drivers, use correct BIOS settings, reduce background load, monitor temperatures, identify bottlenecks, and measure results.

Next step: [FAQ](12-faq.md).
