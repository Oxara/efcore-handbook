---
applyTo: "**/index.html"
description: "Rules for safely editing the EF Core Handbook (markdown-in-JS template literal). Prevents recurring escape errors and failed replacements."
name: "Handbook Editing Safety Rules"
---
# Handbook Editing Safety Rules

This file (`index.html`) stores all Markdown content inside a JavaScript template literal (backtick-delimited string). These rules MUST be followed when adding or modifying content.

## Rule 1 — Backtick Escaping (Critical)

Every inline backtick in the Markdown content MUST be escaped as `\`` (backslash-backtick).

Examples:
- Inline code: `\`DbContext\`` renders as `DbContext`
- Code fences: `\`\`\`csharp` … `\`\`\``

**NEVER** insert a raw/unescaped backtick. It breaks the JavaScript template literal and causes parse errors across the entire file.

**After every edit**, run error checking to confirm no unescaped backticks leaked in.

## Rule 2 — Post-Edit Validation

After adding or modifying any section:
1. Run error diagnostics on the file.
2. If errors exist, fix immediately before proceeding to the next edit.
3. Never propose a commit while errors are present.

## Rule 3 — String Replacement Anchoring

When using find-and-replace on this file:
- Use **plain-text lines** (headings, prose) as anchor context — not lines containing escaped backticks.
- Escaped backtick sequences (`\`\`\`csharp`, `\`something\``) are fragile match targets and frequently fail.
- If a replacement fails, read the exact file content at that line before retrying.

## Rule 4 — Batch Version/Badge Updates

When updating version badges, provider tags, or repeated markers:
1. First, search (`grep_search`) to find ALL occurrences.
2. Present the full list to the user for confirmation.
3. Apply all changes in a single `multi_replace_string_in_file` call.
4. Run error diagnostics after.

## Rule 5 — New Section Checklist

Before considering a new section "done":
- [ ] All backticks escaped
- [ ] Code fences use `\`\`\`language` format
- [ ] Error diagnostics pass (zero errors)
- [ ] Section count in header updated if applicable
- [ ] Table of contents / navigation updated if applicable
