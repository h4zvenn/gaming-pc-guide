---
layout: doc
title: "08-services-and-security"
---

# 08. Services and Security

> Disabling services is one of the most overrated and risky вЂњoptimizationвЂќ methods. Most services consume almost nothing while idle, and mass disabling can break networking, audio, updates, anti-cheat, app installation, and Windows security.

## Core rule

Do not disable a service until you can answer three questions:

1. What exactly does this service do?
2. What specific problem does it cause on my PC?
3. How will I revert the change if something stops working?

> [!IMPORTANT]
> The goal is to remove a specific unnecessary program, not to minimize the number of Windows services at all costs.

### Safe decision matrix

| You see | First action |
|---|---|
| High CPU/disk usage | Find process owner before touching services |
| Update-related load | Pause/schedule updates, do not disable services |
| Unknown service name | Research origin and file path first |

Third-party tools that apply service, registry, or debloat changes вЂ” for example BoosterX background services, Hone registry optimizations, GTtwick, Sparkle, RyTuneX, Exoptimizer, and BRUTAL-FPS process tuning вЂ” must follow the same guardrails described here: one area at a time, keep a rollback path, and do not blanket-disable critical services or security protections.

---

## 1. Why вЂњdisable 100 servicesвЂќ is a bad idea

Prebuilt debloat scripts, videos, and вЂњunnecessary servicesвЂќ lists often ignore:

- Windows version;
- desktop vs laptop usage;
- installed drivers and peripherals;
- VPN, printers, Bluetooth, Wi-Fi;
- anti-cheat and game launchers;
- Microsoft Store/Xbox features;
- corporate software and remote access needs.

A service that is unnecessary for one user may be critical for another.

### Possible consequences

- loss of internet, DNS, or DHCP;
- no sound or microphone;
- Bluetooth/Wi-Fi connection failure;
- game/anti-cheat launch failure;
- driver installation issues;
- broken Windows updates;
- Microsoft Store, Game Pass, or Xbox features stop working;
- Event Viewer errors;
- reduced system security.

---

## 2. What you should not disable blindly

Below are critical Windows components. Do not disable them without an exact documented reason.

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
- WLAN AutoConfig (if you use Wi-Fi)
- Bluetooth Support Service (if you use Bluetooth)

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

## 3. Correct way to identify the real load source

If CPU/disk/RAM/network usage is high, do not jump straight into `services.msc`.

### Step 1. Find the process

Open:

```text
Ctrl + Shift + Esc в†’ Task Manager в†’ Processes
```

Sort by:

- CPU;
- Memory;
- Disk;
- Network;
- GPU.

### Step 2. Identify process owner

- Right-click the process.
- Select `Open file location`.
- Open `Properties` в†’ `Digital Signatures`.
- Identify app name and verify if it is needed.

### Step 3. Find related service

In Task Manager, open:

```text
Services
```

Or:

```text
Win + R в†’ services.msc
```

Do not change startup type before understanding service relation to app or driver.

### Step 4. Fix root cause

Instead of disabling a system service:

- close the program;
- disable its startup;
- turn off unnecessary feature inside app settings;
- update/reinstall problematic app;
- uninstall it if unused;
- schedule sync/scans for non-gaming time.

---

## 4. `svchost.exe` and Service Host

Seeing many `Service Host` / `svchost.exe` processes in Task Manager is normal. Windows runs services in separated groups for stability and security.

### What to do on high load

1. Expand the `Service Host` group in Task Manager.
2. Check which exact service is inside.
3. Determine cause: update, indexing, sync, network, driver error.
4. Do not delete or block `svchost.exe`.

> [!WARNING]
> `svchost.exe` is a core Windows process. Deleting/blocking/"optimizing" it with third-party scripts can damage the system.

---

## 5. Microsoft Defender

Defender provides built-in malware protection.

### What to do if scans interfere

Do not disable Defender permanently. Better options:

- wait for one-time scan to finish;
- do not run manual full scan during gaming;
- check for suspicious app causing constant scanning;
- update protection signatures;
- add exclusions only for trusted folders and only if you understand the risk.

