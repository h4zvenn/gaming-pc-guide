---
layout: doc
title: "07. Background Apps and Startup"
description: "Find heavy background apps, review startup entries, reduce overlays and downloads, and avoid unsafe process termination."
lang: en
translation_key: background-apps
permalink: /docs/07-background-apps.html
---

# 07. Background Apps and Startup

> The safest way to reduce unnecessary load is to remove unneeded startup apps and close heavy tasks before gaming. Do not randomly kill system processes or disable Windows services.

## What actually affects gaming

Background apps can consume:

- CPU time;
- RAM;
- VRAM and GPU resources;
- internet bandwidth;
- SSD/HDD activity;
- attention through notifications, overlays, and popups.

This is especially noticeable on PCs with limited RAM, weaker CPUs, slower storage, or while streaming or recording at the same time.

### Pre-game quick shutdown list

| App type | Action before launch |
| --- | --- |
| Browser video or streams | Close |
| Downloads and cloud sync | Pause |
| Extra overlays | Disable |
| Recording or streaming tools | Keep only one, if needed |

---

## 1. Find heavy apps

### Using Task Manager

1. Press `Ctrl + Shift + Esc`.
2. Open the `Processes` tab.
3. Sort by CPU, Memory, Disk, Network, or GPU.
4. Identify which app creates the load.

Do not end a process if you do not know what it is. First right-click it and select `Open file location`, or search for the app name.

### Processes with the highest total CPU time

```powershell
Get-Process |
  Sort-Object CPU -Descending |
  Select-Object -First 20 Name, Id, CPU, WorkingSet64
```

### Processes using the most memory right now

```powershell
Get-Process |
  Sort-Object WorkingSet64 -Descending |
  Select-Object -First 20 Name, Id,
  @{Name = 'RAM_MB'; Expression = { [math]::Round($_.WorkingSet64 / 1MB, 0) }}
```

> [!NOTE]
> `CPU` in PowerShell is cumulative CPU time since process start, not current usage percentage. For real-time load, Task Manager or HWiNFO is more useful.

---

## 2. Startup apps

Open:

```text
Task Manager → Startup apps
```

Disable apps that should not launch with Windows on every boot.

### Usually safe to disable if not always needed

- Game launchers.
- Discord, Telegram, Teams, and other messengers.
- Cloud clients.
- Adobe, Google, and Office updaters.
- RGB software.
- Recording or streaming apps.
- Spotify and similar apps.
- Browser helper apps.
- Automatic software updaters.
- Third-party “game booster” and “optimizer” apps.

### Do not disable blindly

- Laptop power-management apps.
- Touchpad, hotkey, camera, and audio driver components.
- Fan-control utilities.
- Mouse or keyboard profile tools, if you use them.
- Security software, if it is your only active antivirus.
- Critical corporate or VPN clients required for work.

### Check startup entries

Before changing anything, record which applications currently start with Windows.

```powershell
Write-Host "`n===== STARTUP ITEMS ====="

Write-Host "`n--- Current User Registry ---"
Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' -ErrorAction SilentlyContinue |
  Select-Object * -ExcludeProperty PS* |
  Format-List

Write-Host "`n--- WMI Startup Commands ---"
Get-CimInstance Win32_StartupCommand |
  Select-Object Name, Command, Location |
  Format-List

Write-Host "`n--- Startup Folder ---"
Get-ChildItem "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" -ErrorAction SilentlyContinue |
  Select-Object Name, FullName |
  Format-List
```

### Disable unnecessary startup apps

This does not uninstall an application; it only prevents it from starting with Windows.

```powershell
$run = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'

$disable = @(
  'Discord',
  'RiotClient',
  'RobloxPlayerBeta'
  # 'Steam',
  # 'LGHUB'
)

foreach ($name in $disable) {
  if (Get-ItemProperty -Path $run -Name $name -ErrorAction SilentlyContinue) {
    Remove-ItemProperty -Path $run -Name $name
    Write-Host "DISABLED: $name"
  } else {
    Write-Host "NOT FOUND: $name"
  }
}
```

### Recommended startup policy

| Application | Recommendation |
| --- | --- |
| Discord | Disable unless you need it immediately |
| Riot Client | Disable unless you play Riot games daily |
| Roblox | Disable |
| Steam | Optional |
| Logitech G HUB | Optional |
| NVIDIA | Do not disable |

> [!TIP]
> Disabling startup does not uninstall the app. You can launch it manually or re-enable startup later.

### Verify startup changes

```powershell
Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' -ErrorAction SilentlyContinue |
  Select-Object * -ExcludeProperty PS* |
  Format-List
```

### Related services

Startup apps and services are related, but they are not the same thing. Do not disable Windows services only to reduce startup load.

For safe service checks and rollback instructions, see [Services and security](https://h4zvenn.github.io/gaming-pc-guide/docs/08-services-and-security.html).

---

## 3. Check startup through PowerShell

```powershell
Get-CimInstance Win32_StartupCommand |
  Select-Object Name, Command, Location, User
