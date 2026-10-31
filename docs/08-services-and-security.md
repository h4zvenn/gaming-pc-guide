---
layout: doc
title: "08. Services and Security"
description: "Review third-party services safely, avoid mass service disabling, and preserve Windows security and rollback options."
lang: en
translation_key: services-and-security
permalink: /docs/08-services-and-security.html
---

# 08. Services and Security

> Disabling services is one of the most overrated and risky “optimization” methods. Most services consume almost nothing while idle, and mass disabling can break networking, audio, updates, anti-cheat, app installation, and Windows security.

## Core rule

Do not disable a service until you can answer three questions:

1. What exactly does this service do?
2. What specific problem does it cause on my PC?
3. How will I revert the change if something stops working?

> [!IMPORTANT]
> The goal is to remove a specific unnecessary program, not to minimize the number of Windows services at all costs.

### Safe decision matrix

| You see | First action |
| --- | --- |
| High CPU/disk usage | Find the process owner before touching services |
| Update-related load | Pause or schedule updates; do not disable services |
| Unknown service name | Research its origin and file path first |

Third-party tools that apply service, registry, or debloat changes — for example BoosterX background services, Hone registry optimizations, GTtwick, Sparkle, RyTuneX, Exoptimizer, and BRUTAL-FPS process tuning — must follow the same guardrails: one area at a time, keep a rollback path, and do not blanket-disable critical services or security protections.

---

## 1. Why “disable 100 services” is a bad idea

Prebuilt debloat scripts, videos, and “unnecessary services” lists often ignore:

- Windows version;
- desktop vs laptop usage;
- installed drivers and peripherals;
- VPN, printers, Bluetooth, and Wi-Fi;
- anti-cheat and game launchers;
- Microsoft Store, Xbox, and Game Pass features;
- corporate software and remote-access needs.

A service that is unnecessary for one user may be critical for another.

### Possible consequences

- Loss of internet, DNS, or DHCP.
- No sound or microphone.
- Bluetooth or Wi-Fi connection failure.
- Game or anti-cheat launch failure.
- Driver installation issues.
- Broken Windows updates.
- Microsoft Store, Game Pass, or Xbox features stop working.
- Event Viewer errors.
- Reduced system security.

---

## 2. What not to disable blindly

These Windows components are critical. Do not disable them without an exact, documented reason.

### System and software installation

- Remote Procedure Call (RPC)
- DCOM Server Process Launcher
- RPC Endpoint Mapper
- Plug and Play
- Task Scheduler
- Windows Installer
- Windows Modules Installer
- Cryptographic Services
- Windows Event Log
- Windows Management Instrumentation

### Networking

- DHCP Client
- DNS Client
- Network Location Awareness
- Network List Service
- Network Connections
- WLAN AutoConfig, if you use Wi-Fi
- Bluetooth Support Service, if you use Bluetooth

### Audio and devices

- Windows Audio
- Windows Audio Endpoint Builder
- Human Interface Device Service
- Device Install Service

### Security

- Microsoft Defender Antivirus Service
- Windows Security Service
- Windows Firewall
- Security Center
- Windows Update

> [!WARNING]
> Disabling Defender, Firewall, Windows Update, UAC, network, or certificate services for FPS is a bad tradeoff. Security drops, issues appear, and performance gains are usually zero or negligible.

BITS (Background Intelligent Transfer Service) is an update-delivery component, not a security feature. Do not disable it to stop updates; use Windows Update settings instead.

---

## 3. Identify the real load source

If CPU, disk, RAM, or network usage is high, do not jump straight into `services.msc`.

### Step 1. Find the process

Open:

```text
Ctrl + Shift + Esc → Task Manager → Processes
```

Sort by:

- CPU;
- Memory;
- Disk;
- Network;
- GPU.

### Step 2. Identify the process owner

- Right-click the process.
- Select `Open file location`.
- Open `Properties` → `Digital Signatures`.
- Identify the application and decide whether it is needed.

### Step 3. Find the related service

In Task Manager, open:

```text
Services
```

Or:

```text
Win + R → services.msc
```

Do not change a startup type before understanding its relation to an app or driver.

### Step 4. Fix the root cause

Instead of disabling a system service:

- Close the program.
- Disable its startup.
- Turn off the unnecessary feature inside the app.
- Update or reinstall the problematic app.
- Uninstall it if unused.
- Schedule sync or scans for non-gaming time.

---

## 4. `svchost.exe` and Service Host

Seeing many `Service Host` / `svchost.exe` processes in Task Manager is normal. Windows runs services in separated groups for stability and security.

### What to do on high load

1. Expand the `Service Host` group in Task Manager.
2. Check which exact service is inside.
3. Determine the cause: update, indexing, sync, network, or driver error.
4. Do not delete or block `svchost.exe`.

> [!WARNING]
> `svchost.exe` is a core Windows process. Deleting, blocking, or “optimizing” it with third-party scripts can damage the system.

---

## 5. Microsoft Defender

Defender provides built-in malware protection.

### If scans interfere with gaming

Do not disable Defender permanently. Better options:

- Wait for a one-time scan to finish.
- Do not run a manual full scan during gaming.
- Check whether a suspicious app causes constant scanning.
- Update protection signatures.
- Add exclusions only for trusted folders and only if you understand the risk.

### About exclusions

An exclusion means Defender skips scanning that file or folder. Do not exclude:

- The full system drive `C:`.
- The `Downloads` folder.
- Unknown repositories or scripts.
- Pirated software.
- Browser folders.
- Everything “for performance”.

If a trusted game or tool truly conflicts with scanning, use the minimal required exclusion and prefer developer recommendations.

---

