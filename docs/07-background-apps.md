---
layout: doc
title: "07-background-apps"
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
- attention via notifications, overlays, and popups.

This is especially noticeable on PCs with limited RAM, weaker CPUs, slower storage, or while streaming/recording at the same time.

### Pre-game quick shutdown list

| App type | Action before launch |
|---|---|
| Browser video/streams | Close |
| Downloads/cloud sync | Pause |
| Extra overlays | Disable |
| Recording/stream tools | Keep only one if needed |

---

## 1. How to find heavy apps

### Using Task Manager

1. Press `Ctrl + Shift + Esc`.
2. Open `Processes` tab.
3. Click a column to sort by:
   - CPU;
   - Memory;
   - Disk;
   - Network;
   - GPU.
4. Identify which app creates the load.

Do not end a process if you do not know what it is. First right-click в†’ `Open file location`, or search the app name.

### PowerShell: processes with highest total CPU time

```powershell
Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 20 Name, Id, CPU, WorkingSet64
```

### PowerShell: most memory-heavy processes right now

```powershell
Get-Process |
Sort-Object WorkingSet64 -Descending |
Select-Object -First 20 Name, Id,
@{Name='RAM_MB';Expression={[math]::Round($_.WorkingSet64 / 1MB, 0)}}
```

> [!NOTE]
> `CPU` in PowerShell is cumulative CPU time since process start, not current usage percentage. For real-time load, Task Manager or HWiNFO is more useful.

---

## 2. Startup apps

Open:

```text
Task Manager в†’ Startup apps
```

Disable apps that should not launch with Windows every boot.

### Usually safe to disable if not always needed

- game launchers;
- Discord, Telegram, Teams, and other messengers;
- cloud clients;
- Adobe/Google/Office updaters;
- RGB software;
- recording/streaming apps;
- Spotify and similar apps;
- browser helper apps;
- automatic software updaters;
- third-party вЂњgame boosterвЂќ and вЂњoptimizerвЂќ apps.

### Do not disable blindly

- laptop power management apps;
- touchpad/hotkey/camera/audio driver components;
- fan mode control utilities;
- mouse/keyboard profile drivers/tools if you use them;
- security software if it is your only active antivirus;
- critical corporate/VPN clients required for work.

### Check startup entries with PowerShell

```powershell
Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' -ErrorAction SilentlyContinue |
  Select-Object * -ExcludeProperty PS* |
  Format-List

Get-CimInstance Win32_StartupCommand |
  Select-Object Name, Command, Location |
  Format-List
```

### Disable a startup entry

This does not uninstall the application; it only prevents it from starting with Windows.

```powershell
$run = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'

$disable = @(
  'Discord',
  'RiotClient',
  'RobloxPlayerBeta'
)

foreach ($name in $disable) {
  if (Get-ItemProperty -Path $run -Name $name -ErrorAction SilentlyContinue) {
    Remove-ItemProperty -Path $run -Name $name
    Write-Host "Disabled: $name"
  } else {
    Write-Host "Not found: $name"
  }
}
```

### Recommended startup policy

| Application | Recommendation |
|---|---|
| Discord | Disable unless you need it immediately |
| Riot Client | Disable unless you play Riot games daily |
| Roblox | Disable |
| Steam | Optional |
| Logitech G HUB | Optional |
| NVIDIA | Do not disable |


> [!TIP]
> Disabling startup does not uninstall the app. You can always launch it manually or re-enable startup later.

---

## 3. Check startup via PowerShell

```powershell
Get-CimInstance Win32_StartupCommand |
Select-Object Name, Command, Location, User
```

This command shows what Windows tries to launch at sign-in.

### What to do with results

1. Search unknown app names.
2. If app is not needed at startup, disable it in Task Manager.
3. If app looks suspicious, verify file path and run security checks.
4. Do not manually delete registry startup keys if normal startup disable is sufficient.

---

## 4. Browser

Modern browsers can consume significant RAM, CPU, GPU, and networkвЂ”especially with video playback, streams, dozens of tabs, and many extensions.

Before gaming:

- close tabs with YouTube/Twitch/movies/ads;
- disable unnecessary extensions;
- finish downloads;
- if RAM is limited, fully close browser process, not only window;
- check if browser remains running in background after closing.

### What not to do

