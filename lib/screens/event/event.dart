import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/home/event.dart';
import 'package:fsek_mobile/models/home/eventuser.dart';
import 'package:fsek_mobile/models/home/group.dart';
import 'package:intl/intl.dart';
import 'package:fsek_mobile/services/event.service.dart';
import 'package:fsek_mobile/services/user.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/abstract.service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';

class EventPage extends StatefulWidget {
  final int eventId;
  EventPage({Key? key, required this.eventId}) : super(key: key);
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  Event? event;
  String? userType;
  Group? group;
  String? answer;
  String? customGroup;
  List<String>? foodPreferences;
  String? foodCustom;
  bool displayGroupInput = true;
  final Map<String, Style> _htmlStyle = {
    "body": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
    "p": Style(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        lineHeight: LineHeight(1.2))
  };

  static const foodPrefsDisplay = {
    "vegetarian": "Vegetarian",
    "vegan": "Vegan",
    "pescetarian": "Pescetarian",
    "milk": "Mjölkallergi",
    "gluten": "Gluten"
  };
  void initState() {
    locator<EventService>()
        .getEvent(widget.eventId)
        .then((value) => setState(() {
              this.event = value;
            }));
    locator<UserService>().getUser().then((value) => setState(() {
          this.foodPreferences = [...(value.food_preferences ?? [])];
          this.foodCustom = value.food_custom;
          for (int i = 0; i < (this.foodPreferences?.length ?? 0); i++) {
            print(this.foodPreferences?[i]);
            this.foodPreferences![i] =
                foodPrefsDisplay[this.foodPreferences![i]] ?? "";
          }
        }));

    super.initState();
  }

  void update() {
    locator<EventService>()
        .getEvent(widget.eventId)
        .then((value) => setState(() {
              this.event = value;
              this.userType = null;
              this.group = null;
              this.answer = null;
            }));
    locator<UserService>().getUser().then((value) => setState(() {
          this.foodPreferences = [...(value.food_preferences ?? [])];
          this.foodCustom = value.food_custom;
          for (int i = 0; i < (this.foodPreferences?.length ?? 0); i++) {
            this.foodPreferences![i] =
                foodPrefsDisplay[this.foodPreferences![i]] ?? "";
          }
        }));
  }

