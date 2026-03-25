#!/bin/bash
# This script can be used to prepare for running the project. After it has run you only need to run flutter run

# NOTE: This script is also run in the testing workflow, if you get erroring tests after editing this file, check your changes

BACKEND_URL="${1:-http://localhost:8000}"
OPENAPI_URL="$BACKEND_URL/openapi.json"

echo "Updating OpenAPI"
temp_spec=$(mktemp)

curl "$OPENAPI_URL" > "$temp_spec"

# We use openapi-generator if available, otherwise fallback to openapi-generator-cli
openapi-generator generate \
  -i "$temp_spec" \
  -g dart-dio \
  -o lib/api_client \
  --additional-properties=pubName=api_client,baseUrl="$BACKEND_URL",sdkVersion=">=3.8.0 <4.0.0" \
|| openapi-generator-cli generate \
  -i "$temp_spec" \
  -g dart-dio \
  -o lib/api_client \
  --additional-properties=pubName=api_client,baseUrl="$BACKEND_URL",sdkVersion=">=3.8.0 <4.0.0"

rm "$temp_spec"
echo "Done!"
echo "Fixing SDK version in lib/pubspec.yaml..."
# Because for some stupid reason the sed command works different on macOS we need to check if we are running mac
# when running the version fix command.
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_INPLACE=("sed" "-i" "")
else
  SED_INPLACE=("sed" "-i" "")
fi

"${SED_INPLACE[@]}" "/^environment:/,/^[^[:space:]]/ s/^\([[:space:]]*sdk:[[:space:]]*\).*/\1'>=3.8.0 <4.0.0'/" lib/api_client/pubspec.yaml

echo "Done!"


# After running the script, you also need to change the lower version lock of flutter in pubspec.yaml to 3.0.0 
# (this is done in the sed command now! But you might want to double check the version)
# For usage from emulator, use http://10.0.2.2 instead of localhost in api.dart.
# We also might need to change pubspec.yaml it should be sdk: '>=3.0.0 <4.0.0'.
# command for running in windows cmd with -cli using openapi.json file in App2 folder:
# openapi-generator-cli generate -i openapi.json -g dart-dio -o lib/api_client --additional-properties=pubName=api_client,basePath=http://10.0.2.2

echo "Cleaning project."
# Clean up old builds
flutter clean
echo "Done!"
echo "Cleaning api_client."
cd lib/api_client/
flutter clean 
echo "Done!"

# Main
echo "Building main"
cd ../..
flutter pub get
dart run build_runner build --delete-conflicting-outputs
echo "Done!"

# Internal ????
echo "Building api_client"
cd lib/api_client/
flutter pub get
dart run build_runner build --delete-conflicting-outputs
echo "Done!"

cd ../..
echo "All done! You can now run the project with 'flutter run'."
