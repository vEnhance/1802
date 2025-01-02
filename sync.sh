#!/usr/bin/env bash
set -euxo pipefail

make all

gcloud storage rsync --no-ignore-symlinks outputs/ gs://web.evanchen.cc/upload/1802 --cache-control="private,max-age=0"
gcloud storage rsync --no-ignore-symlinks published/ gs://web.evanchen.cc/textbooks --cache-control="private,max-age=0"
