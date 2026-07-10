import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

class KarenPage extends StatefulWidget {
  @override
  _KarenPageState createState() => _KarenPageState();
}

class _KarenPageState extends State<KarenPage> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/data/nollning_26/homescreen/background.png"),
              repeat: ImageRepeat.repeatY,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              // Your scrolling content
              Container(height: 500),
              Text("Hello"),

              Container(height: 500),
              Text("More content"),

              Container(height: 500),
              Text("End"),
            ],
          ),
        ),
      ),
    );
  }
}