Do not disable browser hardware acceleration вЂњfor FPSвЂќ without reason. It can reduce or shift load to GPU depending on case; test only for specific browser/video/overlay issues.

---

## 5. Downloads, cloud sync, and network load

While gaming, close or pause:

- game downloads in Steam, Epic Games, Battle.net, and similar launchers;
- torrents;
- Windows Update if it is actively downloading;
- sync in OneDrive, Google Drive, Dropbox, and other cloud services;
- cloud backup jobs;
- high-bitrate streaming/video on other devices if your connection is limited.

### Why it matters

Downloads can:

- saturate bandwidth and worsen ping;
- increase SSD load;
- consume CPU for file verification/decompression;
- cause stutters on weaker systems.

> [!NOTE]
> If the issue is only ping or packet loss, do not try to fix it by disabling Windows services. First check downloads, Wi-Fi/cable, router, ISP, and game server status.

---

## 6. Overlays

Overlay means UI on top of the game: FPS counter, chat, recording, notifications, browser, or store.

Common overlays:

- Steam Overlay;
- Discord Overlay;
- NVIDIA Overlay;
- AMD Overlay;
- Xbox Game Bar;
- Overwolf;
- MSI Afterburner + RTSS;
- peripheral vendor overlays;
- OBS/screen recording overlays.

### How to test

If stutters, crashes, or launch issues appear:

1. Disable one overlay.
2. Restart the game.
3. Test the same scene.
4. If no difference, re-enable it if needed.
5. Repeat with next overlay.

> [!IMPORTANT]
> Do not run multiple recording tools and multiple FPS overlays at the same time. They can conflict.

---

## 7. RGB software and peripheral utilities

RGB/peripheral tools can be useful for:

- mouse DPI and polling rate;
- macros;
- keyboard profiles;
- lighting;
- fan curves;
- monitoring.

But some tools continuously consume CPU/RAM and run extra services, overlays, and telemetry.

### Correct approach

1. Save device profile to onboard mouse/keyboard memory if available.
2. Check whether app can be removed from startup without losing needed features.
3. Do not uninstall fan-control utility until you confirm fan behavior remains correct without it.
4. If multiple RGB suites from different vendors are installed, keep only the minimal set you need.

---

## 8. Recording, streaming, and virtual cameras

OBS, Discord stream, NVIDIA ShadowPlay/Instant Replay, AMD ReLive, Xbox Game Bar, and similar apps can use CPU, GPU, VRAM, SSD, and network resources.

### Decide what you need before gaming

- Need recording? Keep one recording method enabled.
- Need streaming? Use a dedicated OBS profile and test load.
- No recording needed? Disable Instant Replay/Replay Buffer and extra overlays.
- Not using virtual camera? Close it with the parent app.

### What to monitor

During stream/recording, watch:

- dropped frames in OBS;
- GPU usage;
- VRAM usage;
- CPU load;
- SSD write speed;
- temperatures and clocks.

---

## 9. What to do before launching a game

Quick sequence:

1. Finish downloads and updates.
2. Close browser video and unnecessary tabs.
3. Pause cloud sync if actively running.
4. Keep only required messenger/voice chat.
5. Disable unnecessary overlays.
6. Close heavy work apps: video editing, Photoshop, IDEs, VMs.
7. Verify recording/streaming is off if not needed.
8. Launch the game.

---

## 10. What not to close

Do not randomly terminate:

- `explorer.exe`;
- Windows processes with unknown purpose;
- driver-related processes;
- audio services;
- security processes;
- network components;
- anti-cheat processes while gaming;
- system processes named `Service Host` / `svchost.exe`.

If a process constantly creates load, first identify which application owns it. See: [Services and security](08-services-and-security.md).

---

## Checklist

- [ ] Unnecessary startup apps are disabled.
- [ ] Browser video and heavy apps are closed before gaming.
- [ ] Downloads and cloud sync are paused.
- [ ] Multiple overlays/recorders are not running simultaneously.
- [ ] RGB/peripheral software runs only when needed.
- [ ] No random termination of system processes.
- [ ] All changes are validated in-game.

---

## Summary

Background optimization is not about вЂњkilling everything in Task Manager.вЂќ Disable only what you understand, do not use, and can safely start later manually. Most useful actions are clean startup, paused downloads, closed video browser tabs, and minimal overlays.

Next step: [Services and security](08-services-and-security.md).
