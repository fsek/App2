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
