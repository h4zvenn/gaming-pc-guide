---
layout: doc
title: "12-faq"
---

# 12. FAQ

> Short answers to common questions about Windows and gaming PC optimization. If an answer depends on hardware, Windows version, or a specific game, test on your own system.

## Start here if you are in a hurry

| You wantвЂ¦ | Go to |
|---|---|
| Fast FPS gains safely | [14 Quick-start presets](14-quick-start-presets.html) |
| Fix stutter/crash quickly | [15 Troubleshooting decision trees](15-troubleshooting-decision-trees.html) |
| Prove tweaks actually work | [16 Benchmark templates](16-benchmark-templates.html) |

## BIOS, CPU, and RAM

### Should I update BIOS?

Not always.

Update BIOS if:

- you install a new CPU;
- you have stability, memory, USB, or compatibility issues;
- update changelog fixes your specific issue;
- vendor recommends a version for your configuration.

If your PC is stable and changelog has no useful fixes, update is optional.

More details: [BIOS and hardware](03-bios-and-hardware.html).

---

### Should I enable XMP or EXPO?

Usually yes, if RAM kit supports profile and system remains stable.

Without XMP/EXPO, memory may run at JEDEC baseline below advertised speed. After enabling profile, verify games, reboots, and WHEA.

If crashes, BSOD, archive errors, or boot issues appear, revert memory settings to `Auto` and troubleshoot stability.

---

### Should I enable Resizable BAR / Above 4G Decoding?

For modern compatible CPU/GPU/motherboard combinations, usually yes.

Enable in BIOS:

```text
Above 4G Decoding в†’ Enabled
Resizable BAR / Re-Size BAR в†’ Enabled
```

On AMD it may also be called Smart Access Memory.

Impact varies by game: noticeable in some, minimal in others. If system is compatible and stable, there is usually no reason to keep it disabled.

---

### Should I enable PBO and Curve Optimizer?

Optional.

PBO and Curve Optimizer are advanced Ryzen tuning options. They can improve boost/efficiency, but wrong values can cause WHEA, crashes, and rare freezes.

If you are not ready to test stability, keep CPU on `Auto`.

> [!IMPORTANT]
> Do not copy Curve Optimizer values from someone else: even identical CPU models can have different stability headroom.

---

### Should I manually overclock RAM?

No, for most users stable XMP/EXPO is enough.

Manual frequency/timing/voltage tuning requires extensive testing. Unstable RAM is more dangerous than small performance loss: crashes, file errors, and possible data corruption.

---

## Windows 11

### Should I enable Game Mode?

For most gaming PCs: yes.

Open:

```text
Settings в†’ Gaming в†’ Game Mode в†’ On
```

Disable only for troubleshooting if a specific game consistently performs worse with Game Mode enabled.

---

### Should I enable HAGS?

Test it.

Open:

```text
Settings в†’ System в†’ Display в†’ Graphics в†’ Change default graphics settings
```

Enable HAGS, reboot, and compare FPS, 1% low, frametime, and stability in your games. Some systems improve, others show no change or issues. Keep it only if the result is repeatable; otherwise disable it and reboot again.

---

### Should I enable Optimizations for windowed games?

Also test it.

This matters for modern games in windowed/borderless mode. After changing, restart game and compare in the same scene.

---

### Do I need Ultimate Performance power mode?

Not necessarily.

For desktops, `Best performance` or a verified `High performance` plan is usually enough. `Ultimate Performance` may barely affect FPS while increasing power draw and heat at idle.

Check active plan:

```powershell
powercfg /getactivescheme
```

---

### Should I disable Windows visual effects?

This is mostly a usability preference, not a major FPS method.

On modern PCs, disabling desktop animations rarely has significant in-game impact. If you prefer simpler UI, disable themвЂ”but do not expect major gains.

---

### Should I disable Defender, Firewall, UAC, and Windows Update?

No.

These are not normal gaming optimization targets. Disabling protection/updates increases risk of infection, compatibility issues, and Windows errors.

If updates interfere while gaming, use temporary pause or active hours. If Defender scans heavily, wait for completion or identify concrete cause.

---

### Should I disable Windows services?

Not via generic lists.

Most services have near-zero idle FPS impact. If load exists, find the specific process and owning program, then fix root cause: disable startup, configure, or uninstall the app.

More details: [Services and security](08-services-and-security.html).

---

### Should I disable page file if I have lots of RAM?

No, usually automatic management is better.

Some games/apps use page file even with large RAM. Fully disabling it can cause crashes, memory errors, and BSOD dump issues.

---

## GPU and FPS

### Should I use a third-party FPS booster such as BoosterX or Hone?

BoosterX and Hone are third-party tools. Their own documentation states that an FPS increase is not guaranteed and depends on hardware, drivers, game settings and what limits performance.

Treat such tools as proposed optimizations. See [18 Optimization tools evidence](18-optimization-tools-evidence.html) for the claim, documentation, test and license layers.

### Why is GPU at 99% usage? Is it bad?

No, often normal.

In heavy games, high GPU usage usually means you are GPU-bound and GPU is used efficiently. The issue is not usage itself, but overheating, stutter, too-low FPS, or instability.

---

### Why is CPU only at 40%, but FPS does not increase?

Game may be limited by one/few CPU threads while total all-core usage looks low.

