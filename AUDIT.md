# Site Audit

Audit date: 2026-11-01

The statuses and findings below describe the audit baseline before the follow-up changes recorded at the end of this file.

## Status definitions

- `complete` — usable for its stated task, with clear steps, verification, safety limits, and relevant links.
- `partial` — substantive content exists, but one or more of those elements or the requested shared format is missing.
- `stub` — mostly a placeholder that redirects the reader to English content.
- `outdated` — known to rely on stale guidance that should not be followed without correction.

No page was marked `outdated` without evidence of a specific obsolete instruction. Several game-specific recommendations need release-by-release verification.

## Existing page inventory

### English

| Page | Status | Audit note |
| --- | --- | --- |
| [Home](index.md) | partial | Useful routes, but repeats the full guide index at lines 82–110 instead of directing readers to focused section indexes. |
| [Before You Start](docs/01-before-you-start.md) | partial | Substantive preparation guide; normalize verification, rollback, and related-guide sections. |
| [Find the Bottleneck](docs/02-find-the-bottleneck.md) | partial | Substantive diagnostic guide; make its signals and next actions the canonical route from the home page and indexes. |
| [BIOS & Hardware](docs/03-bios-and-hardware.md) | partial | Combines platform-wide BIOS checks with hardware-specific tuning; separate vendor-specific CPU guidance. |
| [Drivers & Updates](docs/04-drivers-and-updates.md) | partial | Substantive guide; make driver rollback and vendor-specific steps explicit and consistent. |
| [Windows 11 Core](docs/05-windows-11.md) | partial | Substantive guide; align each change with a repeatable verification and rollback step. |
| [GPU Settings](docs/06-gpu-settings.md) | partial | NVIDIA, AMD, and Intel appear in one page (lines 133, 195, 225); extract the requested vendor guides. |
| [Background Apps](docs/07-background-apps.md) | partial | Substantive guide; keep recommendations limited to user-controlled startup and app settings. |
| [Services & Security](docs/08-services-and-security.md) | partial | Substantive guide; keep safe service guidance distinct from the security baseline and anti-cheat constraints. |
| [PowerShell Diagnostics](docs/09-powershell-diagnostics.md) | partial | Substantive guide; add explicit, copy-safe verification and rollback context to any system-changing command. |
| [Temperatures & Stability](docs/10-temperatures-stability.md) | partial | Lines 72–80 and 99–121 explain signs and actions but give no model-specific limit lookup or measurable thresholds. |
| [What Not To Do](docs/11-what-not-to-do.md) | partial | Useful safety reference; link to it instead of repeating generic warnings throughout other pages. |
| [FAQ](docs/12-faq.md) | partial | Substantive reference; convert questions that need procedures into links to the canonical task guide. |
| [Security Hardening](docs/13-security-hardening-baseline.md) | partial | Substantive guide; avoid duplicating service-level advice from the security guide. |
| [Quick-Start Presets](docs/14-quick-start-presets.md) | partial | Actionable presets exist, but overlap with the build-oriented cards in guide 17. |
| [Troubleshooting Trees](docs/15-troubleshooting-decision-trees.md) | partial | Contains symptom-specific Mermaid flows (lines 23–127); add clear stopping conditions, safe rollback, and verified next links. |
| [Benchmark Templates](docs/16-benchmark-templates.md) | partial | Substantive test guidance; make this the single canonical measurement protocol linked from other pages. |
| [Common Builds](docs/17-common-builds-quick-cards.md) | partial | Overlaps the presets in guide 14; distinguish hardware reference cards from actions or consolidate duplicated actions. |
| [Optimization Tools](docs/18-optimization-tools-evidence.md) | partial | Lines 26–41 make evidence claims without naming tools, studies, documentation, dates, or citations. |
| [Disk Cleanup](docs/19-ai-software-and-disk-cleanup.md) | partial | Substantive guide; keep cleanup limited to supported Windows controls and user-selected software. |
| [Game Guides index](docs/games/index.md) | partial | Lists five games as “Ready” at lines 13–21, although the individual guides require patch-specific verification. |
| [Counter-Strike 2](docs/games/cs2.md) | partial | Useful settings and safety notes; the page itself says status requires verification per game patch. |
| [Minecraft Java](docs/games/minecraft-java.md) | partial | Substantive game guide; verify game/launcher-specific recommendations and use the shared article structure. |
| [PUBG](docs/games/pubg.md) | partial | Substantive game guide; verify game/anti-cheat-specific recommendations and use the shared article structure. |
| [VALORANT](docs/games/valorant.md) | partial | Substantive game guide; verify anti-cheat constraints and patch-sensitive settings. |
| [World of Tanks](docs/games/world-of-tanks.md) | partial | Substantive game guide; verify current game/client settings and use the shared article structure. |
| [Game guide template](docs/games/template.md) | stub | A reusable template, not a published game guide; keep it out of user-facing indexes. |
| [NVIDIA GPU Settings](docs/hardware/nvidia.md) | partial | Added after the baseline audit; vendor-specific controls and rollback guidance. |
| [AMD GPU Settings](docs/hardware/amd.md) | partial | Added after the baseline audit; driver, FreeSync, SAM, and feature guidance. |
| [Intel GPU Settings](docs/hardware/intel-gpu.md) | partial | Added after the baseline audit; driver, XeSS, and Resizable BAR checks. |
| [AMD CPU Settings](docs/hardware/amd-cpu.md) | partial | Added after the baseline audit; EXPO, PBO risks, and stability checks. |
| [Intel CPU Settings](docs/hardware/intel-cpu.md) | partial | Added after the baseline audit; XMP, power limits, and stability checks. |