### About exclusions

An exclusion means Defender will skip scanning that file/folder. Do not exclude:

- full system drive `C:`;
- `Downloads` folder;
- unknown repositories/scripts;
- pirated software;
- browser folders;
- everything вЂњfor performance.вЂќ

If a trusted game/tool truly conflicts with scanning, use the minimal required exclusion and prefer developer recommendations.

---

## 6. Windows Update and BITS

Windows Update and BITS handle updates, including security and driver updates.

### If updates load the system

Instead of disabling services:

1. Open `Settings в†’ Windows Update`.
2. Pause updates briefly if needed.
3. Configure active hours.
4. Let updates complete after gaming.
5. Reboot if Windows requires it.

> [!NOTE]
> Temporary update pause is normal. Permanently disabled Windows Update creates security risk and long-term compatibility issues.

---

## 7. UAC, Firewall, and SmartScreen

### UAC

UAC warns when apps request administrator rights. Do not disable it for convenience; it helps detect unwanted system changes.

### Windows Firewall

Firewall controls network connections. Disabling it is not a way to reduce ping or increase FPS.

If a game cannot connect:

- check Firewall rules;
- allow specific trusted app;
- check router, VPN, antivirus, and game server status;
- do not disable protection globally.

### SmartScreen

SmartScreen warns about suspicious files/sites. Do not disable it just to run unknown `.exe`, `.bat`, `.reg`, or PowerShell scripts.

---

## 8. Safe service status checks

### View running services

```powershell
Get-Service |
Where-Object Status -eq 'Running' |
Sort-Object DisplayName |
Select-Object Status, Name, DisplayName
```

### Find service by partial name

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

## 9. If you need to disable a third-party service

Sometimes a third-party app installs an unnecessary service: updater, telemetry agent, RGB suite, trial antivirus, or old launcher.

Safe sequence:

1. Verify service is not part of a required driver or app.
2. Close the app.
3. Disable app startup.
4. Check whether app has built-in startup/service option.
5. If app is unnecessary, uninstall it via:

    ```text
    Settings в†’ Apps в†’ Installed apps
    ```

6. Reboot and verify system behavior.

Do not manually remove services via registry/commands when normal app uninstall is sufficient.

---

## 10. Prebuilt debloat scripts and вЂњoptimizersвЂќ

Be especially careful with files like:

```text
.bat
.cmd
.ps1
.reg
.exe
```

that promise:

- вЂњ+500 FPSвЂќ;
- вЂњdisable all telemetryвЂќ;
- вЂњreduce input lag with one clickвЂќ;
- вЂњremove Windows bloat without side effectsвЂќ;
- вЂњdisable 200 unnecessary servicesвЂќ;
- вЂњfix pingвЂќ;
- вЂњoptimize timers/HPET/BCDвЂќ.

Before running any script:

1. Open it in Notepad or VS Code.
2. Read every command.
3. Verify author and source repository.
4. Create a restore point.
5. Do not run as administrator if you do not understand what it changes.
6. Do not run scripts from archives, Discord, YouTube descriptions, or unknown websites without review.

> [!IMPORTANT]
> If a script cannot be read and understood, it cannot be run safely.

---

## Checklist

- [ ] Windows services are not disabled вЂњby list.вЂќ
- [ ] Under load, a specific process and owner are identified first.
- [ ] Unnecessary third-party program is disabled from startup or uninstalled safely.
- [ ] Defender, Firewall, UAC, Windows Update, and network services stay enabled.
- [ ] `svchost.exe` and other system processes are not removed.
- [ ] Unknown BAT/REG/PowerShell scripts are not applied.
- [ ] Restore point is created before major changes.

---

## Summary

Services are not the place for mass вЂњoptimization.вЂќ If there is background load, identify the specific program and remove root cause: configure it, disable startup, or uninstall it. This preserves FPS, stability, anti-cheat compatibility, networking, and Windows security.

Next step: [PowerShell: diagnostics and checks](09-powershell-diagnostics.html).
