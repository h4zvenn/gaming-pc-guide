---
layout: doc
title: "cs2"
---

# Counter-Strike 2 (CS2) — Pilot Game Page

> Pilot page for the game-section architecture. Keep only deltas; link to common base for everything else.

## Applicability

- **Game:** Counter-Strike 2
- **Platform:** Steam
- **Engine:** Source 2
- **Anti-cheat:** VAC + Trusted Mode
- **Game version tested:** needs-verification
- **Date checked:** 2026-10-30
- **Status:** pilot

## Quick Start

1. Complete the common base: [Preparation]({{ '/docs/01-before-you-start/' | relative_url }}) → [Bottleneck]({{ '/docs/02-find-the-bottleneck/' | relative_url }}) → [BIOS/Hardware]({{ '/docs/03-bios-and-hardware/' | relative_url }}) → [Drivers]({{ '/docs/04-drivers-and-updates/' | relative_url }}) → [Windows]({{ '/docs/05-windows-11/' | relative_url }}) → [GPU]({{ '/docs/06-gpu-settings/' | relative_url }}) → [Background]({{ '/docs/07-background-apps/' | relative_url }}) → [Security/Services]({{ '/docs/08-services-and-security/' | relative_url }}) → [Diagnostics]({{ '/docs/09-powershell-diagnostics/' | relative_url }}) → [Thermals/Stability]({{ '/docs/10-temperatures-stability/' | relative_url }}).
2. Apply only the CS2-specific items below that match your symptom.
3. Validate with the [Benchmark template]({{ '/docs/16-benchmark-templates/' | relative_url }}).
4. Keep only what improves your metrics without instability.

## Requirements & Compatibility

- **Anti-cheat constraints:** VAC + Trusted Mode. Do not modify game files, inject overlays, or use unverified launch options. The option `-allow_third_party_software` opts out of Trusted Mode — use only if you accept the lower trust level.
- **OS / API requirements:** Windows 10 1909+ / Windows 11; DirectX 11 / Vulkan.
- **Known incompatibilities:** Some overlays (Discord, Steam, NVIDIA, RTSS) may conflict with Trusted Mode or cause launch issues. Test without overlays first.

## Graphics Settings — Tradeoffs

| Setting | What it does | GPU/CPU cost | Visual impact | Recommended start |
|---|---|---|---|---|
| Resolution | Native or custom aspect | GPU | Sharpness | Native |
| Render scale | Internal render resolution | GPU | Blur if <100% | 100% |
| Upscaler (FSR 1.0) | Upscale from lower res | GPU | Slight blur | Off / Quality |
| Anti-aliasing (MSAA) | Edge smoothing | GPU | Sharper edges | 2× / 4× / Off |
| Shadows | Shadow quality | GPU | Shadow detail | Low / Medium |
| Global Shadow Quality | Combined shadow setting | GPU | Overall shadows | Low / Medium |
| Shader Detail | Shader complexity | GPU | Surface detail | Low / High |
| Particle Detail | Particle effects | GPU/CPU | Explosions, smoke | Low / High |
| Ambient Occlusion | Contact shadows | GPU | Depth perception | Off / Medium |
| High Dynamic Range | HDR rendering | GPU | Brightness range | Off / On |
| FidelityFX Super Resolution | AMD upscaler | GPU | Performance/quality | Off / Quality |

> Settings names match current CS2 menus. Remove rows that do not apply to your patch.

## FPS Cap, Sync & Latency Reduction

- **In-game FPS limiter:** Available (`fps_max` in console / Video settings). Behaviour: caps after frame submission.
- **V-Sync:** In-game option + driver control panel. Test both.
- **VRR (G-SYNC / FreeSync):** Supported. Enable in monitor OSD + driver. In-game V-Sync off for VRR.
- **NVIDIA Reflex:** Supported in-game (`Reflex Low Latency` → On / On+Boost). Preferred over driver Low Latency Mode.
- **AMD Anti-Lag:** Driver-level. Test if Reflex not available.
- **Frame Generation:** Not supported in CS2.
- **Recommended sync profiles:**
  - **Competitive latency:** V-Sync off, VRR off, `fps_max` slightly above stable floor, Reflex On+Boost.
  - **VRR smoothness:** V-Sync on (driver), VRR on, `fps_max` 3–5 Hz below monitor max, Reflex On.

