---
name: typst-dense-documents
description: Use when editing dense Typst documents with strict page budgets, typography/layout changes, imports, images, tables/grids, or visual regressions. Use official Typst docs, keep reusable style in shared helpers, and verify the rendered PDF.
---

# Typst Dense Documents

Use this skill before changing Typst files for dense documents, typography/layout, spacing, imports, images, tables/grids, or page-count-sensitive output.

## Sources

Base decisions on official Typst docs, not intuition:

- Syntax, modes, paths, and project root: https://typst.app/docs/reference/syntax/
- Styling with `set` and `show` rules: https://typst.app/docs/reference/styling/
- Paragraphs: https://typst.app/docs/reference/model/par/
- Lists: https://typst.app/docs/reference/model/list/
- Layout functions, including `grid`, `stack`, and `v`: https://typst.app/docs/reference/layout/

## Required Checks

1. Re-read the current files first:
   - shared Typst style/template files
   - relevant content files
   - existing build commands or Makefile targets

2. Keep non-spacing Typst semantics straight:
   - Check markup/code/math mode before editing syntax. In code mode after `#`, do not keep adding `#` unless switching back from markup/math.
   - Use content blocks (`[...]`) for rich Typst markup passed to helpers; use strings only for plain text.
   - Keep global `set` and `show` rules in shared style/template files. If a rule should be local, wrap it in a function/block so it cannot leak through imports.
   - Verify asset/import paths from the file that references them, or from the configured project root. Do not assume paths are relative to the current shell directory.
   - Treat `box`/fixed-size wrappers as possible page-break or clipping hazards in dense documents; prefer breakable structures unless content must stay together.

3. Keep spacing semantics straight:
   - `par.leading` is intra-paragraph line spacing.
   - `par.spacing` is spacing between paragraph blocks.
   - A paragraph break will not look visible if `par.spacing` is close to or smaller than `par.leading`.
   - `list.spacing` controls spacing between list items; it does not fix normal paragraphs.
   - Grid `row-gutter` can read weakly with wrapped inline cells. For repeated dense rows, prefer stacking one row component per item with explicit `stack(spacing: ...)` when row rhythm must be visually guaranteed.
   - Spacing beside non-paragraph block elements can be controlled by the block/element spacing, not only by `par.spacing`.

4. For compact prose, use separate rhythm knobs:
   - Keep line rhythm tight enough for wrapped paragraphs.
   - Make paragraph gaps visibly larger than line gaps.
   - Keep list item gaps, section gaps, role gaps, and skill row gaps named separately.

5. Do not add raw `#v(...)` calls to content files for generic rhythm.
   - Put reusable spacing in shared style/template helpers.
   - Raw `#v(...)` is only acceptable for semantic local layout, such as spacing around a deliberate visual rule or figure.

## Verification

After edits, run:

```sh
make format
make clean
make pdf
```

If the project does not use these targets, identify and run the equivalent Typst format/build commands.

Then run PDF checks for the generated Typst PDF, for example:

```sh
pdfinfo path/to/output.pdf
pdftoppm -png -r 140 path/to/output.pdf /tmp/typst-spacing-check
```

Verify all of the following before reporting success:

- Typst PDF exists.
- Page size and page count match the user's constraint.
- Paragraph breaks are visibly distinct from ordinary wrapped lines.
- Repeated rows have visible row separation, including wrapped rows.
- Lists have visible item rhythm when items wrap.
- Section and subsection headings have visible post-heading separation.
- Page breaks still occur where expected.

Use `pdftotext -layout` only as a supplement. Always inspect rendered PNGs or screenshots for spacing changes.
