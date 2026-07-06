# Known Limitations

## Tested Scope

The tested release fixtures cover Turkish and English M.Sc. theses. Ph.D. theses
and other institute/degree combinations are not yet covered by automated
fixtures.

## Official Class Warnings

The official `itutez.cls` emits several benign warnings in the current Quarto
pipeline, including:

- `Option 'a4paper' not available for this class.`
- `inputenc package ignored with utf8 based engines.`
- font substitution warnings from Times/STIX/math font handling.
- `tocloft` warning that `\@starttoc` was already redefined.

These are documented rather than suppressed because they come from the official
class or from normal LuaLaTeX package interaction.

## Appendices

The official class has its own appendix cover/list behavior, while Quarto book
projects also create an appendices part. The current template keeps the official
appendix commands in the sample appendix, but contributors should visually check
appendix ordering when changing appendix structure.

## Wide Tables

The fixtures include a broad table, but complex landscape or rotated tables may
still require manual LaTeX. Prefer testing such cases in a fixture before relying
on them in a final thesis.
