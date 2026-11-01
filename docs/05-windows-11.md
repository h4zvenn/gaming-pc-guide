---
layout: doc
title: "Windows 11 Gaming Settings"
description: "Review Windows 11 settings for gaming, display, background activity, and power; not every option applies to Windows 10."
lang: en
translation_key: windows-11
permalink: /docs/05-windows-11.html
---

> The goal of Windows tuning is to reduce real background load, choose correct gaming options, and keep the system stable and secure. You do not need to disable dozens of services, Defender, or updates for questionable “FPS tweaks.”

This page covers Windows 11-specific menus and behavior. Windows 10 reached end of support on October 14, 2025; see [Windows 10 legacy notes](windows-10-legacy.html). Do not assume every setting below exists or behaves identically on older builds.

## Principles

- Change settings one at a time.
- Reboot after major changes.
- Check FPS, 1% lows, frame times, and stability.
- Keep only changes that provide measurable results or better usability.

## 5-minute gaming pass

| Check | Target |
| --- | --- |
| Game Mode | On |
| Monitor refresh rate | Highest stable value |
| Startup load | Unneeded apps disabled |
| Overlays | Keep only required ones |
| Downloads and updates | Paused during the session |

> **Important:** Windows does not become faster just because more features are disabled. A stable system with proper drivers and minimal heavy background activity is better than aggressive debloating.

---

## Game Mode

Open:

```text
Settings → Gaming → Game Mode
```

Enable:

```text
Game Mode: On
```

Game Mode helps Windows prioritize gameplay and reduce the impact of some background activity while gaming.

Keep it enabled for most gaming PCs and laptops. Test disabling it only if a specific game consistently performs worse with it enabled, and compare the same scene before and after.

---

## Power mode

Open:

```text
Settings → System → Power & battery
```

For desktop PCs, start with:

```text
Power mode: Best performance
```

Then compare idle power draw, temperature, and fan noise. Keep a higher power mode only if it produces a useful result for your workload; on an idle desktop, it can increase power use without improving games.

For laptops:

- Use AC power while gaming.
- Select a performance mode in Windows and, if available, in the laptop vendor utility.
- Remember that a higher power mode increases heat, noise, and battery usage.

Use the [read-only diagnostics menu](09-powershell-diagnostics.html) to inspect the active and available power plans.

> **Note:** Ultimate Performance does not guarantee higher FPS. On modern PCs, it may provide little or no gain while increasing idle power consumption and temperature. Test it instead of choosing it by name.

---

## Windows graphics settings

Open:

```text
Settings → System → Display → Graphics
```

Here you can assign apps to a specific GPU and enable system gaming options.

### Assign the high-performance GPU

This is especially relevant for laptops and systems with multiple GPUs.

1. In `Custom settings for applications`, find the game.
2. If it is missing, select `Browse` and add the game `.exe`.
3. Select `Options`.
4. Choose:

   ```text
   High performance
   ```

5. Save the changes.

> **Tip:** On laptops, the preferred GPU can also be set in NVIDIA Control Panel, AMD Software, or the laptop vendor utility. Avoid conflicting profiles unless necessary.

---

## Optimizations for windowed games

Open:

```text
Settings → System → Display → Graphics → Change default graphics settings
```

Find:

```text
Optimizations for windowed games
```

This setting applies to modern games in windowed or borderless mode on Windows 11 22H2 and later. Changing it may require restarting the game and sometimes Windows.

### How to test

1. Choose one mode.
2. Reboot if Windows asks.
3. Test the same game scene.
4. Compare FPS, frame times, latency, and fullscreen behavior.
5. Keep the option that works better on your system.

---

## Hardware-accelerated GPU scheduling

Hardware-accelerated GPU scheduling (HAGS) is in the same section:

```text
Settings → System → Display → Graphics → Change default graphics settings
```

Find:

```text
Hardware-accelerated GPU scheduling
```

HAGS is an optional test, not a default recommendation.

1. Record a baseline in one repeatable game scene.
2. Enable HAGS.
3. Reboot the PC.
4. Repeat the same scene with the same settings and overlays.
5. Compare 1% lows, frame times, stability, and any new stutter.
6. Keep it only if the result is repeatable and no new issues appear. Otherwise, disable it and reboot again.

HAGS requires a supported GPU and driver. Some features, including certain frame-generation implementations, may require it. Check the current documentation for your GPU vendor.

