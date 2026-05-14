import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

class QuestHomeScreen extends StatefulWidget {
  @override
  _QuestHomeScreenState createState() => _QuestHomeScreenState();
}

class _QuestHomeScreenState extends State<QuestHomeScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(
        panEnabled: true,
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Align(alignment: Alignment.center, child: Text("Sidequests!")),
        ),
      ),
    );
  }
}