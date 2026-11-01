param(
    [switch]$SelfTest
)

$ErrorActionPreference = 'Stop'
$script:CheckResults = New-Object 'System.Collections.Generic.List[object]'

function Invoke-Check {
    param(
        [string]$Title,
        [scriptblock]$Query
    )

    Write-Host "`n--- $Title ---" -ForegroundColor Cyan

    try {
        $results = @(& $Query)
        if ($results.Count -eq 0) {
            Write-Host 'No data returned.' -ForegroundColor DarkGray
            $script:CheckResults.Add([pscustomobject]@{
                Name = $Title
                Status = 'No data'
                Details = 'The check returned no results.'
            })
            return
        }

        $results | Format-Table -AutoSize -Wrap | Out-Host
        $script:CheckResults.Add([pscustomobject]@{
            Name = $Title
            Status = 'Passed'
            Details = "$($results.Count) result(s) returned."
        })
    }
    catch {
        if ($_.FullyQualifiedErrorId -like '*NoMatchingEventsFound*' -or
            $_.Exception.Message -like '*No events were found*') {
            Write-Host 'No matching events were found.' -ForegroundColor DarkGray
            $script:CheckResults.Add([pscustomobject]@{
                Name = $Title
                Status = 'No data'
                Details = 'No matching events were found.'
            })
        }
        else {
            Write-Host "Check could not be completed: $($_.Exception.Message)" -ForegroundColor Yellow
            $script:CheckResults.Add([pscustomobject]@{
                Name = $Title
                Status = 'Failed'
                Details = $_.Exception.Message
            })
        }
    }
}

function Show-Hardware {
    Invoke-Check 'Windows version' {
        Get-CimInstance -ClassName Win32_OperatingSystem |
            Select-Object Caption, Version, BuildNumber, OSArchitecture,
                @{Name = 'LastBoot'; Expression = { $_.LastBootUpTime }}
    }

    Invoke-Check 'CPU' {
        Get-CimInstance -ClassName Win32_Processor |
            Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, CurrentClockSpeed, MaxClockSpeed
    }

    Invoke-Check 'Motherboard and BIOS' {
        $board = Get-CimInstance -ClassName Win32_BaseBoard
        $bios = Get-CimInstance -ClassName Win32_BIOS
        [pscustomobject]@{
            Motherboard = "$($board.Manufacturer) $($board.Product)".Trim()
            BIOSVersion = $bios.SMBIOSBIOSVersion
            BIOSDate    = $bios.ReleaseDate
        }
    }

    Invoke-Check 'Graphics adapters and drivers' {
        Get-CimInstance -ClassName Win32_VideoController |
            Select-Object Name, DriverVersion, DriverDate, CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate
    }

    Invoke-Check 'Memory modules' {
        Get-CimInstance -ClassName Win32_PhysicalMemory |
            Select-Object Manufacturer, PartNumber,
                @{Name = 'CapacityGB'; Expression = { [math]::Round($_.Capacity / 1GB, 1) }},
                Speed, ConfiguredClockSpeed
    }

    Invoke-Check 'Drive space' {
        Get-PSDrive -PSProvider FileSystem |
            Where-Object { $null -ne $_.Used } |
            Select-Object Name,
                @{Name = 'UsedGB'; Expression = { [math]::Round($_.Used / 1GB, 1) }},
                @{Name = 'FreeGB'; Expression = { [math]::Round($_.Free / 1GB, 1) }}
    }

    Invoke-Check 'Physical disks' {
        if (Get-Command Get-PhysicalDisk -ErrorAction SilentlyContinue) {
            Get-PhysicalDisk |
                Select-Object FriendlyName, MediaType, BusType, HealthStatus, OperationalStatus,
                    @{Name = 'SizeGB'; Expression = { [math]::Round($_.Size / 1GB, 1) }}
        }
    }

    Invoke-Check 'Active power plan' {
        powercfg.exe /getactivescheme |
            ForEach-Object { [pscustomobject]@{ ActivePlan = $_ } }
    }

    Invoke-Check 'Available power plans' {
        powercfg.exe /list |
            ForEach-Object { [pscustomobject]@{ PowerPlan = $_ } }
    }
}

