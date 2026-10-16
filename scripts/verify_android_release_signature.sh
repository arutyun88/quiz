#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: scripts/verify_android_release_signature.sh path-to-apk-or-aab" >&2
  exit 64
fi

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
artifact_path="$1"
if [[ ! -f "$artifact_path" ]]; then
  echo "Android release artifact not found: $artifact_path" >&2
  exit 66
fi

case "$artifact_path" in
  *.apk)
    sdk_dir="$(sed -n 's/^sdk.dir=//p' "$project_dir/android/local.properties")"
    apksigner="$(find "$sdk_dir/build-tools" -type f -name apksigner | sort -V | tail -1)"
    if [[ ! -x "$apksigner" ]]; then
      echo "apksigner is required to verify the Android release" >&2
      exit 69
    fi
    if ! certificate="$(LC_ALL=C "$apksigner" verify --print-certs "$artifact_path" 2>&1)"; then
      printf '%s\n' "$certificate" >&2
      exit 1
    fi
    subject="$(printf '%s\n' "$certificate" | sed -nE \
      's/^Signer #[0-9]+ certificate (DN|distinguished name):[[:space:]]*//p' | head -1)"
    fingerprint="$(printf '%s\n' "$certificate" | sed -nE \
      's/^Signer #[0-9]+ certificate SHA-?256 (digest|fingerprint):[[:space:]]*//p' | head -1)"
    ;;
  *.aab)
    certificate="$(LC_ALL=C keytool -printcert -jarfile "$artifact_path")"
    subject="$(printf '%s\n' "$certificate" | sed -n 's/^Owner: //p')"
    fingerprint="$(printf '%s\n' "$certificate" | sed -n 's/^[[:space:]]*SHA256: //p')"
    ;;
  *)
    echo "Expected an APK or AAB artifact: $artifact_path" >&2
    exit 65
    ;;
esac

if [[ -z "$fingerprint" ]]; then
  echo "Could not read the Android signing certificate" >&2
  exit 1
fi
if [[ -n "$subject" && "$subject" == *"CN=Android Debug"* ]]; then
  echo "Android release artifact is signed with the debug certificate" >&2
  exit 1
fi

normalized_fingerprint="$(printf '%s' "$fingerprint" | tr -d ':' | tr '[:upper:]' '[:lower:]')"
expected_fingerprint="${ANDROID_SIGNING_CERT_SHA256:-}"
expected_fingerprint="$(printf '%s' "$expected_fingerprint" | tr -d ':' | tr '[:upper:]' '[:lower:]')"
if [[ -z "$subject" && -z "$expected_fingerprint" ]]; then
  echo "Could not verify that the Android signing certificate is not a debug certificate" >&2
  exit 1
fi
if [[ -n "$expected_fingerprint" && "$normalized_fingerprint" != "$expected_fingerprint" ]]; then
  echo "Android signing certificate does not match ANDROID_SIGNING_CERT_SHA256" >&2
  exit 1
fi

echo "Verified Android release certificate SHA-256: $normalized_fingerprint"
