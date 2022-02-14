import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/home/fruit.dart';
import 'package:fsek_mobile/models/home/fruituser.dart';
import 'package:fsek_mobile/services/fruit.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class FruitPage extends StatefulWidget {
  const FruitPage({Key? key}) : super(key: key);

  @override
  _FruitPageState createState() => _FruitPageState();
}

class _FruitPageState extends State<FruitPage> {
  List<Fruit>? fruits;
  void initState() {
    locator<FruitService>().getFruits().then((value) => setState(() {
          this.fruits = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (fruits == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Frukter'),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Frukter'),
        ),
        body: ListView(
            children: [...fruits!.map((fruit) => Text(fruit.name ?? ""))]),
      );
    }
  }
}
