# Changes Made

## 1. _layouts/doc.html

Modified to conditionally include the TOC sidebar based on `page.toc_disabled` flag:

- Added conditional check `{% unless page.toc_disabled %}` around the TOC sidebar section
- Added class `toc-disabled` to article element when TOC is disabled

## 2. _layouts/default.html  

Updated JavaScript to detect and handle disabled TOC:

- Modified script to check if `.doc` element has `toc-disabled` class
- When TOC is disabled, properly hide the sidebar using `hidden = true`
- Maintained existing functionality for pages where TOC is enabled

## 3. assets/css/style.scss

Added CSS rule for responsive layout adjustment:

- Added `.doc.toc-disabled` class that modifies grid-template-columns from 3 columns to 2 columns
- This removes the empty space previously occupied by the TOC sidebar

## 4. docs/ultimate-pc-gaming-guide-2026.md

Added frontmatter flag to disable TOC:

- Added `toc_disabled: true` to the page's frontmatter section
