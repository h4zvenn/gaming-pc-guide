---
layout: doc
title: "04-drivers-and-updates"
---

# 04. Drivers and Updates

> Drivers and updates do not provide “magic FPS,” but they ensure compatibility, stability, bug fixes, and proper hardware behavior. Always start with official sources, not driver packs, “boosters,” or random links.

## Core rule

Download drivers only from official websites:

- Motherboard or laptop vendor
- AMD
- NVIDIA
- Intel
- Microsoft
- SSD, Wi-Fi adapter, or peripheral vendor

> [!WARNING]
> Do not use Driver Booster, DriverPack, “auto-updaters,” or repackaged driver websites. They may install incorrect versions, adware, or unstable components.

---

## Correct update order

For a clean Windows install or a new build, use this sequence:

1. Install Windows updates.
2. Install chipset driver.
3. Install GPU driver.
4. Install LAN/Wi-Fi/Bluetooth and audio drivers if needed.
5. Install peripheral drivers only for devices you actually use.
6. Reboot the PC.
7. Verify stability and driver versions.

If your system is already configured and stable, you do not need to reinstall everything from scratch. Update only the needed component.

### Fast update strategy

| Situation | Best move |
|---|---|
| Fresh Windows install | Follow full update order top-to-bottom |
| Stable existing setup | Update only component with known issue/fix |
| New game has launch issues | Try latest stable GPU driver first |

---

## 1. Windows Update

Open:

```text
Settings → Windows Update
```

Click:

```text
Check for updates
```

Install regular cumulative updates and reboot if Windows requests it.

### What to install with caution

`Optional updates` and drivers from Windows Update are not always the best choice for GPU, chipset, or vendor-specific devices.

Check version and source before installing, especially if:

- current driver is stable;
- you use a laptop with vendor-specific power management;
- the update is offered as an Optional driver update;
- you recently had graphics driver issues.

> [!NOTE]
> Do not permanently disable Windows Update for “optimization.” Updates include security, stability, and compatibility fixes. Optional driver updates from Windows Update are not always preferred over vendor drivers; review the source before applying, especially when the current GPU or chipset driver is stable.

---

## 2. Chipset driver

Chipset driver is important for proper power management, PCIe, USB, controller behavior, and OS/platform interaction.

### Where to download

- AMD platform: official AMD site or motherboard/laptop support page.
- Intel platform: official Intel site or motherboard/laptop support page.

### How to install

1. Download the driver for your OS and platform.
2. Close unnecessary apps.
3. Run installer.
4. Finish installation.
5. Reboot the PC.

> [!TIP]
> On laptops, check the vendor support page first. It may provide adapted drivers for power behavior, graphics switching, hotkeys, or cooling modes.

---

## 3. GPU driver

### NVIDIA

Use official driver via NVIDIA App or NVIDIA download page.

Select the driver matching:

- your GPU model;
- Windows version;
- workload type: Game Ready or Studio.

For most gaming PCs, Game Ready Driver is suitable. Studio Driver can be preferable for workstation apps, editing, and 3D stability.

### AMD Radeon

Use AMD Software: Adrenalin Edition from the official AMD website.

Pick the driver for your Radeon series and Windows version.

### Intel Arc / Intel integrated graphics

Use Intel Graphics Software or official Intel Download Center.

On laptops, if brightness, hybrid graphics, or sleep issues appear, try the laptop vendor’s driver first.

---

## 4. Should you update GPU driver immediately after release?

Not always.

Update if:

- a new game requires latest version;
- changelog contains a fix for your issue;
- you have bugs, crashes, artifacts, or poor compatibility;
- the driver adds support for a needed technology;
- you are reinstalling Windows.

Stay on current version if:

- everything is stable;
- you do not play a newly released game with new Game Ready profile;
- newer releases are known problematic on your configuration;
- PC is used for critical work where stability matters more than novelty.

> [!IMPORTANT]
> Newer does not always mean faster in every game. Compare performance in your own titles and roll back to a known stable version if needed.

---

## 5. Clean GPU driver install

Regular driver update works in most cases.

Clean install is needed only for symptoms like:

