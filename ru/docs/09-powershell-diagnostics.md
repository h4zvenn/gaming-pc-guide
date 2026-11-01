---
layout: doc
title: "Диагностика через PowerShell"
description: "Безопасная проверка компонентов, драйверов, служб, сети и ошибок Windows."
lang: ru
translation_key: powershell-diagnostics
permalink: /ru/docs/09-powershell-diagnostics.html
---

Используй PowerShell для диагностики, а не для запуска случайных скриптов «ускорения FPS».

> Английский оригинал: [PowerShell Diagnostics](../../docs/09-powershell-diagnostics.html).

## Открой PowerShell

Обычный режим: нажми `Win`, найди `Windows Terminal` или `PowerShell` и открой приложение. Большинству команд ниже не нужны права администратора. Запускай терминал с повышенными правами только когда это прямо указано; не запускай неизвестные команды.

## Сведения о компонентах

### Процессор

```powershell
Get-CimInstance Win32_Processor |
Select-Object Name, Manufacturer, NumberOfCores, NumberOfLogicalProcessors,
CurrentClockSpeed, MaxClockSpeed
```

### Видеокарта и драйвер

```powershell
Get-CimInstance Win32_VideoController |
Select-Object Name, VideoProcessor, DriverVersion, DriverDate,
CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate
```

Если частота монитора указана неверно, проверь: **Параметры → Система → Дисплей → Расширенный дисплей**.

### Оперативная память

```powershell
Get-CimInstance Win32_PhysicalMemory |
Select-Object Manufacturer, PartNumber, Capacity, Speed, ConfiguredClockSpeed
```

Общий объём памяти в ГБ:

```powershell
[math]::Round(
    (Get-CimInstance Win32_PhysicalMemory |
    Measure-Object -Property Capacity -Sum).Sum / 1GB,
    0
)
```

### Диски и свободное место

```powershell
Get-PSDrive -PSProvider FileSystem |
Select-Object Name,
@{Name='UsedGB';Expression={[math]::Round($_.Used / 1GB, 1)}},
@{Name='FreeGB';Expression={[math]::Round($_.Free / 1GB, 1)}}
```

```powershell
Get-PhysicalDisk |
Select-Object FriendlyName, MediaType, BusType, HealthStatus,
OperationalStatus, Size
```

## План питания

```powershell
powercfg /getactivescheme
powercfg /list
```

Отчёт `powercfg /energy` требует терминал администратора; используй его только при диагностике конкретной проблемы питания.

## Автозагрузка и процессы

```powershell
Get-CimInstance Win32_StartupCommand |
Select-Object Name, Command, Location, User
```

Отключай выбранные приложения через **Диспетчер задач → Автозагрузка приложений**. См. [фоновые приложения](07-background-apps.html).

Наибольшее накопленное процессорное время:

```powershell
Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 20 Name, Id, CPU, WorkingSet64
```

Наибольшее потребление памяти:

```powershell
Get-Process |
Sort-Object WorkingSet64 -Descending |
Select-Object -First 20 Name, Id,
@{Name='RAM_MB';Expression={[math]::Round($_.WorkingSet64 / 1MB, 0)}}
```

Найти, например, процесс Discord:

```powershell
Get-Process *discord* -ErrorAction SilentlyContinue |
Select-Object Name, Id, CPU, WorkingSet64
```

Не завершай неизвестные или системные процессы наугад.

## Службы

```powershell
Get-Service |
Where-Object Status -eq 'Running' |
Sort-Object DisplayName |
Select-Object Status, Name, DisplayName
```

Службы с автоматическим запуском:

```powershell
Get-CimInstance Win32_Service |
Where-Object StartMode -eq 'Auto' |
Sort-Object DisplayName |
Select-Object Name, DisplayName, State, StartMode
```

Поиск по части имени, например аудио:

```powershell
Get-Service *audio* |
Select-Object Status, Name, DisplayName
```

Не меняй службы массово. См. [службы и безопасность](08-services-and-security.html).

## Сеть

```powershell
Get-NetIPConfiguration
Get-NetAdapter |
Select-Object Name, InterfaceDescription, Status, LinkSpeed, MacAddress
Resolve-DnsName microsoft.com
Test-Connection 1.1.1.1 -Count 10
```

Тест `1.1.1.1` проверяет базовую связь, а не задержку до игрового сервера. Для теста игрового соединения:

1. Определи регион или адрес сервера по лаунчеру или журналам игры.
2. Проведи проверку задержки и потерь пакетов в течение 5–10 минут.
3. Запиши минимум, среднее, максимум и потери.
4. При необходимости сравни Wi-Fi и Ethernet.

`Test-Connection` использует ICMP: сервер или Firewall может блокировать запросы. Неудачный ping сам по себе не доказывает проблему соединения с игрой. Перед тестом приостанови загрузки, синхронизацию, торренты и потоковое видео.

## Целостность системных файлов

Используй следующие команды только при подозрении на повреждение Windows. Они требуют терминала администратора и могут выполняться долго. Сначала DISM проверяет и восстанавливает хранилище компонентов, затем SFC проверяет защищённые системные файлы:

```powershell
DISM /Online /Cleanup-Image /RestoreHealth
```

После завершения DISM:

```powershell
sfc /scannow
```

Перезагрузи компьютер после проверки. Если проблема осталась, проверь журнал CBS и [инструкции Microsoft](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/repair-a-windows-image).

## Журналы событий и WHEA

```powershell
Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    ProviderName = 'Microsoft-Windows-WHEA-Logger'
} -MaxEvents 20 |
Select-Object TimeCreated, Id, LevelDisplayName, Message
```

Если ошибки WHEA появились после разгона, андервольтинга, XMP/EXPO, PBO или Curve Optimizer, вернись к стабильным параметрам и повтори тест.

## Сохранение диагностики

```powershell
systeminfo | Out-File -Encoding utf8 "$env:USERPROFILE\Desktop\systeminfo.txt"
driverquery /v /fo csv | Out-File -Encoding utf8 "$env:USERPROFILE\Desktop\drivers.csv"
```

## Проверка

- Используй каждую команду для конкретного вопроса.
- Применяй режим администратора только при необходимости.
- Проверяй вывод и сравнивай FPS, 1% low, время кадра и стабильность.
- Не изменяй неизвестные процессы и службы.

Следующий шаг: [температуры и стабильность](10-temperatures-stability.html).
