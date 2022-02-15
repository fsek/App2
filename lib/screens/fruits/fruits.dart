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
        body:
            ListView(children: [...fruits!.map((fruit) => _FruitCard(fruit))]),
      );
    }
  }
}

/* 
 * note that this widget is stateless. We only want to set the fruit
 * for the widget once and never change it, so we use final. It will
 * never change state after construction, so it is stateless and not stateful
 */
class _FruitCard extends StatelessWidget {
  final Fruit fruit;

  @override
  _FruitCard(this.fruit);

  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        child: InkWell(
          onTap: () {},
          child: Align(
            alignment: Alignment.center,
            child: Text(fruit.name!, style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