### Russian

| Page | Status | Audit note |
| --- | --- | --- |
| [Главная](ru/index.md) | partial | Useful Russian entry page, but repeats the full guide directory at lines 85 onward and routes most tasks to English. |
| [Подготовка перед оптимизацией](ru/docs/01-before-you-start.md) | partial | Substantive translation; `description` was missing at baseline (front matter lines 1–7) and has since been added. |
| [Поиск узкого места](ru/docs/02-find-the-bottleneck.md) | partial | Substantive translation; align terminology, task structure, and verification with the English page. |
| [BIOS и оборудование](ru/docs/03-bios-and-hardware.md) | stub | Lines 10–16 say translation is in progress and send readers to English. |
| [Драйверы и обновления](ru/docs/04-drivers-and-updates.md) | stub | Placeholder redirects to English. |
| [Настройки Windows 11](ru/docs/05-windows-11.md) | stub | Placeholder redirects to English. |
| [Настройки видеокарты](ru/docs/06-gpu-settings.md) | stub | Placeholder redirects to English. |
| [Фоновые приложения](ru/docs/07-background-apps.md) | partial | Substantive content exists; verify the translation against the current English guide. |
| [Службы и безопасность](ru/docs/08-services-and-security.md) | partial | Substantive content exists; verify the translation against the current English guide. |
| [Диагностика через PowerShell](ru/docs/09-powershell-diagnostics.md) | stub | Placeholder redirects to English. |
| [Температуры и стабильность](ru/docs/10-temperatures-stability.md) | stub | Placeholder redirects to English. |
| [Чего не следует делать](ru/docs/11-what-not-to-do.md) | stub | Placeholder redirects to English. |
| [Частые вопросы](ru/docs/12-faq.md) | stub | Placeholder redirects to English. |
| [Базовая настройка безопасности](ru/docs/13-security-hardening-baseline.md) | stub | Placeholder redirects to English. |
| [Стартовые наборы настроек](ru/docs/14-quick-start-presets.md) | stub | Placeholder redirects to English. |
| [Пошаговый поиск неисправностей](ru/docs/15-troubleshooting-decision-trees.md) | stub | Placeholder redirects to English. |
| [Шаблоны тестирования](ru/docs/16-benchmark-templates.md) | stub | Placeholder redirects to English. |
| [Типовые сборки](ru/docs/17-common-builds-quick-cards.md) | stub | Placeholder redirects to English. |
| [Инструменты оптимизации](ru/docs/18-optimization-tools-evidence.md) | stub | Placeholder redirects to English. |
| [Очистка диска и удаление ПО](ru/docs/19-ai-software-and-disk-cleanup.md) | stub | Placeholder redirects to English. |
| [Руководства по играм](ru/docs/games/index.md) | stub | Placeholder redirects to English; `translation_key` is empty at line 6. |
| [Counter-Strike 2 — RU](ru/docs/games/cs2.md) | stub | Placeholder redirects to English. |
| [Minecraft Java — RU](ru/docs/games/minecraft-java.md) | stub | Placeholder redirects to English. |
| [PUBG — RU](ru/docs/games/pubg.md) | stub | Placeholder redirects to English. |
| [VALORANT — RU](ru/docs/games/valorant.md) | stub | Placeholder redirects to English. |
| [World of Tanks — RU](ru/docs/games/world-of-tanks.md) | stub | Placeholder redirects to English. |

