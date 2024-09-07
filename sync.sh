#!/usr/bin/env bash
set -euxo pipefail

make all
readarray -t TARGET_FILES <targets.txt
gsutil -m cp "${TARGET_FILES[@]}" gs://web.evanchen.cc/upload/1802/
gsutil -m setmeta -R -h 'Cache-Control:private, max-age=0, no-transform' "gs://web.evanchen.cc/upload/1802/**"
