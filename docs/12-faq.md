---
layout: doc
title: "FAQ"
description: "Answers to common questions about Windows 11 gaming optimization, performance testing, and safe changes."
lang: en
translation_key: faq
permalink: /docs/12-faq.html
---


> Short answers to common questions about Windows and gaming PC optimization. If an answer depends on hardware, Windows version, or a specific game, test on your own system.

## Start here

| You want… | Go to |
| --- | --- |
| Fast, safe FPS gains | [Quick-Start Presets](14-quick-start-presets.html) |
| Fix stutter or crashes quickly | [Troubleshooting Decision Trees](15-troubleshooting-decision-trees.html) |
| Prove that tweaks work | [Benchmark Templates](16-benchmark-templates.html) |

---

## BIOS, CPU, and RAM

### Should I update BIOS?

Not always.

Update BIOS if:

- You install a new CPU.
- You have stability, memory, USB, or compatibility issues.
- The update changelog fixes your specific issue.
- The motherboard vendor recommends a version for your configuration.

If the PC is stable and the changelog has no useful fixes, an update is optional.

See [BIOS & Hardware](03-bios-and-hardware.html).

### Should I enable XMP or EXPO?

Usually yes, if the RAM kit supports a profile and the system remains stable.

Without XMP or EXPO, memory may run at JEDEC baseline speed below its advertised speed. After enabling the profile, verify games, reboots, and WHEA errors.

If crashes, BSODs, archive errors, or boot issues appear, return memory settings to `Auto` and troubleshoot stability.

### Should I enable Resizable BAR?

For modern compatible CPU, GPU, and motherboard combinations, usually yes.

Enable in BIOS:

```text
Above 4G Decoding: Enabled
Resizable BAR / Re-Size BAR: Enabled
```

On AMD systems, it may also be called Smart Access Memory.

Impact varies by game: noticeable in some, minimal in others. If the system is compatible and stable, there is usually no reason to keep it disabled.

### Should I enable PBO and Curve Optimizer?

Optional.

PBO and Curve Optimizer are advanced Ryzen tuning options. They can improve boost behavior or efficiency, but incorrect values can cause WHEA errors, crashes, and rare freezes.

If you are not ready to test stability, keep the CPU on `Auto`.

> **Important:** Do not copy Curve Optimizer values from someone else. Even identical CPU models can have different stability headroom.

### Should I manually overclock RAM?

No, for most users stable XMP or EXPO is enough.

Manual frequency, timing, and voltage tuning requires extensive testing. Unstable RAM is more dangerous than a small performance loss: it can cause crashes, file errors, and possible data corruption.

---

## Windows 11

### Should I enable Game Mode?

For most gaming PCs, yes.

```text
Settings → Gaming → Game Mode → On
```

Disable it only for troubleshooting if a specific game consistently performs worse with Game Mode enabled.

### Should I enable HAGS?

Test it.

```text
Settings → System → Display → Graphics → Change default graphics settings
```

Enable HAGS, reboot, and compare FPS, 1% lows, frame times, and stability in your games. Some systems improve; others show no change or issues. Keep it only if the result is repeatable.

### Should I enable Optimizations for Windowed Games?

Also test it.

This matters for modern games in windowed or borderless mode. After changing the setting, restart the game and compare the same scene.

### Do I need Ultimate Performance power mode?

Not necessarily.

For desktops, `Best performance` or a verified `High performance` plan is usually enough. `Ultimate Performance` may barely affect FPS while increasing idle power draw and heat.

Check the active plan:

```powershell
powercfg /getactivescheme
```

### Should I disable Windows visual effects?

This is mostly a usability preference, not a major FPS method.

On modern PCs, disabling desktop animations rarely has a significant in-game impact. If you prefer a simpler UI, disable them, but do not expect major gains.

### Should I disable Defender, Firewall, UAC, or Windows Update?

No.

These are not normal gaming optimization targets. Disabling protection or updates increases the risk of infection, compatibility issues, and Windows errors.

If updates interfere while gaming, use a temporary pause or active hours. If Defender scans heavily, wait for completion or identify the concrete cause.

### Should I disable Windows services?

Not from generic lists.

Most services have near-zero idle FPS impact. If load exists, find the specific process and owning program, then fix the root cause: disable startup, configure the app, or uninstall it.

See [Services & Security](08-services-and-security.html).

### Should I disable the page file if I have lots of RAM?

No. Automatic management is usually better.

Some games and apps use the page file even with large RAM. Fully disabling it can cause crashes, memory errors, and BSOD dump issues.

---

## GPU and FPS

### Should I use a third-party FPS booster?

Treat tools such as BoosterX or Hone as proposed optimizations, not guaranteed fixes. Their effect depends on hardware, drivers, game settings, and the actual performance limit.

See [Optimization Tools Evidence](18-optimization-tools-evidence.html).

### Why is GPU usage at 99%? Is that bad?

No, it is often normal.

In heavy games, high GPU usage usually means the system is GPU-bound and the GPU is being used efficiently. The issue is not usage itself, but overheating, stutter, too-low FPS, or instability.

### Why is CPU usage only 40%, but FPS does not increase?

