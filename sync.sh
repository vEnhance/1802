#!/usr/bin/env bash
set -euxo pipefail

make all

[[ -f lamv.pdf ]] || {
  echo "ERROR: lamv.pdf not found in top directory"
  exit 1
}
[[ -e published/lamv.pdf ]] || ln -s ../lamv.pdf published/lamv.pdf

rclone sync --verbose --copy-links outputs/ web:upload/1802
rclone copy --verbose --copy-links published/ web:textbooks
