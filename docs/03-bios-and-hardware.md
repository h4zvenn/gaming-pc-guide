---
layout: doc
title: "BIOS & Hardware"
description: "Review BIOS and hardware settings that affect gaming performance, stability, and memory configuration."
lang: en
translation_key: bios-and-hardware
permalink: /docs/03-bios-and-hardware.html
---


BIOS settings and correct hardware configuration can noticeably affect stability, boot time, 1% lows, and gaming performance. Incorrect settings can also cause crashes, WHEA errors, and boot failures.

> **Important:** Do not update the BIOS or change voltages “just because.” First confirm that you need the change and understand the rollback path.

---

## Before you start

- BIOS interfaces and option names differ across ASUS, MSI, Gigabyte, ASRock, and laptop vendors.
- Take photos of your current settings or save a BIOS profile if your motherboard supports it.
- Change one parameter at a time.
- After each change, verify Windows boot, games, temperatures, and stability.
- If the PC fails to boot after memory tuning or overclocking, reset CMOS using the motherboard manual.

| If you are unsure | Do this |
| --- | --- |
| New to BIOS tuning | Keep voltages on `Auto`; enable only XMP/EXPO and Resizable BAR |
| System is already stable | Change one option at a time and benchmark |
| Boot problems after tuning | Return to defaults and validate stock stability |

---

## Check hardware and connections

Before changing BIOS settings, make sure components are installed and connected correctly.

### GPU

- Connect the monitor to the GPU outputs, not to the motherboard HDMI or DisplayPort.
- Ensure the GPU is fully seated in the primary PCIe x16 slot.
- Use the proper PSU power cables for the GPU.
- Do not sharply bend a 12VHPWR or 12V-2x6 cable near the connector, and ensure it is fully inserted.

### RAM

- With two memory modules, use the recommended slots from the motherboard manual, usually `A2` and `B2`.
- Avoid mixing different RAM kits unless necessary. Matching advertised frequency does not guarantee stability together.
- If XMP or EXPO is unstable, update the BIOS and recheck memory installation first.

### Storage

- Use the recommended M.2 slot for the system NVMe SSD.
- Ensure the SSD is properly mounted and not overheating.
- Do not remove thermal pads from the M.2 heatsink if the motherboard includes them.

---

## BIOS update

### When to update

Update the BIOS only when:

- You are installing a new CPU.
- You have memory, boot, USB, network, or compatibility issues.
- The changelog includes a fix for your issue.
- The vendor released an important stability or security update.

If the system is stable and the new version has no relevant fixes, updating is not always necessary.

### Safe update sequence

1. Confirm the exact motherboard or laptop model.
2. Open the vendor’s official support page.
3. Download the BIOS only for the exact model and board revision.
4. Read the vendor instructions for Q-Flash, M-Flash, EZ Flash, Instant Flash, or the equivalent tool.
5. Prepare a USB drive in the required format if needed.
6. Do not power off, reboot, or touch the power button during flashing.
7. If BitLocker is enabled, save the recovery key before changing BIOS, TPM, Secure Boot, or boot-order settings.
8. After the update, load `Load Optimized Defaults` or `Load UEFI Defaults`.
9. Re-enable only the required settings: XMP/EXPO, Resizable BAR, and other verified options.

> **Warning:** Never flash a BIOS file intended for a similar but different motherboard model or revision. The wrong file can brick the board.

---

## XMP and EXPO

By default, RAM may run at JEDEC baseline speeds instead of the kit’s advertised speed.

### What to enable

- On Intel platforms, this is usually called **XMP**.
- On AMD platforms, this is usually called **EXPO**.
- In BIOS, these options are often under EZ Mode, Advanced Mode, OC, Tweaker, Ai Tweaker, or Extreme Memory Profile.

Select the profile recommended for your RAM kit, usually `Profile 1`.

### Verify in Windows

Open PowerShell:

```powershell
Get-CimInstance Win32_PhysicalMemory |
Select-Object Manufacturer, PartNumber, Capacity, Speed, ConfiguredClockSpeed
```

Check `ConfiguredClockSpeed`.

> **Note:** In CPU-Z and similar tools, DRAM frequency can appear at roughly half of the advertised value because DDR means Double Data Rate. For example, about 3000 MHz DRAM corresponds to DDR5-6000.

### If issues appear after enabling XMP or EXPO

Signs of instability:

- Slow startup or boot loops
- Game crashes
- BSODs
- WHEA errors in Event Viewer
- Archive extraction errors
- Rare random freezes

What to do:

1. Verify that the modules are in the correct slots.
2. Temporarily return RAM to `Auto` or JEDEC and test stability.
3. Update the BIOS only if its changelog lists memory-compatibility fixes for your configuration.
4. Try a less aggressive profile or lower frequency if available.
5. Do not copy other people’s timings or voltages without understanding them.

---

## Above 4G Decoding and Resizable BAR

On modern systems with a compatible CPU, GPU, motherboard, and driver, test these settings:

```text
Above 4G Decoding: Enabled
Resizable BAR / Re-Size BAR: Enabled
```

