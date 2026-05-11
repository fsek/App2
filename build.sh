#!/bin/bash
set -euo pipefail

# Prepares the project for running. After this script completes, run: flutter run

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