```

This command shows what Windows tries to launch at sign-in.

### What to do with the results

1. Search unknown app names.
2. If an app is not needed at startup, disable it in Task Manager.
3. If an app looks suspicious, verify its file path and run security checks.
4. Do not manually delete registry startup keys if normal startup disabling is sufficient.

---

## 4. Browser

Modern browsers can consume significant RAM, CPU, GPU, and network resources—especially with video playback, streams, many tabs, and extensions.

Before gaming:

- Close tabs with YouTube, Twitch, movies, or ads.
- Disable unnecessary extensions.
- Finish downloads.
- If RAM is limited, fully close the browser process, not only its window.
- Check whether the browser remains running in the background after closing.

### What not to do

Do not disable browser hardware acceleration “for FPS” without reason. It can reduce or shift load to the GPU depending on the case. Test it only for a specific browser, video, or overlay issue.

---

## 5. Downloads, cloud sync, and network load

While gaming, close or pause:

- Game downloads in Steam, Epic Games, Battle.net, and similar launchers.
- Torrents.
- Windows Update, if it is actively downloading.
- Sync in OneDrive, Google Drive, Dropbox, and other cloud services.
- Cloud backup jobs.
- High-bitrate streaming or video on other devices, if your connection is limited.

### Why it matters

Downloads can:

- Saturate bandwidth and worsen ping.
- Increase SSD load.
- Consume CPU for file verification or decompression.
- Cause stutters on weaker systems.

> [!NOTE]
> If the issue is only ping or packet loss, do not try to fix it by disabling Windows services. First check downloads, Wi-Fi or cable, router, ISP, and game-server status.

---

## 6. Overlays

An overlay is UI displayed on top of a game: FPS counter, chat, recording, notifications, browser, or store.

Common overlays:

- Steam Overlay.
- Discord Overlay.
- NVIDIA Overlay.
- AMD Overlay.
- Xbox Game Bar.
- Overwolf.
- MSI Afterburner + RTSS.
- Peripheral vendor overlays.
- OBS or screen-recording overlays.

### How to test

If stutters, crashes, or launch issues appear:

1. Disable one overlay.
2. Restart the game.
3. Test the same scene.
4. If there is no difference, re-enable it if needed.
5. Repeat with the next overlay.

> [!IMPORTANT]
> Do not run multiple recording tools and multiple FPS overlays at the same time. They can conflict.

---

## 7. RGB software and peripheral utilities

RGB and peripheral tools can be useful for:

- Mouse DPI and polling rate.
- Macros.
- Keyboard profiles.
- Lighting.
- Fan curves.
- Monitoring.

But some tools continuously consume CPU and RAM and run extra services, overlays, and telemetry.

### Correct approach

1. Save the device profile to onboard mouse or keyboard memory, if available.
2. Check whether the app can be removed from startup without losing needed features.
3. Do not uninstall a fan-control utility until you confirm that fan behavior remains correct without it.
4. If multiple RGB suites from different vendors are installed, keep only the minimal set you need.

---

## 8. Recording, streaming, and virtual cameras

OBS, Discord streaming, NVIDIA ShadowPlay or Instant Replay, AMD ReLive, Xbox Game Bar, and similar apps can use CPU, GPU, VRAM, SSD, and network resources.

### Decide what you need before gaming

- Need recording? Keep one recording method enabled.
- Need streaming? Use a dedicated OBS profile and test its load.
- No recording needed? Disable Instant Replay, Replay Buffer, and extra overlays.
- Not using a virtual camera? Close it together with its parent app.

### What to monitor

During streaming or recording, watch:

- Dropped frames in OBS.
- GPU usage.
- VRAM usage.
- CPU load.
- SSD write speed.
- Temperatures and clocks.

---

## 9. Before launching a game

Quick sequence:

1. Finish downloads and updates.
2. Close browser video and unnecessary tabs.
3. Pause cloud sync if it is actively running.
4. Keep only the required messenger or voice chat.
5. Disable unnecessary overlays.
6. Close heavy work apps: video editing, Photoshop, IDEs, and virtual machines.
7. Verify recording or streaming is off if it is not needed.
8. Launch the game.

---

## 10. What not to close

Do not randomly terminate:

- `explorer.exe`.
- Windows processes with unknown purpose.
- Driver-related processes.
- Audio services.
- Security processes.
- Network components.
- Anti-cheat processes while gaming.
- System processes named `Service Host` or `svchost.exe`.

If a process constantly creates load, first identify which application owns it. See [Services and security](https://h4zvenn.github.io/gaming-pc-guide/docs/08-services-and-security.html).

---

## Checklist

- [ ] Unnecessary startup apps are disabled.
- [ ] Browser video and heavy apps are closed before gaming.
- [ ] Downloads and cloud sync are paused.
- [ ] Multiple overlays or recorders are not running simultaneously.
- [ ] RGB and peripheral software runs only when needed.
- [ ] No random termination of system processes.
- [ ] All changes are validated in-game.

---

## Summary

Background optimization is not about “killing everything in Task Manager.” Disable only what you understand, do not use, and can safely start later manually. The most useful actions are clean startup, paused downloads, closed video browser tabs, and minimal overlays.

Next step: [Services and security](https://h4zvenn.github.io/gaming-pc-guide/docs/08-services-and-security.html).
