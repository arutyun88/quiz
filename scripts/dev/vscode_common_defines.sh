#!/usr/bin/env bash

set -euo pipefail

readonly runtime_dir=".dart_tool/vscode"
readonly local_env_file="$runtime_dir/local.env"
readonly defines_file="$runtime_dir/common_defines.json"

mkdir -p "$runtime_dir"
if [[ -f "$local_env_file" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$local_env_file"
  set +a
fi

readonly sentry_dsn="${SENTRY_DSN:-}"
readonly sentry_environment="${SENTRY_ENVIRONMENT:-development}"

if [[ -n "$sentry_dsn" ]]; then
  printf '{\n  "SENTRY_DSN": "%s",\n  "SENTRY_ENVIRONMENT": "%s"\n}\n' \
    "$sentry_dsn" "$sentry_environment" >"$defines_file"
  echo "Local Sentry reporting is enabled for $sentry_environment"
else
  printf '{}\n' >"$defines_file"
  echo "Local Sentry reporting is disabled"
fi
