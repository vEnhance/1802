#!/usr/bin/env bash
set -euxo pipefail

make all
readarray -t TARGET_FILES <targets.txt

for target in "${TARGET_FILES[@]}"; do
  if [ ! -f outputs/"$(basename "$target")" ]; then
    ln -s ../"$target" outputs/"$(basename "$target")"
  fi
done

PYTHONWARNINGS="ignore" gsutil -m rsync outputs/ gs://web.evanchen.cc/upload/1802/
PYTHONWARNINGS="ignore" gsutil -m setmeta -R -h 'Cache-Control:private, max-age=0, no-transform' "gs://web.evanchen.cc/upload/1802/**"
