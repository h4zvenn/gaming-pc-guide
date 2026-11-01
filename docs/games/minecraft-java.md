---
layout: doc
title: "Minecraft Java"
description: "Minecraft Java performance settings, JVM options, mods, and testing guidance."
lang: en
translation_key: game-minecraft-java
permalink: /docs/games/minecraft-java.html
---
> Improve Minecraft Java performance by reducing chunk-loading stutter, managing RAM allocation, and testing mods one at a time. Java and Bedrock are separate editions and require different guidance.

## Applicability

| Item | Value |
| --- | --- |
| Game | Minecraft: Java Edition |
| Platform | Minecraft Launcher, Prism Launcher, ATLauncher, MultiMC, GDLauncher |
| Engine | Java with LWJGL 3 |
| Anti-cheat | None in single-player; server-side anti-cheat may apply in multiplayer |
| Status | Needs verification per Minecraft version and mod set |

## Before tuning

Complete the general preparation flow first:

1. [Before You Start](../01-before-you-start.html)
2. [Find the Bottleneck](../02-find-the-bottleneck.html)
3. [Drivers & Updates](../04-drivers-and-updates.html)
4. [Windows 11 Gaming Settings](../05-windows-11.html)
5. [Background Apps](../07-background-apps.html)
6. [Temperatures & Stability](../10-temperatures-stability.html)

Do not install performance mods or change JVM arguments until the vanilla game is stable.

---

## Compatibility

- Check server rules before installing mods. Server-side anti-cheat may prohibit specific client mods.
- Use a mod loader version that matches your Minecraft version.
- Do not mix Forge, Fabric, and NeoForge mods in the same instance.
- Do not mix mods made for different Minecraft versions.
- Shader packs may require a specific Iris or OptiFine version.
- Use the Java runtime bundled with your launcher unless you have a specific reason to change it.

Minecraft Java version requirements change over time. Check the official Minecraft requirements for your version before changing Java.

---

## Graphics settings

Start with these values, then adjust one setting at a time.

| Setting | Recommended start | Why |
| --- | --- | --- |
| Render Distance | 12–16 chunks | Major FPS, RAM, and chunk-loading cost |
| Simulation Distance | Equal to or below Render Distance | Reduces CPU load from entities and ticks |
| Graphics | Fast | Improves FPS with minor visual loss |
| Smooth Lighting | Minimum | Reduces GPU load |
| Clouds | Off or Fast | Saves GPU resources |
| Particles | Minimal | Reduces CPU and GPU load |
| Entity Distance | 50–100% | Reduces rendering load for mobs and items |
| Biome Blend | Off or 3x3 | Reduces GPU cost at biome borders |
| V-Sync | Off | Avoids added latency; use VRR separately if supported |
| Max Framerate | Monitor refresh rate or slightly below | Improves frame-time consistency |

If FPS is low, reduce settings in this order:

1. Render Distance
2. Simulation Distance
3. Particles
4. Entity Distance
5. Biome Blend
6. Smooth Lighting

---

## FPS cap and latency

Use the in-game `Max Framerate` slider as the primary FPS limiter.

For VRR monitors:

- Enable G-SYNC or FreeSync in the GPU control panel and monitor OSD.
- Keep in-game V-Sync disabled unless you need to tune VRR behavior.
- Set an FPS cap within the VRR range if frame pacing is inconsistent.

Minecraft Java does not have native NVIDIA Reflex or AMD Anti-Lag support. Lower render distance, fewer mods, and stable FPS usually matter more than latency-specific tweaks.

---

## JVM arguments

Do not copy “FPS boost” JVM flag packs from the internet. Many popular flag sets are designed for Minecraft servers, not clients.

Start with your launcher’s default Java arguments. Change them only if you have a specific problem, such as garbage-collection stutter.

If you tune memory manually:

- Do not allocate all system RAM to Minecraft.
- Leave enough memory for Windows, the GPU driver, browser, and other applications.
- A common starting point is 4–8 GB for Minecraft, depending on total system RAM and modpack size.
- Set `-Xms` and `-Xmx` to the same value only after testing; this can reduce heap resizing but does not guarantee better performance.

Example starting point for a modded instance with enough system RAM:

```text
-Xms4G -Xmx4G
```

Test one JVM change at a time. If stutter appears after changing Java arguments, return to the launcher defaults.

---

## Mods

Test in this order:

1. Vanilla Minecraft baseline.
2. Performance mods one at a time.
3. Shader packs only after the base instance is stable.
4. Content mods after performance is validated.

Do not install a large modpack and performance mods at the same time without testing. If a problem appears, remove the most recently added mod first.

---

## Common issues

| Symptom | First check |
| --- | --- |
| Low FPS with high CPU usage | Lower Render Distance and Simulation Distance |
| Stutter every few seconds | Check RAM allocation, Java version, and garbage-collection behavior |
| Stutter when entering new areas | Lower Render Distance, use an SSD, or pre-generate chunks |
| Shader compilation lag | Allow shaders to compile; update Iris or OptiFine if compatible |
| Mod crash | Check Minecraft, mod-loader, and mod versions |
| Out-of-memory error | Increase allocated RAM only if the system has enough free memory |

---

## Benchmark scenario

Use the same world, seed, coordinates, time, weather, and settings for every run.

| Item | Recommendation |
| --- | --- |
| World | Fixed seed and fixed coordinates |
| Time | Fixed with `/time set 6000` |
| Weather | Clear |
| Warm-up | 5 minutes |
| Runs | At least 3 |
| Metrics | Average FPS, 1% lows, 0.1% lows, frame times, RAM usage |
| Mod testing | Vanilla baseline first, then one mod at a time |

See [Benchmark Templates](../16-benchmark-templates.html) for the full protocol.

---

## Verification

Record the Minecraft version, mod loader, mod list, Java runtime, and test date. Compare the same world, seed, coordinates, time, weather, render distance, and shader settings for at least three runs. Check frame times and memory use as well as FPS.

Use the vanilla baseline first and confirm server rules before testing client mods.

## Rollback

1. Restore `options.txt` from a backup.
2. Return JVM arguments to launcher defaults.
3. Remove mods or shader packs one by one.
4. Re-run the benchmark scenario.

---

## Related guides

- [Game Guides](index.html)
- [Benchmark Templates](../16-benchmark-templates.html)
- [Troubleshooting Trees](../15-troubleshooting-decision-trees.html)
