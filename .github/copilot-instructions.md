# Copilot Instructions


## Project rules


- Keep all content in English for consistency.
- Follow the flat `docs/01–19.md` structure; game pages live in `docs/games/` and link to the common base.
- Do not duplicate content from `docs/01–19` in game pages — link instead.
- Every recommendation must include: problem/goal, applicability, expected effect, risks, verification, rollback.
- No universal registry/HPET/BCD tweaks, no disabling protection, no mass service disables.
- When adding or substantially revising a recommendation, add an evidence tag: `verified`, `needs-verification`, or `deprecated`, plus an ISO date.
- Do not retrofit evidence tags to unchanged legacy content in the same commit.
- Run `markdownlint-cli2@0.13.0` and `lychee --offline` before committing.
- Preserve uncommitted changes; do not commit/push without direction.


## Documentation standards


- Use relative links between internal pages, for example `[GPU Settings](06-gpu-settings.html)`.
- Do not use absolute internal URLs such as `https://h4zvenn.github.io/gaming-pc-guide/...`.
- Keep one `# H1` implied by front matter `title`; do not repeat the page title as an H1 in the body.
- Use unnumbered Markdown headings.
- End every guide with a `## Next step` section and a relative link to the next guide.
- Keep warning, note, tip, and important callouts concise and actionable.
- Prefer reversible changes: startup settings, per-game profiles, vendor utilities, and documented rollback paths.


## Safety boundaries


- Do not recommend custom Windows builds, driver packs, RAM cleaners, or one-click optimizers.
- Do not recommend disabling Defender, Firewall, UAC, Windows Update, Core Isolation, VBS, or critical system services.
- Do not provide copy-paste overclocking, undervolting, PBO, Curve Optimizer, RAM timing, or voltage values as universal settings.
- Treat BIOS changes, SSD firmware, GPU driver clean installs, and DDU as conditional maintenance steps, not routine optimization.
- Require a baseline measurement and repeatable test before recommending that a user keeps a change.