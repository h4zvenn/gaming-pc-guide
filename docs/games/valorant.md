# VALORANT — Game Page (Stub)

> Pilot expansion. Fill after source audit and template agreement.

## Applicability

- **Game:** VALORANT
- **Platform:** Riot Client
- **Engine:** Unreal Engine 4
- **Anti-cheat:** Vanguard (kernel-mode)
- **Game version tested:** needs-verification
- **Date checked:** 2026-10-30
- **Status:** draft

## Quick Start

1. Common base first (see [CS2 Quick Start](cs2.md#quick-start)).
2. Vanguard requires TPM 2.0 + Secure Boot on Windows 11 — verify before BIOS changes.
3. Apply only VALORANT-specific items below.
4. Validate with [Benchmark template](../16-benchmark-templates.md).

## Requirements & Compatibility

- **Anti-cheat constraints:** Vanguard runs at kernel level. Do not disable, modify, or block its services. No file modifications, no unsigned driver injection, no test-signed drivers. TPM 2.0 + Secure Boot mandatory on Windows 11.
- **OS / API requirements:** Windows 10 1909+ / Windows 11; DirectX 11.
- **Known incompatibilities:** Some overlays and monitoring tools conflict with Vanguard. Test clean first.

## Graphics Settings — Tradeoffs

| Setting | What it does | GPU/CPU cost | Visual impact | Recommended start |
|---|---|---|---|---|
| Resolution | | | | Native |
| Render scale | | | | 100% |
| Limit FPS | In-game cap | | | Test |
| V-Sync | | | | Off for competitive |
| Multithreaded Rendering | | CPU | | On |
| Material Quality | | GPU | | Low / Medium |
| Texture Quality | | GPU/VRAM | | Low / Medium |
| Detail Quality | | GPU | | Low |
| UI Quality | | GPU | | Low |
| Vignette | | GPU | | Off |
| Bloom | | GPU | | Off |
| Distortion | | GPU | | Off |
| First Person Shadows | | GPU | | Off |

> Verify setting names in current patch.

## FPS Cap, Sync & Latency Reduction

- **In-game FPS limiter:** Available (`Limit FPS` in Video settings).
- **V-Sync:** In-game + driver. Competitive: off.
- **VRR:** Supported. Test with V-Sync off (driver) + cap inside VRR range.
- **NVIDIA Reflex:** Supported in-game (`Reflex Low Latency` → On / On+Boost).
- **AMD Anti-Lag:** Driver fallback if Reflex unavailable.
- **Raw Input Buffer:** In-game option (mouse raw input). Test.

## Configs & Launch Options

- **Config location:** `%LOCALAPPDATA%\VALORANT\Saved\Config\` (client settings).
- **Verified launch options:** Few/no documented launch options. Prefer in-game settings.
- **Do not use:** Copied launch options from other games; `-high`, `-threads` etc. not documented for VALORANT.

## Common Issues & Diagnosis

| Symptom | First check | Link |
|---|---|---|
| Vanguard error / not initialized | Secure Boot + TPM 2.0 enabled, Vanguard service running | — |
| "VAN" error codes | Riot support KB for specific code | — |
| Low FPS, GPU not saturated | CPU-bound: lower Material/Texture/Detail, enable Multithreaded Rendering | [Bottleneck](../02-find-the-bottleneck.md) |
| Input latency | Reflex On+Boost, Raw Input Buffer on, cap FPS | [GPU settings](../06-gpu-settings.md) |
| Network spikes | Ethernet, Riot server region, background downloads | [Network diagnostics](../09-powershell-diagnostics.md#network) |

## Benchmark Scenario

- **Scene:** Range (fixed bot count, fixed route) or custom game with bots.
- **Warm-up:** 3–5 minutes.
- **Runs:** ≥3.
- **Metrics:** avg FPS, 1% low, p99 frametime, GPU busy, CPU core saturation, temps.

## Rollback

1. Reset in-game Video settings to defaults.
2. Remove any launch options in Riot Client.
3. If driver changed: rollback driver.

## Sources

- Primary: Riot VALORANT patch notes, Vanguard FAQ, NVIDIA/AMD Reflex docs.
- Secondary: —
- Community: —

Back to main guide: [README](../../README.md).
