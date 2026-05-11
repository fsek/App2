#!/bin/bash
set -euo pipefail

# Prepares the project for running. After this script completes, run: flutter run
# NOTE: This script is also run in the testing workflow. If you get failing tests
# after editing this file, check your changes carefully.

SDK_VERSION_LOWER="3.10.0"
SDK_VERSION_UPPER="4.0.0"

# ── Argument handling ────────────────────────────────────────────────────────

if [ -z "${1:-}" ]; then
  echo "No backend URL provided."
  read -p "Do you want to use the default (http://localhost:8000)? [y/N]: " confirm
  case "$confirm" in
    [yY][eE][sS]|[yY])
      BACKEND_URL="http://localhost:8000"
      ;;
    *)
      echo "Aborting. Please provide a backend URL as an argument."
      exit 1
      ;;
  esac
else
  BACKEND_URL="$1"
fi

OPENAPI_URL="$BACKEND_URL/openapi.json"

# For Android emulator, use http://10.0.2.2 instead of localhost.

# Command for running in windows cmd with -cli using openapi.json file in App2 folder:
# (NOTE: this has not been tested, if you are using windows, please double check that this works)
# openapi-generator-cli generate -i openapi.json -g dart-dio -o lib/api_client --additional-properties=pubName=api_client,basePath=http://10.0.2.2

# ── Temp file setup ──────────────────────────────────────────────────────────

temp_spec=$(mktemp)
temp_config=$(mktemp --suffix=.json 2>/dev/null || mktemp)
trap 'rm -f "$temp_spec" "$temp_config"' EXIT

# ── Fetch OpenAPI spec ───────────────────────────────────────────────────────

echo "Fetching OpenAPI spec from $OPENAPI_URL..."
if ! curl --fail --silent --show-error "$OPENAPI_URL" > "$temp_spec"; then
  echo "ERROR: Failed to fetch OpenAPI spec from $OPENAPI_URL"
  exit 1
fi

if [ ! -s "$temp_spec" ]; then
  echo "ERROR: Downloaded OpenAPI spec is empty."
  exit 1
fi
echo "Done!"

# ── Detect generator ─────────────────────────────────────────────────────────

if command -v openapi-generator &>/dev/null; then
  GENERATOR="openapi-generator"
elif command -v openapi-generator-cli &>/dev/null; then
  GENERATOR="openapi-generator-cli"
else
  echo "ERROR: Neither openapi-generator nor openapi-generator-cli found in PATH."
  exit 1
fi

# ── Generate API client ──────────────────────────────────────────────────────
#
# We pass options via a JSON config file rather than --additional-properties to
# avoid shell re-evaluation of >= and < as redirections. This affects both the
# native binary and the Node.js CLI wrapper.

echo "Generating API client using $GENERATOR..."

cat > "$temp_config" <<EOF
{
  "pubName": "api_client",
  "baseUrl": "${BACKEND_URL}",
  "sdkVersion": ">=${SDK_VERSION_LOWER} <${SDK_VERSION_UPPER}"
}
EOF

if ! "$GENERATOR" generate \
  -i "$temp_spec" \
  -g dart-dio \
  -o lib/api_client \
  -c "$temp_config"; then
  echo "ERROR: OpenAPI generation failed."
  exit 1
fi
echo "Done!"

# ── Fix SDK version in generated pubspec ─────────────────────────────────────
#
# The generator sometimes writes an incorrect sdk constraint; overwrite it.

echo "Fixing SDK version in lib/api_client/pubspec.yaml..."
# If you still hit SDK constraint errors, inspect this file after the run.
SDK_RANGE="'>=${SDK_VERSION_LOWER} <${SDK_VERSION_UPPER}'"
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i "" "/^environment:/,/^[^[:space:]]/ s/^\([[:space:]]*sdk:[[:space:]]*\).*/\1${SDK_RANGE}/" lib/api_client/pubspec.yaml
else
  sed -i "/^environment:/,/^[^[:space:]]/ s/^\([[:space:]]*sdk:[[:space:]]*\).*/\1${SDK_RANGE}/" lib/api_client/pubspec.yaml
fi

if ! grep -q ">=${SDK_VERSION_LOWER} <${SDK_VERSION_UPPER}" lib/api_client/pubspec.yaml; then
  echo "WARNING: SDK version fix may not have applied to lib/api_client/pubspec.yaml -- verify it manually before running."
fi
echo "Done!"

# ── Clean ────────────────────────────────────────────────────────────────────

echo "Cleaning main project..."
flutter clean
echo "Done!"

echo "Cleaning api_client..."
(cd lib/api_client && flutter clean)
echo "Done!"

# ── Build main project ───────────────────────────────────────────────────────

echo "Building main project..."
if ! flutter pub get; then
  echo "ERROR: flutter pub get failed in main project."
  exit 1
fi
dart run build_runner build --delete-conflicting-outputs
echo "Done!"

# ── Build api_client ─────────────────────────────────────────────────────────

echo "Building api_client..."
if ! (cd lib/api_client && flutter pub get); then
  echo "ERROR: flutter pub get failed in lib/api_client."
  exit 1
fi
(cd lib/api_client && dart run build_runner build --delete-conflicting-outputs)
echo "Done!"

# ─────────────────────────────────────────────────────────────────────────────

echo ""
echo "All done! Run the project with: flutter run"
echo ""
echo "Note: for emulator use http://10.0.2.2 instead of localhost."