---
layout: doc
title: "Фоновые приложения и автозагрузка"
description: "Проверьте автозагрузку, отключите ненужные приложения и проверьте результат."
lang: ru
translation_key: background-apps
permalink: /ru/docs/07-background-apps.html
---

# Фоновые приложения и автозагрузка

> Скрипты ниже ничего не удаляют по умолчанию. Сначала они показывают элементы автозагрузки и службы.

## Проверить элементы автозагрузки

```powershell
Write-Host "`n===== АВТОЗАГРУЗКА ====="

Write-Host "`n--- Реестр текущего пользователя ---"
Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' -ErrorAction SilentlyContinue |
  Select-Object * -ExcludeProperty PS* |
  Format-List

Write-Host "`n--- Команды автозагрузки WMI ---"
Get-CimInstance Win32_StartupCommand |
  Select-Object Name, Command, Location |
  Format-List

Write-Host "`n--- Папка автозагрузки ---"
Get-ChildItem "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" -ErrorAction SilentlyContinue |
  Select-Object Name, FullName |
  Format-List
```

## Отключить ненужные приложения

```powershell
$run = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'

$disable = @(
  'Discord',
  'RiotClient',
  'RobloxPlayerBeta'
  # 'Steam',
  # 'LGHUB'
)

foreach ($name in $disable) {
  if (Get-ItemProperty -Path $run -Name $name -ErrorAction SilentlyContinue) {
    Remove-ItemProperty -Path $run -Name $name
    Write-Host "ОТКЛЮЧЕНО: $name"
  } else {
    Write-Host "НЕ НАЙДЕНО: $name"
  }
}
```

| Приложение | Рекомендация |
| --- | --- |
| Discord | Отключить автозапуск |
| Riot Client | Отключить, если не играешь в игры Riot каждый день |
| Roblox | Отключить автозапуск |
| Steam | По желанию |
| Logitech G HUB | По желанию |
| NVIDIA | Не отключать |

## Проверить изменения

```powershell
Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' -ErrorAction SilentlyContinue |
  Select-Object * -ExcludeProperty PS* |
  Format-List
```
