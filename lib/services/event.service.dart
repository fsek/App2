import 'package:fsek_mobile/models/home/event.dart';
import 'package:fsek_mobile/models/home/calendarevent.dart';

import 'abstract.service.dart';

class EventService extends AbstractService {
  Future<Map<DateTime, List<CalendarEvent>>> getEvents() async {
    Map<DateTime, List<CalendarEvent>> result = {};
    Map json = await AbstractService.get("/events?start=20200101&end=20220813");
    List<CalendarEvent> eventlist = (json['events'] as List)
        .map((data) => CalendarEvent.fromJson(data))
        .toList();
    eventlist.forEach((event) {
      DateTime? eventDay = DateTime.utc((event.start?.year ?? 2021),
          (event.start?.month ?? 08), (event.start?.day ?? 08));
      if (result.containsKey(eventDay)) {
        result[eventDay]?.add(event);
      } else {
        result[eventDay] = [event];
      }
    });
    return result;
  }

  Future<Event> getEvent(int id) async {
    Map json = await AbstractService.get("/events/" + id.toString());
    Event event = Event.fromJson(json['event']);
    print(event.starts_at);
    return event;
  }
}