Check per-thread usage, background apps, RAM frequency, CPU temperature, and CPU-heavy in-game settings.

More details: [Find the bottleneck](02-find-the-bottleneck.html).

---

### What is more important: Average FPS or 1% low?

Both matter.

- `Average FPS` shows overall throughput.
- `1% low` better reflects noticeable drops and smoothness.
- `Frametime` shows frame pacing consistency.

High average FPS with bad 1% low can feel worse than slightly lower FPS with smooth frametime.

The exact value depends on how the tool defines 1% low. Do not compare numbers from different tools; see [16 Benchmark templates](16-benchmark-templates.html).

---

### Should I cap FPS?

Sometimes yes.

FPS cap can improve frametime consistency and reduce heat, noise, and fluctuations. Use a cap your PC can sustain in heavy scenes.

Start with in-game limiter. Then test driver limiter or RTSS if needed.

---

### Should I enable V-Sync?

Depends on scenario.

V-Sync can remove tearing, but sometimes increases latency and limits FPS. With VRR/G-SYNC/FreeSync monitors, V-Sync + VRR + FPS cap should be tuned for specific monitor/game.

There is no single setting that fits everyone.

---

### Which upscaler should I use: DLSS, FSR, or XeSS?

Use the one supported by game that gives best image/FPS balance on your GPU.

Start with:

```text
Quality в†’ Balanced в†’ Performance
```

Compare not only FPS, but also sharpness, motion quality, artifacts, and 1% low.

---

### Should I enable Frame Generation?

Frame Generation can increase displayed FPS and visual smoothness, but it does not replace adequate base FPS and can alter latency feel.

First achieve acceptable base FPS, then test frame generation together with in-game latency settings.

---

### Should I enable NVIDIA Reflex?

If game supports Reflex, enable it **in-game**.

Reflex is designed to reduce system latency. You do not need to force NVIDIA Low Latency Mode at the same time; first test game with native Reflex setting.

---

### Should I enable NVIDIA Low Latency Mode?

Test only per game if it does not support NVIDIA Reflex.

Do not enable globally for all apps. Effect can vary by game and workload.

---

### Should I enable AMD Anti-Lag?

Test in per-game profile.

If game has built-in latency reduction, try in-game option first. Do not enable all Radeon features simultaneously without validation.

---

## Temperatures and stability

### What CPU/GPU temperature is normal?

Depends on CPU/GPU model, cooling, case, workload, and ambient temperature.

Instead of one вЂњcorrect number,вЂќ evaluate:

- throttling;
- clock drops;
- power limits;
- noise;
- crashes;
- FPS degradation after long sessions.

If performance is stable, no errors appear, and components do not hit critical limitsвЂ”high but expected load temperature is not always a problem.

---

### How to tell if throttling happens?

Signs:

- temperature rises while CPU/GPU clocks drop significantly;
- FPS degrades after sustained load;
- monitoring shows thermal limit / throttling;
- fans run at maximum speed.

Check cooling, dust, airflow, fan curves, and cooler mounting quality.

---

### What is WHEA and should I worry?

WHEA are Windows hardware error reports.

Recurring WHEA after OC/Curve Optimizer/XMP-EXPO/undervolt indicates instability. Relax settings or revert to stock.

Check:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    ProviderName = 'Microsoft-Windows-WHEA-Logger'
} -MaxEvents 20 |
Select-Object TimeCreated, Id, LevelDisplayName, Message
```

---

### Should I undervolt GPU?

Only if you are ready to test.

Undervolt can reduce temperature, noise, and power draw with similar performance. But overly aggressive curves cause crashes, artifacts, and driver resets.

Start with small changes, test in heavy games, and always keep rollback path to stock settings.

---

## Apps and scripts

### Do I need game booster/optimizer apps?

Usually no.

They often just close apps, change power plan, disable Windows features, or apply questionable tweaks. It is better to do useful parts manually and understand each change.

---

### Do I need RAM cleaner apps?

No.

They can evict useful memory cache and worsen frametime. If RAM is insufficient, close heavy apps or increase memory capacity.

---

### Why not run one large PowerShell optimization script?

Script can modify services, registry, security, network, BCD, permissions, and system components. If you do not understand code and rollback path, you cannot safely verify/fix consequences.

Use PowerShell primarily for diagnostics: [PowerShell: checks and diagnostics](09-powershell-diagnostics.html).

---

## Final checklist

- [ ] Bottleneck identified first, not all tweaks applied at once.
- [ ] XMP/EXPO enabled only if stable.
- [ ] ReBAR/Above 4G enabled when compatible.
- [ ] Windows, chipset, and GPU drivers are stable.
- [ ] Game Mode is enabled.
- [ ] HAGS and windowed optimizations tested on your own PC.
- [ ] Correct monitor refresh rate is set.
- [ ] No unnecessary downloads, cloud sync, browser video, or overlays.
- [ ] Temperatures, clocks, frametime, and WHEA are checked.
- [ ] Critical services and Windows protections are not disabled.
- [ ] All changes are reversible.

---

## Summary

Optimization is a sequential process: measure в†’ find bottleneck в†’ change one setting в†’ test в†’ keep or rollback. If there is no specific issue, do not chase risky tweaks: stable system, up-to-date drivers, proper cooling, and clean background already provide most of the result.

Back to main page: [README](../README.html).
