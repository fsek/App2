import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/models/better_cafe/menu_item.dart';

import '../../models/better_cafe/sandwich.dart';

class BetterCafePage extends StatefulWidget {
  BetterCafePage({Key? key}) : super(key: key);

  @override
  _BetterCafePageState createState() => _BetterCafePageState();
}

class _BetterCafePageState extends State<BetterCafePage> {
  List<MenuItem> data = [];
  List<Sandwich> dataS = [];

  _BetterCafePageState() {
    _loadMenuItems().then(
      (value) => setState(
        () {
          this.data = value;
        },
      ),
    );
    _loadSandwiches().then(
      (value) => setState(
        () {
          this.dataS = value;
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

  Future<List<Sandwich>> _loadSandwiches() async {
    final String raw =
        await rootBundle.loadString('assets/data/sandwiches.json');
    Map<String, dynamic> jsonRaw = await json.decode(raw);
    List<Sandwich> out = (jsonRaw['sandwiches'] as List)
        .map((data) => Sandwich.fromJson(data))
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

  Widget _createSandwichMenu(Sandwich sand) {
    String locale = Localizations.localeOf(context).toString();
    return ListTile(
      title: Text(sand.sandwich![locale]! + " " + sand.price!),
      visualDensity: VisualDensity(vertical: -4),
    );
  }

  Widget build(BuildContext context) {
    bool _tileExpanded = false;
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Text("Hilbert Café"),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 60, 5),
                child: Image.asset('assets/img/cafe_logo.png',
                    // width: MediaQuery.of(context).size.width * 1 / 2,
                    //scale: 0.5,
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
                    // trailing: Icon(
                    //   _tileExpanded
                    //       ? Icons.arrow_drop_down
                    //       : Icons.arrow_drop_down,
                    // ),
                    children: [
                      ...data.map(
                        (MenuItem mi) => _createMenu(mi),
                      )
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() => _tileExpanded = expanded);
                    },
                  ),
                  ExpansionTile(
                    title: Text(
                      'Veckans mackmeny, vecka:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Här kan du se veckans smarriga mackor'),
                    children: [
                      ...dataS.map(
                        (Sandwich sand) => _createSandwichMenu(sand),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        // backgroundColor: Colors.white,
      ),
    ]);
  }
}
