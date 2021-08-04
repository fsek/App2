import 'package:fsek_mobile/models/home/event.dart';

import 'abstract.service.dart';

class EventService extends AbstractService {
  Future<String> getEvents() async {
    Map json = await AbstractService.get("/events");
    print(json);
    return "Hej";
  }
}
