import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/user/user.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/user.service.dart';
import 'package:intl/intl.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  User? user;
  static const programs = [
    "Teknisk Fysik",
    "Teknisk Matematik",
    "Teknisk Nanovetenskap",
    "Oklart"
  ];
  static const foodPrefs = [
    "vegetarian",
    "vegan",
    "pescetarian",
    "milk",
    "gluten"
  ];
  static const foodPrefsDisplay = {
    "sv": {
      "vegetarian": "Vegetarian",
      "vegan": "Vegan",
      "pescetarian": "Pescetarian",
      "milk": "Mjölkallergi",
      "gluten": "Gluten"
    },
    "en": {
      "vegetarian": "Vegetarian",
      "vegan": "Vegan",
      "pescetarian": "Pescetarian",
      "milk": "Milk Allergy",
      "gluten": "Gluten"
    }
  };
  static List<int> years =
      List.generate(DateTime.now().year - 1960, (i) => DateTime.now().year - i);

  bool extraPref = false;
  bool changedSetting = false;

  @override
  void initState() {
    locator<UserService>().getUser().then((value) {
      setState(() {
        user = value;
        extraPref = user!.food_custom != "";
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).toString();
    /* Failsafe */
    if (locale != "sv" && locale != "en") {
      locale = "en";
    }
    var t = AppLocalizations.of(context)!;
    if (user == null) {
      return Scaffold(
          appBar: AppBar(title: Text(t.settingsSettings)),
          body: Center(
              child: CircularProgressIndicator(color: Colors.orange[600])));
    }
    return WillPopScope(
      onWillPop: () async {
        if (changedSetting)
          await showDialog(context: context, builder: _saveOnClosePopup());
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.settingsSettings),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Center(
                  child: GestureDetector(
                    onTap: () => _save(),
                    child: Text(
                      t.settingsSave,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ), //Alot of the code here is duplicate. could be made much more compact
          body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _makeTextField(
                              t.settingsFirstName + "*", () => user!.firstname!,
                              (input) {
                            changedSetting = true;
                            user!.firstname = input;
                          }),
                          _makeTextField(
                              t.settingsLastName + "*", () => user!.lastname!,
                              (input) {
                            changedSetting = true;
                            user!.lastname = input;
                          }),
                          _makeDropDown<String>(t.settingsProgramme, programs,
                              () => user!.program, (program) {
                            setState(() {
                              if (program != user!.program) {
                                changedSetting = true;
                                user!.program = program;
                              }
                            });
                          }),
                          _makeDropDown<int>(t.settingsStartYear, years,
                              () => user!.start_year, (year) {
                            setState(() {
                              if (year != user!.start_year) {
                                changedSetting = true;
                                user!.start_year = year;
                              }
                            });
                          }),
                        ])),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12, 28, 12, 28),
                      child: Text(t.settingsParagraph),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _makeTextField(
                            "LUCAT-id",
                            () => user!.student_id != null
                                ? user!.student_id!
                                : "", (input) {
                          changedSetting = true;
                          user!.student_id = input;
                        }),
                        _makeTextField(t.settingsPhoneNumber,
                            () => user!.phone != null ? user!.phone! : "",
                            (input) {
                          changedSetting = true;
                          user!.phone = input;
                        }, num: true),
                        _makeCheckBox(t.settingsShowPhoneNumber,
                            () => user!.display_phone, (bool? change) {
                          setState(() {
                            changedSetting = true;
                            user!.display_phone = change;
                          });
                        }),
                        DropdownButton(
                          isExpanded: true,
                          hint: Text(t.settingsFoodPrefs),
                          items: foodPrefs
                              .map((foodPref) => DropdownMenuItem(
                                  child: Row(children: [
                                    Text(foodPrefsDisplay[locale]![foodPref]!),
                                    Spacer(),
                                    StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setChildState) {
                                      return Checkbox(
                                        checkColor: Colors.white,
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.orange[600]),
                                        value: user!.food_preferences!
                                            .contains(foodPref),
                                        onChanged: (bool? add) {
                                          setChildState(() {
                                            changedSetting = true;
                                            if (add!)
                                              user!.food_preferences!
                                                  .add(foodPref);
                                            else
                                              user!.food_preferences!
                                                  .remove(foodPref);
                                          });
                                        },
                                      );
                                    })
                                  ]),
                                  value: foodPref))
                              .toList()
                            ..add(DropdownMenuItem(
                              child: Row(children: [
                                Text(t.settingsOther),
                                Spacer(),
                                StatefulBuilder(builder: (BuildContext context,
                                    StateSetter setChildState) {
                                  return Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.orange[600]),
                                      value: extraPref,
                                      onChanged: (bool? add) {
                                        setChildState(() {
                                          extraPref = add!;
                                          if (!(add!)){
                                            user!.food_custom! = ""
                                          }
                                        });
                                        setState(() {});
                                      });
                                })
                              ]),
                              value: t.settingsOther,
                            )),
                          onChanged: (_) {
                            setState(() {});
                          },
                        ),
                        _extraPrefTextField(),
                        Text(
                          t.settingsFoodPrefsPrivacy,
                          style: TextStyle(color: Colors.grey[600]),
                        )
                      ]),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12, 28, 12, 28),
                      child: Text(t.settingsParagraph),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _makeCheckBox(t.settingsNotificationsSignUp,
                          () => user!.notify_event_users, (bool? change) {
                        setState(() {
                          changedSetting = true;
                          user!.notify_event_users = change;
                        });
                      }),
                      _makeCheckBox(t.settingsNotificationsMessage,
                          () => user!.notify_messages, (bool? change) {
                        setState(() {
                          changedSetting = true;
                          user!.notify_messages = change;
                        });
                      }),
                      _makeCheckBox(t.settingsNotificationsSignUpClosing,
                          () => user!.notify_event_closing, (bool? change) {
                        setState(() {
                          changedSetting = true;
                          user!.notify_event_closing = change;
                        });
                      }),
                      _makeCheckBox(t.settingsNotificationsSignUpOpening,
                          () => user!.notify_event_open, (bool? change) {
                        setState(() {
                          changedSetting = true;
                          user!.notify_event_open = change;
                        });
                      })
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(12, 28, 12, 28),
                        child: Text(
                            t.settingsMemberSince + " ${_makeTimestamp()}")),
                  ),
                ),
              ]))),
    );
  }

  Widget _extraPrefTextField() {
    var t = AppLocalizations.of(context)!;
    if (extraPref) {
      return Padding(
          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t.settingsOtherFoodPrefs),
            TextField(
              controller: TextEditingController(text: user!.food_custom),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              onChanged: (input) {
                user!.food_custom = input;
              },
            )
          ]));
    }
    return SizedBox.shrink();
  }

  Widget _makeTextField(String displayText, String Function() attrGetter,
      void Function(String?) modUser,
      {bool num = false}) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(displayText, style: TextStyle(fontSize: 16)),
            TextField(
                controller: TextEditingController(text: attrGetter()),
                decoration: InputDecoration(border: UnderlineInputBorder()),
                keyboardType: num ? TextInputType.number : null,
                onChanged: (change) => modUser(change))
          ],
        ));
  }

  Widget _makeDropDown<T>(String displayText, List<T> dropDownItems,
      T? Function() attrGetter, void Function(T?) modUser) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            displayText,
            style: TextStyle(fontSize: 16),
          ),
          DropdownButton<T>(
              autofocus: false,
              isExpanded: true,
              value: attrGetter(),
              items: dropDownItems
                  .map((item) => DropdownMenuItem(
                      child: Text(item.toString()), value: item))
                  .toList(),
              onChanged: (T? change) => modUser(change))
        ],
      ),
    );
  }

  Widget _makeCheckBox(String displayText, bool? Function() attrGetter,
      void Function(bool?) modUser) {
    return Row(children: [
      Text(displayText),
      Spacer(),
      Checkbox(
        checkColor: Colors.white,
        fillColor:
            MaterialStateProperty.resolveWith((states) => Colors.orange[600]),
        value: attrGetter(),
        onChanged: (bool? change) => modUser(change),
      )
    ]);
  }

  String _makeTimestamp() {
    DateTime memberSince = DateTime.parse(user!.member_at!);
    String locale = Localizations.localeOf(context).toString();

    return "${DateFormat.Hm().format(memberSince)}, ${DateFormat.d().format(memberSince)} "
        "${DateFormat.MMM(locale).format(memberSince)} ${DateFormat.y().format(memberSince)}";
  }

  Widget Function(BuildContext) _savingPopup() {
    var t = AppLocalizations.of(context)!;
    return (BuildContext context) => SimpleDialog(
            title: Text(t.settingsSaving,
                style: Theme.of(context).textTheme.headline5),
            children: [
              Column(
                children: [
                  CircularProgressIndicator(
                    color: Colors.orange[600],
                  ),
                ],
              )
            ]);
  }

  Widget Function(BuildContext) _failedPopup() {
    var t = AppLocalizations.of(context)!;
    return (BuildContext context) => SimpleDialog(
            title: Text(t.settingsWarning,
                style: Theme.of(context).textTheme.headline5),
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(t.settingsWarningText),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Paddin(EdgeInsets.all(8),
                  child: IconButton(
                    icon: Icon(Icons.check, color: Colors.grey[800]),
                    onPressed: () => Navigator.pop(context),
                  )
                )
              )
            ]
            );
  }

  Widget Function(BuildContext) _saveOnClosePopup() {
    var t = AppLocalizations.of(context)!;
    return (BuildContext context) => SimpleDialog(
          title: Text(t.settingsUnsaved,
              style: Theme.of(context).textTheme.headline5),
          children: [
            Center(
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(t.settingsUnsavedText)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:Padding(
                padding: EdgeInsets.all(8)
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(t.settingsDiscard)),
                    Spacer(),
                    TextButton(
                      onPressed: () async {
                        _save();
                        Navigator.pop(context);
                      },
                      child: Text(t.settingsSave))
                ],
              ),
              )
            )
          ],
        );
  }

  void _save() async {
    FocusScope.of(context).unfocus();
    showDialog(context: context, builder: _savingPopup());
    locator<UserService>().updateUser(user!).then((value) {
      setState(() {
        changedSetting = false;
      });
      Navigator.pop(context);
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(context: context, builder: _failedPopup());
    });
  }
}