function Show-BackgroundLoad {
    Invoke-Check 'Processes with the highest accumulated CPU time' {
        Get-Process |
            Sort-Object CPU -Descending |
            Select-Object -First 15 Name, Id, CPU,
                @{Name = 'RAM_MB'; Expression = { [math]::Round($_.WorkingSet64 / 1MB, 0) }}
    }

    Invoke-Check 'Processes using the most memory' {
        Get-Process |
            Sort-Object WorkingSet64 -Descending |
            Select-Object -First 15 Name, Id,
                @{Name = 'RAM_MB'; Expression = { [math]::Round($_.WorkingSet64 / 1MB, 0) }}
    }

    Invoke-Check 'Startup applications' {
        Get-CimInstance -ClassName Win32_StartupCommand |
            Select-Object Name, Command, Location, User
    }
}

function Show-Services {
    Invoke-Check 'Running services (first 40)' {
        Get-Service |
            Where-Object Status -eq 'Running' |
            Sort-Object DisplayName |
            Select-Object -First 40 Status, Name, DisplayName
    }

    Invoke-Check 'Third-party services (first 40)' {
        Get-CimInstance -ClassName Win32_Service |
            Where-Object { $_.PathName -and $_.PathName -notmatch 'Windows|Microsoft' } |
            Sort-Object DisplayName |
            Select-Object -First 40 Name, DisplayName, State, StartMode
    }
}

function Show-Network {
    Invoke-Check 'IP configuration' {
        Get-NetIPConfiguration |
            Select-Object InterfaceAlias,
                @{Name = 'IPv4'; Expression = { ($_.IPv4Address | ForEach-Object IPAddress) -join ', ' }},
                @{Name = 'Gateway'; Expression = { ($_.IPv4DefaultGateway | ForEach-Object NextHop) -join ', ' }},
                @{Name = 'DNS'; Expression = { ($_.DnsServer.ServerAddresses) -join ', ' }}
    }

    Invoke-Check 'Network adapters' {
        Get-NetAdapter |
            Select-Object Name, InterfaceDescription, Status, LinkSpeed
    }

    Invoke-Check 'DNS lookup for microsoft.com' {
        Resolve-DnsName microsoft.com |
            Select-Object Name, Type, IPAddress
    }

    Invoke-Check 'Basic connectivity to 1.1.1.1 (three ICMP attempts)' {
        Test-Connection -ComputerName 1.1.1.1 -Count 3 |
            Select-Object Address, ResponseTime
    }
}

function Show-CustomNetworkTarget {
    $target = (Read-Host 'Enter a game-server hostname or IP address (not a URL)').Trim()
    if ([string]::IsNullOrWhiteSpace($target) -or [System.Uri]::CheckHostName($target) -eq [System.UriHostNameType]::Unknown) {
        Write-Host 'Enter a valid hostname or IP address.' -ForegroundColor Yellow
        return
    }

    Invoke-Check "DNS lookup for $target" {
        Resolve-DnsName -Name $target |
            Select-Object Name, Type, IPAddress
    }

    Invoke-Check "Five ICMP attempts to $target" {
        Test-Connection -ComputerName $target -Count 5 |
            Select-Object Address, ResponseTime
    }

    Write-Host 'A server may block ICMP. A failed ping does not prove that the game connection is broken.' -ForegroundColor Yellow
}

function Show-Security {
    Invoke-Check 'Microsoft Defender status' {
        Get-MpComputerStatus |
            Select-Object AMServiceEnabled, RealTimeProtectionEnabled, AntivirusEnabled, AntispywareEnabled
    }

    Invoke-Check 'Firewall profiles' {
        Get-NetFirewallProfile |
            Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction
    }

    Invoke-Check 'Windows Update service' {
        Get-Service -Name wuauserv |
            Select-Object Name, Status, StartType
    }

    Invoke-Check 'Current user account groups' {
        whoami.exe /groups |
            Select-Object -First 15 |
            ForEach-Object { [pscustomobject]@{ Group = $_ } }
    }

    Invoke-Check 'Recent startup entries' {
        Get-CimInstance -ClassName Win32_StartupCommand |
            Select-Object -First 20 Name, Command, Location
    }

    Invoke-Check 'Scheduled tasks currently ready or running (first 20)' {
        Get-ScheduledTask |
            Where-Object { $_.State -eq 'Ready' -or $_.State -eq 'Running' } |
            Select-Object -First 20 TaskName, TaskPath, State
    }
}

