#!/usr/bin/env bash

set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
artifact_path="$project_dir/build/app/outputs/bundle/globalRelease/app-global-release.aab"
plugins_file="$project_dir/.flutter-plugins-dependencies"
registrant_file="$project_dir/android/app/src/main/java/io/flutter/plugins/GeneratedPluginRegistrant.java"
temporary_dir="$(mktemp -d)"

restore_generated_files() {
  cp "$temporary_dir/flutter-plugins-dependencies" "$plugins_file"
  if [[ -f "$temporary_dir/GeneratedPluginRegistrant.java" ]]; then
    mkdir -p "$(dirname "$registrant_file")"
    cp "$temporary_dir/GeneratedPluginRegistrant.java" "$registrant_file"
  else
    rm -f "$registrant_file"
  fi
  rm -rf "$temporary_dir"
}

cd "$project_dir"
flutter pub get
cp "$plugins_file" "$temporary_dir/flutter-plugins-dependencies"
if [[ -f "$registrant_file" ]]; then
  cp "$registrant_file" "$temporary_dir/GeneratedPluginRegistrant.java"
fi
trap restore_generated_files EXIT

dart run tool/filter_release_android_plugins.dart \
  "$plugins_file" \
  "$temporary_dir/release-plugins.json"
cp "$temporary_dir/release-plugins.json" "$plugins_file"
rm -f "$registrant_file"

flutter build appbundle --flavor global --release --no-pub "$@"
"$project_dir/scripts/verify_android_release_signature.sh" "$artifact_path"
