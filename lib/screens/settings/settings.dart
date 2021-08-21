import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/user/user.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/user.service.dart';
import 'package:intl/intl.dart';

class SettingsPage extends StatefulWidget {
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  User? user;
  static const programs = [
    "Teknisk Fysik",
    "Teknisk Matematik",
    "Teknisk Nanovetenska",
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
    "vegetarian": "Vegetarian",
    "vegan": "Vegan",
    "pescetarian": "Pescetarian",
    "milk": "Mjölkallergi",
    "gluten": "Gluten"
  };
  static List<int> years =
      List.generate(DateTime.now().year - 1960, (i) => DateTime.now().year - i);

  bool extraPref = false;

  void initState() {
    locator<UserService>().getUser().then((value) {
      setState(() {
        user = value;
        extraPref = user!.food_custom != "";
        print(user!.food_custom);
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    if (user == null) {
      return Scaffold(
          appBar: AppBar(title: Text("Inställningar")),
          body: Center(
              child: CircularProgressIndicator(color: Colors.orange[600])));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Inställningar"),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    showDialog(context: context, builder: _savingPopup());
                    locator<UserService>().updateUser(user!).then((value) {
                      setState(() {
                        extraPref = user!.food_custom != "";
                      });
                      Navigator.pop(context);
                      }).catchError((error) {
                        print("in error");
                        Navigator.pop(context);
                        showDialog(context: context, builder: _failedPopup());
                      });
                  },
                  child: Text(
                    "Spara",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ), //Alot of the code here is duplicate. could be made much more compact
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _makeTextField("Förnamn*", () => user!.firstname!,
                        (input) => user!.firstname = input),
                    _makeTextField("Efternamn*", () => user!.lastname!,
                        (input) => user!.lastname = input),
                    _makeDropDown<String>(
                        "Program", programs, () => user!.program, (program) {
                      setState(() {
                        if (program != user!.program) {
                          user!.program = program;
                        }
                      });
                    }),
                    _makeDropDown<int>("Startår", years, () => user!.start_year,
                        (year) {
                      setState(() {
                        if (year != user!.start_year) {
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
                child: Text("Nedstående fält används endast för "
                    "sektionsval, bilbokning samt arbete i Hilbert Café. "
                    "Kan ses av styrelse, administratörer samt ansvariga för"
                    "  val, bokning eller caféet"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _makeTextField(
                  "LUCAT-id",
                  () => user!.student_id != null ? user!.student_id! : "",
                  (input) => user!.student_id = input),
              _makeTextField(
                  "Telefon",
                  () => user!.phone != null ? user!.phone! : "",
                  (input) => user!.phone = input,
                  num: true),
              _makeCheckBox(
                  "Visa tel. för gruppmedlemmar",
                  () => user!.display_phone,
                  (bool? change) => setState(() {
                        user!.display_phone = change;
                      })),
              DropdownButton(
                isExpanded: true,
                hint: Text("Matpreferenser"),
                items: foodPrefs
                    .map((foodPref) => DropdownMenuItem(
                        child: Row(children: [
                          Text(foodPrefsDisplay[foodPref]!),
                          Spacer(),
                          StatefulBuilder(builder: (BuildContext context,
                              StateSetter setChildState) {
                            return Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.orange[600]),
                              value: user!.food_preferences!.contains(foodPref),
                              onChanged: (bool? add) {
                                setChildState(() {
                                  if (add!)
                                    user!.food_preferences!.add(foodPref);
                                  else
                                    user!.food_preferences!.remove(foodPref);
                                });
                              },
                            );
                          })
                        ]),
                        value: foodPref))
                    .toList()
                      ..add(DropdownMenuItem(
                        child: Row(children: [
                          Text("Annat"),
                          Spacer(),
                          StatefulBuilder(builder: (BuildContext context,
                              StateSetter setChildState) {
                            return Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.orange[600]),
                                value: extraPref,
                                onChanged: (bool? add) {
                                  setChildState(() => extraPref = add!);
                                  setState(() {});
                                });
                          })
                        ]),
                        value: "Annat",
                      )),
                onChanged: (_) {
                  setState(() {});
                },
              ),
              _extraPrefTextField(),
              Text(
                "Matprefersener kan endast ses av de som arrangerar"
                " evenmang som du anmält dig till.",
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
                child: Text("Nedstående fält används endast för "
                    "sektionsval, bilbokning samt arbete i Hilbert Café. "
                    "Kan ses av styrelse, administratörer samt ansvariga för"
                    "  val, bokning eller caféet"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _makeCheckBox(
                    "Notiser för eventanmälan", () => user!.notify_event_users,
                    (bool? change) {
                  setState(() {
                    user!.notify_event_users = change;
                  });
                }),
                _makeCheckBox(
                    "Notiser för meddelande", () => user!.notify_messages,
                    (bool? change) {
                  setState(() {
                    user!.notify_messages = change;
                  });
                }),
                _makeCheckBox("Notiser för eventanmälan stänger",
                    () => user!.notify_event_closing, (bool? change) {
                  setState(() {
                    user!.notify_event_closing = change;
                  });
                }),
                _makeCheckBox("Notiser för eventanmälan stänger",
                    () => user!.notify_event_open, (bool? change) {
                  setState(() {
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
                  child: Text("Medlemskap sedan ${_makeTimestamp()}")),
            ),
          ),
        ])));
  }

  Widget _extraPrefTextField() {
    if (extraPref) {
      return Padding(
          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Andra matpreferenser/allergier"),
              TextField(
                controller: TextEditingController(text: user!.food_custom),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
                onChanged: (input) {
                  user!.food_custom = input;
                },
              )
            ],
          ));
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

    return "${DateFormat.Hm().format(memberSince)}, ${DateFormat.d().format(memberSince)} "
        /*"${DateFormat.MMMM('sv_SE').format(memberSince)} */ "${DateFormat.y().format(memberSince)}"; //Doesnt work now
  }

  //Sometimes causes render overflow. Seems to be when saving while keyboard is active. Feels weird ):
  Widget Function(BuildContext) _savingPopup() {
    return (BuildContext context) =>
        SimpleDialog(title: Text("Sparar",
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
    return (BuildContext context) => 
      SimpleDialog(title: Text("Varning", 
        style: Theme.of(context).textTheme.headline5),
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text("Ändringarna kunde inte sparas ): "
              "Kolla din täckning och de obligatiska fälten."),
              ),
          ),
          Align(alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(Icons.check, color: Colors.grey[800]),
              onPressed: () => Navigator.pop(context),
            )
          )
        ]
      );
  }
}
