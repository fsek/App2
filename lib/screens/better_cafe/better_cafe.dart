import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/models/better_cafe/menu_item.dart';
import 'package:fsek_mobile/screens/better_cafe/cafe_work.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fsek_mobile/services/cafe.service.dart';

import '../../models/better_cafe/cafe_day.dart';

class BetterCafePage extends StatefulWidget {
  @override
  _BetterCafePageState createState() => _BetterCafePageState();
}

class _BetterCafePageState extends State<BetterCafePage> {
  List<MenuItem> items = [];
  List<CafeDay> days = [];

  _BetterCafePageState() {
    _loadMenuItems().then(
      (value) => setState(
        () {
          this.items = value;
        },
      ),
    );
    _loadCafeDays().then(
      (value) => setState(
        () {
          this.days = value;
        },
      ),
    );
  }

  Future<List<MenuItem>> _loadMenuItems() async {
    final String raw =
        await rootBundle.loadString('assets/data/menu_items.json');
    Map<String, dynamic> jsonRaw = await json.decode(raw);
    List<MenuItem> out = (jsonRaw['menu_items'] as List)
        .map((data) => MenuItem.fromJson(data))
        .toList();
    return out;
  }

  Future<List<CafeDay>> _loadCafeDays() async {
    final String raw =
        await rootBundle.loadString('assets/data/cafe_days.json');
    Map<String, dynamic> jsonRaw = await json.decode(raw);
    List<CafeDay> out = (jsonRaw['cafe_days'] as List)
        .map((data) => CafeDay.fromJson(data))
        .toList();
    return out;
  }

  Widget _createMenu(MenuItem mi) {
    String locale = Localizations.localeOf(context).toString();
    return ListTile(
      title: Text(mi.item![locale]! + " " + mi.price!),
      visualDensity: VisualDensity(vertical: -4),
    );
  }

  Widget _createSandwichMenu(CafeDay cafeday) {
    String locale = Localizations.localeOf(context).toString();
    String sandwichString = "";

    //loop thorugh the sandwiches of the day and build a nice looking string
    //for the subtitle below
    cafeday.sandwiches!.forEach((sandwich) => sandwichString = sandwichString +
        sandwich.name![locale]! +
        " " +
        sandwich.price! +
        '\n');

    return ListTile(
      title: Text(
        cafeday.weekday![locale]!,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(sandwichString,
          style: TextStyle(color: Colors.black.withOpacity(0.9))),
      visualDensity: VisualDensity(vertical: -4),
    );
  }

  Widget build(BuildContext context) {
    bool _tileExpanded = false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hilbert Café"),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(60, 5, 60, 5),
              child: Image.asset('assets/img/cafe_logo.png',
                  alignment: Alignment.topCenter),
            ),
            Text(
              "Välkommen till Hilbert Café!",
              style: TextStyle(
                color: Colors.orange[800],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'Meny',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                      'Här kan du kolla igenom kaféets klassiker och dess priser'),
                  children: [
                    ...items.map(
                      (MenuItem mi) => _createMenu(mi),
                    )
                  ],
                  onExpansionChanged: (bool expanded) {
                    setState(() => _tileExpanded = expanded);
                  },
                ),
                ExpansionTile(
                  title: Text(
                    'Veckans mackmeny, läsvecka:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Här kan du se veckans smarriga mackor'),
                  children: [
                    ...days.map(
                      (CafeDay day) => _createSandwichMenu(day),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => CafeWorkPage())));
                  },
                  child: Text('Jobba i caféet'),
                ),
                Text("Glutenintolerant? Beställ macka här!"),
                TextButton(
                    onPressed: () {
                      launch("http://contact.fsektionen.se");
                    },
                    child: Text("Specialmacka:D"))
              ],
            )
          ],
        ),
      ),
      // backgroundColor: Colors.white,
    );
  }
}
