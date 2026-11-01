---
layout: doc
title: "PowerShell Diagnostics"
description: "Use safe PowerShell commands to inspect hardware, services, network status, and system errors."
lang: en
translation_key: powershell-diagnostics
permalink: /docs/09-powershell-diagnostics.html
---


> Use PowerShell to inspect your system, not to run random “one-click FPS” scripts.

## Quick diagnostic flow

| If you need to check | Go here |
| --- | --- |
| Basic hardware information | CPU, GPU, RAM, drives |
| Startup and background load | Startup apps and processes |
| Services status | Services |
| Network and ping basics | Network |
| Suspected Windows corruption | System file integrity |
| WHEA and hardware errors | Event logs and WHEA |

---

## Open PowerShell

### Normal mode

1. Press `Win`.
2. Type `Windows Terminal` or `PowerShell`.
3. Open it.

Most commands in this guide do not require administrator rights.

### Administrator mode

Use it only when explicitly required:

1. Press `Win`.
2. Type `Windows Terminal`.
3. Right-click and select `Run as administrator`.

> **Warning:** Do not run unknown commands as administrator.

---

## CPU information

```powershell
Get-CimInstance Win32_Processor |
Select-Object Name, Manufacturer, NumberOfCores, NumberOfLogicalProcessors,
CurrentClockSpeed, MaxClockSpeed
```

This shows the CPU model, core and thread count, and reported clocks.

---

## GPU and driver information

```powershell
Get-CimInstance Win32_VideoController |
Select-Object Name, VideoProcessor, DriverVersion, DriverDate,
CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate
```

If the refresh rate looks wrong, verify it in:

```text
Settings → System → Display → Advanced display
```

---

## RAM information

```powershell
Get-CimInstance Win32_PhysicalMemory |
Select-Object Manufacturer, PartNumber, Capacity, Speed, ConfiguredClockSpeed
```

Total RAM in GB:

```powershell
[math]::Round(
    (Get-CimInstance Win32_PhysicalMemory |
    Measure-Object -Property Capacity -Sum).Sum / 1GB,
    0
)
```

---

## Drives and free space

### Free space

```powershell
Get-PSDrive -PSProvider FileSystem |
Select-Object Name,
@{Name='UsedGB';Expression={[math]::Round($_.Used / 1GB, 1)}},
@{Name='FreeGB';Expression={[math]::Round($_.Free / 1GB, 1)}}
```

### Physical disks

```powershell
Get-PhysicalDisk |
Select-Object FriendlyName, MediaType, BusType, HealthStatus,
OperationalStatus, Size
```

---

## Power plan

Current plan:

```powershell
powercfg /getactivescheme
```

All plans:

```powershell
powercfg /list
```

Energy report, administrator required:

```powershell
powercfg /energy
```

---

## Startup apps

```powershell
Get-CimInstance Win32_StartupCommand |
Select-Object Name, Command, Location, User
```

Disable startup items in:

```text
Task Manager → Startup apps → Disable
```

See [Background Apps](07-background-apps.html).

---

## Processes

Top cumulative CPU time:

```powershell
Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 20 Name, Id, CPU, WorkingSet64
```

Top RAM usage:

```powershell
Get-Process |
Sort-Object WorkingSet64 -Descending |
Select-Object -First 20 Name, Id,
@{Name='RAM_MB';Expression={[math]::Round($_.WorkingSet64 / 1MB, 0)}}
```

Find a process by name, for example Discord:

```powershell
Get-Process *discord* -ErrorAction SilentlyContinue |
Select-Object Name, Id, CPU, WorkingSet64
```

> **Warning:** Do not kill unknown or system processes blindly.

---

## Services

Running services:

```powershell
Get-Service |
Where-Object Status -eq 'Running' |
Sort-Object DisplayName |
Select-Object Status, Name, DisplayName
```

Automatic-start services:

```powershell
Get-CimInstance Win32_Service |
Where-Object StartMode -eq 'Auto' |
Sort-Object DisplayName |
Select-Object Name, DisplayName, State, StartMode
```

Find services by partial name, for example audio:

```powershell
Get-Service *audio* |
Select-Object Status, Name, DisplayName
```

See [Services & Security](08-services-and-security.html).

---

## Network

IP and adapter configuration:

```powershell
Get-NetIPConfiguration
```

Adapter status:

```powershell
Get-NetAdapter |
Select-Object Name, InterfaceDescription, Status, LinkSpeed, MacAddress
```

DNS test:

```powershell
Resolve-DnsName microsoft.com
```

Basic connectivity test:

```powershell
Test-Connection 1.1.1.1 -Count 10
```

### Game-server latency

To measure latency to the server you actually play on:

1. Identify the game-server region or address from the launcher or game logs.
2. Run a short 5–10 minute latency and packet-loss test toward that host.
3. Record minimum, average, and maximum latency, plus packet loss.
4. Repeat on Wi-Fi and Ethernet if you want to separate wireless noise from real network latency.

> **Important:** A `1.1.1.1` test is not your game-server ping; it is only a baseline connectivity check. `Test-Connection` uses ICMP, which some servers and firewalls block. A failed ping does not automatically prove a bad game connection.

Before measuring, pause downloads, cloud sync, torrents, and streaming. Network saturation can appear as high latency and may be unrelated to routing or ISP problems.

---

## System file integrity

Use this only for suspected Windows corruption. Both commands can take a long time and require an administrator terminal.

DISM repairs the Windows component store. SFC checks and replaces protected system files using that store. If the store itself is damaged, SFC may be unable to repair anything, so the more reliable repair order is DISM first, then SFC.

```powershell
DISM /Online /Cleanup-Image /RestoreHealth
```

```powershell
sfc /scannow
```

Repair order:

1. Run `DISM /Online /Cleanup-Image /RestoreHealth`.
2. Wait for it to finish and read the result.
3. Run `sfc /scannow`.
4. Reboot.
5. If problems persist, repeat the sequence and check the CBS log.

Microsoft documents `sfc /scannow` as a quick check-and-repair option, while `DISM /Cleanup-Image` is the more extensive option for repairing the component store. [Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/repair-a-windows-image)

---

## Event logs and WHEA

Check recent WHEA events:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    ProviderName = 'Microsoft-Windows-WHEA-Logger'
} -MaxEvents 20 |
Select-Object TimeCreated, Id, LevelDisplayName, Message
```

If WHEA errors appear after overclocking, undervolting, XMP/EXPO, PBO, or Curve Optimizer, revert to stable settings and retest.

---

## Export diagnostics

Save system information to the desktop:

```powershell
systeminfo | Out-File -Encoding utf8 "$env:USERPROFILE\Desktop\systeminfo.txt"
```

Save the driver list to CSV:

```powershell
driverquery /v /fo csv | Out-File -Encoding utf8 "$env:USERPROFILE\Desktop\drivers.csv"
```

---

## Checklist

- [ ] Commands are used with a clear purpose.
- [ ] Administrator mode is used only when required.
- [ ] Results are validated in-game: FPS, 1% lows, frame times, and stability.
- [ ] Unknown processes and services are not modified blindly.

---

## Next step

[Temperatures & Stability](10-temperatures-stability.html)
