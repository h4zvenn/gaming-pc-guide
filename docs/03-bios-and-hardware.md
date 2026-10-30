---
layout: doc
title: "03-bios-and-hardware"
---

# 03. BIOS and Hardware

> BIOS settings and correct hardware configuration can noticeably affect stability, boot time, 1% low, and gaming performance. Incorrect settings can also cause crashes, WHEA errors, and boot failures.

## Before you start

- BIOS interfaces and option names differ across ASUS, MSI, Gigabyte, ASRock, and laptop vendors.
- Take photos of your current settings or save a BIOS profile if your board supports it.
- Change one parameter at a time.
- After each change, verify Windows boot, games, temperatures, and stability.
- If the PC fails to boot after memory tuning or overclocking, reset CMOS using your motherboard manual.

### Fast safe BIOS path

| If you are unsure | Do this |
|---|---|
| New to BIOS tuning | Keep voltages on `Auto`, enable only XMP/EXPO + ReBAR |
| System already stable | Change one option at a time and benchmark |
| Boot problems after tuning | Revert to defaults and validate stock stability |

> [!IMPORTANT]
> Do not update BIOS or change voltages “just because.” First make sure you actually need it and understand the rollback path.

---

## 1. Check build quality and connections

Before changing BIOS settings, make sure components are installed and connected correctly.

### GPU

- Connect the monitor to the GPU outputs, not to motherboard HDMI/DisplayPort.
- Ensure the GPU is fully seated in the primary PCIe x16 slot.
- Use proper PSU power cables for the GPU.
- Do not sharply bend the 12VHPWR/12V-2x6 cable near the connector and ensure it is fully inserted.

### RAM

- With two memory sticks, use the recommended slots from your motherboard manual (usually `A2` and `B2`).
- Avoid mixing different RAM kits unless necessary; matching label frequency does not guarantee stability together.
- If XMP/EXPO is unstable, update BIOS and re-check memory installation first.

### Storage

- For the system NVMe SSD, use the recommended M.2 slot from the motherboard manual.
- Ensure the SSD is properly mounted and not overheating.
- Do not remove thermal pads from the M.2 heatsink if the board includes them.

---

## 2. BIOS update

### When to update

A BIOS update makes sense if:

- you are installing a new CPU;
- you have memory/boot/USB/network/compatibility issues;
- the changelog includes a fix for your issue;
- the vendor released an important stability or security update.

If the system is stable and the new version has no relevant fixes, updating is not always necessary.

### Safe update sequence

1. Confirm your exact motherboard or laptop model.
2. Open the vendor’s **official** support page.
3. Download BIOS only for your exact model and board revision.
4. Read the vendor instructions: Q-Flash, M-Flash, EZ Flash, Instant Flash, or equivalent.
5. Prepare a USB drive in the required format if needed.
6. Do not power off, reboot, or touch power during flashing.
7. If BitLocker is enabled, save the recovery key before changing BIOS, TPM, Secure Boot, or boot-order settings.
8. After update, load `Load Optimized Defaults` / `Load UEFI Defaults`.
9. Re-enable only required settings: XMP/EXPO, ReBAR, and other verified options.

> [!WARNING]
> Never flash BIOS using a file for a similar but different motherboard model. Wrong model/revision can brick the board.

---

## 3. XMP and EXPO: RAM configuration

By default, RAM may run at JEDEC baseline instead of your kit’s advertised speed.

### What to enable

- On Intel platforms, this is usually **XMP**.
- On AMD platforms, this is usually **EXPO**.
- In BIOS, these options are often under EZ Mode / Advanced Mode, OC, Tweaker, Ai Tweaker, or Extreme Memory Profile.

Select the profile recommended for your RAM kit, usually `Profile 1`.

### How to verify in Windows

Open PowerShell:

```powershell
Get-CimInstance Win32_PhysicalMemory |
Select-Object Manufacturer, PartNumber, Capacity, Speed, ConfiguredClockSpeed
```

Check `ConfiguredClockSpeed`.

> [!NOTE]
> In CPU-Z and similar tools, DRAM frequency can appear around half of the advertised value because DDR means Double Data Rate.
> For example, ~3000 MHz DRAM corresponds to DDR5-6000.

### If issues appear after enabling XMP/EXPO

Signs of instability:

- slow startup or boot loops;
- game crashes;
- BSODs;
- WHEA errors in Event Viewer;
- archive extraction errors;
- rare random freezes.

What to do:

1. Verify modules are in the correct slots.
2. Temporarily return RAM to `Auto` / JEDEC and test stability.
3. Update BIOS only if its changelog lists memory-compatibility fixes for your configuration.
4. Try a less aggressive profile or lower frequency if available.
5. Do not copy other people’s timings/voltages without understanding them.

---

## 4. Above 4G Decoding and Resizable BAR

On modern systems with a compatible CPU, GPU, motherboard, and driver, these are usually worth testing:

```text
Above 4G Decoding → Enabled
Resizable BAR / Re-Size BAR → Enabled
```

