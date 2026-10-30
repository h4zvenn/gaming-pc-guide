# Copilot Instructions

## Project rules

- Keep all content in English for consistency.
- Follow the flat `docs/01–18.md` structure; game pages live in `docs/games/` and link to the common base.
- Do not duplicate content from `docs/01–18` in game pages — link instead.
- Every recommendation must include: problem/goal, applicability, expected effect, risks, verification, rollback.
- No universal registry/HPET/BCD tweaks, no disabling protection, no mass service disables.
- Evidence-tag every recommendation: `verified` / `needs-verification` / `deprecated` + date.
- Run `markdownlint-cli2@0.13.0` and `lychee --offline` before committing.
- Preserve uncommitted changes; do not commit/push without direction.