function Show-HardwareEvents {
    Invoke-Check 'Recent WHEA hardware events (up to 20)' {
        Get-WinEvent -FilterHashtable @{
            LogName = 'System'
            ProviderName = 'Microsoft-Windows-WHEA-Logger'
        } -MaxEvents 20 |
            Select-Object TimeCreated, Id, LevelDisplayName,
                @{Name = 'Message'; Expression = { ($_.Message -replace '\s+', ' ').Substring(0, [math]::Min(180, $_.Message.Length)) }}
    }

    Invoke-Check 'Recent critical or error events (up to 20)' {
        Get-WinEvent -FilterHashtable @{
            LogName   = 'System'
            Level     = @(1, 2)
            StartTime = (Get-Date).AddDays(-7)
        } -MaxEvents 20 |
            Select-Object TimeCreated, ProviderName, Id, LevelDisplayName,
                @{Name = 'Message'; Expression = {
                    $message = $_.Message -replace '\s+', ' '
                    if ($message.Length -gt 180) { $message.Substring(0, 180) } else { $message }
                }}
    }
}

function Pause-Menu {
    [void](Read-Host "`nPress Enter to return to the menu")
}

function Reset-CheckResults {
    $script:CheckResults.Clear()
}

function Show-RunSummary {
    $passed = @($script:CheckResults | Where-Object Status -eq 'Passed').Count
    $noData = @($script:CheckResults | Where-Object Status -eq 'No data').Count
    $failed = @($script:CheckResults | Where-Object Status -eq 'Failed').Count

    Write-Host "`n--- Check summary ---" -ForegroundColor Cyan
    Write-Host "Completed with data: $passed; no data: $noData; errors: $failed."

    foreach ($result in $script:CheckResults | Where-Object Status -eq 'Passed') {
        Write-Host "Completed: $($result.Name)" -ForegroundColor Green
    }

    foreach ($result in $script:CheckResults | Where-Object Status -ne 'Passed') {
        $color = if ($result.Status -eq 'Failed') { 'Yellow' } else { 'DarkGray' }
        Write-Host "$($result.Status): $($result.Name) - $($result.Details)" -ForegroundColor $color
    }
}

function Invoke-SelectedChecks {
    param([string[]]$Sections)

    foreach ($section in $Sections) {
        switch ($section) {
            '1' { Show-Hardware }
            '2' { Show-BackgroundLoad }
            '3' { Show-Services }
            '4' { Show-Network }
            '5' { Show-Security }
            '6' { Show-HardwareEvents }
        }
    }

    Show-RunSummary
}

function Invoke-AllChecks {
    Invoke-SelectedChecks @('1', '2', '3', '4', '5', '6')
}

