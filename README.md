# F-App 2: Electric Boogaloo

Flutter App for interacting with the API of fsektionen.se.

## Setup

This project uses Flutter 3.35.4. This is as of 2025-11-03 the most updated account of the version number.

1. Use our handy installation guide [here](https://fsek.readthedocs.io/en/latest/installing_systems/installation_app.html). Installation will include Dart.
1. You might need to include `flutter/bin` in your PATH environment variable.
1. Clone the repo: `git clone https://github.com/fsek/App2.git`
1. In the backend, search for and uncomment this line: `openapi_schema["servers"] = [{"url": "http://10.0.2.2:8000"}]`
1. Start the backend while running on the most up to date app backend branch [(which can be found here](https://github.com/fsek/WebWebWeb/pull/220) at the time of writing).
1. You might need to install some further things, in particular openapi-generator
1. Run `bash script.sh`, which will take care of most work for you.
1. Run `flutter run` or run the app via the VSCode standard runner. (If it tells you errors exist, try selecting "run anyway")
1. _If everything works, you can recomment the line again!_
