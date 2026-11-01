---
layout: doc
title: "Services & Security"
description: "Review third-party services safely, avoid mass service disabling, and preserve Windows security and rollback options."
lang: en
translation_key: services-and-security
permalink: /docs/08-services-and-security.html
---


> Disabling services is one of the most overrated and risky “optimization” methods. Most services consume almost nothing while idle, and mass disabling can break networking, audio, updates, anti-cheat, app installation, and Windows security.

## Core rule

Do not disable a service until you can answer three questions:

1. What exactly does this service do?
2. What specific problem does it cause on my PC?
3. How will I revert the change if something stops working?

> **Important:** The goal is to remove a specific unnecessary program, not to minimize the number of Windows services at all costs.

| You see | First action |
| --- | --- |
| High CPU, disk, or network usage | Find the process owner before touching services |
| Update-related load | Pause or schedule updates; do not disable services |
| Unknown service name | Research its origin and file path first |

Third-party tools that apply service, registry, or debloat changes must follow the same guardrails: change one area at a time, keep a rollback path, and do not blanket-disable critical services or security protections.

---

## Why mass disabling fails

Prebuilt debloat scripts, videos, and “unnecessary services” lists often ignore:

- Windows version
- Desktop versus laptop usage
- Installed drivers and peripherals
- VPN, printers, Bluetooth, and Wi-Fi
- Anti-cheat and game launchers
- Microsoft Store, Xbox, and Game Pass features
- Corporate software and remote-access needs

A service that is unnecessary for one user may be critical for another.

Possible consequences:

- Loss of internet, DNS, or DHCP
- No sound or microphone
- Bluetooth or Wi-Fi connection failure
- Game or anti-cheat launch failure
- Driver installation issues
- Broken Windows updates
- Microsoft Store, Game Pass, or Xbox features stop working
- Event Viewer errors
- Reduced system security

---

## Do not disable blindly

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

> **Warning:** Disabling Defender, Firewall, Windows Update, UAC, network, or certificate services for FPS is a bad trade-off. Security drops, issues appear, and performance gains are usually zero or negligible.

BITS (Background Intelligent Transfer Service) is an update-delivery component, not a security feature. Do not disable it to stop updates; use Windows Update settings instead.

---

## Identify the real load source

If CPU, disk, RAM, or network usage is high, do not jump straight into `services.msc`.

### Find the process

Open:

```text
Ctrl + Shift + Esc → Task Manager → Processes
```

Sort by CPU, memory, disk, network, or GPU.

### Identify the process owner

- Right-click the process.
- Select `Open file location`.
- Open `Properties → Digital Signatures`.
- Identify the application and decide whether it is needed.

### Find the related service

Open Task Manager’s `Services` tab, or run:

```text
Win + R → services.msc
```

Do not change a startup type before understanding its relation to an app or driver.

### Fix the root cause

Instead of disabling a system service:

- Close the program.
- Disable its startup.
- Turn off the unnecessary feature inside the app.
- Update or reinstall the problematic app.
- Uninstall it if unused.
- Schedule sync or scans for non-gaming time.

---

## Service Host and svchost.exe

Seeing many `Service Host` or `svchost.exe` processes in Task Manager is normal. Windows runs services in separated groups for stability and security.

If load is high:

1. Expand the `Service Host` group in Task Manager.
2. Check which exact service is inside.
3. Determine the cause: update, indexing, sync, network, or driver error.
4. Do not delete or block `svchost.exe`.

> **Warning:** `svchost.exe` is a core Windows process. Deleting, blocking, or “optimizing” it with third-party scripts can damage the system.

---

## Microsoft Defender

Defender provides built-in malware protection.

If scans interfere with gaming:

- Wait for a one-time scan to finish.
- Do not run a manual full scan during gaming.
- Check whether a suspicious app causes constant scanning.
- Update protection signatures.
- Add exclusions only for trusted folders and only if you understand the risk.

An exclusion means Defender skips scanning that file or folder. Do not exclude:

