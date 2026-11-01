---
layout: doc
title: "Laptops and Windows Handhelds"
description: "Power, cooling, and graphics-switching checks for gaming laptops and Windows handheld PCs."
lang: en
translation_key: laptops-and-handhelds
permalink: /docs/21-laptops-and-handhelds.html
---

Laptops and Windows handheld PCs are limited by power and cooling more often than desktops. The same method applies: measure, change one thing, retest.

## Check these first

| Check | Why it matters |
| --- | --- |
| Plug in the original or a rated charger | Many laptops reduce CPU and GPU power on battery or with an underpowered charger. |
| Select a gaming-appropriate power mode | Windows power mode and the manufacturer's performance profile can change sustained clocks. |
| Confirm the game uses the dedicated GPU | A hybrid-graphics laptop may run a game on the integrated GPU. |
| Clear vents and use a hard, flat surface | Blocked airflow causes throttling regardless of settings. |
| Update the BIOS and drivers from the manufacturer | Laptop vendors often ship customized firmware and drivers. |

## Power and thermals

1. Run the same test plugged in and on battery and record FPS, frame times, and temperatures. A large gap confirms a power limit.
2. Watch CPU and GPU temperature and clocks during a 15 to 20 minute session. Clocks that fall as temperature rises indicate thermal throttling. See [Temperatures and Stability](10-temperatures-stability.html).
3. Prefer the manufacturer's supplied performance modes over third-party tools. Higher modes raise noise and heat; use the one that gives a stable result you can tolerate.
4. Use a frame-rate cap slightly below what the hardware can hold steadily. A stable capped frame rate is often smoother and cooler than an uncapped, fluctuating one.

## Hybrid graphics

- In Windows Settings, open the graphics settings and verify the game is assigned to the high-performance GPU.
- Also check the vendor's control panel or app for a per-game assignment.
- Confirm the active GPU with the overlay or a monitoring tool while the game runs.
- A hardware mode switch (MUX) exists only on some models and is set by the manufacturer's software or BIOS. Use it only as documented for your model.

## Battery life

Battery-powered gaming trades performance for runtime. Lower the frame-rate cap, reduce resolution or render scale, and lower power targets where the manufacturer's software provides them. Record the result as FPS per watt or minutes of playtime rather than guessing.

## Windows handhelds

- Use the manufacturer's official update path for BIOS, chipset, graphics drivers, and its control software.
- Keep the manufacturer's performance modes within documented ranges.
- Test with a fixed refresh rate and frame-rate cap, then change one display or power setting at a time.
- Storage is limited: keep free space for game updates and shader caches. See [Software and Disk Cleanup](19-ai-software-and-disk-cleanup.html).

## What to avoid

- Disabling thermal protection or removing power limits with unofficial tools.
- Undervolting or overclocking without reading [Overclocking and Undervolting](23-overclocking-and-undervolting.html).
- Opening the device or repasting without checking whether it voids your warranty.
