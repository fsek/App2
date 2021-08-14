import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/home/event.dart';
import 'package:fsek_mobile/models/home/eventsignup.dart';
import 'package:fsek_mobile/models/home/eventuser.dart';
import 'package:fsek_mobile/models/home/group.dart';
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

  String? user_type = null;
  Group? group = null;
  String? answer = null;
  String? custom_group;

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
    EventUser eventUser = EventUser(answer, group?.id, custom_group, user_type);
    /* just to be sure */
    if (group?.id != null) {
      custom_group = null;
    }
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

  Widget userTypeDropDown() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...?event!.user_types?.map(
            (ut) => ListTile(
              title: Text(ut[0]),
              leading: Radio<String?>(
                value: ut[1],
                groupValue: user_type,
                onChanged: (String? value) {
                  setState(() {
                    user_type = value;
                    custom_group = null;
                  });
                },
              ),
            ),
          ),
          ListTile(
            title: Text("Övrigt"),
            leading: Radio<String?>(
              value: null,
              groupValue: user_type,
              onChanged: (String? value) {
                setState(() {
                  user_type = null;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget groupRadio() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Grupp:"),
          ...?event!.groups?.map(
            (g) => ListTile(
              title: Text(g.name!),
              leading: Radio<Group?>(
                value: g,
                groupValue: group,
                onChanged: (Group? value) {
                  setState(() {
                    group = value;
                  });
                },
              ),
            ),
          ),
          ListTile(
            title: TextField(
              onChanged: (String? newValue) {
                setState(() {
                  custom_group = newValue;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Eget gruppnamn",
              ),
            ),
            leading: Radio<Group?>(
              value: null,
              groupValue: group,
              onChanged: (Group? value) {
                setState(() {
                  group = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget questionInput() {
    if (event?.question == "") {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(event?.event_signup?.question ?? ""),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            onChanged: (String? newValue) {
              setState(() {
                answer = newValue;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: event?.event_signup?.question,
            ),
          ),
        ),
      ],
    );
  }

  Widget signupInfoWidget() {
    Widget signup;
    /* If no event or no event signup recieved */
    if (event == null || event?.event_signup == null) {
      return Container();
    }

    if (event!.can_signup!) {
      if (event!.event_signup!.open!)
        signup = signupWidget();
      else {
        if (event!.event_signup!.closed!) {
          if (event!.event_user == null) {
            signup = Text("Du är inte anmäld");
          }
          if (event!.event_user?.reserve ?? true) {
            signup = Text("Du har tyvärr inte fått plats");
          } else {
            signup = Text("Du har fått plats!");
          }
        } else {
          signup = Text("anmälan inte öppen");
        }
      }
    } else {
      signup = Text("hej");
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
            signup,
          ],
        ),
      ),
    );
  }

  Widget signupWidget() {
    if (event == null) {
      if (event?.can_signup ?? false) return Container();
    }

    if (event?.event_user == null) {
      return Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              groupRadio(),
              userTypeDropDown(),
              questionInput(),
              Container(
                child: InkWell(
                  onTap: () => sendSignup(),
                  child: Card(
                    child: Text("Skicka anmälan"),
                  ),
                ),
              ),
            ],
          ));
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
          child: ListView(
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
              Row(children: [
                Text("Klädkod: "),
                ...?event?.dress_code?.map((dressCode) => Text(dressCode + " "))
              ]),
              Text("Pris: " + (event?.price?.toString() ?? "")),
              const Divider(),
              signupInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
