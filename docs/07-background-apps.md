---
layout: doc
title: "Background Apps"
description: "Find heavy background apps, review startup entries, reduce overlays and downloads, and avoid unsafe process termination."
lang: en
translation_key: background-apps
permalink: /docs/07-background-apps.html
---


> The safest way to reduce unnecessary load is to remove unneeded startup apps and close heavy tasks before gaming. Do not randomly kill system processes or disable Windows services.

## What affects gaming

Background apps can consume:

- CPU time
- RAM
- VRAM and GPU resources
- Internet bandwidth
- SSD or HDD activity
- Attention through notifications, overlays, and pop-ups

This is especially noticeable on PCs with limited RAM, weaker CPUs, slower storage, or while streaming or recording.

| App type | Action before gaming |
| --- | --- |
| Browser video or streams | Close |
| Downloads and cloud sync | Pause |
| Extra overlays | Disable |
| Recording or streaming tools | Keep only one, if needed |

---

## Find heavy apps

### Task Manager

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

### Processes using the most memory

```powershell
Get-Process |
Sort-Object WorkingSet64 -Descending |
Select-Object -First 20 Name, Id,
@{Name = 'RAM_MB'; Expression = { [math]::Round($_.WorkingSet64 / 1MB, 0) }}
```

> **Note:** `CPU` in PowerShell is cumulative CPU time since process start, not current usage percentage. For real-time load, use Task Manager or HWiNFO.

---

## Startup apps

Open:

```text
Task Manager → Startup apps
```

Disable apps that should not launch with Windows on every boot.

### Usually safe to disable

Disable these only if you do not need them immediately after boot:

- Game launchers
- Discord, Telegram, Teams, and other messengers
- Cloud clients
- Adobe, Google, and Office updaters
- RGB software
- Recording or streaming apps
- Spotify and similar apps
- Browser helper apps
- Automatic software updaters
- Third-party game boosters or optimizers

### Do not disable blindly

- Laptop power-management apps
- Touchpad, hotkey, camera, and audio driver components
- Fan-control utilities
- Mouse or keyboard profile tools, if you use them
- Security software, if it is your only active antivirus
- Critical corporate or VPN clients required for work

### Disable a startup entry

Prefer Task Manager first:

1. Open `Task Manager → Startup apps`.
2. Select the application.
3. Select `Disable`.

This does not uninstall the application; it only prevents it from launching automatically at sign-in.

| Application | Recommendation |
| --- | --- |
| Discord | Disable unless you need it immediately |
| Riot Client | Disable unless you play Riot games daily |
| Roblox | Disable |
| Steam | Optional |
| Logitech G HUB | Optional |
| NVIDIA | Do not disable |

> **Tip:** Disabling startup does not uninstall the app. You can launch it manually or re-enable startup later.

If a startup entry is not visible in Task Manager but exists in the current user’s Run key, inspect it before changing anything:

```powershell
Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' -ErrorAction SilentlyContinue |
Select-Object * -ExcludeProperty PS* |
Format-List
```

Do not manually delete registry startup keys unless you understand the entry and have confirmed that Task Manager cannot disable it.

Startup apps and services are related, but they are not the same thing. Do not disable Windows services only to reduce startup load. See [Services & Security](08-services-and-security.html).

---

## Browser

Modern browsers can consume significant RAM, CPU, GPU, and network resources, especially with video playback, streams, many tabs, and extensions.

Before gaming:

- Close tabs with YouTube, Twitch, movies, or ads.
- Disable unnecessary extensions.
- Finish downloads.
- If RAM is limited, fully close the browser process, not only its window.
- Check whether the browser remains running in the background after closing.

Do not disable browser hardware acceleration “for FPS” without a reason. It can reduce or shift load to the GPU depending on the case. Test it only for a specific browser, video, or overlay issue.

---

## Downloads, cloud sync, and network load

While gaming, close or pause:

- Game downloads in Steam, Epic Games, Battle.net, and similar launchers
- Torrents
- Windows Update, if it is actively downloading
- OneDrive, Google Drive, Dropbox, and other cloud sync
- Cloud backup jobs
- High-bitrate streaming or video on other devices, if your connection is limited

Downloads can:

- Saturate bandwidth and worsen ping
- Increase SSD load
- Use CPU for file verification or decompression
- Cause stutter on weaker systems

> **Note:** If the issue is only ping or packet loss, do not try to fix it by disabling Windows services. First check downloads, Wi-Fi or Ethernet, the router, ISP, and game-server status.

---

## Overlays

An overlay is UI displayed on top of a game: FPS counter, chat, recording controls, notifications, browser, or store.

Common overlays:

- Steam Overlay
- Discord Overlay
- NVIDIA Overlay
- AMD Overlay
- Xbox Game Bar
- Overwolf
- MSI Afterburner with RTSS
- Peripheral vendor overlays
- OBS or screen-recording overlays

If stutter, crashes, or launch issues appear:

1. Disable one overlay.
2. Restart the game.
3. Test the same scene.
4. If there is no difference, re-enable it if needed.
5. Repeat with the next overlay.

> **Important:** Do not run multiple recording tools and multiple FPS overlays at the same time. They can conflict.

---

## RGB software and peripherals

RGB and peripheral tools can be useful for:

- Mouse DPI and polling rate
- Macros
- Keyboard profiles
- Lighting
- Fan curves
- Monitoring

But some tools continuously consume CPU and RAM and run extra services, overlays, and telemetry.

1. Save device profiles to onboard mouse or keyboard memory, if available.
2. Check whether the app can be removed from startup without losing needed features.
3. Do not uninstall fan-control software until you confirm that fan behavior remains correct without it.
4. If several RGB suites from different vendors are installed, keep only the minimal set you need.

---

## Recording, streaming, and virtual cameras

OBS, Discord streaming, NVIDIA ShadowPlay or Instant Replay, AMD ReLive, Xbox Game Bar, and similar apps can use CPU, GPU, VRAM, SSD, and network resources.

Before gaming:

- Need recording? Keep one recording method enabled.
- Need streaming? Use a dedicated OBS profile and test its load.
- No recording needed? Disable Instant Replay, Replay Buffer, and extra overlays.
- Not using a virtual camera? Close it together with its parent app.

During streaming or recording, monitor:

- Dropped frames in OBS
- GPU usage
- VRAM usage
- CPU load
- SSD write speed
- Temperatures and clocks

---

## Before launching a game

1. Finish downloads and updates.
2. Close browser video and unnecessary tabs.
3. Pause cloud sync if it is actively running.
4. Keep only the required messenger or voice chat.
5. Disable unnecessary overlays.
6. Close heavy work apps: video editing, Photoshop, IDEs, and virtual machines.
7. Verify that recording or streaming is off if it is not needed.
8. Launch the game.

---

## What not to close

Do not randomly terminate:

- `explorer.exe`
- Windows processes with unknown purpose
- Driver-related processes
- Audio services
- Security processes
- Network components
- Anti-cheat processes while gaming
- System processes such as `Service Host` or `svchost.exe`

If a process constantly creates load, first identify which application owns it. See [Services & Security](08-services-and-security.html).

---

## Checklist

- [ ] Unnecessary startup apps are disabled.
- [ ] Browser video and heavy apps are closed before gaming.
- [ ] Downloads and cloud sync are paused.
- [ ] Multiple overlays or recorders are not running simultaneously.
- [ ] RGB and peripheral software runs only when needed.
- [ ] No random termination of system processes.
- [ ] All changes are validated
