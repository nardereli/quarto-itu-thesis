# Contributing

This repository is a reusable ITU thesis template, not a private thesis project.

## Principles

- Preserve official ITU class behavior wherever possible.
- Keep changes to `itutez.cls` minimal and documented.
- Do not invent ITU formatting requirements.
- Keep repository-facing comments and documentation in English.
- Preserve ITU terminology in generated thesis pages.
- Do not add personal thesis content, research notes, copyrighted thesis PDFs,
  ebooks, or unrelated workflows.

## Development Workflow

Render the sample project:

```bash
quarto render
```

Render release fixtures:

```bash
bash tests/scripts/render-fixtures.sh
```

Use debug output when inspecting generated LaTeX:

```bash
quarto render --debug
```

Generated build artifacts are ignored and should not be committed.

## Before A Release

- Render the default sample project.
- Render both Turkish and English fixtures.
- Visually inspect the generated PDFs, especially title pages, committee pages,
  table of contents, lists of figures/tables, references, and appendices.
- Confirm no Turkish custom labels leak into English output and no English custom
  labels leak into Turkish output.
- Update `CHANGELOG.md`.
