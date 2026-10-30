# World of Tanks — Game Page (Stub)

> Pilot expansion. Fill after source audit and template agreement.

## Applicability

- **Game:** World of Tanks
- **Platform:** Wargaming Game Center / Steam
- **Engine:** Core (BigWorld) → moving to newer render pipeline
- **Anti-cheat:** Wargaming anti-cheat (client integrity + server-side)
- **Game version tested:** needs-verification
- **Date checked:** 2026-10-30
- **Status:** draft

## Quick Start

1. Common base first (see [CS2 Quick Start](../cs2.md#quick-start)).
2. Mods only from officially allowed sources (Wargaming Mod Hub). XVM and others — verify current policy.
3. Apply only WoT-specific items below.
4. Validate with [Benchmark template](../16-benchmark-templates.md).

## Requirements & Compatibility

- **Anti-cheat constraints:** Client integrity checks. Only mods from official Mod Hub allowed. XVM / custom configs — verify current policy before use. No file modifications outside allowed folders.
- **OS / API requirements:** Windows 10 1809+ / Windows 11; DirectX 11 (SD/HD client).
- **Known incompatibilities:** Some overlays and injectors trigger integrity failures. Test clean.

## Graphics Settings — Tradeoffs

| Setting | What it does | GPU/CPU cost | Visual impact | Recommended start |
|---|---|---|---|---|
| Render Scale | Internal resolution | GPU | Sharpness | 100% |
| Graphics Preset | Bundled preset | GPU/CPU | Overall | Medium / High |
| Anti-Aliasing | | GPU | Edges | MSAA 2× / 4× |
| Texture Quality | | GPU/VRAM | Detail | High |
| Shadow Quality | | GPU | Shadows | Medium |
| Water Quality | | GPU | Water | Medium |
| Particle Quality | | GPU/CPU | Explosions, smoke | Medium |
| Grass / Vegetation | | GPU/CPU | Foliage | Medium |
| Post-Processing | | GPU | Bloom, DOF | Off / Low |
| Motion Blur | | GPU | Motion | Off |
| Flare / Lens Effects | | GPU | Visual | Off |

> SD vs HD client may have different setting names.

## FPS Cap, Sync & Latency Reduction

- **In-game FPS limiter:** Available in Graphics settings.
- **V-Sync:** In-game + driver.
- **VRR:** Supported. Test with V-Sync off (driver) + cap inside VRR range.
- **NVIDIA Reflex / AMD Anti-Lag:** Not supported natively.
- **Latency reduction:** High FPS + low render scale + minimal post-processing.

## Configs & Launch Options

- **Config location:** `%APPDATA%\Wargaming.net\WorldOfTanks\` (`preferences.xml`, `engine_config.xml`).
- **Launch options (WGC / Steam):** Few documented. Prefer in-game settings.
- **Mods:** Only from [Wargaming Mod Hub](https://modhub.wargaming.com/). XVM — verify current policy.
- **Do not use:** Copied `engine_config.xml` from other players; unverified mods.

## Common Issues & Diagnosis

| Symptom | First check | Link |
|---|---|---|
| "Game integrity check failed" | Remove mods, verify files via WGC/Steam | — |
| Low FPS, GPU-bound | Lower Render Scale, Particle Quality, Water, Post-Processing | [Bottleneck](../02-find-the-bottleneck.md) |
| Low FPS, CPU-bound | Lower Grass, View Distance, Shadows | [Bottleneck](../02-find-the-bottleneck.md) |
| Stutter in battle | Texture streaming, SSD space, background downloads | [Bottleneck](../02-find-the-bottleneck.md) |
| High ping / packet loss | Server region, Ethernet, background traffic | [Network diagnostics](../09-powershell-diagnostics.md#network) |

## Benchmark Scenario

- **Scene:** Replay file (fixed battle, fixed camera) or Training Room (fixed route).
- **Warm-up:** 3–5 minutes.
- **Runs:** ≥3.
- **Metrics:** avg FPS, 1% low, p99 frametime, GPU busy, CPU core saturation, temps.

## Rollback

1. Reset in-game Graphics to defaults.
2. Remove mods, verify game files.
3. Restore `preferences.xml` from backup.

## Sources

- Primary: World of Tanks patch notes, Wargaming Mod Hub policy, NVIDIA/AMD driver notes for WoT.
- Secondary: —
- Community: —

Back to main guide: [README](../README.md).
