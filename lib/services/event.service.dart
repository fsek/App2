import 'package:fsek_mobile/models/home/event.dart';
import 'package:fsek_mobile/models/home/calendarevent.dart';
import 'package:intl/intl.dart';

import 'abstract.service.dart';

class EventService extends AbstractService {
  Future<Map<DateTime, List<CalendarEvent>>> getEvents() async {
    Map<DateTime, List<CalendarEvent>> result = {};

    Map json = await AbstractService.get("/events?start=" +
        DateFormat("y", "sv_SE")
            .format(DateTime.now().subtract(Duration(days: 365))) +
        DateFormat("M", "sv_SE")
            .format(DateTime.now().subtract(Duration(days: 365))) +
        DateFormat("dd", "sv_SE")
            .format(DateTime.now().subtract(Duration(days: 365))) +
        "&end=" +
        DateFormat("y", "sv_SE")
            .format(DateTime.now().add(Duration(days: 365))) +
        DateFormat("M", "sv_SE")
            .format(DateTime.now().add(Duration(days: 365))) +
        DateFormat("dd", "sv_SE")
            .format(DateTime.now().add(Duration(days: 365))));
    List<CalendarEvent> eventlist = (json['events'] as List)
        .map((data) => CalendarEvent.fromJson(data))
        .toList();
    eventlist.forEach((event) {
      DateTime? eventDay = DateTime.utc(
          (event.start?.toLocal().year ?? 2010),
          (event.start?.toLocal().month ?? 01),
          (event.start?.toLocal().day ?? 01));
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
