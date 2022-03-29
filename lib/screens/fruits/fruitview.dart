import 'package:flutter/cupertino.dart';
import 'package:fsek_mobile/services/fruit.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/home/fruit.dart';

class FruitView extends StatefulWidget {
  final int id;
  const FruitView({Key? key, required this.id}) : super(key: key);

  @override
  _FruitViewState createState() => _FruitViewState();
}

class _FruitViewState extends State<FruitView> {
  Fruit? fruit;
  void initState() {
    locator<FruitService>().getFruit(widget.id).then((value) => setState(() {
          this.fruit = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (fruit == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Frukt'),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Frukt'),
        ),
        body: Text(fruit!.name ?? ""),
      );
    }
  }
}
