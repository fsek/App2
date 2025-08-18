import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for EventSignupApi
void main() {
  final instance = ApiClient().getEventSignupApi();

  group(EventSignupApi, () {
    // Event Signoff Route
    //
    //Future<EventRead> eventSignupEventSignoffRoute(int eventId, EventSignupDelete eventSignupDelete) async
    test('test eventSignupEventSignoffRoute', () async {
      // TODO
    });

    // Event Signup Route
    //
    //Future<EventRead> eventSignupEventSignupRoute(int eventId, EventSignupCreate eventSignupCreate) async
    test('test eventSignupEventSignupRoute', () async {
      // TODO
    });

    // Update Event Signup Route
    //
    //Future<EventRead> eventSignupUpdateEventSignupRoute(int eventId, EventSignupUpdate eventSignupUpdate) async
    test('test eventSignupUpdateEventSignupRoute', () async {
      // TODO
    });

  });
}
