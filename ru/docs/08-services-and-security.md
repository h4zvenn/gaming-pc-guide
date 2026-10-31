---
layout: doc
title: "Службы и безопасность"
description: "Проверьте сторонние службы, измените только действительно ненужные и сохраните возможность отката."
lang: ru
translation_key: services-and-security
permalink: /ru/docs/08-services-and-security.html
---

# Службы и безопасность

> Перед изменением службы запиши её изначальный `StartType`. Если что-то перестанет работать, верни настройку обратно.

## Посмотреть сторонние службы

```powershell
Get-CimInstance Win32_Service |
  Where-Object { $_.PathName -and $_.PathName -notmatch 'Windows|Microsoft' } |
  Select-Object Name, DisplayName, State, StartMode, PathName |
  Format-Table -AutoSize
```

## Что можно изменить

| Служба | Команда | Когда менять |
| --- | --- | --- |
| Xbox Service | `Set-Service XboxService -StartupType Manual` | Не пользуешься Xbox Game Bar |
| LGHUB Updater Service | `Set-Service LGHUBUpdaterService -StartupType Manual` | Не нужен постоянный updater Logitech |
| Discord System Helper | Оставить `Manual` | Обычно не запущена |
| NVIDIA FrameView SDK | Оставить `Manual` | Нужна только для FrameView |

```powershell
Set-Service -Name XboxService -StartupType Manual
Stop-Service -Name XboxService -ErrorAction SilentlyContinue

Set-Service -Name LGHUBUpdaterService -StartupType Manual
Stop-Service -Name LGHUBUpdaterService -ErrorAction SilentlyContinue
```

## Что не отключать

| Служба | Почему |
| --- | --- |
| NVIDIA LocalSystem Container | Нужна для NVIDIA App, драйвера и игровых функций |
| Steam Client Service | Нужна для нормальной работы Steam |
| Windows Update | Обновления и безопасность |
| Windows Defender | Защита от вирусов |
| AudioSrv | Звук |
| AudioEndpointBuilder | Аудиоустройства |
| Bluetooth Support Service | Bluetooth-наушники, мыши, геймпады |
| WLAN AutoConfig | Wi-Fi |

## Вернуть службу

```powershell
Set-Service -Name 'ИМЯ_СЛУЖБЫ' -StartupType Automatic
Start-Service -Name 'ИМЯ_СЛУЖБЫ'
```

Пример для Xbox:

```powershell
Set-Service -Name XboxService -StartupType Automatic
Start-Service XboxService
```

## Типы запуска

| Тип | Значение |
| --- | --- |
| Automatic | Запускается с Windows |
| Manual | Запускается только когда нужна |
| Disabled | Не запускается; используй только если точно уверен |

## Проверить изменения

```powershell
Get-Service XboxService, LGHUBUpdaterService -ErrorAction SilentlyContinue |
  Select-Object Name, Status, StartType |
  Format-Table -AutoSize
```
