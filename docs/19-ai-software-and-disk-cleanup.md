---
layout: doc
title: "Disk Cleanup"
description: "Remove unused AI tools and reclaim disk space without breaking required applications."
lang: en
translation_key: ai-software-and-disk-cleanup
permalink: /docs/19-ai-software-and-disk-cleanup.html
---

Use this page to find unused AI tools, inspect large folders, and clean only safe caches. Do not delete application folders automatically.

> **Important:** Create a restore point first. Do not remove developer tools such as Node.js, Python, Git, Visual Studio, or project folders.

## Quick start

1. Create a restore point.
2. Run the AI software audit.
3. Identify tools you do not use.
4. Uninstall them through their official uninstaller or Windows Settings.
5. Clean only safe caches.
6. Verify free space and that required applications still work.

---

## Audit AI software

This command only displays installed applications, CLI tools, and common data folders. It does not delete anything.

```powershell
Write-Host "`n===== AI SOFTWARE AUDIT ====="

Get-ItemProperty `
  HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, `
  HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, `
  HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* `
  -ErrorAction SilentlyContinue |
Where-Object {
  $_.DisplayName -match 'Claude|Anthropic|ChatGPT|OpenAI|Codex|Copilot|Cursor|Windsurf|Ollama|LM Studio|Jan|AnythingLLM|Continue|Perplexity|Gemini|Aider'
} |
Select-Object DisplayName, DisplayVersion, InstallLocation, UninstallString |
Format-List

foreach ($command in 'claude', 'claude-unlimited', 'cu', 'codex', 'copilot', 'cursor', 'ollama', 'lms', 'gemini', 'aider', 'openai') {
    $found = Get-Command $command -ErrorAction SilentlyContinue
    if ($found) {
        Write-Host "Found: $command -> $($found.Source)"
    }
}

$paths = @(
    "$env:USERPROFILE\.claude",
    "$env:USERPROFILE\.codex",
    "$env:USERPROFILE\.ollama",
    "$env:USERPROFILE\.lmstudio",
    "$env:USERPROFILE\.continue",
    "$env:USERPROFILE\.aider",
    "$env:LOCALAPPDATA\Ollama",
    "$env:LOCALAPPDATA\Programs\Ollama",
    "$env:LOCALAPPDATA\Programs\LM Studio"
)

foreach ($path in $paths) {
    if (Test-Path -LiteralPath $path) {
        Write-Host "Found: $path"
    }
}
```

---

## Remove unused AI tools

Remove only tools you have identified and no longer use.

Preferred order:

1. Close the application normally.
2. Uninstall it from `Settings → Apps → Installed apps`.
3. Use the application’s official uninstaller if Windows does not list it.
4. Remove its remaining data folder only after confirming that you do not need its settings, models, or local data.

Example for Ollama, only if you no longer use it:

```powershell
$uninstaller = "$env:LOCALAPPDATA\Programs\Ollama\unins000.exe"

if (Test-Path -LiteralPath $uninstaller) {
    Start-Process -FilePath $uninstaller -Wait
}
```

After uninstalling, check whether a data folder remains:

```powershell
Test-Path "$env:USERPROFILE\.ollama"
```

Delete it manually only if you are certain that its models and settings are no longer needed.

> **Warning:** Do not run a script that force-stops processes and recursively deletes multiple user folders. A single wrong path can remove configurations, local models, project data, or development tools.

---

## Analyze disk usage

Check drive space:

```powershell
Get-PSDrive -PSProvider FileSystem |
Where-Object { $null -ne $_.Used } |
Select-Object Name,
@{Name = 'UsedGB'; Expression = { [math]::Round($_.Used / 1GB, 1) }},
@{Name = 'FreeGB'; Expression = { [math]::Round($_.Free / 1GB, 1) }} |
Format-Table -AutoSize
```

Find the largest folders in your user profile:

```powershell
Get-ChildItem $env:USERPROFILE -Directory -Force -ErrorAction SilentlyContinue |
ForEach-Object {
    $size = (
        Get-ChildItem $_.FullName -Recurse -Force -ErrorAction SilentlyContinue |
        Where-Object { -not $_.PSIsContainer } |
        Measure-Object -Property Length -Sum
    ).Sum

    [PSCustomObject]@{
        SizeGB = [math]::Round($size / 1GB, 2)
        Folder = $_.FullName
    }
} |
Sort-Object SizeGB -Descending |
Select-Object -First 20 |
Format-Table -AutoSize
```

This scan can take several minutes on large profiles.

---

## Clean safe caches

Close the related application before clearing its cache.

```powershell
Remove-Item "$env:LOCALAPPDATA\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:WINDIR\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
```

Graphics shader caches can be cleared if games regenerate them:

```powershell
Remove-Item "$env:LOCALAPPDATA\NVIDIA\DXCache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\NVIDIA\GLCache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\D3DSCache\*" -Recurse -Force -ErrorAction SilentlyContinue
```

Browser caches can be cleared, but the browser must be closed:

```powershell
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Code Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
```

Empty the Recycle Bin only after checking it:

```powershell
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
```

> **Note:** Clearing shader caches can cause longer initial loading or shader compilation after the next game launch.

---

## Game launcher caches

Close Discord or Roblox before clearing their caches.

```powershell
Remove-Item "$env:LOCALAPPDATA\Roblox\*" -Recurse -Force -ErrorAction SilentlyContinue
```

```powershell
Remove-Item "$env:LOCALAPPDATA\Discord\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Discord\Code Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:APPDATA\discord\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:APPDATA\discord\Code Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
```

Clear the npm cache only if you use Node.js and understand the effect:

```powershell
if (Get-Command npm -ErrorAction SilentlyContinue) {
    npm cache clean --force
}
```

---

## Do not delete

| Path | Reason |
| --- | --- |
| `C:\Windows\Installer` | Required for repairing and uninstalling programs |
| `C:\ProgramData\Package Cache` | Required by many installers |
| `C:\pagefile.sys` | Required for system stability |
| `C:\Program Files (x86)\Steam\steamapps\common` | Contains installed Steam games |
| `.rustup` and `.cargo` | Rust toolchain and build cache |
| `node_modules` inside active projects | Required to run the project |
| Project folders | May contain source code, local settings, and unsaved work |

---

## Checklist

- [ ] Restore point created.
- [ ] AI software audit completed.
- [ ] Only unused tools were uninstalled.
- [ ] Safe caches were cleaned.
- [ ] Free space was verified.
- [ ] Required applications still work.

---

## Home

[Home](../index.html)
