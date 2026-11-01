---
layout: doc
title: "Network, Wi-Fi, and Online Latency"
description: "Separate network latency, packet loss, and Wi-Fi problems from PC performance problems, then test one change at a time."
lang: en
translation_key: network-and-wifi
permalink: /docs/20-network-and-wifi.html
---

Rubber-banding, ping spikes, and disconnects are network symptoms, not FPS symptoms. Confirm which one you have before changing Windows or game settings.

## Tell the symptoms apart

| Symptom | Likely area | First check |
| --- | --- | --- |
| Low or unstable FPS, local input lag | PC | [Find the Bottleneck](02-find-the-bottleneck.html) |
| Ping spikes, rubber-banding, "network unstable" icon | Network or server | Ping test below |
| Packet loss at all times of day | Home network or ISP | Wired test, then ISP |
| Problems only in one game or region | Game server or routing | Another game or server region |

## Measure before changing anything

Use the in-game network graph or net statistics if the game provides them. Then record a baseline outside the game:

```powershell
ping -n 100 1.1.1.1
```

Record the minimum, average, and maximum times and the packet loss. A spread of a few milliseconds is normal; frequent large spikes or any sustained loss deserve investigation. Repeat the test at the same time of day, because congestion changes the result.

If you want a structured, read-only network check, use the connectivity section of the [diagnostics menu](09-powershell-diagnostics.html).

## Ordered checklist

1. **Test wired.** Connect an Ethernet cable directly to the router. If the problem disappears, the cause is the wireless link, not the game or Windows.
2. **Reduce competing traffic.** Pause large downloads, cloud sync, streaming, and game launcher updates on every device while you test.
3. **Restart the modem and router** once, then retest. Do not make this a daily habit; recurring faults point to a hardware or ISP problem.
4. **Update network drivers** from the motherboard, laptop, or adapter manufacturer. Keep the previous driver available for rollback. See [Drivers and Updates](04-drivers-and-updates.html).
5. **Check the cable and port.** A damaged or very long cable, or a port negotiating a lower speed than expected, can cause loss. Try another cable.
6. **Contact your ISP** if wired tests still show loss or spikes. Include your dated ping results.

## If you must use Wi-Fi

- Prefer the 5 GHz or 6 GHz band (if your router and adapter support it) over 2.4 GHz for gaming, and stay close to the router with a clear line of sight.
- Choose a less crowded channel in the router settings if neighbors' networks overlap yours; change one value, then retest.
- Keep router firmware current using the manufacturer's official update path.
- Do not rely on a wireless repeater for latency-sensitive games; each hop adds delay.
- Avoid Wi-Fi power-saving options while testing. On a laptop, use a power plan appropriate for gaming and plugged-in power. See [Laptops and Handhelds](21-laptops-and-handhelds.html).

## What to avoid

- "Network booster" or TCP/IP registry tweaks promised to lower ping. Evidence for general benefit is weak, and they can cause hard-to-trace problems. See [What Not To Do](11-what-not-to-do.html) and [Optimization Tools](18-optimization-tools-evidence.html).
- Disabling IPv6, the firewall, or security services as a "fix". Isolate the cause first.
- Third-party DNS or VPN changes without a test: they can lower or raise latency depending on routing. Measure with the same ping test before and after, and revert if there is no clear improvement.

## Record the result

Add network results to your [benchmark template](16-benchmark-templates.html): date and time, wired or Wi-Fi, ping minimum/average/maximum, loss percentage, and the single change you made.
