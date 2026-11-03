---
layout: doc
title: "Sources and Evidence"
description: "Where recommendations come from, how sources are ranked, and how claims are labeled."
lang: en
translation_key: sources
permalink: /docs/sources.html
last_checked: 2026-11-03
applicable_to: All guides in this project
---

Every recommendation should trace back to something you can check: official documentation, a repeatable measurement, or a clearly labeled community report. This page explains how sources are ranked and where to find the main ones.

For how tests are run and compared, see [Methodology](methodology.html) and [Benchmark templates](16-benchmark-templates.html).

## How sources are ranked

| Tier | Source type | How it is used |
| --- | --- | --- |
| 1 | Official vendor and OS documentation, release notes, specifications | Can support a recommendation on its own |
| 2 | Repeatable measurements with documented method (frame-time capture, logs) | Supports a recommendation if the method and hardware are stated |
| 3 | Independent reviews and technical articles with test data | Supports a recommendation together with a Tier 1 or 2 source |
| 4 | Forums, videos, social media, user guides | A lead to investigate. Never evidence by itself |

A claim that rests only on Tier 4 is either tested first or left out.

## Main official sources

### Windows

- [Windows documentation on Microsoft Learn](https://learn.microsoft.com/en-us/windows/)
- [Windows release health](https://learn.microsoft.com/en-us/windows/release-health/) for known issues and update status
- [Windows 10 lifecycle](https://learn.microsoft.com/en-us/lifecycle/products/windows-10-home-and-pro) for the end of support (October 14, 2025)
- [Sysinternals documentation](https://learn.microsoft.com/en-us/sysinternals/) for RAMMap, Process Explorer and related tools

### GPU drivers and software

- [NVIDIA drivers](https://www.nvidia.com/en-us/drivers/)
- [AMD drivers and support](https://www.amd.com/en/support/download/drivers.html)
- [Intel graphics downloads](https://www.intel.com/content/www/us/en/download-center/home.html)

### Measurement tools

- [PresentMon](https://github.com/GameTechDev/PresentMon) for frame-time capture
- [CapFrameX](https://www.capframex.com/) for frame-time analysis
- See [System utilities](tools.html) for the full list of tools used in this guide

### Motherboard, CPU and game sources

- The motherboard manual and BIOS release notes for your exact board
- CPU manufacturer specification pages (Intel ARK, AMD product pages)
- Official patch notes, settings documentation and anti-cheat rules for each game. Each [game guide](games/index.html) links its own sources

## Claim labels

Guides label claims by how well they are supported:

| Label | Meaning |
| --- | --- |
| **Documented** | Stated in official documentation (Tier 1) |
| **Measured** | Shown by a repeatable test with method and hardware stated (Tier 2) |
| **Community-reported** | Seen in forums or videos, not verified here |
| **Unverified** | No source found. Test it yourself before keeping the change |

Vendor-, OS- and game-specific advice is labeled as such instead of being presented as universal.

## Working with evidence

1. **Prefer the original source.** Read the vendor page, not a video about it.
2. **Check the date and version.** Advice for an older driver, Windows build or game patch may no longer apply.
3. **Cross-check.** Important claims need a second source, or your own measurement.
4. **Separate fact from opinion.** "The setting does X" is documentation. "It feels smoother" is a report.
5. **Explain conflicts.** When two sources disagree, the guide states which one it follows and why.
6. **Keep the date.** Pages carry a `last_checked` date. Outdated advice is marked or removed.

## When you find a problem

If a source is outdated, a link is broken, or a claim has no evidence, [report a mistake](https://github.com/h4zvenn/gaming-pc-optimization-guide/issues/new/choose) and include a link to the better source. Pull requests that add or replace sources are welcome. See the [Contributing](https://github.com/h4zvenn/gaming-pc-optimization-guide#-contributing) section.
