---
layout: doc
title: "Streaming and Game Capture"
description: "Reduce the performance cost of recording and streaming by measuring encoder, capture, and overlay impact."
lang: en
translation_key: streaming-and-capture
permalink: /docs/22-streaming-and-capture.html
---

Recording and streaming add load to the GPU, CPU, memory, and disk. Measure that cost instead of copying someone else's encoder settings.

## Measure the cost

1. Benchmark the game alone with the method in [Benchmark Templates](16-benchmark-templates.html).
2. Repeat the same test with your recording or streaming software running.
3. Compare average FPS, 1% lows, and frame times. The difference is the real cost on your system.

## Choose the encoder

| Encoder | Uses | Consider when |
| --- | --- | --- |
| Hardware encoder (NVENC, AMD AMF, Intel Quick Sync) | Dedicated encoding block on the GPU or iGPU | You want low CPU load while playing. |
| Software encoder (x264) | CPU cores | You have spare CPU headroom and want to test quality at a given bitrate. |

Hardware encoders are the usual starting point for gaming. Their quality and impact vary by GPU generation and software version, so test them on your hardware.

## Practical settings

- Record or stream at the resolution and frame rate you actually need. Higher values cost more.
- Keep the bitrate within your upload speed with headroom to spare, and verify with a test recording or a private stream.
- Record to a fast drive that is not busy with the game's own storage activity. Watch free space; recordings are large.
- Use game capture rather than full display capture where the software supports it, and avoid unnecessary browser or filter sources.
- If the game is GPU-limited, a small drop in game settings or a frame-rate cap usually leaves more headroom for the encoder than changing encoder presets.

## Overlays

Every overlay (recording software, game launcher, performance monitor, chat) can add overhead or conflict with anti-cheat. Enable only what you need, and disable overlays while troubleshooting. For competitive games, check the game's and anti-cheat vendor's official guidance on overlays and capture software.

## Dropped frames

- **Encoding overloaded** in the software: the encoder cannot keep up. Lower the output resolution, frame rate, or preset load, or move to a different encoder.
- **Rendering lag**: the GPU is saturated by the game. Cap the game frame rate or lower game settings.
- **Network drops** while streaming: see [Network, Wi-Fi, and Online Latency](20-network-and-wifi.html).

## What to avoid

- "Best OBS settings" copied without testing on matching hardware.
- Running several capture or overlay tools at once.
- Disabling security software for capture performance.
