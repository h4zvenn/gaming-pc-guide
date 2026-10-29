# 15. Troubleshooting Decision Trees

> Fast path: find symptom → follow decision tree → test one fix at a time.

## How to use

- Start from the tree matching your issue.
- Apply one action.
- Re-test the same game scene.
- If no change, move to next branch.

---

## 1) Low FPS tree

```mermaid
flowchart TD
	A[Low FPS] --> B{GPU usage 95-99%?}
	B -- Yes --> C[GPU-bound: lower RT/shadows/reflections]
	C --> D[Test DLSS/FSR/XeSS Quality/Balanced]
	D --> E[Set realistic FPS cap]
	B -- No --> F{One CPU thread near 100%?}
	F -- Yes --> G[CPU-bound: reduce draw distance/crowd/physics]
	G --> H[Close background apps + overlays]
	F -- No --> I[Check RAM/VRAM usage + SSD free space]
	I --> J[Validate temperatures and throttling]
```

Quick actions table:

| Signal | First fix |
|---|---|
| GPU 99%, low FPS | Reduce GPU-heavy settings first |
| GPU low, CPU thread maxed | Reduce CPU-heavy settings + background load |
| Normal average FPS, bad 1% low | Check RAM/VRAM/SSD + shader/loading stutter |

---

## 2) Stutter / bad frametime tree

```mermaid
flowchart TD
	A[Stutter / bad frametime] --> B{Happens after 20-60 min?}
	B -- Yes --> C[Check thermals, clocks, throttling]
	C --> D[Improve airflow / fan curve]
	B -- No --> E{Happens on new area/camera turns?}
	E -- Yes --> F[Likely shader/streaming/VRAM issue]
	F --> G[Lower textures or render scale]
	E -- No --> H[Check overlay conflicts + background downloads]
	H --> I[Test with minimal overlays]
```

Quick actions table:

| Symptom pattern | Likely cause |
|---|---|
| Gets worse over time | Thermal saturation |
| Spikes on new zones | Shader compile / storage streaming |
| Spikes with Discord/recording | Overlay/capture overhead |

---

## 3) Crash / black screen tree

```mermaid
flowchart TD
	A[Crash / black screen] --> B{Recent OC/undervolt/XMP change?}
	B -- Yes --> C[Revert latest tweak to stock]
	C --> D[Re-test game + check WHEA]
	B -- No --> E{Driver recently updated?}
	E -- Yes --> F[Clean reinstall or rollback to known stable]
	E -- No --> G[Check PSU cables, temps, hotspot, RAM stability]
	G --> H[Run stress + long game session]
```

Quick actions table:

| If this happened after… | Do this first |
|---|---|
| Curve Optimizer / PBO tweak | Revert and test stock |
| GPU undervolt | Relax curve or return default |
| Driver update | Roll back or clean reinstall |

---

## 4) High ping / packet loss tree

```mermaid
flowchart TD
	A[High ping / packet loss] --> B{Downloads/updates running?}
	B -- Yes --> C[Pause downloads/cloud sync]
	B -- No --> D{Wi-Fi signal weak or unstable?}
	D -- Yes --> E[Test Ethernet or better Wi-Fi channel]
	D -- No --> F[Check router reboot + ISP status]
	F --> G[Compare with another server/region]
```

Quick actions table:

| Network issue | First check |
|---|---|
| Sudden ping spikes | Background downloads/updates |
| Random packet loss | Wi-Fi quality / cable / router |
| Region-specific lag | Server-side routing/load |

---

## 5) “No change after optimization” tree

```mermaid
flowchart TD
	A[No measurable improvement] --> B{Changed many settings at once?}
	B -- Yes --> C[Rollback and retest one-by-one]
	B -- No --> D{Bottleneck identified correctly?}
	D -- No --> E[Re-run bottleneck diagnostics]
	D -- Yes --> F[Keep only changes with measurable gain]
	F --> G[Document baseline and final results]
```

---

## Safety guardrails

- Do not disable Defender/Firewall/Update for FPS.
- Do not apply unknown scripts.
- Do not stack multiple changes without testing.

Next step: [16 Benchmark templates](16-benchmark-templates.md).
