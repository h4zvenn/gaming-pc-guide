# Proposed Changelog

## Unreleased

### Added

- Added English and Russian Start Here pages, focused guide indexes, and shorter home-page navigation.
- Added five vendor-specific GPU and CPU setup guides.
- Added generated sitemap and crawler instructions, plus canonical, social-sharing, and structured-data metadata.
- Added responsive navigation, article breadcrumbs and table of contents, localized copy buttons, and mobile-friendly layouts.
- Added automatic previous/next navigation for system and game articles.
- Expanded the link checker to validate local links, image/source targets, and fragment identifiers.
- Added substantive Russian translations for PowerShell diagnostics, GPU settings, temperature and stability, what-not-to-do, FAQ, quick-start presets, troubleshooting, and benchmark guides.

### Changed

- Applied the requested neutral dark and PC-blue palette, consistent 16px/1.6 typography, 80ch article width, and styles for notes, warnings, danger callouts, tables, code, and navigation.
- Normalized the five English game guides with explicit, repeatable verification sections and current-version review cautions.
- Corrected CS2 rendering guidance to defer to the current client default and removed unsupported “Verified” evidence labels.
- Aligned breadcrumb structured data with the visible breadcrumb path.
- Removed UTF-8 byte-order marks that prevented Jekyll from rendering Russian pages.
- Corrected Russian translation keys and game-guide routes so language switching and internal links resolve.
- Added model-specific temperature-limit lookup guidance and safer diagnostic, verification, and rollback steps.
- Replaced Mermaid-dependent troubleshooting diagrams with readable decision paths.
- Removed unsupported claims from the optimization-tools evidence page.

### Removed

- Removed the decorative gradient background and card hover-lift effect.
- No content pages, user files, or assets were deleted in this pass; review found no unused assets directory or commented-out HTML blocks.

### Remaining work

- Translate and review the remaining Russian system and game guides.
- Finish consolidating repeated actions and normalize article structure across the full guide set.
- Revisit patch-sensitive game recommendations and complete release-specific verification before marking them current.
- Add `jekyll-seo-tag`/`jekyll-sitemap` only if dependency/configuration changes are permitted; current hand-authored metadata and Liquid sitemap avoid changing the explicitly protected `Gemfile` and `_config.yml`.
- Repeat browser-based accessibility and responsive checks after the remaining content work.

### Validation

- `bundle exec jekyll build` — passed.
- `npx --no-install markdownlint-cli2` — passed (74 Markdown files, 0 issues).
- `powershell -ExecutionPolicy Bypass -File .\\check-links.ps1` — passed.
- `git diff --check` — passed.
- Rendered-site audit — passed for 63 pages: exactly one H1, unique title/description, canonical/Open Graph/Twitter tags, valid JSON-LD, no raw Markdown output, and a 63-URL sitemap.
- Responsive browser checks — passed at mobile and desktop widths; mobile navigation toggles correctly and page width does not exceed the viewport.