On AMD this may be called **Smart Access Memory**.

ReBAR is not universally neutral: the effect depends on the game, driver, and GPU, and some titles have shown regressions. Enable it, then compare your own games. If a specific game becomes slower or less stable, disable ReBAR for testing before changing anything else.

### Why it matters

Resizable BAR allows the CPU to access a larger VRAM window at once. Impact depends on game, driver, and GPU: noticeable in some titles, minimal in others.

### Where to find these settings

Usually in:

```text
Advanced
PCIe / PCI Subsystem Settings
IO Ports
Settings
```

### If options are unavailable

Check:

- motherboard BIOS is up to date;
- UEFI boot mode is enabled;
- CSM is disabled if required by the board;
- CPU/GPU/driver compatibility;
- `Above 4G Decoding` is enabled before ReBAR.

> [!WARNING]
> Do not change Secure Boot, TPM, CSM, or partition scheme without understanding consequences. On Legacy/MBR systems, boot mode changes can make Windows unbootable.

---

## 5. PCIe mode

### Recommended setting

Keep PCIe link speed at:

```text
Auto
```

Modern boards usually negotiate the best stable mode automatically.

### When to set manually

Force Gen3/Gen4 only for targeted troubleshooting:

- unstable riser cable;
- old PCIe extender;
- compatibility issues;
- rare errors/black screens that disappear on lower PCIe generation.

Do not force Gen5/Gen4 for “free FPS” if `Auto` already selects maximum stable mode.

---

## 6. CPU: PBO, Curve Optimizer, and overclocking

This is an optional advanced step, mostly relevant for some AMD Ryzen setups.

### What these settings mean

- **PBO (Precision Boost Overdrive)** — changes power/current limits that govern automatic boost behavior.
- **Curve Optimizer (CO)** — adjusts the voltage/frequency curve. Negative values can reduce required voltage and sometimes improve boost, but too much can cause errors.
- **Manual all-core overclock** — locks/sets all-core frequency manually. On modern CPUs this can reduce automatic single-thread boost behavior.

### Safe approach

1. Keep CPU on `Auto` if the system already performs well.
2. If testing PBO/CO, start with small changes.
3. Change one parameter at a time.
4. Validate in real games, not only benchmarks.
5. Monitor temperatures, clocks, and WHEA.
6. If errors appear, relax settings or return to `Auto`.

### WHEA check

1. Press `Win`.
2. Open `Event Viewer`.
3. Go to `Windows Logs → System`.
4. Find events with source `WHEA-Logger`.

> [!IMPORTANT]
> One good benchmark score does not prove stability. If WHEA, crashes, or rare freezes appear, the setup is unstable even if average FPS increased.

---

## 7. GPU undervolt and fan curves

These are optional but can reduce temperature, noise, and throttling.

### GPU undervolt

Goal: reduce GPU voltage while keeping similar frequency.

Possible outcomes:

- lower temperature;
- lower power draw;
- quieter fans;
- steadier clocks under thermal/power limits.

Risks:

- driver crashes;
- artifacts;
- game freezes;
- stable in some games but unstable in others.

If you are not ready to test and roll back, keep stock profile.

### Fan curves

Can be configured in BIOS, motherboard vendor software, or reliable monitoring tools.

Principle:

- at low temperature — moderate fan speed and low noise;
- as temperature rises — smooth fan ramp;
- avoid sharp jumps every 1–2 °C to prevent constant speed oscillation.

---

## 8. Settings best left on Auto

Without a specific reason, keep these on `Auto`:

- CPU Core Voltage;
- SoC Voltage;
- RAM timings;
- PCIe Link Speed;
- chipset voltages;
- LLC / Load-Line Calibration;
- manual CPU frequency;
- manual Infinity Fabric frequency;
- random values in Advanced/AMD Overclocking sections.

> [!TIP]
> `Auto` is not a “bad setting.” For most systems, it is the safest and most correct default.

---

## BIOS checklist

- [ ] BIOS file matches exact board model and revision.
- [ ] Optimized defaults were loaded after BIOS update.
- [ ] XMP/EXPO profile enabled, then verified for stability; kept only if stable.
- [ ] RAM installed in recommended slots.
- [ ] Above 4G Decoding enabled if supported.
- [ ] Resizable BAR enabled if supported.
- [ ] PCIe Link Speed left on Auto unless troubleshooting compatibility.
- [ ] No WHEA errors, crashes, reboots, or memory errors.
- [ ] PBO/Curve Optimizer/undervolt not used without testing.

---

## Summary

Proper baseline BIOS setup is not maximum overclocking. For most gaming PCs, this is enough:

1. Update BIOS only when there is a real reason.
2. Enable stable XMP/EXPO.
3. Enable Above 4G Decoding and Resizable BAR if compatible.
4. Keep complex voltages and frequencies on Auto.
5. Verify temperatures, WHEA, and overall stability.

Next step: [Drivers and updates](04-drivers-and-updates.md).
