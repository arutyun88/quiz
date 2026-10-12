#!/usr/bin/env bash

set -euo pipefail

readonly runtime_dir=".dart_tool/vscode"
readonly local_env_file="$runtime_dir/local.env"
readonly posthog_env_file="$runtime_dir/posthog.env"
readonly defines_file="$runtime_dir/common_defines.json"

mkdir -p "$runtime_dir"
if [[ -f "$local_env_file" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$local_env_file"
  set +a
fi
if [[ -f "$posthog_env_file" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$posthog_env_file"
  set +a
fi

readonly sentry_dsn="${SENTRY_DSN:-}"
readonly sentry_environment="${SENTRY_ENVIRONMENT:-development}"
readonly posthog_project_token="${POSTHOG_PROJECT_TOKEN:-}"

printf '{\n' >"$defines_file"
separator=""
if [[ -n "$sentry_dsn" ]]; then
  printf '  "SENTRY_DSN": "%s",\n  "SENTRY_ENVIRONMENT": "%s"' \
    "$sentry_dsn" "$sentry_environment" >>"$defines_file"
  separator=',\n'
  echo "Local Sentry reporting is enabled for $sentry_environment"
else
  echo "Local Sentry reporting is disabled"
fi

if [[ -n "$posthog_project_token" ]]; then
  printf '%b  "POSTHOG_PROJECT_TOKEN": "%s"' \
    "$separator" "$posthog_project_token" >>"$defines_file"
  echo "Local PostHog EU analytics is available after in-app consent"
else
  echo "Local PostHog analytics is disabled"
fi
printf '\n}\n' >>"$defines_file"
