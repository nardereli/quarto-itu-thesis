# quarto-itu-thesis

A Quarto thesis template for Istanbul Technical University (ITU).

This repository adapts ITU's official graduate thesis LaTeX template for a
Quarto-based writing workflow. The goal is to let students write chapters in
Quarto Markdown while preserving the official ITU PDF layout for cover pages,
approval pages, frontmatter, abstracts, lists, references, appendices, and page
numbering.

## Status

This is an initial working template. It currently targets a Turkish M.Sc. thesis
using ITU's APA 7 bibliography setup and renders successfully with Quarto and
TinyTeX. Numbered citations, English theses, and additional institute/degree
combinations are intended to be supported through document class options.

A rendered sample PDF is available at
[`examples/itu-thesis-sample.pdf`](examples/itu-thesis-sample.pdf).

## Official Sources Used

The implementation was prepared from ITU's official graduate thesis materials,
available from the public ITU Graduate School documents page:

- [ITU Graduate School Documents](https://lee.itu.edu.tr/belgeler)

The thesis writing documents used are:

- ITU Graduate Thesis Writing Guide, DOCX and PDF
- ITU Graduate Thesis Template, DOCX and PDF
- ITU Graduate Thesis LaTeX Template, updated January 2025

The core PDF layout is based on the official `itutez.cls` file from the ITU LaTeX
template. The DOCX files were used to verify style names, section ordering,
spacing rules, margin settings, comments, and expected user-editable fields.

## Requirements

Install:

- [Quarto](https://quarto.org)
- A LaTeX distribution such as TeX Live, MacTeX, or MiKTeX
- `biber` for APA 7 references

On macOS, a typical setup is:

```bash
brew install --cask mactex
brew install quarto
```

This repository has been tested with Quarto 1.9.38 and TinyTeX 2026.07.

## Render

From the repository root:

```bash
quarto render
```

The default format is `itu-thesis-pdf`, defined by the extension in
`_extensions/itu-thesis`.

## Metadata

Fill thesis identity fields in `_quarto.yml` under `itu-thesis`.

Important fields:

- `author.given` and `author.family`
- `student-id`
- `title-tr` and `title-en`
- `department.tr`, `department.en`
- `program.tr`, `program.en`
- `advisor` and optional `coadvisor`
- `committee`
- `submission-date` and `defense-date`
- frontmatter file paths such as `abstract-tr`, `abstract-en`, `foreword`, and
  `cv`

The user-facing metadata names are in English. The generated thesis pages remain
in the language required by the selected ITU document class option.

## ITU Document Class Options

The official class is configured through `classoption` in `_quarto.yml`.

Default:

```yaml
format:
  itu-thesis-pdf:
    classoption:
      - onluarkali
      - turkce
      - yukseklisans
      - bez
      - LisansustuEgitim
```

Common options:

- `onluarkali` or `tekyonlu`
- `turkce` or `ingilizce`
- `yukseklisans` or `doktora`
- `bez` or `karton`
- `bilisim`, `fenbilimleri`, `sosyalbilimler`, `avrasya`, `enerji`, or
  `LisansustuEgitim`

## Repository Name

The recommended repository name is `quarto-itu-thesis`. That name matches the
convention used by other university-specific Quarto thesis extensions and is
clearer than the original upstream fork name, `quarto-thesis`.

## Notes for Contributors

- Keep repository-facing names, comments, and documentation in English.
- Preserve ITU's official terminology in generated thesis pages.
- Keep the official class changes minimal and documented.
- Do not commit generated PDF, HTML, auxiliary LaTeX, or DOCX inspection output,
  except for the intentionally versioned sample PDF in `examples/`.
- Test with at least one Turkish M.Sc. thesis and one English thesis before
  marking the template as complete.

## Relationship to awesome-quarto-thesis

This repository can be proposed for the `Jupyter4Science/awesome-quarto-thesis`
list under:

```markdown
Istanbul Technical University
- [nardereli/quarto-itu-thesis](https://github.com/nardereli/quarto-itu-thesis)
```