function Export-DiagnosticReport {
    $sections = [ordered]@{
        '1' = 'System overview'
        '2' = 'Processes and startup applications'
        '3' = 'Services'
        '4' = 'Network and connectivity'
        '5' = 'Security status and scheduled tasks'
        '6' = 'Hardware and system events'
    }
    $dataDescriptions = @{
        '1' = 'Hardware may include device models, Windows build, memory details, drive status, and power plans.'
        '2' = 'Process and startup data may include process names, IDs, memory use, usernames, startup commands, and file paths.'
        '3' = 'Service data may include service names, status, startup type, and executable paths.'
        '4' = 'Network data may include private IP addresses, gateways, DNS servers, adapter names, and connectivity results.'
        '5' = 'Security data may include protection status, account group names, startup entries, and scheduled-task names.'
        '6' = 'Event data may include timestamps, event sources, IDs, and shortened system event messages.'
    }

    Write-Host "`nChoose report sections by number, separated by commas, or A for all:" -ForegroundColor Cyan
    foreach ($key in $sections.Keys) {
        Write-Host "$key. $($sections[$key])"
    }
    Write-Host '0. Cancel'
    $selection = (Read-Host 'Sections').Trim().ToUpperInvariant()
    if ($selection -eq '0') {
        Write-Host 'Report export cancelled.' -ForegroundColor DarkGray
        return
    }

    if ($selection -eq 'A') {
        $selected = @($sections.Keys)
    }
    else {
        $selected = @($selection -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
        if ($selected.Count -eq 0 -or @($selected | Where-Object { -not $sections.Contains($_) }).Count -gt 0) {
            Write-Host 'Invalid section selection. Choose listed numbers, comma-separated, or A.' -ForegroundColor Yellow
            return
        }
        $selected = @($selected | Select-Object -Unique)
    }

    Write-Host "`nSelected sections:" -ForegroundColor Cyan
    foreach ($key in $selected) {
        Write-Host "- $($sections[$key])"
    }
    Write-Host "`nThe report may include:" -ForegroundColor Yellow
    foreach ($key in $selected) {
        Write-Host "- $($dataDescriptions[$key])"
    }
    Write-Host 'Only selected checks are included. Review the local report before sharing; it is not uploaded anywhere.'
    $confirmation = Read-Host 'Create a local report on your Desktop? Type YES to continue'
    if ($confirmation -cne 'YES') {
        Write-Host 'Report export cancelled.' -ForegroundColor DarkGray
        return
    }

    $desktop = [Environment]::GetFolderPath('Desktop')
    if ([string]::IsNullOrWhiteSpace($desktop) -or -not (Test-Path -LiteralPath $desktop -PathType Container)) {
        $desktop = $env:USERPROFILE
    }

    $timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $reportPath = Join-Path $desktop "GamingPCGuide-Diagnostics-$timestamp.txt"
    try {
        Start-Transcript -Path $reportPath -ErrorAction Stop | Out-Null
        try {
            Write-Host 'Gaming PC Guide - Read-only diagnostic report'
            Write-Host "Created: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
            Write-Host "Included sections: $(($selected | ForEach-Object { $sections[$_] }) -join ', ')"
            Write-Host 'No system settings were changed.'
            Reset-CheckResults
            Invoke-SelectedChecks $selected
        }
        finally {
            Stop-Transcript | Out-Null
        }

        Write-Host "`nReport saved to: $reportPath" -ForegroundColor Green
    }
    catch {
        Write-Host "Could not create the report: $($_.Exception.Message)" -ForegroundColor Red
    }
}

if ($SelfTest) {
    Reset-CheckResults
    Invoke-Check 'Self-test with no data' { @() }
    Invoke-Check 'Self-test with error' { throw 'Synthetic self-test error.' }
    Show-RunSummary

    if ($script:CheckResults.Count -ne 2 -or
        $script:CheckResults[0].Status -ne 'No data' -or
        $script:CheckResults[1].Status -ne 'Failed') {
        throw 'Diagnostic self-test failed.'
    }

    Write-Host 'Diagnostic self-test passed.' -ForegroundColor Green
    exit 0
}

while ($true) {
    Clear-Host
    Write-Host 'Gaming PC Guide - Read-only diagnostics' -ForegroundColor Cyan
    Write-Host 'No administrator rights required. No settings are changed.'
    Write-Host ''
    Write-Host '1. System overview: Windows, CPU, GPU, RAM, drives, BIOS, power plan'
    Write-Host '2. Processes and startup applications'
    Write-Host '3. Services'
    Write-Host '4. Network and basic connectivity (DNS + ICMP)'
    Write-Host '5. Security status, account groups, and scheduled tasks'
    Write-Host '6. WHEA and recent critical system events'
    Write-Host '7. Run all checks'
    Write-Host '8. Test a game-server hostname or IP (DNS + ICMP)'
    Write-Host '9. Export selected checks to a local text report (asks for confirmation)'
    Write-Host '0. Exit'

    $choice = Read-Host "`nSelect an option"
    switch ($choice) {
        '1' { Reset-CheckResults; Show-Hardware; Show-RunSummary; Pause-Menu }
        '2' { Reset-CheckResults; Show-BackgroundLoad; Show-RunSummary; Pause-Menu }
        '3' { Reset-CheckResults; Show-Services; Show-RunSummary; Pause-Menu }
        '4' { Reset-CheckResults; Show-Network; Show-RunSummary; Pause-Menu }
        '5' { Reset-CheckResults; Show-Security; Show-RunSummary; Pause-Menu }
        '6' { Reset-CheckResults; Show-HardwareEvents; Show-RunSummary; Pause-Menu }
        '7' { Reset-CheckResults; Invoke-AllChecks; Pause-Menu }
        '8' { Reset-CheckResults; Show-CustomNetworkTarget; Show-RunSummary; Pause-Menu }
        '9' { Export-DiagnosticReport; Pause-Menu }
        '0' { break }
        default {
            Write-Host 'Choose one of the listed options.' -ForegroundColor Yellow
            Start-Sleep -Seconds 1
        }
    }

    if ($choice -eq '0') {
        break
    }
}
