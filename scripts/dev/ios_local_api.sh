#!/usr/bin/env bash

set -euo pipefail

readonly runtime_dir=".dart_tool/vscode_ios_api"
readonly defines_file="$runtime_dir/debug_defines.json"

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

mkdir -p "$runtime_dir"
printf '{\n  "API_BASE_URL": "%s"\n}\n' "$api_base_url" >"$defines_file"
echo "Local quiz-server is ready at $api_base_url"
