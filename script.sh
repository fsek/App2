#!/bin/bash
# This script can be used to prepare for running the project. After it has run you only need to run flutter run

# NOTE: This script is also run in the testing workflow, if you get erroring tests after editing this file, check your changes
SDK_VERSION_LOWER="3.10.0"
SDK_VERSION_UPPER="4.0.0"

# Check if argument is provided
if [ -z "$1" ]; then
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

echo "Updating OpenAPI"
temp_spec=$(mktemp)

curl "$OPENAPI_URL" > "$temp_spec"

# We use openapi-generator if available, otherwise fallback to openapi-generator-cli
openapi-generator generate \
  -i "$temp_spec" \
  -g dart-dio \
  -o lib/api_client \
  --additional-properties=pubName=api_client,baseUrl="$BACKEND_URL",sdkVersion=">=${SDK_VERSION_LOWER} <${SDK_VERSION_UPPER}" \
|| openapi-generator-cli generate \
  -i "$temp_spec" \
  -g dart-dio \
  -o lib/api_client \
  --additional-properties=pubName=api_client,baseUrl="$BACKEND_URL",sdkVersion=">=${SDK_VERSION_LOWER} <${SDK_VERSION_UPPER}"

rm "$temp_spec"
echo "Done!"

echo "Fixing SDK version in lib/pubspec.yaml..."
# Because for some stupid reason the sed command works different on macOS we need to check if we are running mac
# when running the version fix command.
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i "" "/^environment:/,/^[^[:space:]]/ s/^\([[:space:]]*sdk:[[:space:]]*\).*/\1'>=${SDK_VERSION_LOWER} <${SDK_VERSION_UPPER}'/" lib/api_client/pubspec.yaml
else
  sed -i "/^environment:/,/^[^[:space:]]/ s/^\([[:space:]]*sdk:[[:space:]]*\).*/\1'>=${SDK_VERSION_LOWER} <${SDK_VERSION_UPPER}'/" lib/api_client/pubspec.yaml
fi
echo "Done!"


# After running the script, double check that the sdk version in lib/api_client/pubspec.yaml file match SDK_VERSION_LOWER and SDK_VERSION_UPPER
# (You will notice if it didn't work because you won't be able to run the app.)
# For usage from emulator, use http://10.0.2.2 instead of localhost in api.dart.
# Command for running in windows cmd with -cli using openapi.json file in App2 folder:
# (NOTE: this has not been tested, if you are using windows, please double check that this works)
# openapi-generator-cli generate -i openapi.json -g dart-dio -o lib/api_client --additional-properties=pubName=api_client,basePath=http://10.0.2.2

echo "Cleaning project."
# Clean up old builds
flutter clean
echo "Done!"

echo "Cleaning api_client."
cd lib/api_client/
flutter clean 
echo "Done!"

# Build the main project
echo "Building main"
cd ../..
flutter pub get
dart run build_runner build --delete-conflicting-outputs
echo "Done!"

# We build the api_client separately.
echo "Building api_client"
cd lib/api_client/
flutter pub get
dart run build_runner build --delete-conflicting-outputs
echo "Done!"

cd ../..
echo "All done! You can now run the project with 'flutter run'."
