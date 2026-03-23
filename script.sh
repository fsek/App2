#!/bin/bash
# This script can be used to prepare for running the project. After it has run you only need to run flutter run

# NOTE: This script is also run in the testing workflow, if you get erroring tests after editing this file, check your changes

BACKEND_URL="${1:-http://localhost:8000}"
OPENAPI_URL="$BACKEND_URL/openapi.json"


temp_spec=$(mktemp)

curl "$OPENAPI_URL" > "$temp_spec"

# We use openapi-generator if available, otherwise fallback to openapi-generator-cli
openapi-generator generate \
  -i "$temp_spec" \
  -g dart-dio \
  -o lib/api_client \
  --additional-properties=pubName=api_client,baseUrl="$BACKEND_URL" \
|| openapi-generator-cli generate \
  -i "$temp_spec" \
  -g dart-dio \
  -o lib/api_client \
  --additional-properties=pubName=api_client,baseUrl="$BACKEND_URL"

rm "$temp_spec"

echo "Fixing SDK version in lib/pubspec.yaml..."

sed -i "/^environment:/,/^[^[:space:]]/ s/^\([[:space:]]*sdk:[[:space:]]*\).*/\1'>=3.0.0 <4.0.0'/" lib/api_client/pubspec.yaml

echo "Done!"


# After running the script, you also need to change the lower version lock of flutter in pubspec.yaml to 3.0.0 
# (this is done in the sed command now! But you might want to double check the version)
# For usage from emulator, use http://10.0.2.2 instead of localhost in api.dart.
# We also might need to change pubspec.yaml it should be sdk: '>=3.0.0 <4.0.0'.
# command for running in windows cmd with -cli using openapi.json file in App2 folder:
# openapi-generator-cli generate -i openapi.json -g dart-dio -o lib/api_client --additional-properties=pubName=api_client,basePath=http://10.0.2.2

# Clean up old builds
flutter clean
cd lib/api_client/
flutter clean 

# Main
cd ../..
flutter pub get
dart run build_runner build --delete-conflicting-outputs

# Internal ????
cd lib/api_client/
flutter pub get
dart run build_runner build --delete-conflicting-outputs

cd ../..
echo "All done! You can now run the project with 'flutter run'."