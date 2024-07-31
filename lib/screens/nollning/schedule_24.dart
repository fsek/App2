import 'package:flutter/material.dart';


class Schedule24ScreenPage extends StatefulWidget {
  @override
  _Schedule24ScreenState createState() => _Schedule24ScreenState();
}


class _Schedule24ScreenState extends State<Schedule24ScreenPage> {
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    String schemaPath = "assets/img/nollning-24/schema/schedulescreen.png";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(child: SingleChildScrollView(
        child: Positioned.fill(child: Image.asset(schemaPath, fit: BoxFit.fill)),
      ),
      )
    );
  }
}