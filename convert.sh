#!/usr/bin/env bash
set -euxo pipefail

sed 's/\\bf/\\mathbf/g' "$1" | pandoc --from latex --to typst