## Configs & Launch Options

- **Config location:** `.../steamapps/common/Counter-Strike 2/game/csgo/cfg/` (`video.txt`, `autoexec.cfg`).
- **Verified launch options (current patch):**
  - `-novid` — skip intro video.
  - `-high` — high process priority (use with caution on laptops).
  - `-threads <N>` — main thread count (default: logical cores; test).
  - `-nojoy` — remove joystick support (marginal).
  - `-allow_third_party_software` — disables Trusted Mode (not recommended).
- **Do not use:** `-dxlevel`, `-nod3d9ex`, `-nod3d9ex2`, legacy Source 1 options, copied "FPS boost" packs.

## Common Issues & Diagnosis

| Symptom | First check | Link |
|---|---|---|
| Low FPS, GPU busy 95–99% | Lower Shader Detail, Shadows, Particle Detail, disable MSAA | [Bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck/) |
| Low FPS, one CPU core 100% | Lower Particle Detail, disable multicore rendering test, close background | [Bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck/) |
| Stutter on new maps/rounds | Shader pre-compilation, verify game files, SSD space | [Bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck/) |
| Input latency feels high | Reflex On+Boost, `fps_max` cap, VRR profile, disable overlays | [GPU settings]({{ site.baseurl }}/docs/06-gpu-settings/) |
| Network latency / loss | `net_graph 1`, Steam region, Ethernet vs Wi-Fi | [Network diagnostics]({{ site.baseurl }}/docs/09-powershell-diagnostics/#9-network) |
| Crash on launch / "VAC unable to verify" | Verify integrity, disable overlays, check `-allow_third_party_software` | [Troubleshooting]({{ site.baseurl }}/docs/15-troubleshooting-decision-trees/) |
| "Trusted Mode" blocks overlay | Disable overlay or use `-allow_third_party_software` knowingly | — |

> CS2-specific: shader compilation on first launch / after driver update causes one-time stutter. Let it finish before benchmarking.

## Benchmark Scenario

- **Scene:** Workshop map `aim_botz` or `Aim Botz - Training` (fixed bot count, fixed route) OR recorded `.dem` demo played back with `playdemo`.
- **Warm-up:** 5 minutes (shader cache, asset streaming).
- **Runs:** ≥3 (median + min–max).
- **Metrics:** avg FPS, 1% low, 0.1% low, p99 frametime, GPU busy, CPU core saturation, CPU/GPU temps, WHEA.
- **Tools:** CapFrameX 1.8+, PresentMon, HWiNFO, in-game `cl_showfps 2` / `net_graph 1` for cross-check.
- **Fixed variables:** same map, same bot config, same resolution/settings, same `fps_max`, same overlays (preferably none), same driver/Windows build.

## Rollback

1. Delete or rename `autoexec.cfg`, restore `video.txt` from backup.
2. Remove launch options in Steam → Properties → Launch Options.
3. If driver changed for CS2: rollback driver (Device Manager → Roll Back) or reinstall previous version.
4. Re-run benchmark scenario to confirm baseline restored.

## Sources

- Primary: Valve CS2 patch notes (store.steampowered.com), NVIDIA/AMD Reflex/Anti-Lag docs, Microsoft HAGS/DirectX blog.
- Secondary: Blur Busters (VRR/V-Sync methodology), CapFrameX docs (metric definitions).
- Community: Reddit r/GlobalOffensive, HLTV configs — hypothesis only.

> Mark each recommendation with: `verified` | `needs-verification` | `deprecated` and the date.

Back to main guide: [README]({{ '/' | relative_url }}).