Microsoft describes HAGS as a way to offload most GPU scheduling to a dedicated GPU-based scheduling processor; for most users, the transition is intended to be transparent. [Microsoft DirectX Developer Blog](https://devblogs.microsoft.com/directx/hardware-accelerated-gpu-scheduling/)

> **Important:** HAGS is not a mandatory FPS boost. The result depends on the GPU, driver, game, and Windows version. Decide based on your own measurements.

---

## VRR, Auto HDR, and HDR

### Variable Refresh Rate

VRR can help on monitors with FreeSync, G-SYNC Compatible, or similar technologies.

Check that:

- Adaptive Sync is enabled in the monitor’s on-screen display.
- VRR is enabled in the GPU driver panel.
- No flicker or game-specific issues appear.

### Auto HDR and HDR

Use HDR or Auto HDR only if your monitor supports HDR at acceptable quality and you like the result.

HDR can improve visuals in suitable games, but it is not a performance tweak. If color, brightness, or compatibility issues appear, disable it first for testing.

---

## Monitor refresh rate

Open:

```text
Settings → System → Display → Advanced display
```

In `Choose a refresh rate`, select the highest stable value supported by the monitor, cable, and GPU.

Example:

```text
A 165 Hz monitor should be set to 165 Hz in Windows, not 60 Hz.
```

> **Warning:** Do not confuse FPS and Hz. FPS is how many frames the PC renders; Hz is how many times per second the monitor refreshes. Both matter, but they are not the same thing.

---

## Notifications and Do Not Disturb

Notifications can distract you and sometimes trigger extra overlays.

Open:

```text
Settings → System → Notifications
```

- Disable notifications from unnecessary apps.
- Use Do Not Disturb while gaming.
- Disable promotional or recommendation notifications if you do not need them.

This does not directly increase FPS, but it reduces interruptions during gameplay.

---

## Overlays and recording

Overlays are useful, but running several at once can cause conflicts, overhead, and game issues.

Check whether you actually need:

- Xbox Game Bar
- Discord Overlay
- NVIDIA Overlay
- AMD Overlay
- Steam Overlay
- Overwolf
- OBS Game Capture or recording
- Monitoring and FPS overlays

Do not disable everything permanently. Keep only the features you need. If stutter, crashes, or bad frame times appear, disable overlays one by one temporarily and re-test the same game.

> **Tip:** MSI Afterburner with RTSS is useful for monitoring, but if one specific game has issues, also test without the RTSS overlay.

---

## Startup apps

Open:

```text
Task Manager → Startup apps
```

Disable startup apps that are not needed immediately after boot.

Often safe to disable if not always needed:

- Game launchers
- Messengers
- Adobe, Google, or Office updaters
- Cloud clients
- RGB software
- Recording and overlay tools
- Unnecessary auto-updaters

Do not disable blindly:

- Audio driver components
- Touchpad, hotkey, or laptop power components
- Fan-control software, if you use it
- Mouse or keyboard software, if your profiles depend on it
- Security software, if it is your only active antivirus

---

## Windows visual effects

Open Windows search and type:

```text
Adjust the appearance and performance of Windows
```

You can disable some animations for a simpler, snappier desktop feel.

On modern PCs, this rarely affects in-game FPS noticeably. Treat it as a desktop comfort setting, not a core gaming tweak. Do not disable interface features you actually use for tiny resource savings.

---

## Security and virtualization

Do not disable these without a clear reason:

- Microsoft Defender
- Windows Firewall
- UAC
- Windows Update
- Core isolation
- VBS and related protections

Some of these can have a measurable impact in specific setups, but disabling them reduces security and may affect compatibility. First identify a concrete issue, create a restore point, and evaluate the trade-off.

Microsoft recommends keeping memory integrity enabled unless there is a specific, understood reason to change it. [Microsoft Learn](https://learn.microsoft.com/en-us/windows/security/hardware-security/enable-virtualization-based-protection-of-code-integrity)

> **Warning:** Do not run `.reg`, `.bat`, or PowerShell scripts that mass-disable protections and system features. “More disabled” does not mean “better optimized.”

---

## Useful diagnostics

Use the [read-only diagnostics menu](09-powershell-diagnostics.html) to inspect power plans, startup entries, and processes without changing Windows. Individual commands are kept in the diagnostics guide.

---

## Checklist

- [ ] Game Mode is enabled.
- [ ] A suitable power mode is selected.
- [ ] The game is assigned to the high-performance GPU, if the system has multiple GPUs.
- [ ] HAGS and Optimizations for windowed games are tested.
- [ ] The correct monitor refresh rate is set.
- [ ] Unnecessary notifications are disabled.
- [ ] Only required overlays remain active.
- [ ] Unnecessary startup apps are disabled.
- [ ] Defender, Firewall, Windows Update, and critical Windows components remain enabled.
- [ ] Every change is tested in the same scene.

---

## Next step

[GPU Settings](06-gpu-settings.html)
