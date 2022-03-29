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
        body: _FruitWidget(this.fruit!),
      );
    }
  }
}

class _FruitWidget extends StatelessWidget {
  final Fruit fruit;
  String moldStatus = "";
  @override
  _FruitWidget(this.fruit) {
    /* We are optimistic. If isMoldy is null we assume the fruit is fresh */
    if (this.fruit.is_moldy ?? false) {
      this.moldStatus = "möglig";
    } else {
      this.moldStatus = "ej möglig";
    }
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        child: Align(
          alignment: Alignment.center,
          child: Text("${fruit.name!}: ${moldStatus} ",
              style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
