# Architecture Report: Common Base + Game Sections

> First report per specification. Covers tree, matrix, pilot plan, readiness criteria.

---

## 1. Tree: Common Base + Game Sections

```text
gaming-pc-guide/
├── README.md                    # EN entry point
├── README.ru.md                 # RU entry point (to be created)
├── docs/
│   ├── 01-before-you-start.md   # Preparation, baseline, rollback
│   ├── 02-find-the-bottleneck.md# Diagnostics: CPU/GPU/RAM/VRAM/SSD/thermal
│   ├── 03-bios-and-hardware.md  # BIOS, XMP/EXPO, ReBAR, PBO, PCIe, undervolt
│   ├── 04-drivers-and-updates.md# Windows, chipset, GPU, SSD firmware, rollback
│   ├── 05-windows-11.md         # Game Mode, power, HAGS, VRR, refresh, security
│   ├── 06-gpu-settings.md       # Per-game profiles, FPS cap, sync, Reflex, upscalers, FG
│   ├── 07-background-apps.md    # Startup, browser, overlays, recording, RGB
│   ├── 08-services-and-security.md# Services, Defender, Firewall, UAC, Update, safety
│   ├── 09-powershell-diagnostics.md# CPU, GPU, RAM, disk, network, WHEA, SFC/DISM
│   ├── 10-temperatures-stability.md# Throttling, airflow, stress tests, WHEA, cleaning
│   ├── 11-what-not-to-do.md     # Debloat, scripts, services, registry, HPET/BCD, RAM cleaners
│   ├── 12-faq.md                # Quick answers, links to deep chapters
│   ├── 13-security-hardening-baseline.md# Security baseline, Defender/Firewall/Update
│   ├── 14-quick-start-presets.md# Tier presets (entry/mid/high/laptop)
│   ├── 15-troubleshooting-decision-trees.md# Symptom → action trees
│   ├── 16-benchmark-templates.md# Metrics, protocols, templates, verdict rules
│   ├── 17-common-builds-quick-cards.md# NVIDIA/AMD/Intel safe defaults
│   ├── 18-optimization-tools-evidence.md# BoosterX, Hone, BRUTAL-FPS, Razer, debloat tools
│   └── games/                   # Game-specific deltas only
│       ├── _template.md         # Canonical template (copy for new games)
│       ├── cs2.md               # Pilot: Counter-Strike 2
│       ├── valorant.md          # VALORANT
│       ├── pubg.md              # PUBG: BATTLEGROUNDS
│       ├── minecraft-java.md    # Minecraft Java Edition (separate from Bedrock)
│       └── world-of-tanks.md    # World of Tanks
├── images/                      # Shared assets (webp/png/svg)
├── scripts/                     # Future tooling (not in base)
├── .github/
│   ├── workflows/
│   │   ├── docs-quality.yml     # markdownlint, lychee offline, Jekyll build
│   │   └── links-external.yml   # Scheduled external link check
│   ├── ISSUE_TEMPLATE/
│   │   ├── config.yml           # Contact link → Discussions
│   │   ├── general_issue.md     # Unified issue form
│   │   ├── bug_report.md        # (to be filled)
│   │   └── improvement.md       # (to be filled)
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── copilot-instructions.md
│   └── dependabot.yml
├── CONTRIBUTING.md
├── CHANGELOG.md
├── LICENSE
├── SECURITY.md
└── .gitignore
```

**Navigation rules:**

- `README.md` / `README.ru.md` → full guide table with links to `docs/NN-*.md` and `docs/games/*.md`.
- Each `docs/NN-*.md` ends with `Next step: [NN+1-title](NN+1-*.md)`.
- Each `docs/games/*.md` starts with Quick Start linking the common base chain.
- Cross-links use relative paths (`../02-find-the-bottleneck.md`).

---

## 2. Matrix: What is Common vs Game-Specific

| Area | Common Base (canonical, single source) | Game Section (delta only) |
|---|---|---|
| Preparation / baseline / rollback | `01-before-you-start.md` | Link only; game config backup path |
| Bottleneck diagnosis | `02-find-the-bottleneck.md` | Symptom → game-specific first checks |
| BIOS / hardware | `03-bios-and-hardware.md` | None (unless game has unique hardware reqs) |
| Drivers (Windows, chipset, GPU, SSD) | `04-drivers-and-updates.md` | Game-specific driver version tested |
| Windows 11 tuning | `05-windows-11.md` | Game-specific HAGS/VRR/test results |
| GPU settings (profiles, FPS cap, sync, Reflex, upscalers, FG) | `06-gpu-settings.md` | Game-supported features, profile values, launch options |
| Background apps / overlays | `07-background-apps.md` | Game-specific overlay conflicts |
| Services / security | `08-services-and-security.md` | Anti-cheat constraints, required services |
| PowerShell diagnostics | `09-powershell-diagnostics.md` | Game-server latency measurement |
| Thermals / stability / stress tests | `10-temperatures-stability.md` | Game-specific stress scenario |
| What not to do | `11-what-not-to-do.md` | Game-specific forbidden mods/launch options |
| FAQ | `12-faq.md` | Game-specific FAQ entries (or link) |
| Security baseline | `13-security-hardening-baseline.md` | Anti-cheat compatibility with security features |
| Quick-start presets | `14-quick-start-presets.md` | Game-specific preset additions |
| Troubleshooting trees | `15-troubleshooting-decision-trees.md` | Game-specific failure modes |
| Benchmark methodology | `16-benchmark-templates.md` | Game-specific scene, warm-up, metrics |
| Build quick cards | `17-common-builds-quick-cards.md` | None |
| Tool evidence | `18-optimization-tools-evidence.md` | Game-specific tool compatibility |
| **Game configs / launch options** | — | **Only here** |
| **In-game graphics tradeoff table** | — | **Only here** |
| **Anti-cheat constraints** | — | **Only here** |
| **Supported sync/latency features** | — | **Only here** |
| **Benchmark scene / replay / demo** | — | **Only here** |
| **Rollback steps for game configs** | — | **Only here** |
| **Sources (patch notes, vendor docs)** | — | **Only here** |

