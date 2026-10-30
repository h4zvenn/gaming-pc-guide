---
layout: doc
title: "05-windows-11"
---

# 05. Windows 11 Tuning

> The goal of Windows tuning is to reduce real background load, choose correct gaming options, and keep the system stable and secure. You do not need to disable dozens of services, Defender, or updates for questionable “FPS tweaks.”

## Principles

- Change settings one at a time.
- Reboot after major changes.
- Check FPS, 1% low, frametime, and stability.
- Keep only changes that provide measurable results or better usability.

### 5-minute Windows gaming pass

| Check | Target |
|---|---|
| Game Mode | On |
| Monitor refresh rate | Correct max stable value |
| Startup load | Unneeded apps disabled |
| Overlays | Keep only required ones |
| Downloads/updates | Paused during session |

> [!IMPORTANT]
> Windows does not become faster just because more features are disabled. A stable system with proper drivers and minimal heavy background apps is better than aggressive debloating.

---

## 1. Game Mode

Open:

```text
Settings → Gaming → Game Mode
```

Enable:

```text
Game Mode → On
```

Game Mode helps Windows prioritize gameplay and reduce impact from some background activity while gaming.

### When to keep it enabled

- For most gaming PCs and laptops.
- If you do not see problems in a specific game.

### When to test disabling

- Only if a specific game consistently performs worse with Game Mode enabled.
- Compare the same scene before and after change.

---

## 2. Power mode

Open:

```text
Settings → System → Power & battery
```

For desktop PCs, start with:

```text
Power mode → Best performance
```

Then compare idle power draw, temperature, and fan noise. Keep a higher power mode only if it produces a useful result for your workload; on an idle desktop it can increase power use without improving games.

For laptops:

- Use AC power while gaming.
- Select a performance mode in Windows and, if available, vendor performance profile.
- Keep in mind higher power mode increases heat, noise, and battery usage.

### Check active power plan

```powershell
powercfg /getactivescheme
```

### List available plans

```powershell
powercfg /list
```

> [!NOTE]
> `Ultimate Performance` does not guarantee higher FPS. On modern PCs it may provide little to no gain while increasing idle power and temperature. Test, do not choose by name.

---

## 3. Windows graphics settings

Open:

```text
Settings → System → Display → Graphics
```

Here you can assign apps to a specific GPU and enable certain system gaming options.

### Assign high-performance GPU

This is especially relevant for laptops and systems with multiple GPUs.

1. In `Custom settings for applications`, find the game.
2. If missing, click `Browse` and add the game `.exe`.
3. Click `Options`.
4. Select:

    ```text
    High performance
    ```

5. Save changes.

> [!TIP]
> On laptops, preferred GPU can also be set in NVIDIA Control Panel, AMD Software, or vendor utility. Avoid conflicting profiles unless required.

---

## 4. Optimizations for windowed games

Open:

```text
Settings → System → Display → Graphics → Change default graphics settings
```

There may be an option:

```text
Optimizations for windowed games
```

It applies to modern games in windowed/borderless mode on Windows 11 22H2 and later. Test it in your games: changing it may require game restart and sometimes Windows restart.

### How to test

1. Choose one mode.
2. Reboot if Windows asks.
3. Test the same game scene.
4. Compare FPS, frametime, latency, and fullscreen behavior.
5. Keep the option that works better on your specific system.

---

## 5. Hardware-accelerated GPU scheduling (HAGS)

HAGS is in the same section:

```text
Settings → System → Display → Graphics → Change default graphics settings
```

Option name:

```text
Hardware-accelerated GPU scheduling
```

### What to do

HAGS is an optional test, not a default recommendation.

1. Record a baseline in one repeatable game scene.
2. Enable HAGS.
3. Reboot the PC.
4. Repeat the same scene with the same settings and overlays.
5. Compare 1% low, frametime, stability, and any new stutter.
6. Keep the setting only if the result is repeatable and no new issues appear. Otherwise disable it and reboot again.

> [!NOTE]
> HAGS requires a supported GPU and driver. Some features, such as certain frame-generation implementations, may require it. Check the current vendor documentation for your GPU.

