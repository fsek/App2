import 'package:flutter/material.dart';

class CoffeCardPage extends StatefulWidget {
  const CoffeCardPage({Key? key}) : super(key: key);

  @override
  _CoffeCardState createState() => _CoffeCardState();
}

class _CoffeCardState extends State<CoffeCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaffekort'),
      ),
    );
  }
}
