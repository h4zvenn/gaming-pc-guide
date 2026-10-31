---
layout: doc
title: "cs2"
---

# Counter-Strike 2 (CS2) — Comprehensive Optimization Guide

> Complete guide for maximum Counter-Strike 2 performance optimization on Source 2. Eliminating micro-stutters, reducing input lag, fine-tuning network settings, and securing a stable 1% Low FPS floor.

## Applicability

- **Game:** Counter-Strike 2
- **Platform:** Steam
- **Engine:** Source 2 (DirectX 11 / Vulkan)
- **Anti-cheat:** VAC + Trusted Mode
- **Game version tested:** current-patch (2026)
- **Date checked:** 2026-10-30
- **Status:** verified

## Quick Start

Before tuning CS2, verify your system configuration in this order:

1. **System Preparation:** [Before You Start]({{ '/docs/01-before-you-start.html' | relative_url }}) → [Find the Bottleneck]({{ '/docs/02-find-the-bottleneck.html' | relative_url }})
2. **Hardware & OS:** [BIOS Setup]({{ '/docs/03-bios-and-hardware.html' | relative_url }}) → [Drivers & Updates]({{ '/docs/04-drivers-and-updates.html' | relative_url }}) → [Windows 11 Tweaks]({{ '/docs/05-windows-11.html' | relative_url }})
3. **Graphics & Background:** [GPU Settings]({{ '/docs/06-gpu-settings.html' | relative_url }}) → [Background Apps]({{ '/docs/07-background-apps.html' | relative_url }}) → [Services & Security]({{ '/docs/08-services-and-security.html' | relative_url }})
4. **Diagnostics & Stability:** [PowerShell Diagnostics]({{ '/docs/09-powershell-diagnostics.html' | relative_url }}) → [Temperatures & Stability]({{ '/docs/10-temperatures-stability.html' | relative_url }})
5. **CS2 Validation:** Apply the settings below and measure performance with the [Benchmark Template]({{ '/docs/16-benchmark-templates.html' | relative_url }}).

## Requirements & Compatibility

- **Anti-cheat constraints:** VAC + Trusted Mode strictly block third-party code injection. Do not modify core game files or use unapproved external overlays. The `-allow_third_party_software` parameter lowers your Trust Factor — use it at your own risk.
- **OS / API:** Windows 10 (1909+) / Windows 11; **DirectX 11** is strongly recommended (Vulkan is recommended only for older AMD CPUs paired with powerful GPUs, but can induce stutter during initial shader compilation).
- **Incompatibilities:** Discord Overlay, Xbox Game Bar, NVIDIA GeForce Experience Overlay, and RivaTuner Statistics Server (RTSS) may cause cursor issues, frame stutters, and FPS drops. Disable them during initial troubleshooting.

## Graphics Settings — Tradeoffs & Competitive Baseline

> Graphics settings in CS2 impact not only FPS, but also player model visibility through Source 2 lighting and shadow mechanics.

| Setting | What it does | GPU/CPU cost | Visual impact | Recommended start |
| --- | --- | --- | --- | --- |
| Resolution | Native or custom 4:3 / 16:9 | GPU | Sharpness / FOV | Native (or 1280x960 stretched) |
| Display Mode | Fullscreen / Windowed | OS/GPU | Input latency | Exclusive Fullscreen |
| Boost Player Contrast | Highlights models | CPU | Visibility | Enabled |
| Wait for V-Sync | Frame synchronization | GPU | Input lag | Disabled |
| Multisampling Anti-Aliasing | Edge smoothing | GPU | Jagged edges | 4x MSAA (or 2x for weak GPU) |
| Global Shadow Quality | Shadow distance / map | GPU/CPU | Shadow detail | High (Critical for info!) |
| Model / Texture Detail | Texture filtering | VRAM | Surface clarity | Medium |
| Shader Detail | Surface effects / water | GPU | Visual effects | Low |
| Particle Detail | Smokes, Molotovs, blood | CPU/GPU | Explosion detail | Low |
| Ambient Occlusion | Contact shadows | GPU | Depth perception | Disabled |
| High Dynamic Range | Lighting range | GPU | Brightness | Quality / Performance |
| FidelityFX Super Resolution | AMD Upscaling | GPU | Blur vs FPS | Disabled (Native) |
| NVIDIA Reflex Low Latency | Sub-frame latency reduction | CPU/GPU | Input lag | On + Boost |