**Rule:** If it appears in the left column, it must not be duplicated in the right column. Game pages only link.

---

## 3. Pilot Game Page Plan (CS2)

### Scope

Counter-Strike 2 as the first page to validate template, navigation, evidence standard, EN/RU parity.

### Sections to populate (per template)

1. **Applicability** — game, platform, engine, anti-cheat, version, date, status.
2. **Quick Start** — ordered link chain to common base + game-specific first steps.
3. **Requirements & Compatibility** — anti-cheat (VAC + Trusted Mode), OS/API, known overlay conflicts.
4. **Graphics Settings — Tradeoffs** — table with GPU/CPU cost, visual impact, recommended start (no invented numbers).
5. **FPS Cap, Sync & Latency Reduction** — two profiles (Competitive latency / VRR smoothness), Reflex, `fps_max`, VRR/V-Sync.
6. **Configs & Launch Options** — config paths, verified launch options (current patch), deprecated options list.
7. **Common Issues & Diagnosis** — symptom → first check → link to common base.
8. **Benchmark Scenario** — scene (workshop map / demo), warm-up, runs, metrics, tools, fixed variables.
9. **Rollback** — config, launch options, driver, benchmark confirmation.
10. **Sources** — primary (Valve patch notes, NVIDIA/AMD/Microsoft docs), secondary, community (hypothesis only).
11. **Status markers** — every recommendation tagged `verified | needs-verification | deprecated` + date.

### EN/RU parity

- Create `docs/games/cs2.ru.md` with identical structure, translated content, same anchors.
- Language switcher in `README.md` / `README.ru.md` and each game page header.

### Acceptance before merge

- Template renders without lint errors (`markdownlint-cli2@0.13.0`).
- All internal links resolve (`lychee --offline`).
- No duplicated content from common base (grep check).
- Every claim has a source or `needs-verification` tag.
- Benchmark scene is reproducible (workshop map name or demo instructions).

---

## 4. Readiness Criteria & Patch Update Process

### Readiness Criteria (per game page)

| Criterion | Pass condition |
|---|---|
| Template compliance | All 10 sections present, no extra sections |
| No duplication | Zero paragraphs copied from `docs/01–18` (automated diff check) |
| Evidence tags | Every recommendation has `verified`, `needs-verification`, or `deprecated` + date |
| Source links | Primary sources linked; secondary marked; community only as hypothesis |
| Benchmark reproducibility | Scene name / demo / route documented; warm-up, runs, metrics fixed |
| Anti-cheat accuracy | Current anti-cheat name, constraints, forbidden actions documented |
| Launch options | Only patch-verified options listed; deprecated list present |
| Sync/latency features | Only features actually supported in current patch listed |
| EN/RU parity | Both language files exist, same anchors, same structure |
| Lint & links | `markdownlint-cli2@0.13.0` = 0 errors; `lychee --offline` = 0 broken |

### Patch Update Process

1. **Trigger:** New game patch released (SteamDB / official patch notes).
2. **Audit (within 7 days):**
   - Check patch notes for changed graphics settings, launch options, anti-cheat, engine/API.
   - Re-run benchmark scenario on changed settings.
   - Update version tested + date checked in Applicability.
   - Change status tags where behaviour changed (`verified` → `needs-verification`).
3. **Edit:** Update only affected rows/sections; preserve unchanged content.
4. **Review:** PR with diff; CI must pass (lint, links, Jekyll).
5. **Merge:** Fast-forward to `main`.
6. **Changelog:** Entry in `CHANGELOG.md` with game, patch, what changed.

### Deprecation

- If a game drops below 1% Steam concurrent players for 6 months and no active maintainer: mark status `deprecated`, move to `docs/games/archive/`, keep link in README with notice.

---

## 5. Next Steps

1. Create `README.ru.md` with mirrored navigation.
2. Create `docs/games/cs2.ru.md` (translate CS2 pilot).
3. Fill VALORANT, PUBG, Minecraft Java, WoT with source-audited content (not stubs).
4. Add `docs/games/README.md` index (optional) with table of all games, status, last checked.
5. Automate "no duplication" check in CI (diff vs common base).
6. Add `bug_report.md` and `improvement.md` content.

Back to main guide: [README](../README.md).
