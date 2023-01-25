import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/models/better_cafe/menu_items.dart';

class BetterCafePage extends StatefulWidget {
  BetterCafePage({Key? key}) : super(key: key);

  @override
  _BetterCafePageState createState() => _BetterCafePageState();
}

class _BetterCafePageState extends State<BetterCafePage> {
  List<MenuItem> data = [];

  _BetterCafePageState() {
    _loadMenuItems().then(
      (value) => setState(
        () {
          this.data = value;
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

  Widget _createMenu(MenuItem mi) {
    String locale = Localizations.localeOf(context).toString();
    return Card(
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Text(mi.item![locale]! + " " + mi.price!),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Text("Hilbert Café"),
        ),
        body: Container(
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
                child: Image.asset("assets/img/cafe_logo.png",
                    width: MediaQuery.of(context).size.width * 3 / 4,
                    alignment: Alignment.topCenter),
              ),
              Text(
                "Välkommen till Hilbert Café!",
                style: TextStyle(
                  color: Colors.orange[800],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Column(
                children: [
                  ...data.map(
                    (MenuItem mi) => _createMenu(mi),
                  )
                ],
              )
            ],
          ),
          // backgroundColor: Colors.white,
        ),
      ),
    ]);
  }
}