## 6. Windows Update and BITS

Windows Update and BITS handle updates, including security and driver updates.

### If updates load the system

Instead of disabling services:

1. Open `Settings → Windows Update`.
2. Pause updates briefly if needed.
3. Configure active hours.
4. Let updates complete after gaming.
5. Reboot if Windows requires it.

> [!NOTE]
> A temporary update pause is normal. Permanently disabled Windows Update creates security risk and long-term compatibility issues.

---

## 7. UAC, Firewall, and SmartScreen

### UAC

UAC warns when apps request administrator rights. Do not disable it for convenience; it helps detect unwanted system changes.

### Windows Firewall

Firewall controls network connections. Disabling it is not a way to reduce ping or increase FPS.

If a game cannot connect:

- Check Firewall rules.
- Allow only a specific trusted app.
- Check router, VPN, antivirus, and game-server status.
- Do not disable protection globally.

### SmartScreen

SmartScreen warns about suspicious files and sites. Do not disable it just to run unknown `.exe`, `.bat`, `.reg`, or PowerShell scripts.

---

## 8. Safe service status checks

### View running services

```powershell
Get-Service |
  Where-Object Status -eq 'Running' |
  Sort-Object DisplayName |
  Select-Object Status, Name, DisplayName
```

### Find a service by partial name

Example for the word `Update`:

```powershell
Get-Service *Update* |
  Select-Object Status, Name, DisplayName
```

### View services set to automatic startup

```powershell
Get-CimInstance Win32_Service |
  Where-Object StartMode -eq 'Auto' |
  Sort-Object DisplayName |
  Select-Object Name, DisplayName, State, StartMode
```

> [!NOTE]
> All commands above are read-only. They do not change Windows configuration.

---

## 9. Third-party service review

Review only third-party services. Do not disable system services from copied lists.

```powershell
Get-CimInstance Win32_Service |
  Where-Object { $_.PathName -and $_.PathName -notmatch 'Windows|Microsoft' } |
  Select-Object Name, DisplayName, State, StartMode, PathName |
  Format-Table -AutoSize
```

Before changing a service, record its current `StartType`. If something stops working, restore the original setting.

### Safe candidates

| Service | Recommended state | When |
| --- | --- | --- |
| `XboxService` | `Manual` | Xbox Game Bar is not used |
| `LGHUBUpdaterService` | `Manual` | Constant Logitech background updates are not needed |
| Discord System Helper | Leave as `Manual` | It is usually not running by default |
| NVIDIA FrameView SDK | Leave as `Manual` | Needed only for FrameView |

Example:

```powershell
Set-Service -Name XboxService -StartupType Manual
Stop-Service -Name XboxService -ErrorAction SilentlyContinue

Set-Service -Name LGHUBUpdaterService -StartupType Manual
Stop-Service -Name LGHUBUpdaterService -ErrorAction SilentlyContinue
```

### Services to leave alone

| Service | Reason |
| --- | --- |
| `NvContainerLocalSystem` | Required by NVIDIA App and driver components |
| Steam Client Service | Required for normal Steam operation |
| Windows Update | Security and system updates |
| Microsoft Defender | Antimalware protection |
| AudioSrv | Required for sound |
| AudioEndpointBuilder | Required for audio devices |
| Bluetooth Support Service | Required for Bluetooth headphones, mice, and controllers |
| WLAN AutoConfig | Required for Wi-Fi |

### Restore a service

If something stops working, restore the previous startup type:

```powershell
Set-Service -Name 'SERVICE_NAME' -StartupType Automatic
Start-Service -Name 'SERVICE_NAME'
```

Example for Xbox:

```powershell
Set-Service -Name XboxService -StartupType Automatic
Start-Service XboxService
```

### Verify service changes

```powershell
Get-Service XboxService, LGHUBUpdaterService -ErrorAction SilentlyContinue |
  Select-Object Name, Status, StartType |
  Format-Table -AutoSize
```

### Service startup types

| Type | Meaning |
| --- | --- |
| Automatic | Starts with Windows |
| Manual | Starts only when required |
| Disabled | Never starts; use only if you are certain |

---

## 10. Prebuilt debloat scripts and “optimizers”

Be especially careful with files like:

```text
.bat
.cmd
.ps1
.reg
.exe
```

that promise:

- “+500 FPS”.
- “Disable all telemetry”.
- “Reduce input lag with one click”.
- “Remove Windows bloat without side effects”.
- “Disable 200 unnecessary services”.
- “Fix ping”.
- “Optimize timers/HPET/BCD”.

Before running any script:

1. Open it in Notepad or VS Code.
2. Read every command.
3. Verify the author and source repository.
4. Create a restore point.
5. Do not run it as administrator if you do not understand what it changes.
6. Do not run scripts from archives, Discord, YouTube descriptions, or unknown websites without review.

> [!IMPORTANT]
> If a script cannot be read and understood, it cannot be run safely.

---

## Checklist

- [ ] Windows services are not disabled “by list”.
- [ ] Under load, a specific process and owner are identified first.
- [ ] An unnecessary third-party program is disabled from startup or uninstalled safely.
- [ ] Defender, Firewall, UAC, Windows Update, and network services stay enabled.
- [ ] `svchost.exe` and other system processes are not removed.
- [ ] Unknown BAT, REG, or PowerShell scripts are not applied.
- [ ] A restore point is created before major changes.

---

## Summary

Services are not the place for mass “optimization.” If there is background load, identify the specific program and remove the root cause: configure it, disable startup, or uninstall it. This preserves FPS, stability, anti-cheat compatibility, networking, and Windows security.

Next step: [PowerShell diagnostics and checks](09-powershell-diagnostics.md).