On AMD systems, Resizable BAR may be called **Smart Access Memory**.

ReBAR is not universally beneficial. Its effect depends on the game, driver, and GPU, and some titles have shown regressions. Enable it, then compare your own games. If a specific game becomes slower or less stable, disable ReBAR before changing anything else.

### Why it matters

Resizable BAR allows the CPU to access a larger VRAM window at once. The impact depends on the game, driver, and GPU: noticeable in some titles and minimal in others.

### Where to find the settings

These options are usually under:

```text
Advanced
PCIe / PCI Subsystem Settings
IO Ports
Settings
```

### If the options are unavailable

Check:

- The motherboard BIOS is up to date.
- UEFI boot mode is enabled.
- CSM is disabled if required by the board.
- CPU, GPU, and driver compatibility.
- `Above 4G Decoding` is enabled before Resizable BAR.

> **Warning:** Do not change Secure Boot, TPM, CSM, or the partition scheme without understanding the consequences. On Legacy/MBR systems, boot-mode changes can make Windows unbootable.

---

## PCIe mode

Keep PCIe link speed on:

```text
Auto
```

Modern motherboards usually negotiate the best stable mode automatically.

Force Gen3 or Gen4 only for targeted troubleshooting:

- Unstable riser cable
- Old PCIe extender
- Compatibility issues
- Rare errors or black screens that disappear at a lower PCIe generation

Do not force Gen4 or Gen5 for “free FPS” if `Auto` already selects the maximum stable mode.

---

## CPU: PBO, Curve Optimizer, and overclocking

This is an optional advanced step, mostly relevant for some AMD Ryzen systems.

### What these settings mean

- **PBO (Precision Boost Overdrive):** changes power and current limits that govern automatic boost behavior.
- **Curve Optimizer:** adjusts the voltage-frequency curve. Negative values can reduce required voltage and sometimes improve boost, but excessive values can cause errors.
- **Manual all-core overclock:** sets all-core frequency manually. On modern CPUs, this can reduce automatic single-thread boost behavior.

### Safe approach

1. Keep the CPU on `Auto` if the system already performs well.
2. If testing PBO or Curve Optimizer, start with small changes.
3. Change one parameter at a time.
4. Validate in real games, not only benchmarks.
5. Monitor temperatures, clocks, and WHEA errors.
6. If errors appear, relax the settings or return to `Auto`.

### Check WHEA errors

1. Press `Win`.
2. Open Event Viewer.
3. Go to `Windows Logs → System`.
4. Find events with the source `WHEA-Logger`.

> **Important:** One good benchmark score does not prove stability. If WHEA errors, crashes, or rare freezes appear, the setup is unstable even if average FPS increased.

---

## GPU undervolt and fan curves

These are optional changes that can reduce temperature, noise, and throttling.

### GPU undervolt

The goal is to reduce GPU voltage while keeping a similar frequency.

Possible benefits:

- Lower temperature
- Lower power consumption
- Quieter fans
- More consistent clocks under thermal or power limits

Possible risks:

- Driver crashes
- Visual artifacts
- Game freezes
- Stability in some games but not others

If you are not ready to test and roll back, keep the stock profile.

### Fan curves

Fan curves can be configured in BIOS, motherboard vendor software, or reliable monitoring tools.

Use this principle:

- At low temperature, use moderate fan speed and low noise.
- As temperature rises, increase fan speed smoothly.
- Avoid sharp jumps every 1–2 °C, which can cause constant speed oscillation.

---

## Settings best left on Auto

Without a specific reason, keep these on `Auto`:

- CPU core voltage
- SoC voltage
- RAM timings
- PCIe link speed
- Chipset voltages
- LLC / Load-Line Calibration
- Manual CPU frequency
- Manual Infinity Fabric frequency
- Random values in Advanced or AMD Overclocking sections

> **Tip:** `Auto` is not a bad setting. For most systems, it is the safest and most correct default.

---

## BIOS checklist

- [ ] BIOS file matches the exact motherboard model and revision.
- [ ] Optimized defaults were loaded after a BIOS update.
- [ ] XMP or EXPO is enabled and verified for stability.
- [ ] RAM is installed in the recommended slots.
- [ ] Above 4G Decoding is enabled if supported.
- [ ] Resizable BAR is enabled if supported.
- [ ] PCIe link speed is on `Auto` unless troubleshooting compatibility.
- [ ] No WHEA errors, crashes, reboots, or memory errors appear.
- [ ] PBO, Curve Optimizer, or undervolting are not used without testing.

---

## Summary

Proper BIOS setup is not maximum overclocking. For most gaming PCs, this is enough:

1. Update the BIOS only when there is a real reason.
2. Enable stable XMP or EXPO.
3. Enable Above 4G Decoding and Resizable BAR if compatible.
4. Keep complex voltages and frequencies on `Auto`.
5. Verify temperatures, WHEA errors, and overall stability.

---

## Next step

[Drivers & Updates](04-drivers-and-updates.html)
