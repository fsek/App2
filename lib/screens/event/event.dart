import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/contact/contact.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/settings/settings.dart'; //For the food-prefs link
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class EventPage extends StatefulWidget {
  final int eventId;
  EventPage({Key? key, required this.eventId}) : super(key: key);
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  EventRead? event;
  AdminUserRead? user;
  String? userType;
  GroupRead? group;
  // String? answer;
  String? customGroup;
  String? foodCustom;
  Map<String, List<String>?> foodPreferences = {};
  bool displayGroupInput = false;
  String? drinkPackageAnswer;
  GroupRead? defaultGroup;
  EventSignupRead? eventSignup;
  List<String>? priorites = [];

  final Map<String, Style> _htmlStyle = {
    "body": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
    "p": Style(
        padding: HtmlPaddings.zero,
        margin: Margins.zero,
        lineHeight: LineHeight(1.2)),
  };

  static const foodPrefsDisplay = {
    "vegetarian": "Vegetarian",
    "vegan": "Vegan",
    "pescetarian": "Pescetarian",
    "milk": "Mjölkallergi",
    "gluten": "Gluten",
  };

  static const prioritiesSvToEn = {
    "Nolla": "Mentee",
    "Gruppfadder": "Mentor",
    "Uppdragsfadder": "Mentor",
    "Fotograf": "Photographer",
  };

  static const String drinkPackageNone = "None";
  static const String drinkPackageAlcohol = "Alcohol";
  static const String drinkPackageAlcoholFree = "AlcoholFree";

  static const Map<String, EventSignupCreateDrinkPackageEnum>
      drinkPackageToEnum = {
    "None": EventSignupCreateDrinkPackageEnum.none,
    "Alcohol": EventSignupCreateDrinkPackageEnum.alcohol,
    "AlcoholFree": EventSignupCreateDrinkPackageEnum.alcoholFree
  };

  void initState() {
    super.initState();
    _loadInitData();
  }

  Future<void> _loadInitData() async {
    try {
      final eventResponse = await ApiService.apiClient
          .getEventsApi()
          .eventsGetSingleEvent(eventId: widget.eventId);

      final event = eventResponse.data;
      if (event == null) return;

      final userResponse =
          await ApiService.apiClient.getUsersApi().usersGetMe();

      final user = userResponse.data;
      if (user == null) return;

      EventSignupRead? eventSignup = null;

      try {
        final userSignupResponse = await ApiService.apiClient
            .getEventSignupApi()
            .eventSignupGetMeEventSignup(eventId: event.id);

        eventSignup = userSignupResponse.data;
      } catch (e) {
        if (e is DioException && e.response!.statusCode == 404) {
          eventSignup = null;
        } else {
          rethrow;
        }
      }

      final prioritesResponse =
          await ApiService.apiClient.getUsersApi().usersGetMyPriorities();

      setState(() {
        this.event = event;
        this.user = user;
        this.eventSignup = eventSignup;
        this.drinkPackageAnswer = drinkPackageAlcohol;
        this.priorites = prioritesResponse.data!.toList();
        if (user.groups.isNotEmpty) {
          this.defaultGroup = user.groups.first;
          this.group = defaultGroup;
        } else {
          this.displayGroupInput = true;
        }
        this.foodPreferences['en'] = [...(user.standardFoodPreferences ?? [])];
        this.foodPreferences['sv'] = [...(user.standardFoodPreferences ?? [])];
        this.foodCustom = user.otherFoodPreferences;
        for (int i = 0; i < (this.foodPreferences['sv']?.length ?? 0); i++) {
          this.foodPreferences['en']![i] =
              foodPrefsDisplay[this.foodPreferences['en']![i]] ?? "";
        }
      });
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  void update() {
    _loadInitData();
  }

  Future<void> _onRefresh() async {
    update();
  }

  Widget alcoholEventRow(EventRead event, BuildContext context) {
    var t = AppLocalizations.of(context)!;
    if (event.alcoholEventType == "Alcohol-Served") {
      return Row(children: [
        Icon(Icons.wine_bar_rounded),
        Text("  " + t.eventAlcoholServed)
      ]);
    }

    if (event.isNollningEvent && event.alcoholEventType == "Alcohol") {
      return Row(children: [
        Icon(Icons.local_drink_rounded),
        Text("  " + t.eventAlcoholMayAppear)
      ]);
    }

    if (event.isNollningEvent && event.alcoholEventType == "None") {
      return Row(children: [
        Icon(Icons.no_drinks_rounded),
        Text("  " + t.eventAlcoholFree)
      ]);
    }

    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    String locale = Localizations.localeOf(context).toString();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: () => _onRefresh(),
            child: ListView(
              children: [
                Text(locale == "sv" ? event!.titleSv : event!.titleEn,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 30,
                        )),
                Divider(
                  color: null,
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
                              event?.startsAt.toLocal() ?? DateTime.now()) +
                          getDots() +
                          " - " +
                          DateFormat("HH:mm").format(
                              event?.endsAt.toLocal() ?? DateTime.now()) +
                          ", " +
                          DateFormat("MMMMd", locale).format(
                              event?.startsAt.toLocal() ?? DateTime.now()),
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodyMedium!.color),
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
                          color: Theme.of(context).textTheme.bodyMedium!.color),
                    ),
                  ],
                ),
                Divider(
                  color: null,
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: double.infinity,
                    /* should be parsed html */
                    child: Markdown(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      data: (locale == "sv"
                              ? event!.descriptionSv
                              : event!.descriptionEn)
                          .replaceAll("<br />", ""),
                      onTapLink: (text, href, title) {
                        if (href != null) {
                          launchUrl(Uri.parse(href));
                        }
                      },
                      styleSheet:
                          MarkdownStyleSheet.fromTheme(Theme.of(context))
                              .copyWith(
                        p: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(height: 1.2),
                      ),
                    )),
                Divider(
                  color: null,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(t.eventDressCode + event!.dressCode)
                      ]),
                      Visibility(
                          visible: event!.price <= 0 ? false : true,
                          child: Text(t.eventPrice +
                              (event?.price.toString() ?? "") +
                              " kr")),
                    ],
                  ),
                ),
                Divider(
                  color: null,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Column(
                    children: [
                      Visibility(
                        visible: event!.price <= 0 ? false : true,
                        child: Row(
                          children: [
                            Icon(Icons.attach_money_rounded),
                            Text(t.eventCostsMoney)
                          ],
                        ),
                      ),
                      Visibility(
                        visible: event!.food,
                        child: Row(
                          children: [
                            Icon(
                              Icons.restaurant_rounded,
                            ),
                            Text(t.eventFoodServed)
                          ],
                        ),
                      ),
                      alcoholEventRow(event!, context),
                      Visibility(
                        visible: event!.canSignup,
                        child: Row(
                          children: [
                            Icon(
                              Icons.event_rounded,
                            ),
                            Text(t.eventHasSignup)
                          ],
                        ),
                      ),
                      Visibility(
                        visible: event!.lottery,
                        child: Row(
                          children: [
                            Icon(
                              Icons.casino_outlined,
                            ),
                            Text("  " + t.eventHasLottery)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: event!.canSignup,
                  child: Divider(
                    color: null,
                  ),
                ),
                Visibility(
                  visible: (!(event!.council == null)),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.eventInCaseOfQuestions,
                        ),
                        InkWell(
                          child: new Text(
                            t.localeName == "sv"
                                ? event!.council.nameSv
                                : event!.council.nameEn,
                            style: TextStyle(
                              color: Colors.blue[300],
                            ),
                          ),
                          onTap: () => _goToPostContact(event!.council.nameSv),
                        ),
                        Divider(
                          color: null,
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

  void sendSignup() async {
    if (drinkPackageAnswer == null || drinkPackageAnswer == "") {
      setState(() {
        drinkPackageAnswer = drinkPackageNone;
      });
    }

    final eventSignupCreate = EventSignupCreate((b) => b
      ..userId = user!.id
      ..priority = userType
      ..groupName = group?.name ?? customGroup
      ..drinkPackage = drinkPackageToEnum[drinkPackageAnswer]);

    await ApiService.apiClient.getEventSignupApi().eventSignupEventSignupRoute(
        eventId: event!.id, eventSignupCreate: eventSignupCreate);

    update();
  }

  void removeSignup() async {
    int userId = user?.id ?? -1;
    int eventId = event?.id ?? -1;

    await ApiService.apiClient
        .getEventSignupApi()
        .eventSignupEventSignoffRoute(eventId: eventId, userId: userId);
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
              if (event!.priorities.toList().isNotEmpty)
                ...event!.priorities
                    .where((prio) => priorites!.contains(prio.priority))
                    .map((prio) => DropdownMenuItem<String?>(
                          value: prio.priority,
                          child: Text(t.localeName == "en"
                              ? (prioritiesSvToEn[prio.priority] ??
                                  prio.priority)
                              : prio.priority),
                        )),
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

    if (user == null) {
      return CircularProgressIndicator();
    }

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.eventChooseGroup),
          DropdownButton<GroupRead?>(
            isExpanded: true,
            value: group,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            onChanged: (GroupRead? newValue) {
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
              if (user!.groups.toList().isNotEmpty)
                ...user!.groups.map(((GroupRead? g) {
                  return DropdownMenuItem<GroupRead?>(
                      value: g, child: Text(g!.name));
                })),
              DropdownMenuItem<GroupRead?>(
                value: null,
                child: Text(t.eventOtherDifferent),
              ),
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

  // This is ugly af but works
  String isSignupOpen(EventRead event) {
    if (event.signupStart.toLocal().isBefore(DateTime.now())) {
      if (event.signupEnd.toLocal().isAfter(DateTime.now())) {
        return "open";
      }
      return "closed";
    }
    return "upcoming";
  }

  Widget signupInfoWidget() {
    var t = AppLocalizations.of(context)!;
    Widget signup;
    String locale = Localizations.localeOf(context).toString();
    // If no event
    if (event == null) {
      return Container(
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
              onTap: () => _goToPostContact("Spindelman"),
            ),
            Divider(
              color: null,
            ),
          ],
        ),
      );
    }
    if (!event!.canSignup) {
      return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.local_activity_outlined),
                Text("  " + t.eventNoSignup),
              ],
            ),
            Divider(
              color: null,
            ),
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
                    onTap: () => _goToPostContact("Spindelman"),
                  ),
                  Divider(
                    color: null,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    if (event!.canSignup) {
      if (isSignupOpen(event!) == "open") {
        signup = signupWidget(t);
      } else {
        if (isSignupOpen(event!) == "closed") {
          if (eventSignup == null) {
            signup = Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: Colors.red[
                      300], // I don't like it, but this hardcoding kinda just works
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
            String? groupName = eventSignup!.groupName;
            String userType = eventSignup!.priority;
            if (event!.eventUsersConfirmed) {
              if (!eventSignup!.confirmedStatus) {
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
                    Divider(
                      color: null,
                    ),
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
                    Divider(
                      color: null,
                    ),
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
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        t.eventLotterySpot,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: null,
                  ),
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
      signup = SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.eventSignUp,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Divider(
            color: null,
          ),
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
                      t.eventNbrSignUps + event!.signupCount.toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                    ),
                    Text(
                      t.eventNbrSpots +
                          (event!.maxEventUsers == 0
                              ? t.unlimited
                              : event!.maxEventUsers.toString()),
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
                              .format(event!.signupStart.toLocal()) +
                          " " +
                          DateFormat("jm", locale)
                              .format(event!.signupStart.toLocal()),
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
                          DateFormat("d/M").format(event!.signupEnd.toLocal()) +
                          " " +
                          DateFormat("jm", locale)
                              .format(event!.signupEnd.toLocal()),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: null,
          ),
          signup,
          Divider(
            color: null,
          ),
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
                  onTap: () => _goToPostContact("Spindelman"),
                ),
                Divider(
                  color: null,
                ),
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
    // if (event == null) {
    //   if (event?.can_signup ?? false) return Container();
    // }
    Widget drinkPackageInput = Container();
    if (!(event!.alcoholEventType == "None") & event!.drinkPackage) {
      drinkPackageInput = Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(" ${t.eventDrinkPackage}"),
          Container(
              height: 50,
              child: DropdownButton<String?>(
                isExpanded: false,
                value: drinkPackageAnswer,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                onChanged: (String? newValue) {
                  setState(() {
                    drinkPackageAnswer = newValue;
                  });
                },
                items: [
                  DropdownMenuItem<String?>(
                    value: drinkPackageAlcohol,
                    child: Text(t.eventAlcohol),
                  ),
                  DropdownMenuItem<String?>(
                    value: drinkPackageAlcoholFree,
                    child: Text(t.eventAlcoholFree),
                  ),
                  DropdownMenuItem<String?>(
                    value: drinkPackageNone,
                    child: Text(t.eventNoAlcohol),
                  )
                ],
              )),
        ],
      );
    }
    if (eventSignup == null) {
      return Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              groupDropdown(),
              userTypeDropDown(),
              // questionInput(),
              drinkPackageInput,
              Wrap(
                children: [
                  Text(t.eventFoodPreferences + " ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).textTheme.bodyMedium!.color)),
                  ...?foodPreferences[locale]
                      ?.where((element) => element.isNotEmpty)
                      .map((foodPreference) => Text(foodPreference + " ")),
                  Text("  " + (foodCustom ?? "")),
                ],
              ),
              Wrap(children: [
                Text(
                  t.eventFoodPrefInfo,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).textTheme.bodyMedium!.color),
                ),
                GestureDetector(
                  child: Text(t.eventLinkToFoodPrefs,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.primary)),
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
                      color: Theme.of(context).colorScheme.primary,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          t.eventSendSignup,
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ));
    } else {
      String? groupName = eventSignup!.groupName;
      String userType = eventSignup!.priority;
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
                  color: Theme.of(context).colorScheme.error,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      t.eventDesignup,
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onError),
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
    if (event!.drinkPackage) {
      switch (eventSignup!.drinkPackage.name) {
        case "alcohol": // Had to hard code this cuz the openapi generator lowered all enums... TODO maybe change this later...
          drinkPackage =
              _drinkPackageWidget(t.eventDrinkPackage, " ${t.eventAlcohol}");
          break;
        case "alcoholFree":
          drinkPackage = _drinkPackageWidget(
              t.eventDrinkPackage, " ${t.eventAlcoholFree}");
          break;
        case "none":
          drinkPackage =
              _drinkPackageWidget(t.eventDrinkPackage, " ${t.eventNoAlcohol}");
          break;
        default:
          this.drinkPackageAnswer = drinkPackageNone;
          drinkPackage =
              _drinkPackageWidget(t.eventDrinkPackage, " ${t.eventNoAlcohol}");
          break;
      }
    }
    return [
      RichText(
          text: TextSpan(
        text: t.eventGroup,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyMedium!.color),
        children: [
          TextSpan(
              text: " $groupName",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).textTheme.bodyMedium!.color))
        ],
      )),
      RichText(
          text: TextSpan(
        text: t.eventPriority2,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyMedium!.color),
        children: [
          TextSpan(
              text: t.localeName == "en"
                  ? (prioritiesSvToEn[userType] ?? userType)
                  : userType,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).textTheme.bodyMedium!.color))
        ],
      )),
      // event!.event_signup!.question != ""
      //     ? RichText(
      //         text: TextSpan(
      //             text: event!.event_signup!.question!,
      //             children: [
      //               TextSpan(text: " "),
      //               TextSpan(
      //                   text: event!.event_user!.answer,
      //                   style: TextStyle(fontWeight: FontWeight.normal, color: Theme.of(context).textTheme.bodyMedium!.color))
      //             ],
      //             style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyMedium!.color)))
      //     : Container(),
      drinkPackage,
      Wrap(
        children: [
          RichText(
              text: TextSpan(
            text: t.eventFoodPreferences + " ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyMedium!.color),
          )),
          ...?foodPreferences[locale]
              ?.where((element) => element.isNotEmpty)
              .map((foodPreferences) => Text(foodPreferences + " ")),
          Text(foodCustom ?? ""),
        ],
      ),
      Wrap(children: [
        Text(
          t.eventFoodPrefInfo,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Theme.of(context).textTheme.bodyMedium!.color),
        ),
        GestureDetector(
          child: Text(t.eventLinkToFoodPrefs,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.primary)),
          onTap: () => goToSettings(),
        ),
      ]),
    ];
  }

  Widget _drinkPackageWidget(String drinkPackageText, String choice) {
    return RichText(
      text: TextSpan(
        text: drinkPackageText,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyMedium!.color),
        children: [
          TextSpan(
              text: choice,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).textTheme.bodyMedium!.color))
        ],
      ),
    );
  }

  String getDots() {
    switch (event!.dot) {
      case "Single":
        return " (.)";
      case "Double":
        return " (..)";
      default:
        return "";
    }
  }

  Map<String, String> _councilPostMap = {
    "Prylmästeriet": "Prylmästare",
    "Föset": "Cofös",
    "Sanningsministeriet": "Sanningsminister",
    "Bokförlaget": "Kassör",
    "Cafemästeriet": "Cafemästare",
    "Externa representanter": "Utbildningsminister",
    "Studierådet": "Utbildningsminister",
    "Kulturministeriet": "Kulturminister",
    "Näringslivsutskottet": "Näringslivsansvarig",
    "Samvetet": "Samvetesansvarig",
    "Sekret service": "Sekreterare",
    "Sexmästeriet": "Sexmästare",
    "Styrelsen": "Ordförande",
  };

  void _goToPostContact(String nameSv) {
    String finalname = _councilPostMap[nameSv] ?? "Spindelman";
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => ContactPage(initPostNameSv: finalname))));
  }
}
