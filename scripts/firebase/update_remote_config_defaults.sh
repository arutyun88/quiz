#!/usr/bin/env bash

set -euo pipefail

readonly script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly project_root="$(cd "${script_dir}/../.." && pwd)"
readonly firebase_project_id="${FIREBASE_PROJECT_ID:-quiz-df891}"

if ! command -v firebase >/dev/null 2>&1; then
  echo "firebase CLI is required: npm install --global firebase-tools@15.28.2" >&2
  exit 69
fi

readonly temporary_dir="$(mktemp -d)"
trap 'rm -rf "${temporary_dir}"' EXIT
readonly template_path="${temporary_dir}/remote-config-template.json"

cd "${project_root}"
firebase remoteconfig:get \
  --project "${firebase_project_id}" \
  --non-interactive \
  --output "${template_path}"

if command -v fvm >/dev/null 2>&1; then
  fvm dart run tool/update_remote_config_defaults.dart "${template_path}"
  fvm flutter test \
    test/unit/app/core/services/firebase_remote_config_service_test.dart \
    test/unit/tool/update_remote_config_defaults_test.dart
else
  dart run tool/update_remote_config_defaults.dart "${template_path}"
  flutter test \
    test/unit/app/core/services/firebase_remote_config_service_test.dart \
    test/unit/tool/update_remote_config_defaults_test.dart
fi

echo "Updated assets/config/remote_config_defaults.json from ${firebase_project_id}"
