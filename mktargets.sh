#!/usr/bin/env bash
set -euxo pipefail

readarray -t TARGET_FILES <targets.txt

for target in "${TARGET_FILES[@]}"; do
  if [ ! -f outputs/"$(basename "$target")" ]; then
    ln -s ../"$target" outputs/"$(basename "$target")"
  fi
done
