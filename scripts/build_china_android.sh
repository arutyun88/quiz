#!/usr/bin/env bash

set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
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

dart run tool/filter_china_android_plugins.dart \
  "$plugins_file" \
  "$temporary_dir/china-plugins.json"
cp "$temporary_dir/china-plugins.json" "$plugins_file"
rm -f "$registrant_file"

export ORG_GRADLE_PROJECT_chinaGmsFree=true
flutter build apk --flavor china --no-pub "$@"

build_mode="release"
for argument in "$@"; do
  case "$argument" in
    --debug) build_mode="debug" ;;
    --profile) build_mode="profile" ;;
    --release) build_mode="release" ;;
  esac
done
"$project_dir/scripts/verify_china_android_apk.sh" \
  "$project_dir/build/app/outputs/flutter-apk/app-china-$build_mode.apk"
if [[ "$build_mode" == "release" ]]; then
  "$project_dir/scripts/verify_android_release_signature.sh" \
    "$project_dir/build/app/outputs/flutter-apk/app-china-release.apk"
fi
