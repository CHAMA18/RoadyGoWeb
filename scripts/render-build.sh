#!/usr/bin/env bash
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  FLUTTER_ROOT="${HOME}/flutter-sdk"

  if [ ! -x "${FLUTTER_ROOT}/bin/flutter" ]; then
    git clone https://github.com/flutter/flutter.git --depth 1 --branch stable "${FLUTTER_ROOT}"
  fi

  export PATH="${FLUTTER_ROOT}/bin:${PATH}"
fi

flutter config --enable-web
flutter --version
flutter pub get
flutter build web --release