  void sendSignup() async {
    EventUser eventUser = EventUser(answer, group?.id, customGroup, userType);
    /* just to be sure */
    if (group?.id != null) {
      customGroup = null;
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
          Text("Prioritering:"),
          DropdownButton<String?>(
            isExpanded: true,
            value: userType,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            onChanged: (String? newValue) {
              setState(() {
                userType = newValue;
              });
            },
            items: [
              ...?event!.user_types?.map(((List<String> ut) {
                return DropdownMenuItem<String?>(
                  value: ut[1],
                  child: Text(ut[0]),
                );
              })),
              DropdownMenuItem<String?>(
                value: null,
                child: Text("Övrigt"),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget groupDropdown() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Välj grupp:"),
          DropdownButton<Group?>(
            isExpanded: true,
            value: group,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            onChanged: (Group? newValue) {
              setState(() {
                group = newValue;
                if (newValue == null) {
                  displayGroupInput = true;
                } else {
                  displayGroupInput = false;
                }
              });
            },
            items: [
              ...?event!.groups?.map(((Group? g) {
                return DropdownMenuItem<Group?>(
                  value: g,
                  child: Text(g!.name!),
                );
              })),
              DropdownMenuItem<Group?>(
                value: null,
                child: Text("Annan"),
              )
            ],
          ),
          Visibility(
            visible: displayGroupInput,
            child: TextField(
                onChanged: (String? newValue) {
                  setState(() {
                    customGroup = newValue;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Skriv eget gruppnamn",
                )),
          ),
        ],
      ),
    );
  }

  Widget questionInput() {
    if (event?.event_signup?.question == null) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
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
      ),
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
            signup = Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: Colors.red[300],
                ),
                Text(
                  "Du var inte anmäld",
                  style: TextStyle(
                    color: Colors.red[300],
                  ),
                ),
              ],
            );
          } else {
            String groupName = "";
            if (event!.event_user!.group_id != null) {
              for (int i = 0; i < event!.groups!.length; i++) {
                if (event!.groups![i].id == event!.event_user!.group_id) {
                  groupName = event!.groups![i].name!;
                  break;
                }
              }
            } else {
              groupName = event!.event_user!.group_custom ?? "";
            }
            String userType = event!.event_user!.user_type ?? "Övrigt";
            if (event!.event_user?.reserve ?? false) {
              signup = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.cancel,
                        color: Colors.red[300],
                      ),
                      Text(
                        "Du fick tyvärr inte plats till eventet.",
                        style: TextStyle(
                          color: Colors.red[300],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  ..._signupDetails(groupName, userType),
                ],
              );
            } else {
              signup = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green[300],
                      ),
                      Text(
                        "Du har fått plats!",
                        style: TextStyle(
                          color: Colors.green[300],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  ..._signupDetails(groupName, userType),
                ],
              );
            }
          }
        } else {
          signup = SizedBox.shrink();
        }
      }
    } else {
      signup = Text("hej");
    }

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Anmälan",
            style: TextStyle(fontSize: 25, color: Colors.orange[600]),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                    ),
                    Text(
                      "  Antal anmälda: " + event!.event_user_count!.toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                    ),
                    Text(
                      "  Antal platser: " +
                          event!.event_signup!.slots!.toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.event_available_rounded,
                    ),
                    Text(
                      "  Anmälan öppnar: " +
                          DateFormat("d/M")
                              .format(event!.event_signup!.opens!.toLocal()) +
                          " " +
                          DateFormat("jm", "sv_SE")
                              .format(event!.event_signup!.opens!.toLocal()),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.event_busy_rounded,
                    ),
                    Text(
                      "  Anmälan stänger: " +
                          DateFormat("d/M")
                              .format(event!.event_signup!.closes!.toLocal()) +
                          " " +
                          DateFormat("jm", "sv_SE")
                              .format(event!.event_signup!.closes!.toLocal()),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          signup,
          const Divider(),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Vid tekniska problem med anmälan, kontakta "),
                InkWell(
                  child: new Text(
                    "spindelmännen",
                    style: TextStyle(
                      color: Colors.blue[300],
                    ),
                  ),
                  onTap: () => launchUrl(Uri.parse("https://www.fsektionen.se/kontakter/1")), // lmao
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget signupWidget() {
    if (event == null) {
      if (event?.can_signup ?? false) return Container();
    }

    if (event?.event_user == null) {
      return Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              groupDropdown(),
              userTypeDropDown(),
              questionInput(),
              Wrap(
                children: [
                  Text("  Matpreferenser:"),
                  ...?foodPreferences
                      ?.where((element) => element.isNotEmpty)
                      .map((foodPreference) => Text("  " + foodPreference)),
                  Text("  " + (foodCustom ?? "")),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: InkWell(
                  onTap: () => sendSignup(),
                  child: Card(
                    color: Colors.orange[400],
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Skicka anmälan",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ));
    } else {
      String groupName = "";
      if (event!.event_user!.group_id != null) {
        for (int i = 0; i < event!.groups!.length; i++) {
          if (event!.groups![i].id == event!.event_user!.group_id) {
            groupName = event!.groups![i].name!;
            break;
          }
        }
      } else {
        groupName = event!.event_user!.group_custom ?? "";
      }
      String userType = event!.event_user!.user_type ?? "Övrigt";
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._signupDetails(groupName, userType),
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 50,
              width: 200,
              child: InkWell(
                onTap: () async {
                  bool? unenroll = await _confirmUnenroll(context);
                  if (unenroll ?? false) removeSignup();
                },
                child: Card(
                  color: Colors.red[400],
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Avanmäl",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }
  }

  Future<bool?> _confirmUnenroll(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Är du säker på att du vill avanmäla dig?"),
            actions: [
              TextButton(
                child: Text("AVBRYT"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              TextButton(
                child: Text("AVANMÄL MIG"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

  List<Widget> _signupDetails(String? groupName, String? userType) {
    return [
      RichText(
          text: TextSpan(
              text: "Grupp: ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              children: [
            TextSpan(
                text: groupName,
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black))
          ])),
      RichText(
          text: TextSpan(
              text: "Prioritet: ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              children: [
            TextSpan(
                text: userType,
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black))
          ])),
      event!.event_signup!.question != ""
          ? RichText(
              text: TextSpan(
                  text: event!.event_signup!.question!,
                  children: [
                    TextSpan(text: " "),
                    TextSpan(
                        text: event!.event_user!.answer,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.black))
                  ],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)))
          : Container(),
      Wrap(
        children: [
          RichText(
              text: TextSpan(
                  text: "Matpreferenser: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black))),
          ...?foodPreferences
              ?.where((element) => element.isNotEmpty)
              .map((foodPreferences) => Text(foodPreferences + " ")),
          Text(foodCustom ?? ""),
        ],
      ),
    ];
  }

  String getDots() {
    switch (event!.dot) {
      case "single":
        return " (.)";
      case "double":
        return " (..)";
      default:
        return "";
    }
  }

  Future<void> _onRefresh() async {
    update();
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: () => _onRefresh(),
            child: ListView(
              children: [
                Text(
                  event?.title ?? "ingen titel",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.orange[600],
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                    ),
                    Text(
                      /* better error checking */
                      "  " +
                          DateFormat("HH:mm").format(
                              event?.starts_at?.toLocal() ?? DateTime.now()) +
                          getDots() +
                          " - " +
                          DateFormat("HH:mm").format(
                              event?.ends_at?.toLocal() ?? DateTime.now()) +
                          ", " +
                          DateFormat("MMMMd", "sv_SE").format(
                              event?.starts_at?.toLocal() ?? DateTime.now()),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.room,
                    ),
                    Text(
                      "  " + (event?.location ?? "intigheten"),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Container(
                  margin: EdgeInsets.fromLTRB(3, 15, 0, 15),
                  /* should be parsed html */
                  child: Html(
                      data: event?.description ?? "ingen beskrivning",
                      style: _htmlStyle,
                      onLinkTap: (String? url, RenderContext context,
                          Map<String, String> attributes, element) {
                        launchUrl(Uri.parse(url!));
                      }),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text("Klädkod: "),
                        ...?event?.dress_code
                            ?.map((dressCode) => Text(dressCode + " "))
                      ]),
                      Visibility(
                          visible: event!.cash ?? false,
                          child: Text("Pris: " +
                              (event?.price?.toString() ?? "") +
                              " kr")),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Column(
                    children: [
                      Visibility(
                        visible: event!.cash ?? false,
                        child: Row(
                          children: [
                            Icon(Icons.attach_money_rounded),
                            Text("  Kostar pengar")
                          ],
                        ),
                      ),
                      Visibility(
                        visible: event!.food ?? false,
                        child: Row(
                          children: [
                            Icon(
                              Icons.restaurant_rounded,
                            ),
                            Text("  Mat serveras")
                          ],
                        ),
                      ),
                      Visibility(
                        visible: event!.drink ?? false,
                        child: Row(
                          children: [
                            Icon(
                              Icons.wine_bar_rounded,
                            ),
                            Text("  Alkohol serveras")
                          ],
                        ),
                      ),
                      Visibility(
                        visible: event!.can_signup ?? false,
                        child: Row(
                          children: [
                            Icon(
                              Icons.event_rounded,
                            ),
                            Text("  Kräver anmälan")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: event!.can_signup ?? false,
                  child: const Divider(),
                ),
                Visibility(
                  visible: (!(event!.contact == null)),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vid frågor om eventet, kontakta eventansvarig:",
                        ),
                        InkWell(
                          child: new Text(
                            event!.contact?.name ?? "",
                            style: TextStyle(
                              color: Colors.blue[300],
                            ),
                          ),
                          onTap: () => launchUrl(Uri.parse(
                            "https://www.fsektionen.se/kontakter/" +
                                (event!.contact?.id ?? 0).toString())
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
                signupInfoWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