Background: [Hardware Accelerated GPU Scheduling](https://devblogs.microsoft.com/directx/hardware-accelerated-gpu-scheduling/).

> [!IMPORTANT]
> HAGS is not a mandatory “FPS boost.” Result depends on GPU, driver, game, and Windows version. Decide by your measurements, not someone else’s test.

---

## 6. VRR, Auto HDR, and HDR

### Variable Refresh Rate (VRR)

VRR can help on monitors with FreeSync/G-SYNC Compatible and similar technologies.

Check:

- adaptive sync is enabled in monitor OSD;
- VRR is enabled in GPU driver panel;
- no flicker or specific-game issues appear.

### Auto HDR and HDR

Use HDR/Auto HDR only if your monitor truly supports HDR at acceptable quality and you like the result.

HDR can improve visuals in suitable games, but it is not a performance tweak. If color/brightness/compatibility issues appear, disable it first for testing.

---

## 7. Monitor refresh rate

Check:

```text
Settings → System → Display → Advanced display
```

In `Choose a refresh rate`, select the highest stable value supported by monitor, cable, and GPU.

Example:

```text
165 Hz monitor → Windows should be set to 165 Hz, not 60 Hz.
```

> [!WARNING]
> Do not confuse FPS and Hz. FPS is how many frames the PC renders; Hz is how many times per second the monitor refreshes. Both matter, but they are not the same thing.

---

## 8. Notifications and Do Not Disturb

Notifications can distract, pull focus from game, and sometimes trigger extra overlays.

Open:

```text
Settings → System → Notifications
```

Configure:

- Disable notifications from unnecessary apps.
- Use `Do Not Disturb` while gaming.
- Disable Windows promotional/recommendation notifications if not needed.

This does not directly increase FPS, but it improves gameplay focus and reduces interruptions.

---

## 9. Overlays and recording

Overlays are useful, but running several overlays at once can cause conflicts, overhead, and game issues.

Check if you really need:

- Xbox Game Bar;
- Discord Overlay;
- NVIDIA Overlay;
- AMD Overlay;
- Steam Overlay;
- Overwolf;
- OBS Game Capture / recording;
- monitoring and FPS overlays.

### Correct approach

1. Do not disable everything permanently.
2. Keep only needed features.
3. If stutter/crashes/bad frametime appear, disable overlays one by one temporarily.
4. Re-test in the same game.

> [!TIP]
> MSI Afterburner + RTSS are often useful for monitoring, but for issues in one specific game, also test without RTSS overlay.

---

## 10. Startup apps

Open:

```text
Task Manager → Startup apps
```

Disable startup apps that are not needed right after boot.

Often safe to disable if not always needed:

- game launchers;
- messengers;
- Adobe/Google/Office updaters;
- cloud clients;
- RGB software;
- recording and overlay tools;
- unnecessary auto-updaters.

Do not disable blindly:

- audio driver components;
- touchpad/hotkey/laptop power components;
- fan control software if you use it;
- mouse/keyboard driver software if profiles depend on it;
- security software if it is your only active antivirus.

---

## 11. Windows visual effects

Open Windows search and type:

```text
Adjust the appearance and performance of Windows
```

You may disable some animations for a simpler and snappier desktop feel.

But remember:

- On modern PCs this rarely affects in-game FPS noticeably.
- This is mostly a desktop comfort setting, not a core gaming tweak.
- Do not disable interface features you actually use for tiny resource savings.

---

## 12. Security and virtualization

Do not disable without a clear reason:

- Microsoft Defender;
- Windows Firewall;
- UAC;
- Windows Update;
- Core isolation;
- VBS and related protections.

Some of these can have measurable impact in specific setups, but disabling them reduces security and may affect compatibility. First identify a concrete issue, create a restore point, and evaluate the tradeoff.

Microsoft’s guidance for memory integrity and VBS is to keep the protection enabled unless there is a specific, understood reason to change it. See [Enable memory integrity](https://learn.microsoft.com/en-us/windows/security/hardware-security/enable-virtualization-based-protection-of-code-integrity).

> [!WARNING]
> Do not run `.reg`, `.bat`, or PowerShell scripts that mass-disable protections and system features. “More disabled” does not mean “better optimized.”

---

## 13. Useful safe commands

### Current power scheme

```powershell
powercfg /getactivescheme
```

### Startup list

```powershell
Get-CimInstance Win32_StartupCommand |
Select-Object Name, Command, Location, User
```

### Top CPU-time processes

```powershell
Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 20 Name, Id, CPU, WorkingSet64
```

> [!NOTE]
> These commands do not change Windows; they only display information.

---

## Windows 11 checklist

- [ ] Game Mode is enabled.
- [ ] Suitable power mode is selected.
- [ ] Game is assigned to high-performance GPU if multiple GPUs exist.
- [ ] HAGS and Optimizations for windowed games are tested.
- [ ] Correct monitor refresh rate is set.
- [ ] Unnecessary notifications are disabled.
- [ ] Only required overlays remain active.
- [ ] Unnecessary startup apps are disabled.
- [ ] Defender, Firewall, Update, and critical Windows components remain enabled.
- [ ] All changes are tested in the same scene.

---

## Summary

For most PCs, it is enough to enable Game Mode, verify power mode, refresh rate, graphics assignment, and remove truly unnecessary background apps. HAGS, windowed optimizations, VRR, and overlays should be tested on your own hardware—there is no universal best setup for every system.

Next step: [GPU settings](06-gpu-settings.md).
