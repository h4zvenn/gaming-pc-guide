# 19. AI Software and Disk Cleanup

## Applicability

Use this page to remove unused AI tools, clean safe caches, and identify large files.

## Quick Start

1. Create a restore point.
2. Run the AI software audit.
3. Remove only tools you do not use.
4. Clean safe caches.
5. Verify free space and remaining software.

## 1. Audit AI software

```powershell
Write-Host "`n===== AI SOFTWARE AUDIT ====="

Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* -ErrorAction SilentlyContinue |
  Where-Object { $_.DisplayName -match 'Claude|Anthropic|ChatGPT|OpenAI|Codex|Copilot|Cursor|Windsurf|Ollama|LM Studio|Jan|AnythingLLM|Continue|Perplexity|Gemini|Aider' } |
  Select-Object DisplayName, DisplayVersion, InstallLocation, UninstallString |
  Format-List

foreach ($c in 'claude','claude-unlimited','cu','codex','copilot','cursor','ollama','lms','gemini','aider','openai') {
  $cmd = Get-Command $c -ErrorAction SilentlyContinue
  if ($cmd) { Write-Host "FOUND: $c -> $($cmd.Source)" }
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

foreach ($p in $paths) {
  if (Test-Path -LiteralPath $p) { Write-Host "FOUND: $p" }
}
```

## 2. Remove unused AI tools

> Keep GitHub Copilot CLI if you use it. Do not remove developer tools such as Node.js, Python, Git, or Visual Studio.

```powershell
Get-Process | Where-Object { $_.ProcessName -match 'claude|ollama|aider|continue' } |
  Stop-Process -Force -ErrorAction SilentlyContinue

$ollamaUninstaller = "$env:LOCALAPPDATA\Programs\Ollama\unins000.exe"
if (Test-Path $ollamaUninstaller) {
  Start-Process $ollamaUninstaller -Wait
}

Get-ChildItem "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Directory -ErrorAction SilentlyContinue |
  Where-Object { $_.Name -match 'ClaudeCode|Anthropic' } |
  Remove-Item -Recurse -Force

$paths = @(
  "$env:USERPROFILE\.claude",
  "$env:USERPROFILE\.codex",
  "$env:USERPROFILE\.ollama",
  "$env:USERPROFILE\.lmstudio",
  "$env:USERPROFILE\.continue",
  "$env:USERPROFILE\.aider",
  "$env:USERPROFILE\.local\bin\claude.exe",
  "$env:USERPROFILE\.local\bin\aider.exe",
  "$env:LOCALAPPDATA\Ollama",
  "$env:LOCALAPPDATA\Programs\Ollama",
  "$env:LOCALAPPDATA\Programs\LM Studio"
)

foreach ($p in $paths) {
  if (Test-Path -LiteralPath $p) {
    Remove-Item -LiteralPath $p -Recurse -Force
    Write-Host "Removed: $p"
  }
}
```

## 3. Analyze disk usage

```powershell
Write-Host "`n===== DISK USAGE ====="

Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Used -ne $null } |
  Select-Object Name,
    @{n='Used GB';e={[math]::Round($_.Used/1GB,1)}},
    @{n='Free GB';e={[math]::Round($_.Free/1GB,1)}} |
  Format-Table -AutoSize

Write-Host "`n===== LARGE PROFILE FOLDERS ====="

Get-ChildItem $env:USERPROFILE -Directory -Force -ErrorAction SilentlyContinue |
  ForEach-Object {
    $size = (Get-ChildItem $_.FullName -Recurse -Force -ErrorAction SilentlyContinue |
      Where-Object { -not $_.PSIsContainer } | Measure-Object -Property Length -Sum).Sum
    [PSCustomObject]@{ SizeGB = [math]::Round($size/1GB,2); Folder = $_.FullName }
  } | Sort-Object SizeGB -Descending | Select-Object -First 20 |
  Format-Table -AutoSize
```

## 4. Clean safe caches

```powershell
Remove-Item "$env:LOCALAPPDATA\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:WINDIR\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

Remove-Item "$env:LOCALAPPDATA\NVIDIA\DXCache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\NVIDIA\GLCache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\D3DSCache\*" -Recurse -Force -ErrorAction SilentlyContinue

Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Code Cache\*" -Recurse -Force -ErrorAction SilentlyContinue

Clear-RecycleBin -Force -ErrorAction SilentlyContinue
```

## 5. Clean game launcher caches

```powershell
Remove-Item "$env:LOCALAPPDATA\Roblox\*" -Recurse -Force -ErrorAction SilentlyContinue

Remove-Item "$env:LOCALAPPDATA\Discord\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Discord\Code Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:APPDATA\discord\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:APPDATA\discord\Code Cache\*" -Recurse -Force -ErrorAction SilentlyContinue

if (Get-Command npm -ErrorAction SilentlyContinue) {
  npm cache clean --force
}
```

## 6. What not to delete

| Path | Reason |
|---|---|
| `C:\Windows\Installer` | Required for repairing and uninstalling programs |
| `C:\ProgramData\Package Cache` | Required by many installers |
| `C:\pagefile.sys` | Required for system stability |
| `C:\Program Files (x86)\Steam\steamapps\common` | Contains installed Steam games |
| `.rustup`, `.cargo` | Rust toolchain and build cache |
| `node_modules` inside active projects | Required to run the project |

## Checklist

- [ ] Restore point created
- [ ] AI software audit completed
- [ ] Unused AI tools removed
- [ ] Safe caches cleaned
- [ ] Free space verified
- [ ] Required applications still work

## Summary

Remove only applications you do not use. Clean caches rather than deleting program folders manually. Keep NVIDIA, Steam, Windows security, and required development tools intact.
