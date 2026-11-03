---
layout: doc
title: "Testing Methodology"
description: "How recommendations are tested, what to measure, and how to compare before and after."
lang: en
translation_key: methodology
permalink: /docs/methodology.html
---

## Testing Conditions

All recommendations in this guide are based on reproducible testing conditions. When testing a change, we follow these principles:

### System Configuration

- Consistent hardware configuration (CPU, GPU, RAM, storage)
- Same Windows version and driver versions
- Identical BIOS settings across tests
- Controlled background processes and applications
- Standardized environmental conditions (temperature, ventilation)

### Test Scenarios

- Use benchmark templates for consistent testing
- Run at least 3 repetitions for each test condition
- Document baseline performance before making changes
- Apply only one variable change at a time
- Record all relevant system metrics during tests

## What to Measure

### Performance Metrics

- **Average FPS**: Overall game performance
- **1% lows**: Worst-case frame times that affect gameplay
- **0.1% lows**: Extreme frame time outliers
- **P99 frame time**: Near-worst case performance
- **GPU busy time**: How much time GPU spends processing frames
- **CPU core saturation**: Which CPU cores are most active

### Stability Indicators

- System temperatures and power consumption
- WHEA errors or system crashes
- Application stability during extended play sessions
- Driver resets or graphical glitches

## Before and After Comparison

All recommendations include:

1. Baseline performance measurement
2. Change implementation with clear steps
3. Post-change performance verification
4. Statistical analysis of improvements or regressions
5. Notes about limitations or caveats

## Validation Requirements

Each recommendation must be:

- Reproducible by other users with similar systems
- Based on measurable data rather than assumptions
- Documented with clear instructions for implementation
- Tested under conditions that match the user's system
- Updated when new information becomes available
