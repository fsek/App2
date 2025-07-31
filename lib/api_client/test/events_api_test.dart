import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for EventsApi
void main() {
  final instance = ApiClient().getEventsApi();

  group(EventsApi, () {
    // Add Tag To Event
    //
    //Future<AddEventTag> eventsAddTagToEvent(AddEventTag addEventTag) async
    test('test eventsAddTagToEvent', () async {
      // TODO
    });

    // Create Event
    //
    //Future<EventRead> eventsCreateEvent(EventCreate eventCreate) async
    test('test eventsCreateEvent', () async {
      // TODO
    });

    // Event Remove
    //
    //Future<EventRead> eventsEventRemove(int eventId) async
    test('test eventsEventRemove', () async {
      // TODO
    });

    // Event Update
    //
    //Future<EventRead> eventsEventUpdate(int eventId, EventUpdate eventUpdate) async
    test('test eventsEventUpdate', () async {
      // TODO
    });

    // Get All Event Signups
    //
    //Future<BuiltList<UserRead>> eventsGetAllEventSignups(int eventId) async
    test('test eventsGetAllEventSignups', () async {
      // TODO
    });

    // Get All Events
    //
    //Future<BuiltList<EventRead>> eventsGetAllEvents() async
    test('test eventsGetAllEvents', () async {
      // TODO
    });

    // Get Event Tags
    //
    //Future<BuiltList<EventTagRead>> eventsGetEventTags(int eventId) async
    test('test eventsGetEventTags', () async {
      // TODO
    });

    // Get Random Event Signup
    //
    //Future<BuiltList<UserRead>> eventsGetRandomEventSignup(int eventId) async
    test('test eventsGetRandomEventSignup', () async {
      // TODO
    });

  });
}
