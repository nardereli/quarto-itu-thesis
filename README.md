# quarto-itu-thesis

A Quarto thesis template for Istanbul Technical University (ITU).

This repository adapts ITU's official graduate thesis LaTeX class for a Quarto
book workflow. Students write chapters in Quarto Markdown while the local
`itu-thesis` extension maps `_quarto.yml` metadata to the official `itutez.cls`
frontmatter, title pages, lists, abstracts, bibliography, appendices, and page
numbering.

## Status

This is a public `v0.1.0` template candidate. The tested configurations are:

- Turkish M.Sc. thesis: `turkce`, `yukseklisans`
- English M.Sc. thesis: `ingilizce`, `yukseklisans`

Other official class options may work, but they are not yet covered by fixtures.
See [KNOWN_LIMITATIONS.md](KNOWN_LIMITATIONS.md) before using this for final
submission.

A rendered sample PDF is available at
[`examples/itu-thesis-sample.pdf`](examples/itu-thesis-sample.pdf).

## Requirements

Install:

- [Quarto](https://quarto.org)
- A LaTeX distribution such as TinyTeX, TeX Live, MacTeX, or MiKTeX
- `biber` for BibLaTeX bibliography processing

Tested locally with Quarto 1.9.38 and TinyTeX 2026.07.

### macOS

One straightforward setup is:

```bash
brew install quarto
quarto install tinytex
```

MacTeX also works:

```bash
brew install --cask mactex
brew install quarto
```

### Linux

Install Quarto, TeX Live, and Biber through your distribution packages or use
TinyTeX:

```bash
quarto install tinytex
```

### Windows

Use Quarto with TinyTeX or MiKTeX. Make sure `biber` is available on `PATH`.

## Create A New Thesis

Quarto starter templates are GitHub repositories copied with `quarto use
template`; Quarto documents this workflow in its
[Starter Templates guide](https://quarto.org/docs/extensions/starter-templates.html).

Create a new thesis project with:

```bash
quarto use template nardereli/quarto-itu-thesis
```

Then render:

```bash
cd quarto-itu-thesis
quarto render
```

The repository includes a `.quartoignore` file so tests, docs, generated PDFs,
and release-maintainer files are not copied into new thesis projects.

## Fill Metadata

Edit `_quarto.yml`, especially the `itu-thesis` block:

- `author.given`, `author.family`, and `student-id`
- `title-tr` and `title-en`
- `department.tr`, `department.en`
- `program.tr`, `program.en`
- `defense-month`, `submission-date`, and `defense-date`
- `advisor` and optional `coadvisor`
- `committee.member-1` through `committee.member-5`
- frontmatter file paths for foreword, abstracts, abbreviations, symbols, and CV

The metadata keys are in English. Generated thesis pages keep ITU terminology
from the official class.

## Language And Class Options

Set ITU class options in `_quarto.yml`:

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

For an English M.Sc. thesis, use `ingilizce` instead of `turkce`:

```yaml
format:
  itu-thesis-pdf:
    classoption:
      - onluarkali
      - ingilizce
      - yukseklisans
      - bez
      - LisansustuEgitim
```

The extension does not set a default `classoption` list. This avoids Quarto
merging `turkce` and `ingilizce` together. Keep exactly one language option in
your project config.

Custom Quarto list labels use the official class language flag, so Turkish mode
uses labels such as `Şekil`, `Çizelge`, `Sayfa`, and `KAYNAKLAR`; English mode
uses `Figure`, `Table`, `Page`, and `REFERENCES`.

## Write Content

Add chapters under `Chapters/` and list them in `book.chapters`:

```yaml
book:
  chapters:
    - index.qmd
    - Chapters/Chapter2.qmd
    - references.qmd
```

Add appendices under `Appendices/` and list them in `book.appendices`:

```yaml
book:
  appendices:
    - Appendices/AppendixA.qmd
```

Use normal Quarto citations, figures, tables, equations, and cross-references.

## Bibliography

This template uses BibLaTeX with Biber:

```yaml
bibliography: references.bib
suppress-bibliography: true
```

The extension configures:

- `cite-method: biblatex`
- `style=apa`
- `backend=biber`

`itubib.bst` is not included because it is a BibTeX style file and is not used
by the current BibLaTeX/Biber workflow. Render inspection showed Biber reading
`index.bcf` and `references.bib`, with no `\bibliographystyle` or `.bst` usage.

To use Zotero, export a BibLaTeX `.bib` file to `references.bib`, keep citation
keys stable, and cite entries with Quarto syntax such as `@apa2020`.

## Render

Render the PDF from the project root:

```bash
quarto render
```

By default, generated `.tex`, `.aux`, `.log`, `.bcf`, `.run.xml`, and related
files are cleaned up. To inspect generated LaTeX while debugging:

```bash
quarto render --debug
```

Those generated files are ignored by `.gitignore` and should not be committed.

## Test Fixtures

Render the release fixtures:

```bash
bash tests/scripts/render-fixtures.sh
```

The fixtures cover Turkish and English M.Sc. theses with long titles, long
advisor names, co-advisors, five committee members, abstracts, summaries,
multiple figures, multiple tables, bibliography entries, and appendices.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Keep repository-facing documentation and
comments in English, preserve official ITU terminology in generated pages, and
avoid broad changes to `itutez.cls`.

Do not commit generated build artifacts such as `_book/`, `.quarto/`, `.aux`,
`.log`, `.bcf`, `.run.xml`, copied root `itutez.cls`, copied root `itu-defs.tex`,
or copied root `itubib.bst`.
