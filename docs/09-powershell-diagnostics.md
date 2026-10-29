# 09. PowerShell: Checks and Diagnostics

> Use PowerShell to inspect your system, not to run random "one-click FPS" scripts.

## Quick diagnostic flow

| If you need to check | Go here |
|---|---|
| Basic hardware info | Sections 1-4 |
| Startup/background load | Sections 6-7 |
| Services status | Section 8 |
| Network/ping basics | Section 9 |
| Suspected Windows corruption | Section 10 |
| WHEA and hardware errors | Section 11 |

---

## How to open PowerShell

### Normal mode

1. Press `Win`.
2. Type `Windows Terminal` or `PowerShell`.
3. Open it.

Most commands in this guide do not require admin rights.

### Run as administrator

Only when explicitly required.

1. Press `Win`.
2. Type `Windows Terminal`.
3. Right-click -> `Run as administrator`.

> [!WARNING]
> Do not run unknown commands as administrator.

---

## 1. CPU information

```powershell
Get-CimInstance Win32_Processor |
Select-Object Name, Manufacturer, NumberOfCores, NumberOfLogicalProcessors,
CurrentClockSpeed, MaxClockSpeed
```

Shows CPU model, cores/threads, and reported clocks.

---

## 2. GPU and driver information

```powershell
Get-CimInstance Win32_VideoController |
Select-Object Name, VideoProcessor, DriverVersion, DriverDate,
CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate
```

If refresh rate looks wrong, verify in:

```text
Settings -> System -> Display -> Advanced display
```

---

## 3. RAM information

```powershell
Get-CimInstance Win32_PhysicalMemory |
Select-Object Manufacturer, PartNumber, Capacity, Speed, ConfiguredClockSpeed
```

Total RAM in GB:

```powershell
[math]::Round(
	(Get-CimInstance Win32_PhysicalMemory |
	Measure-Object -Property Capacity -Sum).Sum / 1GB,
	0
)
```

---

## 4. Drives and free space

### Free space

```powershell
Get-PSDrive -PSProvider FileSystem |
Select-Object Name,
@{Name='UsedGB';Expression={[math]::Round($_.Used / 1GB, 1)}},
@{Name='FreeGB';Expression={[math]::Round($_.Free / 1GB, 1)}}
```

### Physical disks

```powershell
Get-PhysicalDisk |
Select-Object FriendlyName, MediaType, BusType, HealthStatus,
OperationalStatus, Size
```

---

## 5. Power plan

Current plan:

```powershell
powercfg /getactivescheme
```

All plans:

```powershell
powercfg /list
```

Energy report (admin):

```powershell
powercfg /energy
```

---

## 6. Startup apps

```powershell
Get-CimInstance Win32_StartupCommand |
Select-Object Name, Command, Location, User
```

Disable startup items via:

```text
Task Manager -> Startup apps -> Disable
```

Related guide: [Background apps and startup](07-background-apps.md).

---

## 7. Processes

Top cumulative CPU time:

```powershell
Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 20 Name, Id, CPU, WorkingSet64
```

Top RAM usage:

```powershell
Get-Process |
Sort-Object WorkingSet64 -Descending |
Select-Object -First 20 Name, Id,
@{Name='RAM_MB';Expression={[math]::Round($_.WorkingSet64 / 1MB, 0)}}
```

Find by name (example Discord):

```powershell
Get-Process *discord* -ErrorAction SilentlyContinue |
Select-Object Name, Id, CPU, WorkingSet64
```

> [!WARNING]
> Do not kill unknown/system processes blindly.

---

## 8. Services

Running services:

```powershell
Get-Service |
Where-Object Status -eq 'Running' |
Sort-Object DisplayName |
Select-Object Status, Name, DisplayName
```

Automatic-start services:

```powershell
Get-CimInstance Win32_Service |
Where-Object StartMode -eq 'Auto' |
Sort-Object DisplayName |
Select-Object Name, DisplayName, State, StartMode
```

Find a service (example audio):

```powershell
Get-Service *audio* |
Select-Object Status, Name, DisplayName
```

Related guide: [Services and security](08-services-and-security.md).

---

## 9. Network

IP and adapter config:

```powershell
Get-NetIPConfiguration
```

Adapter status:

```powershell
Get-NetAdapter |
Select-Object Name, InterfaceDescription, Status, LinkSpeed, MacAddress
```

DNS test:

```powershell
Resolve-DnsName microsoft.com
```

Basic latency test:

```powershell
Test-Connection 1.1.1.1 -Count 10
```

> [!NOTE]
> `1.1.1.1` test is not your game server ping; it is just a baseline connectivity check.

---

## 10. System file integrity (admin only)

Use only for suspected Windows corruption.

```powershell
sfc /scannow
```

```powershell
DISM /Online /Cleanup-Image /RestoreHealth
```

Order:

1. Run SFC.
2. If unresolved, run DISM.
3. Reboot.
4. Run SFC again if needed.

---

## 11. Event logs and WHEA

WHEA check:

```powershell
Get-WinEvent -FilterHashtable @{
	LogName = 'System'
	ProviderName = 'Microsoft-Windows-WHEA-Logger'
} -MaxEvents 20 |
Select-Object TimeCreated, Id, LevelDisplayName, Message
```

If WHEA appears after OC/undervolt/XMP/PBO/CO, revert to stable settings and retest.

---

## 12. Export diagnostics

System info to desktop:

```powershell
systeminfo | Out-File -Encoding utf8 "$env:USERPROFILE\Desktop\systeminfo.txt"
```

Driver list to CSV:

```powershell
driverquery /v /fo csv | Out-File -Encoding utf8 "$env:USERPROFILE\Desktop\drivers.csv"
```

---

## Checklist

- [ ] Commands are used with clear purpose.
- [ ] Admin mode is used only when required.
- [ ] Results are validated in-game (FPS, 1% low, frametime, stability).
- [ ] Unknown processes/services are not modified blindly.

Next step: [Temperatures, stability, and maintenance](10-temperatures-stability.md).