import 'package:flutter/material.dart';

class IntroductionSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE1C9),
      appBar: AppBar(
        title: Text("Schema"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width / 23,
            0,
            0,
            0), //maybe change padding to fix pixels, might look wierd on some phones
        reverse: true,
        child: Image(
          image: AssetImage("assets/img/Schema.png"),
        ),
      ),
    );
  }
}
