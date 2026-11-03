---
title: System Utilities
layout: doc
permalink: /docs/tools.html
---

Free tools for measuring what your PC is doing. They show data. They do not make a PC faster by themselves, so test every change with the [Benchmark Templates]({{ '/docs/16-benchmark-templates.html' | relative_url }}).

> **Note:** Download these tools only from the official pages linked below. Avoid "RAM booster" clones and repacks.

## Quick picks

| Tool | Use it for | Source |
| :--- | :--- | :--- |
| RAMMap | See how RAM is split between active, standby, modified and free | [Microsoft Sysinternals](https://learn.microsoft.com/en-us/sysinternals/downloads/rammap) |
| Process Explorer | Find which process uses CPU, RAM or handles | [Microsoft Sysinternals](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer) |
| Mem Reduct | Monitor memory; manual cleaning only if tested | [memreduct.com](https://www.memreduct.com/) |
| Resource Monitor | Disk, network, CPU and memory per process (built into Windows, run `resmon`) | Windows |
| HWiNFO | Temperatures, clocks, power and throttling | [hwinfo.com](https://www.hwinfo.com/) |
| LatencyMon | Driver latency (DPC/ISR) behind stutter and audio crackle | [resplendence.com](https://www.resplendence.com/latencymon) |
| CapFrameX, PresentMon | Frame-time capture: average FPS, 1% and 0.1% lows | [CapFrameX](https://www.capframex.com/), [PresentMon](https://github.com/GameTechDev/PresentMon) |

## RAMMap

RAMMap shows how physical memory is used. Run it as Administrator.

### How to read it

1. Open the **Use Counts** tab. The main rows are Active, Standby, Modified and Free.
2. Open **Processes** to see which programs hold memory.
3. Open **File Summary** to see which files sit in the cache.

Low Free memory is normal. Windows keeps recently used data in the Standby list as a cache and gives it back when a program needs it, so a full Standby list is not wasted memory.

### Signs of a real problem

- Active memory is close to your total RAM and the game stutters when new areas load.
- Modified memory keeps growing and does not shrink.
- One process holds far more memory than expected.

If you see these, fix the cause first: close the heavy program, add RAM, or lower texture settings.

> **Note:** The **Empty** menu (Empty Working Sets, Empty Standby List and similar) is a diagnostic experiment, not an optimization. Emptying the cache forces Windows to read data from disk again, which can cause stutter.

## Mem Reduct

Mem Reduct is a free, open-source memory monitor. It can also trigger cleaning similar to RAMMap's Empty menu, manually or automatically.

### Recommendations

1. Use it as a monitor first. Leave auto-reduction off.
2. Do not run it together with other memory cleaners.
3. Enable cleaning only after a test shows a benefit (see below).

## When memory cleaning is worth testing

Test it only if all of these apply:

- RAM is almost full, or hard faults spike at the moment the game stutters.
- The stutter appears after a long session and goes away after a restart.
- You can reproduce the problem in the same scene.

How to test:

1. Record a baseline: three runs of the same scene, noting average FPS, 1% low and 0.1% low.
2. Apply one cleaning method (for example, Empty Standby List before launch).
3. Record three more runs.
4. Keep it only if the 1% lows improve consistently. Otherwise, do not use it.

## Other utilities

- **Process Explorer** replaces Task Manager when you need to see what a process is doing.
- **Resource Monitor** replaces the old DiskMon for disk activity (Disk tab).
- **Wireshark** is for advanced network analysis. Most players only need the steps in [Network & Wi-Fi]({{ '/docs/20-network-and-wifi.html' | relative_url }}).

Related guides: [Find the Bottleneck]({{ '/docs/02-find-the-bottleneck.html' | relative_url }}) and [Temperatures & Stability]({{ '/docs/10-temperatures-stability.html' | relative_url }}).
