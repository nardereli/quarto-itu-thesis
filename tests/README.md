# Render Fixtures

This directory contains source fixtures for release validation:

- `fixtures/turkish-msc`: Turkish M.Sc. thesis fixture.
- `fixtures/english-msc`: English M.Sc. thesis fixture.

Run all fixtures from the repository root:

```bash
bash tests/scripts/render-fixtures.sh
```

The script copies each fixture and the local `itu-thesis` extension into
`tmp/fixture-renders/`, then runs `quarto render` in each temporary project.
Generated PDFs and LaTeX auxiliary files are intentionally kept out of version
control.