### Required pages missing at the audit baseline

- `docs/start-here.md`, `docs/index.md`, and `ru/docs/index.md` were missing; they have since been added.
- `docs/hardware/nvidia.md`, `docs/hardware/amd.md`, `docs/hardware/intel-gpu.md`, `docs/hardware/amd-cpu.md`, and `docs/hardware/intel-cpu.md` were missing; they have since been added.
- No `robots.txt` is present; no sitemap-generation plugin is configured in `Gemfile` or `_config.yml`.

## Repeated topics and consolidation

- Measurement and “change one thing at a time” guidance recur on the home pages, guides 01, 02, 14, and 16, and game guides. Keep the full protocol in guide 16 and use short links elsewhere.
- Safety, service, and security warnings recur in guides 03, 08, 11, 13, and 15. Keep the policy in guides 08/13 and link to it from troubleshooting and other articles.
- Quick-start actions in guide 14 overlap with the PC-tier cards in guide 17. Keep one set of tuning actions; retain guide 17 only for genuinely distinct hardware compatibility/reference data.
- GPU advice in guide 06 overlaps with generic setup and game-specific pages. Keep general selection/measurement in guide 06, vendor controls in hardware guides, and game-only exceptions in game guides.
- The home pages repeat a full guide directory instead of linking to a concise system index and a separate game index ([index.md](index.md#all-guides), [ru/index.md](ru/index.md#all-guides)).

## Pages to split

- Split vendor-specific GPU controls out of [GPU Settings](docs/06-gpu-settings.md) into NVIDIA, AMD, and Intel GPU guides; retain shared settings and selection principles in guide 06.
- Split CPU-vendor settings out of [BIOS & Hardware](docs/03-bios-and-hardware.md) into AMD CPU and Intel CPU guides; retain common BIOS safety and rollback guidance in guide 03.

## Pages to combine or consolidate

- Consolidate repeated action steps between [Quick-Start Presets](docs/14-quick-start-presets.md) and [Common Builds](docs/17-common-builds-quick-cards.md); keep one canonical set of actions.
- Consolidate repeated measurement instructions into [Benchmark Templates](docs/16-benchmark-templates.md), with short cross-links from diagnostic, preset, and game pages.
- Do not merge the system and game indexes; keep each index focused on one user task.

## Broken, stale, or unsafe guidance

- [Temperatures & Stability](docs/10-temperatures-stability.md#cpu-temperature) and [GPU temperature](docs/10-temperatures-stability.md#gpu-temperature) identify symptoms but do not give concrete, model-specific thresholds or a method for looking up manufacturer limits. Add threshold interpretation and actions without implying one universal safe temperature.
- [Optimization Tools](docs/18-optimization-tools-evidence.md#current-review-status) reported independent and official evidence without named tools, sources, citations, or a review date. The unsupported evidence claims have since been removed.
- [Counter-Strike 2](docs/games/cs2.md) marks its settings as patch-sensitive; do not label it “Ready” in the index without an update/verification date.
- The link checker strips URL fragments at `check-links.ps1:23` and checks only `href` attributes at `check-links.ps1:65`; it does not verify anchor IDs or image `src` targets. Its passing result is not proof that all anchors and images work.
- Twenty-one Russian Markdown pages had a UTF-8 BOM before the opening front-matter delimiter. Jekyll copied these pages as raw `.md` files instead of rendering them; remove the BOM so their declared permalinks and layouts take effect.
- Russian guide translation keys used numbered filenames instead of the English keys, and all five Russian game stubs pointed outside `/docs/games/`. This prevented language pairing and linked to nonexistent routes; match the English keys and correct the game permalinks.
- No confirmed recommendation to disable Defender, Windows Update, or anti-cheat protections was found in the reviewed pages. Continue rejecting registry hacks, mass service disabling, and unverified “FPS boost” tools.

## Navigation issues

- The shared header (`_layouts/default.html`) links to five individual guides, not the requested Home / Start here / Windows / Games / Русский destinations.
- The shared header (`_layouts/default.html`) wraps links on small screens but has no open/close mobile menu.
- [The document layout](_layouts/doc.html) has a large static English-only sidebar; Russian readers are sent to English guide URLs when the corresponding Russian page is a stub.
- There is no system-guide index or Start Here page; both home pages carry long duplicated lists instead.

## SEO and technical issues

- `_layouts/default.html` lines 47–48 output title and description only; canonical, Open Graph, Twitter Card, and JSON-LD metadata are absent.
- `robots.txt` and a generated `sitemap.xml` are absent; `Gemfile` contains only Jekyll and `_config.yml` configures no plugins.
- [ru/docs/01-before-you-start.md](ru/docs/01-before-you-start.md) has no description metadata, so its page uses the generic site description.
- The missing Russian system index and the empty `translation_key` on the Russian game index weakened navigation and language pairing; both have since been corrected.
- The Russian game stubs had mismatched translation keys and permalinks; their metadata and English links have since been corrected to pair with `/docs/games/*.html`.
- Existing site content contains no image references requiring alt text; re-check alt text when images are added.

## Priority plan

1. Add `docs/start-here.md` and concise English/Russian system and game indexes; replace full guide directories on both home pages with the requested two primary sections.
2. Update the shared header for Home, Start here, Windows, Games, and Русский; ensure it remains usable on mobile and from Russian pages.
3. Normalize existing English technical pages around purpose, prerequisites, steps, verification, rollback, and relevant links; prioritize guides 02, 06, 10, 15, 16, and 18.
4. Consolidate duplicate preset and measurement instructions; leave only one canonical action per topic.
5. Add vendor GPU and CPU hardware guides; link them from the system index and guide 06.
6. Complete Russian translations in the requested order; make translation status explicit and link each translated page to its counterpart.
7. Add responsive article components and the requested metadata, sitemap, robots rules, and structured data using GitHub Pages-compatible tooling.
8. Extend `check-links.ps1` to validate local fragments and image sources, then run the Jekyll build, link checks, and Markdown lint.

## Baseline checks

- `bundle exec jekyll build` — passed.
- `npx --no-install markdownlint-cli2` — passed (62 Markdown files, 0 issues).
- `powershell -ExecutionPolicy Bypass -File .\check-links.ps1` — passed, with the validation limitations described above.

## Follow-up changes in this pass

- Added the Start Here page, English and Russian system/game indexes, and short English/Russian home pages with the requested navigation.
- Added five English hardware guides and linked them from the system index and shared GPU/BIOS guides.
- Removed UTF-8 BOMs that prevented Jekyll from rendering 21 Russian pages; the build now emits HTML instead of raw `.md` files.
- Matched Russian translation keys and corrected Russian game guide routes to their canonical `/ru/docs/games/*.html` locations.
- Added a model-specific thermal investigation threshold and removed unsupported tool-evidence claims.
- Added explicit verification and rollback sections to the highest-priority diagnostic and testing guides.
- Added canonical/Open Graph/Twitter metadata, JSON-LD breadcrumbs, responsive navigation and article layout, generated sitemap, and `robots.txt`.
- Extended `check-links.ps1` to validate local `href` and `src` targets and fragment IDs.
- Rewrote Russian guides 06, 09, 10, 11, 12, 14, 15, and 16 with substantive task-focused content; the remaining entries marked as planned or in progress still need translation review.
- Replaced the renderer-dependent English troubleshooting diagrams with readable decision paths.
- Final validation: `bundle exec jekyll build`, `npx --no-install markdownlint-cli2` (74 files, 0 issues), `powershell -ExecutionPolicy Bypass -File .\\check-links.ps1`, and `git diff --check` all passed.
- This review pass confirmed the existing responsive navigation and hand-authored SEO metadata/schema; no SEO dependency was added because the request explicitly prohibited edits to `Gemfile` and `_config.yml`.
- Updated the shared dark theme to use the requested blue/neutral palette, removed the decorative background gradient and hover lift, capped article text at 80ch, and added mobile-friendly previous/next guide links.
- Normalized all five English game guides with explicit verification steps; removed unsupported “Verified” evidence labels from the patch-sensitive CS2 settings.
- Content audit found no published Markdown links ending in `.md`, no image references needing alt text, no commented-out HTML code in layouts/includes/docs, and no separate assets directory to prune. Russian placeholder pages remain outside this pass because localization was explicitly out of scope.
- Current generated-site checks cover one H1 and unique metadata per page, parseable JSON-LD, a valid sitemap, and local paths/fragments. Game-specific recommendations remain marked for patch review rather than asserted as currently verified.
- Responsive browser checks at mobile and desktop widths confirmed no horizontal overflow; the mobile menu toggles closed and open. Generated pages show the exact dark background palette and previous/next links for article sequences.
- In response to layout feedback, moved shared CSS from the HTML layout to `assets/css/style.scss`, centered the article/TOC grid with a consistent 28px gap, and restricted previous/next navigation to system articles (not game guides).
