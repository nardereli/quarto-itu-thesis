#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT_DIR="$ROOT_DIR/tmp/fixture-renders"

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

for fixture in turkish-msc english-msc; do
  src="$ROOT_DIR/tests/fixtures/$fixture"
  dst="$OUT_DIR/$fixture"

  mkdir -p "$dst"
  rsync -a "$src/" "$dst/"
  mkdir -p "$dst/_extensions"
  rsync -a "$ROOT_DIR/_extensions/itu-thesis" "$dst/_extensions/"

  (
    cd "$dst"
    quarto render
  )
done
