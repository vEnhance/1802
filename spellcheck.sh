#!/usr/bin/env bash
set -euxo pipefail

readarray -t TYPST_INPUTS < <(git ls-files '*.typ')
codespell "${TYPST_INPUTS[@]}"
