#!/usr/bin/env bash
set -euxo pipefail

readarray -t TYPST_FILES < <(fd '.typ')
for t in "${TYPST_FILES[@]}"; do
  typst compile "$t"
done

readarray -t TARGET_FILES <targets.txt
gsutil -m cp "${TARGET_FILES[@]}" gs://web.evanchen.cc/upload/1802/
gsutil -m setmeta -R -h 'Cache-Control:private, max-age=0, no-transform' "gs://web.evanchen.cc/upload/1802/**"