- The full system drive `C:`
- The `Downloads` folder
- Unknown repositories or scripts
- Pirated software
- Browser folders
- Everything “for performance”

If a trusted game or tool truly conflicts with scanning, use the minimal required exclusion and prefer developer recommendations.

---

## Windows Update and BITS

Windows Update and BITS handle updates, including security and driver updates.

If updates load the system:

1. Open `Settings → Windows Update`.
2. Pause updates briefly if needed.
3. Configure active hours.
4. Let updates complete after gaming.
5. Reboot if Windows requires it.

> **Note:** A temporary update pause is normal. Permanently disabled Windows Update creates security risk and long-term compatibility issues.

---

## UAC, Firewall, and SmartScreen

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

## Safe service checks

Use option 3 in the [read-only diagnostics guide](09-powershell-diagnostics.html) to review running and third-party services. It only displays information. The manual PowerShell examples remain in that guide.

---

## Review third-party services

Review only third-party services. Do not disable system services from copied lists.

Use the third-party services check in the [read-only diagnostics menu](09-powershell-diagnostics.html) to inspect service names, paths, and startup states.

Before changing a service, record its current `StartType`. If something stops working, restore the original setting.

### Possible candidates

| Service | Recommended state | When |
| --- | --- | --- |
| `XboxService` | `Manual`, only after testing | Xbox Game Bar, Game Pass, or Xbox features are not used |
| `LGHUBUpdaterService` | `Manual` | Constant Logitech background updates are not needed |
| Discord System Helper | Leave as `Manual` | It is usually not running by default |
| NVIDIA FrameView SDK | Leave as `Manual` | Needed only for FrameView |

### Optional advanced change

Only change a third-party service if you have identified a real issue, recorded its current startup type, and know how to restore it.

Run PowerShell as Administrator only after creating a restore point.

Example:

```powershell
Set-Service -Name XboxService -StartupType Manual
Stop-Service -Name XboxService -ErrorAction SilentlyContinue
```

Do not apply service changes in bulk. Change one service, reboot or test the affected feature, and keep a rollback command ready.

### Services to leave alone

| Service | Reason |
| --- | --- |
| `NvContainerLocalSystem` | Required by NVIDIA App and driver components |
| Steam Client Service | Required for normal Steam operation |
| Windows Update | Security and system updates |
| Microsoft Defender | Antimalware protection |
| `AudioSrv` | Required for sound |
| `AudioEndpointBuilder` | Required for audio devices |
| Bluetooth Support Service | Required for Bluetooth headphones, mice, and controllers |
| WLAN AutoConfig | Required for Wi-Fi |

### Restore a service

```powershell
Set-Service -Name 'SERVICE_NAME' -StartupType Automatic
Start-Service -Name 'SERVICE_NAME'
```

Example for Xbox:

```powershell
Set-Service -Name XboxService -StartupType Automatic
Start-Service XboxService
```

Verify the change:

```powershell
Get-Service XboxService, LGHUBUpdaterService -ErrorAction SilentlyContinue |
Select-Object Name, Status, StartType |
Format-Table -AutoSize
```

| Startup type | Meaning |
| --- | --- |
| Automatic | Starts with Windows |
| Manual | Starts only when required |
| Disabled | Never starts; use only if you are certain |

---

## Debloat scripts and optimizers

Be especially careful with files such as:

```text
.bat
.cmd
.ps1
.reg
.exe
```

that promise:

- “+500 FPS”
- “Disable all telemetry”
- “Reduce input lag with one click”
- “Remove Windows bloat without side effects”
- “Disable 200 unnecessary services”
- “Fix ping”
- “Optimize timers, HPET, or BCD”

Before running any script:

1. Open it in Notepad or VS Code.
2. Read every command.
3. Verify the author and source repository.
4. Create a restore point.
5. Do not run it as administrator if you do not understand what it changes.
6. Do not run scripts from archives, Discord, YouTube descriptions, or unknown websites without review.

> **Important:** If a script cannot be read and understood, it cannot be run safely.

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

## Next step

[PowerShell Diagnostics](09-powershell-diagnostics.html)
