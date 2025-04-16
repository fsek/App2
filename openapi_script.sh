#!/usr/bin/env bash

temp_spec=$(mktemp)

curl http://localhost:8000/openapi.json > "$temp_spec"

# If using openapi generator cli, change to: openapi-generator-cli generate
openapi-generator generate \
  -i "$temp_spec" \
  -g dart-dio \
  -o lib/api_client \
  --additional-properties=pubName=api_client,baseUrl="http://localhost:8000"

rm "$temp_spec"

# After running the script, you also need to change the lower version lock of flutter in pubspec.yaml to 3.0.0
# For usage from emulator, use http://10.0.2.2 instead of localhost in api.dart.
# We also might need to change pubspec.yaml it should be sdk: '>=3.0.0 <4.0.0'.
# command for running in windows cmd with -cli using openapi.json file in App2 folder:
# openapi-generator-cli generate -i openapi.json -g dart-dio -o lib/api_client --additional-properties=pubName=api_client,basePath=http://10.0.2.2

