import 'package:fsek_mobile/models/home/event.dart';

import 'abstract.service.dart';

class EventService extends AbstractService {
  Future<Map<DateTime, List<Event>>> getEvents() async {
    Map<DateTime, List<Event>> result = {};
    Map json = await AbstractService.get("/events?start=20200101&end=20220813");
    print((json['events'] as List).map((data) => data).toList()[0]);

    List<Event> eventlist =
        (json['events'] as List).map((data) => Event.fromJson(data)).toList();
    eventlist.forEach((event) {
      DateTime? eventDay = DateTime.utc((event.start?.year ?? 2021),
          (event.start?.month ?? 08), (event.start?.day ?? 08));
      if (result.containsKey(eventDay)) {
        result[eventDay]?.add(event);
      } else {
        result[eventDay] = [event];
      }
    });
    print(result);
    return result;
  }
}
