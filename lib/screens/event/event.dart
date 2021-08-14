import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/home/event.dart';
import 'package:fsek_mobile/models/home/eventsignup.dart';
import 'package:fsek_mobile/models/home/eventuser.dart';
import 'package:fsek_mobile/models/user/user.dart';
import 'package:intl/intl.dart';
import 'package:fsek_mobile/services/event.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class EventPage extends StatefulWidget {
  int event_id;
  EventPage({Key? key, required this.event_id}) : super(key: key);
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  Event? event;

  String? user_type;
  String? group;
  String? answer;

  void initState() {
    locator<EventService>()
        .getEvent(widget.event_id)
        .then((value) => setState(() {
              this.event = value;
            }));
    super.initState();
  }

  void update() {
    locator<EventService>()
        .getEvent(widget.event_id)
        .then((value) => setState(() {
              this.event = value;
            }));
  }

  void sendSignup() async {
    EventUser eventUser = EventUser("hej", 0, "", null);
    int eventId = event?.id ?? -1;
    Map json = await AbstractService.post(
        "/events/" + eventId.toString() + "/event_users",
        mapBody: eventUser.toJson());
    print(json);
    if (!json.containsKey('errors')) {}
    update();
  }

  void removeSignup() async {
    int userId = event?.event_user?.id ?? -1;
    int eventId = event?.id ?? -1;
    Map json = await AbstractService.delete(
      "/events/" + eventId.toString() + "/event_users/" + userId.toString(),
    );

    print(json);
    if (!json.containsKey('errors')) {}
    update();
  }

  Widget dropDown(title, List<String> options) {
    return Container();
  }

  Widget signupInfoWidget() {
    if (event == null) {
      return Container();
    }
    return Container(
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Anmälan",
              style: TextStyle(fontSize: 25, color: Colors.orange[600]),
            ),
            Text(
              "Antal anmälda: " + event!.event_user_count!.toString(),
            ),
            Text(
              "Antal platser: " + event!.event_signup!.slots!.toString(),
            ),
          ],
        ),
      ),
    );
  }

  Widget signupWidget() {
    if (event == null) {
      return Container();
    }

    if (event?.event_user == null) {
      return Container(
        width: double.infinity,
        child: InkWell(
          onTap: () => sendSignup(),
          child: Card(
            child: Text("Skicka anmälan"),
          ),
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        child: InkWell(
          onTap: () => removeSignup(),
          child: Card(
            child: Text("Avanmäl"),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (event == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Evenemang'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evenemang'),
      ),
      body: Container(
        width: double.infinity,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  event?.title ?? "ingen titel",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.orange[600],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Divider(),
              Text(
                /* better error checking */
                DateFormat("kk:mm").format(event?.starts_at ?? DateTime.now()) +
                    " - " +
                    DateFormat("kk:mm")
                        .format(event?.ends_at ?? DateTime.now()) +
                    ", " +
                    DateFormat("MMMMd")
                        .format(event?.starts_at ?? DateTime.now()),
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                event?.location ?? "intigheten",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
              const Divider(),
              Container(
                margin: EdgeInsets.all(10),
                /* should be parsed html */
                child: Text(event?.description ?? "ingen beskrivning"),
              ),
              const Divider(),
              signupInfoWidget(),
              signupWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
