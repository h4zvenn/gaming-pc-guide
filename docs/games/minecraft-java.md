---
layout: doc
title: "minecraft-java"
---

# Minecraft Java Edition вЂ” Game Page (Stub)

> Pilot expansion. Fill after source audit and template agreement. **Java and Bedrock are separate pages.**

## Applicability

- **Game:** Minecraft Java Edition
- **Platform:** Minecraft Launcher / Third-party launchers (Prism, ATLauncher, MultiMC, GDLauncher)
- **Engine:** Custom (Java, LWJGL 3)
- **Anti-cheat:** None in singleplayer; server-side only (e.g., Watchdog, Vulcan, Spartan) вЂ” check server rules.
- **Game version tested:** needs-verification
- **Date checked:** 2026-10-30
- **Status:** draft

## Quick Start

1. Common base first (see [CS2 Quick Start](cs2.html#quick-start)).
2. No kernel anti-cheat in singleplayer; server rules apply for multiplayer.
3. Java runtime and launch arguments matter вЂ” test, do not copy "magic flags".
4. Apply only Minecraft-specific items below.
5. Validate with [Benchmark template]({{ '/docs/16-benchmark-templates/' | relative_url }}).

## Requirements & Compatibility

- **Anti-cheat / server constraints:** No client-side kernel anti-cheat. Server-side anti-cheats may forbid specific mods (e.g., Baritone, Freecam, certain HUD mods). Check server rules before installing mods.
- **Java runtime:** Use the bundled Java runtime from the launcher, or a tested JDK 17/21 (Minecraft 1.18+ requires Java 17+; 1.20.5+ requires Java 21).
- **Launcher:** Official Launcher, Prism, ATLauncher, MultiMC, GDLauncher вЂ” each manages Java and instances differently.
- **Known incompatibilities:** Mixing incompatible Forge/Fabric/NeoForge versions; mixing mods for different Minecraft versions; shader packs requiring specific Iris/OptiFine versions.

## Graphics Settings вЂ” Tradeoffs

| Setting | What it does | GPU/CPU cost | Visual impact | Recommended start |
|---|---|---|---|---|
| Render Distance | Chunk load radius | CPU/GPU/RAM | Visibility | 12вЂ“16 chunks |
| Simulation Distance | Entity/tick radius | CPU | Farms, redstone | в‰¤ Render Distance |
| Graphics (Fast/Fancy) | Leaves, clouds, particles | GPU | Visual fidelity | Fast for FPS |
| Render Region Fix | Fixes chunk border artifacts | GPU | Visual fix | On |
| Smooth Lighting | Light interpolation | GPU | Ambient occlusion | Minimum / Maximum |
| Clouds | Cloud rendering | GPU | Sky | Off / Fast |
| Particles | Particle density | GPU/CPU | Effects | Minimal |
| Entity Distance | Entity render distance | GPU/CPU | Mobs, items | 50вЂ“100% |
| FOV | Field of view | GPU | Perception | 70вЂ“90 |
| V-Sync | Frame sync | GPU | Tearing | Off (use VRR) |
| Max Framerate | In-game cap | | | Monitor Hz or slightly below |
| Biome Blend | Biome transition smoothing | GPU | Visual | Off / 3Г—3 |

> OptiFine / Iris / Sodium add many more settings вЂ” document separately per mod.

## FPS Cap, Sync & Latency Reduction

- **In-game FPS limiter:** `Max Framerate` slider.
- **V-Sync:** In-game option. Test off with VRR.
- **VRR:** Supported in fullscreen/exclusive; borderless may need driver VRR.
- **NVIDIA Reflex / AMD Anti-Lag:** Not supported natively.
- **Latency reduction:** No native Reflex/Anti-Lag. Low latency = high FPS + low render distance + minimal mods.

## Configs & Launch Options

- **Config location:**
  - Official Launcher: `%APPDATA%\.minecraft\options.txt`
  - Prism/ATLauncher/MultiMC: instance folder `options.txt`
- **Java arguments (JVM flags):**
  - Do **not** copy "Aikar flags" or "G1GC magic flags" without testing. They are tuned for **servers**, not clients.
  - Start with launcher defaults. If tuning: `-Xms4G -Xmx8G` (adjust to physical RAM в€’ 2вЂ“4 GB for OS), `-XX:+UseG1GC` (default on modern JDK), `-XX:G1HeapRegionSize=16M`. Test each change.
- **Launch options (launcher-level):** `--width`, `--height`, `--fullscreen`, `--gameDir`.
- **Do not use:** `-XX:+AggressiveOpts`, `-XX:+UseStringDeduplication`, large `-Xmn`, copied "FPS boost" flag packs.

## Common Issues & Diagnosis

| Symptom | First check | Link |
|---|---|---|
| Low FPS, high CPU | Lower Render/Simulation Distance, disable shaders, test Sodium/Lithium | [Bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck/) |
| Stutter every few seconds | GC spikes: check RAM allocation, try `-Xms=Xmx`, test G1GC/ZGC | [Bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck/) |
| Chunk load stutter | Pre-generate chunks (Chunky), lower Render Distance, SSD | [Bottleneck]({{ site.baseurl }}/docs/02-find-the-bottleneck/) |
| Shader compile lag | Iris/OptiFine shader cache, pre-compile | вЂ” |
| Mod crash / incompatibility | Check mod loader version (Forge/Fabric/NeoForge) matches Minecraft version; read mod changelogs | вЂ” |

## Benchmark Scenario

- **Scene:** Fixed seed, fixed coordinates (e.g., `seed: 12345, x: 100, y: 64, z: 100`), fixed time (`/time set 6000`), clear weather.
- **Warm-up:** 5 minutes (chunk generation, shader compile, JIT warm-up).
- **Runs:** в‰Ґ3 (median + minвЂ“max).
- **Metrics:** avg FPS, 1% low, p99 frametime, GC pause time (if using JDK flight recorder / VisualVM), RAM usage, temps.
- **Mod testing:** Test vanilla baseline first, then add one mod at a time.

## Rollback

1. Restore `options.txt` from backup.
2. Revert JVM arguments to launcher defaults.
3. Remove mods / shader packs one by one.
4. Re-run benchmark scenario.

## Sources

- Primary: Minecraft Java Edition changelogs (minecraft.net), JDK release notes, Sodium/Iris/OptiFine official docs.
- Secondary: Aikar's JVM flags (server-only вЂ” marked secondary), Prism/ATLauncher wikis.
- Community: Reddit r/Minecraft, r/admincraft вЂ” hypothesis only.

Back to main guide: [README]({{ '/' | relative_url }}).
