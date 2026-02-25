#!/usr/bin/env bash
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  FLUTTER_ROOT="${HOME}/flutter-sdk"

  if [ ! -x "${FLUTTER_ROOT}/bin/flutter" ]; then
    if [ -d "${FLUTTER_ROOT}/.git" ]; then
      rm -f "${FLUTTER_ROOT}/.git/index.lock" "${FLUTTER_ROOT}/.git/shallow.lock"
      git -C "${FLUTTER_ROOT}" fetch origin stable --depth 1
      git -C "${FLUTTER_ROOT}" reset --hard FETCH_HEAD
    else
      rm -rf "${FLUTTER_ROOT}"
      git clone https://github.com/flutter/flutter.git --depth 1 --branch stable "${FLUTTER_ROOT}"
    fi
  fi

  export PATH="${FLUTTER_ROOT}/bin:${PATH}"
fi

flutter pub get
flutter build web --release
