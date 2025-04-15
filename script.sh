#!/bin/bash
# This script can be used to prepare for running the project. After it has run you only need to run flutter run

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