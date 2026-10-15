#!/usr/bin/env bash

set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
artifact_path="$project_dir/build/app/outputs/bundle/globalRelease/app-global-release.aab"

cd "$project_dir"
flutter pub get
flutter build appbundle --flavor global --release --no-pub "$@"
"$project_dir/scripts/verify_android_release_signature.sh" "$artifact_path"
