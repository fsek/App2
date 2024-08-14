import 'package:fsek_mobile/april_fools.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/settings/settings.dart'; //For the food-prefs link

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
  Map<String, List<String>?> foodPreferences = {};
  String? foodCustom;
  bool displayGroupInput = true;
  bool? drinkPackageAnswer;
  final Map<String, Style> _htmlStyle = {
    "body": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
    "p": Style(
        padding: HtmlPaddings.zero,
        margin: Margins.zero,
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
          this.foodPreferences['en'] = [...(value.food_preferences ?? [])];
          this.foodPreferences['sv'] = [...(value.food_preferences ?? [])];
          this.foodCustom = value.food_custom;
          for (int i = 0; i < (this.foodPreferences['sv']?.length ?? 0); i++) {
            this.foodPreferences['sv']![i] =
                foodPrefsDisplay[this.foodPreferences['sv']![i]] ?? "";
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
          this.foodPreferences['en'] = [...(value.food_preferences ?? [])];
          this.foodPreferences['sv'] = [...(value.food_preferences ?? [])];
          this.foodCustom = value.food_custom;
          for (int i = 0; i < (this.foodPreferences['sv']?.length ?? 0); i++) {
            this.foodPreferences['sv']![i] =
                foodPrefsDisplay[this.foodPreferences['sv']![i]] ?? "";
          }
        }));
  }

  void sendSignup() async {
    EventUser eventUser =
        EventUser(answer, group?.id, customGroup, userType, drinkPackageAnswer);
    /* just to be sure */
    if (group?.id != null) {
      customGroup = null;
    }
    int eventId = event?.id ?? -1;
    Map json = await AbstractService.post(
        "/events/" + eventId.toString() + "/event_users",
        mapBody: eventUser.toJson());
    if (!json.containsKey('errors')) {}
    update();
  }

  void removeSignup() async {
    int userId = event?.event_user?.id ?? -1;
    int eventId = event?.id ?? -1;
    Map json = await AbstractService.delete(
      "/events/" + eventId.toString() + "/event_users/" + userId.toString(),
    );
    if (!json.containsKey('errors')) {}
    update();
  }

  //Bör denna vara async som de andra funktionerna?
  void goToSettings() {
    Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsPage()))
        .then((_) {
      //uppdaterar sidan så man ser sin ändring
      update();
    });
  }

  Widget userTypeDropDown() {
    var t = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(t.eventPriority),
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
                child: Text(t.eventOther),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget groupDropdown() {
    var t = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.eventChooseGroup),
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
                child: Text(t.eventOtherDifferent),
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
                  hintText: t.eventCustomGroupName,
                )),
          ),
        ],
      ),
    );
  }

  Widget questionInput() {
    if (event?.event_signup?.question == null ||
        event?.event_signup?.question == "") {
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
    var t = AppLocalizations.of(context)!;
    Widget signup;
    String locale = Localizations.localeOf(context).toString();
    /* If no event or no event signup recieved */
    if (event == null || event?.event_signup == null) {
      return Container();
    }

    if (event!.can_signup!) {
      if (event!.event_signup!.open!)
        signup = signupWidget(t);
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
                  t.eventNotSignedUp,
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
            String userType = event!.event_user!.user_type ?? t.eventOther;
            if (!(event!.event_signup!.lottery ?? false)) {
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
                          t.eventNoSpot,
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
                          t.eventGotSpot,
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
            } else {
              signup = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: (isAprilFools
                            ? Color(0xFFF17F9F)
                            : Colors.orange[600]),
                      ),
                      Text(
                        t.eventLotterySpot,
                        style: TextStyle(
                          color: (isAprilFools
                              ? Color(0xFFF17F9F)
                              : Colors.orange[600]),
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
            t.eventSignUp,
            style: TextStyle(
                fontSize: 25,
                color: (isAprilFools ? Color(0xFFF17F9F) : Colors.orange[600])),
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
                      t.eventNbrSignUps + event!.event_user_count!.toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                    ),
                    Text(
                      t.eventNbrSpots + event!.event_signup!.slots!.toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.event_available_rounded,
                    ),
                    Text(
                      t.eventSignUpOpens +
                          DateFormat("d/M")
                              .format(event!.event_signup!.opens!.toLocal()) +
                          " " +
                          DateFormat("jm", locale)
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
                      t.eventSignUpCloses +
                          DateFormat("d/M")
                              .format(event!.event_signup!.closes!.toLocal()) +
                          " " +
                          DateFormat("jm", locale)
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
                Text(t.eventTechnicalDifficulties),
                InkWell(
                  child: new Text(
                    "spindelmännen",
                    style: TextStyle(
                      color: Colors.blue[300],
                    ),
                  ),
                  onTap: () => launchUrl(
                      Uri.parse("https://www.fsektionen.se/kontakter/1")),
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget signupWidget(AppLocalizations t) {
    String locale = Localizations.localeOf(context).toString();
    /* Failsafe */
    if (locale != "sv" && locale != "en") {
      locale = "en";
    }
    if (event == null) {
      if (event?.can_signup ?? false) return Container();
    }
    Widget drinkPackageInput = Container();
    if (event!.drink_package ?? false) {
      drinkPackageInput = Row(
        children: [
          Text(" ${t.eventDrinkPackage}"),
          Checkbox(
              value: drinkPackageAnswer ?? false,
              onChanged: (value) {
                setState(() {
                  this.drinkPackageAnswer = value;
                });
              }),
        ],
      );
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
              drinkPackageInput,
              Wrap(
                children: [
                  Text(t.eventFoodPreferences + " ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  ...?foodPreferences[locale]
                      ?.where((element) => element.isNotEmpty)
                      .map((foodPreference) => Text(foodPreference + " ")),
                  Text("  " + (foodCustom ?? "")),
                ],
              ),
              Wrap(children: [
                Text(
                  t.eventFoodPrefInfo,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                GestureDetector(
                  child: Text(t.eventLinkToFoodPrefs,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: (isAprilFools
                              ? Color(0xFFF17F9F)
                              : Colors.orange[600]))),
                  onTap: () => goToSettings(),
                ),
              ]),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: InkWell(
                    onTap: () => sendSignup(),
                    child: Card(
                      color: (isAprilFools
                          ? Color(0xFFF17F9F)
                          : Colors.orange[400]),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          t.eventSendSignup,
                          style: TextStyle(fontSize: 20),
                        ),
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
      String userType = event!.event_user!.user_type ?? t.eventOther;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._signupDetails(groupName, userType),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.center,
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
                      t.eventDesignup,
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
    var t = AppLocalizations.of(context)!;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(t.eventConfirmCancel),
            actions: [
              TextButton(
                child: Text(t.eventCancel),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              TextButton(
                child: Text(t.eventConfirmRemoveSignUp),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

  List<Widget> _signupDetails(String? groupName, String? userType) {
    var t = AppLocalizations.of(context)!;
    String locale = Localizations.localeOf(context).toString();
    /* Failsafe */
    if (locale != "sv" && locale != "en") {
      locale = "en";
    }
    Widget drinkPackage = Container();
    if (event!.drink_package ?? false) {
      if (event!.event_user!.drink_package_answer ?? false) {
        drinkPackage = RichText(
          text: TextSpan(
              text: t.eventDrinkPackage,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              children: [
                TextSpan(
                    text: t.eventYes,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black))
              ]),
        );
      } else {
        drinkPackage = RichText(
          text: TextSpan(
              text: t.eventDrinkPackage,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              children: [
                TextSpan(
                    text: t.eventNo,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black))
              ]),
        );
      }
    }
    return [
      RichText(
          text: TextSpan(
              text: t.eventGroup,
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
              text: t.eventPriority2,
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
      drinkPackage,
      Wrap(
        children: [
          RichText(
              text: TextSpan(
                  text: t.eventFoodPreferences + " ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black))),
          ...?foodPreferences[locale]
              ?.where((element) => element.isNotEmpty)
              .map((foodPreferences) => Text(foodPreferences + " ")),
          Text(foodCustom ?? ""),
        ],
      ),
      Wrap(children: [
        Text(
          t.eventFoodPrefInfo,
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        GestureDetector(
          child: Text(t.eventLinkToFoodPrefs,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color:
                      (isAprilFools ? Color(0xFFF17F9F) : Colors.orange[600]))),
          onTap: () => goToSettings(),
        ),
      ]),
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
    var t = AppLocalizations.of(context)!;
    String locale = Localizations.localeOf(context).toString();
    /* Failsafe */
    if (locale != "sv" && locale != "en") {
      locale = "en";
    }
    if (event == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(t.eventTitle),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.eventTitle),
      ),
      body: Container(
        // Introduction events have a different background
        decoration: event?.is_introduction == true ? BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/img/nollning-24/schedule/event_background.png"),
          fit: BoxFit.fill,
          ),
        ) : null,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: () => _onRefresh(),
            child: ListView(
              children: [
                Text(
                  event?.title ?? t.eventNoTitle,
                  style: TextStyle(
                    fontSize: 30,
                    color: (event?.is_introduction == true ? Color(0xFF630B0B) :
                        (isAprilFools ? Color(0xFFF17F9F) : Colors.orange[600])),
                  ),
                ),
                Divider(
                  color: (event?.is_introduction == true ? Color(0xFF565656) : null),
                ),
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
                          DateFormat("MMMMd", locale).format(
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
                Divider(
                  color: (event?.is_introduction == true ? Color(0xFF565656) : null),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(3, 15, 0, 15),
                  /* should be parsed html */
                  child: Html(
                      data: event?.description ?? t.eventNoDescription,
                      style: _htmlStyle,
                      onLinkTap: (String? url, Map<String, String> attributes,
                          element) {
                        launchUrl(Uri.parse(url!));
                      }),
                ),
                Divider(
                  color: (event?.is_introduction == true ? Color(0xFF565656) : null),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(t.eventDressCode),
                        ...?event?.dress_code
                            ?.map((dressCode) => Text(dressCode + " "))
                      ]),
                      Visibility(
                          visible: event!.cash ?? false,
                          child: Text(t.eventPrice +
                              (event?.price?.toString() ?? "") +
                              " kr")),
                    ],
                  ),
                ),
                Divider(
                  color: (event?.is_introduction == true ? Color(0xFF565656) : null),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Column(
                    children: [
                      Visibility(
                        visible: event!.cash ?? false,
                        child: Row(
                          children: [
                            Icon(Icons.attach_money_rounded),
                            Text(t.eventCostsMoney)
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
                            Text(t.eventFoodServed)
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
                            Text(t.eventAlcoholServed)
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
                            Text(t.eventHasSignup)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: event!.can_signup ?? false,
                  child: Divider(color: (event?.is_introduction == true ? Color(0xFF565656) : null)),
                ),
                Visibility(
                  visible: (!(event!.contact == null)),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.eventInCaseOfQuestions,
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
                                (event!.contact?.id ?? 0).toString(),
                          )),
                        ),
                        Divider(
                          color: (event?.is_introduction == true ? Color(0xFF565656) : null),
                        ),
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
