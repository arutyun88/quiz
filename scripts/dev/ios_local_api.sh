#!/usr/bin/env bash

set -euo pipefail

readonly runtime_dir=".dart_tool/vscode"
readonly defines_file="$runtime_dir/local_api_defines.json"
readonly local_env_file="$runtime_dir/local.env"

mkdir -p "$runtime_dir"
if [[ -f "$local_env_file" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$local_env_file"
  set +a
fi

readonly dev_time="${QUIZ_DEV_TIME:-}"
readonly dev_time_key="${QUIZ_DEV_TIME_KEY:-}"

if [[ -n "$dev_time" && -z "$dev_time_key" ]] ||
  [[ -z "$dev_time" && -n "$dev_time_key" ]]; then
  echo "QUIZ_DEV_TIME and QUIZ_DEV_TIME_KEY must be provided together." >&2
  exit 1
fi

local_ip=""
for interface in en0 en1 en2 en3 en4 en5 en6 en7 en8 en9; do
  candidate="$(ipconfig getifaddr "$interface" 2>/dev/null || true)"
  if [[ "$candidate" =~ ^10\. ]] ||
    [[ "$candidate" =~ ^192\.168\. ]] ||
    [[ "$candidate" =~ ^172\.(1[6-9]|2[0-9]|3[01])\. ]]; then
    local_ip="$candidate"
    break
  fi
done

if [[ -z "$local_ip" ]]; then
  echo "No private IPv4 address found. Connect the Mac and iPhone to the same network." >&2
  exit 1
fi

readonly api_base_url="http://$local_ip:8081/api"
curl --silent --show-error --max-time 5 --output /dev/null \
  "$api_base_url/user/age-access" || {
    echo "quiz-server is not reachable at $api_base_url" >&2
    exit 1
  }

scripts/dev/vscode_common_defines.sh

{
  printf '{\n  "API_BASE_URL": "%s"' "$api_base_url"
  if [[ -n "$dev_time" ]]; then
    printf ',\n  "QUIZ_DEV_TIME": "%s",\n  "QUIZ_DEV_TIME_KEY": "%s"' \
      "$dev_time" "$dev_time_key"
  fi
  printf '\n}\n'
} >"$defines_file"
echo "Local quiz-server is ready at $api_base_url"