The game may be limited by one or a few CPU threads, while total all-core usage looks low.

Check per-thread usage, background apps, RAM frequency, CPU temperature, and CPU-heavy in-game settings.

See [Find the Bottleneck](02-find-the-bottleneck.html).

### What matters more: average FPS or 1% lows?

Both matter.

- Average FPS shows overall throughput.
- 1% lows better reflect noticeable drops and smoothness.
- Frame times show frame-pacing consistency.

High average FPS with poor 1% lows can feel worse than slightly lower FPS with smooth frame times.

The exact value depends on how the tool defines 1% lows. Do not compare numbers from different tools. See [Benchmark Templates](16-benchmark-templates.html).

### Should I cap FPS?

Sometimes yes.

An FPS cap can improve frame-time consistency and reduce heat, noise, and fluctuations. Use a cap your PC can sustain in heavy scenes.

Start with the in-game limiter. Then test the driver limiter or RTSS if needed.

### Should I enable V-Sync?

It depends on the scenario.

V-Sync can remove tearing, but it can also increase latency and limit FPS. With VRR, G-SYNC, or FreeSync monitors, tune V-Sync, VRR, and the FPS cap for the specific monitor and game.

### Which upscaler should I use: DLSS, FSR, or XeSS?

Use the one supported by the game that gives the best image-quality and FPS balance on your GPU.

Start with:

```text
Quality → Balanced → Performance
```

Compare not only FPS, but also sharpness, motion quality, artifacts, and 1% lows.

### Should I enable Frame Generation?

Frame Generation can increase displayed FPS and visual smoothness, but it does not replace adequate base FPS and can alter latency feel.

First achieve acceptable base FPS, then test Frame Generation together with in-game latency settings.

### Should I enable NVIDIA Reflex?

If the game supports Reflex, enable it in-game.

Reflex is designed to reduce system latency. You do not need to force NVIDIA Low Latency Mode at the same time; first test the game with its native Reflex setting.

### Should I enable NVIDIA Low Latency Mode?

Test it per game only if the game does not support NVIDIA Reflex.

Do not enable it globally for all apps. The effect can vary by game and workload.

### Should I enable AMD Anti-Lag?

Test it in a per-game profile.

If the game has a built-in latency-reduction option, try that first. Do not enable all Radeon features simultaneously without validation.

---

## Temperatures and stability

### What CPU or GPU temperature is normal?

It depends on the CPU or GPU model, cooling, case, workload, and ambient temperature.

Instead of looking for one “correct number,” evaluate:

- Throttling
- Clock drops
- Power limits
- Noise
- Crashes
- FPS degradation after long sessions

If performance is stable, no errors appear, and components do not hit critical limits, a high but expected load temperature is not always a problem.

### How do I tell whether throttling is happening?

Signs:

- Temperature rises while CPU or GPU clocks drop significantly
- FPS degrades after sustained load
- Monitoring shows a thermal limit or throttling indicator
- Fans run at maximum speed

Check cooling, dust, airflow, fan curves, and cooler mounting quality.

### What is WHEA, and should I worry?

WHEA errors are Windows hardware error reports.

Recurring WHEA errors after overclocking, Curve Optimizer, XMP/EXPO, or undervolting indicate instability. Relax the settings or return to stock.

Check recent events:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    ProviderName = 'Microsoft-Windows-WHEA-Logger'
} -MaxEvents 20 |
Select-Object TimeCreated, Id, LevelDisplayName, Message
```

### Should I undervolt my GPU?

Only if you are ready to test.

Undervolting can reduce temperature, noise, and power draw with similar performance. But overly aggressive curves can cause crashes, artifacts, and driver resets.

Start with small changes, test in demanding games, and always keep a rollback path to stock settings.

---

## Apps and scripts

### Do I need game booster or optimizer apps?

Usually no.

They often just close apps, change the power plan, disable Windows features, or apply questionable tweaks. It is better to do the useful parts manually and understand each change.

### Do I need RAM cleaner apps?

No.

They can evict useful memory cache and worsen frame times. If RAM is insufficient, close heavy apps or increase memory capacity.

### Why not run one large PowerShell optimization script?

A script can modify services, registry, security, network, BCD, permissions, and system components. If you do not understand the code and rollback path, you cannot safely verify or fix the consequences.

Use PowerShell primarily for diagnostics. See [PowerShell Diagnostics](09-powershell-diagnostics.html).

---

## Checklist

- [ ] The bottleneck is identified first; not all tweaks are applied at once.
- [ ] XMP or EXPO is enabled only if stable.
- [ ] ReBAR and Above 4G Decoding are enabled when compatible.
- [ ] Windows, chipset, and GPU drivers are stable.
- [ ] Game Mode is enabled.
- [ ] HAGS and Windowed Games optimizations are tested on your own PC.
- [ ] The correct monitor refresh rate is set.
- [ ] No unnecessary downloads, cloud sync, browser video, or overlays are running.
- [ ] Temperatures, clocks, frame times, and WHEA errors are checked.
- [ ] Critical services and Windows protections are not disabled.
- [ ] All changes are reversible.

---

## Next step

[Security Hardening](13-security-hardening-baseline.html)