## FPS Cap, Sync & Latency Reduction

- **In-game FPS limiter:** Use the `fps_max` console command (e.g., `fps_max 400` or cap to your monitor's refresh rate if your frame delivery is erratic). In-game capping is vastly superior to external limiters.
- **NVIDIA Reflex:** Set to **`On + Boost`** whenever using an RTX/GTX GPU. This reduces input latency by 15–30% in CPU-bound scenarios.
- **G-SYNC / FreeSync:** Enable in your GPU Control Panel and monitor OSD. Keep in-game V-Sync **Disabled** when utilizing VRR.

## Configs & Launch Options

- **Config location:** `.../steamapps/common/Counter-Strike 2/game/csgo/cfg/` (`autoexec.cfg`).
- **Verified launch options:**
  - `-novid` — skips the Valve intro sequence.
  - `-high` — sets high process priority (beneficial on older CPUs; test carefully on modern architectures with E-cores).
  - `-threads <N>` — forces the process to utilize specific physical CPU threads.
  - `-nojoy` — disables joystick/controller input polling to free CPU cycles.
- **Recommended Autoexec Network Variables:**
  - `rate 786432` (maximum bandwidth allocation for sub-tick rate data).
  - `cl_cmdrate 127`, `cl_updaterate 127` (server tick synchronization).

## Common Issues & Diagnosis

| Symptom | First check | Link |
| --- | --- | --- |
| Low FPS, GPU busy at 95-99% | Lower Shader Detail, Shadow Quality, disable MSAA | [Bottleneck]({{ '/docs/02-find-the-bottleneck.html' | relative_url }}) |
| Low FPS, single CPU core at 100% | Lower Particle Detail, terminate background processes | [Bottleneck]({{ '/docs/02-find-the-bottleneck.html' | relative_url }}) |
| Micro-stutter on new maps | Shader pre-compilation, verify game files, move to NVMe SSD | [Bottleneck]({{ '/docs/02-find-the-bottleneck.html' | relative_url }}) |
| Heavy input latency / sluggish mouse | Enable Reflex On+Boost, disable V-Sync and third-party overlays | [GPU settings]({{ '/docs/06-gpu-settings.html' | relative_url }}) |
| Packet loss / sub-tick delay | Check telemetry overlay, switch to Ethernet, check bufferbloat | [Diagnostics]({{ '/docs/09-powershell-diagnostics.html' | relative_url }}) |
| Crash on launch / "VAC unable to verify" | Verify file integrity in Steam, disable third-party hooks | [Troubleshooting]({{ '/docs/15-troubleshooting-decision-trees.html' | relative_url }}) |

> **Source 2 Shader Note:** Shaders compile dynamically during your first few matches. If you experience stutters after a GPU driver update, complete 1 full Deathmatch game to allow the disk shader cache to build.

## Benchmark Scenario

- **Scene:** Steam Workshop map `Aim Botz` (fixed bot count) OR a recorded `.dem` competitive replay played via `playdemo`.
- **Warm-up:** 5 minutes (mandatory warm-up to pre-load shader cache and stream map assets into memory).
- **Runs:** Minimum of 3 runs (recording Average FPS, 1% Low, and 0.1% Low metrics).
- **Tools:** CapFrameX 1.8+, PresentMon, or HWiNFO64.
- **Control Variables:** Identical resolution, identical graphics settings, no background browser or chat apps running.

## Rollback Procedure

1. Delete or rename `autoexec.cfg` and restore default parameters in `video.txt`.
2. Clear all custom launch options in Steam properties.
3. If issues started after a driver update, perform a clean rollback using Display Driver Uninstaller (DDU).
4. Reboot your system and rerun the benchmark scenario to confirm baseline performance.

## Sources

- Primary: Valve CS2 Official Patch Notes, NVIDIA Reflex Developer Documentation, AMD Anti-Lag guides.
- Secondary: Blur Busters (Display Latency & VRR Methodology), CapFrameX metric validation docs.
- Community: Competitive hardware benchmarking analytics (r/GlobalOffensive, HLTV technical analysis).

> Mark each recommendation with: `verified` | `needs-verification` | `deprecated` and the date.

Back to main guide: [README]({{ '/' | relative_url }}).