- frequent graphics driver crashes;
- black screens or artifacts after update;
- driver control panel settings behave incorrectly;
- game fails to launch due to legacy component conflicts;
- you switched GPU vendor (AMD ↔ NVIDIA ↔ Intel).

### Try simple method first

For NVIDIA, choose clean installation option if available in installer. For AMD, use Factory Reset only if you understand that driver settings will be reset.

### DDU — only when truly needed

Display Driver Uninstaller fully removes GPU drivers. It can help with severe conflicts, but it is not required before every update.

If using DDU:

1. Create a restore point.
2. Download fresh driver package in advance.
3. Read tool instructions.
4. Do not use it for routine updates without actual problem.
5. Install driver from official source after cleanup.

> [!WARNING]
> Do not run DDU monthly “for FPS.” Frequent full driver removal is not optimization.

### How to roll back a GPU driver

1. Open Device Manager, open the GPU entry, and use `Roll Back Driver` on the `Driver` tab, if available.
2. If rollback is unavailable, install the previous official GPU driver package from the vendor source.
3. If neither rollback path exists and the problem appeared after a driver update, use DDU as described above.
4. Do not mix rollback and clean install in one step without re-testing the affected game.

---

## 6. Motherboard and laptop drivers

Your model support page usually includes:

- LAN/Ethernet;
- Wi-Fi;
- Bluetooth;
- Audio;
- SATA/RAID;
- BIOS utilities;
- fan/RGB/power management apps.

Install only what you need.

For example:

- If you use Ethernet, Wi-Fi driver may be unnecessary.
- If you do not use RGB lighting, heavy RGB suites are optional.
- If vendor software constantly loads CPU/RAM or causes errors, disable its startup first without removing required driver components.

> [!TIP]
> Driver and vendor utility are not the same thing. Network/audio drivers are often required; large overlay/telemetry/lighting suites may be optional.

---

## 7. SSD drivers and firmware

### NVMe/SATA drivers

In most cases, default Microsoft storage drivers work well. Do not install separate controller drivers without clear reason or vendor recommendation.

### SSD firmware

SSD firmware update is useful when vendor lists fixes for:

- stability;
- data loss;
- sleep/wake behavior;
- overheating;
- compatibility;
- performance in a specific scenario.

Before updating SSD firmware:

1. Back up important data.
2. Read vendor instructions.
3. Keep laptop on AC power.
4. Do not power off during update.

---

## 8. Verify drivers in Windows

### Device Manager

1. Press `Win + X`.
2. Open `Device Manager`.
3. Check for devices with yellow warning icons.
4. Open target device properties → `Driver` tab.

### GPU information via PowerShell

```powershell
Get-CimInstance Win32_VideoController |
Select-Object Name, DriverVersion, DriverDate, VideoProcessor
```

### Windows version

```powershell
Get-ComputerInfo |
Select-Object WindowsProductName, WindowsVersion, OsBuildNumber
```

> [!NOTE]
> These commands only display information and do not modify system settings.

---

## 9. Optional vendor software

Before installing, ask: “What exact benefit do I get from this app?”

Often optional:

- automatic driver updaters;
- “gaming optimizers”;
- duplicate overlays;
- RAM cleaning tools;
- always-on telemetry utilities;
- RGB suites if lighting control is not needed;
- preinstalled trial antivirus software.

May be required:

- laptop power mode control;
- fan tuning;
- hotkeys;
- touchpad profiles;
- hybrid/discrete graphics switching;
- peripheral firmware updates.

Do not uninstall software until you understand its role. Disable startup first and test system behavior.

---

## Checklist

- [ ] Windows updates installed.
- [ ] Chipset driver installed from official source.
- [ ] Stable GPU driver installed.
- [ ] No devices with yellow warning icon in Device Manager.
- [ ] No driver packs or questionable auto-updaters used.
- [ ] Clean driver install used only for real issues.
- [ ] SSD firmware updated only when justified and per vendor instructions.
- [ ] Optional utilities are not running in background without need.

---

## Summary

A stable baseline is more important than chasing every new version. Use official drivers, update components intentionally, perform clean installs only when needed, and keep the system free from unnecessary “helper” tools.

Next step: [Windows 11 tuning](05-windows-11.md).
