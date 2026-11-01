---
layout: doc
title: "Security Hardening"
description: "Maintain a safe Windows security baseline while optimizing a gaming PC."
lang: en
translation_key: security-hardening-baseline
permalink: /docs/13-security-hardening-baseline.html
---


> Goal: maintain real security with minimal FPS impact while preserving compatibility for games, anti-cheat, and updates.

## Principles

1. Keep security defaults enabled unless there is measured, proven impact.
2. Change one setting at a time and benchmark before and after.
3. Prefer allow-listing and targeted exclusions over disabling core security features.
4. Use official sources for drivers, software, and firmware.

| Control | Recommended state |
| --- | --- |
| Defender | Enabled |
| Firewall | Enabled |
| Windows Update | Enabled and scheduled |
| UAC | Default or higher |
| Random scripts | Blocked by default |

---

## Account and access

- Use a Microsoft account or local account with a strong, unique password.
- Enable Windows Hello or a PIN if available.
- Keep UAC enabled at the default level or higher.
- Avoid daily use of a full administrator account when possible.

Quick check:

```powershell
whoami /groups
```

---

## Defender baseline

Keep enabled:

- Microsoft Defender real-time protection
- Cloud-delivered protection
- Tamper protection

Add targeted exclusions only for a specific game folder or process if there is a verified false positive or a measurable issue.

Check status:

```powershell
Get-MpComputerStatus |
Select-Object AMServiceEnabled, RealTimeProtectionEnabled, IoavProtectionEnabled,
AntispywareEnabled, AntivirusEnabled, TamperProtectionSource
```

---

## Firewall baseline

- Keep Windows Defender Firewall enabled for Domain, Private, and Public profiles.
- Do not disable the firewall globally for multiplayer troubleshooting.
- Create narrow inbound rules only when a game or server tool requires them.

Check profiles:

```powershell
Get-NetFirewallProfile |
Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction
```

---

## Update baseline

- Keep Windows Update enabled.
- Install cumulative and security updates on a regular schedule.
- Update GPU, chipset, and network drivers from vendor sites only.
- Update motherboard BIOS or SSD firmware only when the changelog is relevant or fixes a known issue.

Check the update service:

```powershell
Get-Service wuauserv |
Select-Object Name, Status, StartType
```

---

## Downloads and application control

- Download game mods and tools only from trusted sources.
- Verify signatures or hashes for critical tools when available.
- Avoid optimizer packs that bundle scripts, unknown executables, or registry tweaks.

Signature check example:

```powershell
Get-AuthenticodeSignature "C:\Path\To\file.exe" |
Select-Object Status, SignerCertificate
```

---

## Browser and launcher hygiene

- Keep the browser and game launchers updated.
- Remove unneeded browser extensions.
- Enable two-factor authentication for game-platform accounts such as Steam, Microsoft, and Epic.

---

## Ransomware and backups

- Keep regular backups of saves, configurations, and documents.
- Consider Controlled Folder Access if you store critical data locally.
- Periodically test the restore process.

---

## Check security after tuning

After any optimization session, verify that:

- Defender is still enabled.
- Firewall is still enabled.
- The Windows Update service is not disabled.
- No unknown startup items, services, or scheduled tasks were added.

Quick checks:

```powershell
Get-CimInstance Win32_StartupCommand |
Select-Object Name, Command, Location
```

```powershell
Get-ScheduledTask |
Where-Object { $_.State -eq 'Ready' -or $_.State -eq 'Running' } |
Select-Object TaskName, TaskPath, State
```

---

## Safe exception workflow

If security appears to hurt performance:

1. Reproduce the issue in a repeatable benchmark.
2. Inspect process and file activity; do not disable protection first.
3. Add a minimal, scoped exception.
4. Retest FPS, 1% lows, frame times, and stability.
5. Document the exception and the reason for it.

---

## Do not disable globally

Do not disable these as an “optimization”:

- Microsoft Defender and its protection modules
- Windows Defender Firewall
- UAC
- SmartScreen
- Windows Update

If a game has a compatibility issue, use a targeted exception and keep core protections enabled.

---

## Next step

[Quick-Start Presets](14-quick-start-presets.html)
