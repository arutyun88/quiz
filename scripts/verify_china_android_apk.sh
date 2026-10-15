#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: scripts/verify_china_android_apk.sh path-to-apk" >&2
  exit 64
fi

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
apk_path="$1"
if [[ ! -f "$apk_path" ]]; then
  echo "China APK not found: $apk_path" >&2
  exit 66
fi

sdk_dir="$(sed -n 's/^sdk.dir=//p' "$project_dir/android/local.properties")"
apk_analyzer="$sdk_dir/cmdline-tools/latest/bin/apkanalyzer"
if [[ ! -x "$apk_analyzer" ]]; then
  apk_analyzer="$(find "$sdk_dir/cmdline-tools" -type f -name apkanalyzer | sort | tail -1)"
fi
if [[ ! -x "$apk_analyzer" ]]; then
  echo "apkanalyzer is required to verify the China APK" >&2
  exit 69
fi

forbidden_packages="$({
  "$apk_analyzer" dex packages "$apk_path" | grep -E \
    '^[PC] d .* (com\.android\.billingclient|com\.google\.android\.gms|com\.google\.firebase|com\.revenuecat|io\.flutter\.plugins\.firebase|io\.flutter\.plugins\.googlemobileads)(\.|$)' || true
})"
if [[ -n "$forbidden_packages" ]]; then
  echo "China APK contains forbidden native packages:" >&2
  echo "$forbidden_packages" >&2
  exit 1
fi

forbidden_manifest="$({
  "$apk_analyzer" manifest print "$apk_path" | grep -E \
    'com\.android\.vending\.BILLING|android\.permission\.POST_NOTIFICATIONS|com\.google\.android\.gms\.ads|com\.google\.firebase' || true
})"
if [[ -n "$forbidden_manifest" ]]; then
  echo "China APK contains forbidden manifest entries:" >&2
  echo "$forbidden_manifest" >&2
  exit 1
fi

echo "Verified China APK without Firebase, GMS, AdMob, RevenueCat or Play Billing"
