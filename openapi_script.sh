#!/usr/bin/env bash

temp_spec=$(mktemp)

curl http://localhost:8000/openapi.json > "$temp_spec"

openapi-generator generate \
  -i "$temp_spec" \
  -g dart-dio \
  -o lib/api_client \
  --additional-properties=pubName=api_client,baseUrl=http://localhost:8080

rm "$temp_spec"


# openapi-generator generate \
#   -i path/to/openapi.json \
#   -g dart-dio \
#   -o lib/api_client \
#   --additional-properties=pubName=api_client,baseUrl=http://localhost:8080
