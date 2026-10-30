---
layout: doc
title: "13-security-hardening-baseline"
---

# 13) Security Hardening Baseline (Gaming PC, Windows 11)

> Goal: improve real security with minimal FPS impact and keep system compatibility for games, anti-cheat, and updates.

---

## Principles

1. Keep **security defaults enabled** unless there is measured, proven impact.
2. Change **one setting at a time** and benchmark before/after.
3. Prefer **allow-listing** and exclusions over disabling core security features.
4. Use official sources for drivers, software, and firmware.

### Fast security baseline (gaming-safe)

| Control | Recommended state |
|---|---|
| Defender | Enabled |
| Firewall | Enabled |
| Windows Update | Enabled (scheduled) |
| UAC | Default or higher |
| Random scripts | Block by default |

---

## 1) Account and access hygiene

- Use a Microsoft account or local account with a strong unique password.
- Enable PIN/Windows Hello if available.
- Keep UAC enabled at default or higher.
- Avoid daily usage from a full administrator account when possible.

PowerShell quick check:

```powershell
whoami /groups
```

---

## 2) Defender baseline

Recommended:

- Keep Microsoft Defender real-time protection enabled.
- Keep cloud-delivered protection enabled.
- Keep tamper protection enabled.
- Add **targeted exclusions only** (specific game folder/process) if a verified false-positive or measurable issue appears.

Check status:

```powershell
Get-MpComputerStatus | Select-Object AMServiceEnabled,RealTimeProtectionEnabled,IoavProtectionEnabled,AntispywareEnabled,AntivirusEnabled,TamperProtectionSource
```

---

## 3) Firewall baseline

- Keep Windows Defender Firewall enabled for Domain/Private/Public profiles.
- Do not disable firewall globally for multiplayer troubleshooting.
- Create narrow inbound rules only when required by a game/server tool.

Check profiles:

```powershell
Get-NetFirewallProfile | Select-Object Name,Enabled,DefaultInboundAction,DefaultOutboundAction
```

---

## 4) Update baseline

- Keep Windows Update enabled.
- Apply cumulative/security updates on a regular schedule.
- Update GPU/chipset/network drivers from vendor sites only.
- Update motherboard BIOS/SSD firmware only when changelog is relevant or fixes a known issue.

Check update service:

```powershell
Get-Service wuauserv | Select-Object Name,Status,StartType
```

---

## 5) Application control and downloads

- Download game mods/tools only from trusted sources.
- Verify signatures/hashes for critical tools when available.
- Avoid "optimizer" packs that bundle scripts, unknown EXEs, or registry tweaks.

Signature check example:

```powershell
Get-AuthenticodeSignature "C:\Path\To\file.exe" | Select-Object Status,SignerCertificate
```

---

## 6) Browser and launcher hygiene

- Keep browser and game launchers auto-updated.
- Remove unneeded extensions.
- Enable MFA/2FA for game platform accounts (Steam, Microsoft, Epic, etc.).

---

## 7) Ransomware and backup

- Keep regular backups for saves/configs/documents.
- Consider Controlled Folder Access if you store critical data locally.
- Test restore flow periodically.

---

## 8) Security checks after tuning

After any optimization session, verify:

- Defender still enabled
- Firewall still enabled
- Windows Update service not disabled
- No unknown startup items/services/tasks

Quick checks:

```powershell
Get-CimInstance Win32_StartupCommand | Select-Object Name,Command,Location
Get-ScheduledTask | Where-Object {$_.State -eq 'Ready' -or $_.State -eq 'Running'} | Select-Object TaskName,TaskPath,State
```

---

## 9) Safe exception workflow for performance

If security appears to hurt performance:

1. Reproduce issue in a repeatable benchmark.
2. Inspect process/file activity (do not disable protection first).
3. Add minimal, scoped exception.
4. Retest FPS, 1% low, frametime, and stability.
5. Document the exception and reason.

---

## 10) Do-not-disable list

Do not disable these globally as an "optimization":

- Microsoft Defender (all modules)
- Windows Defender Firewall
- UAC
- SmartScreen
- Windows Update

If a game has a compatibility issue, use a targeted exception and keep core protections enabled.
