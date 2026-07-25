import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

class NolleGuideHomePage extends StatefulWidget {
  @override
  _NolleGuideHomeState createState() => _NolleGuideHomeState();
}

class _NolleGuideHomeState extends State<NolleGuideHomePage> {
  void initState() {
    super.initState();
  }

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
          child: Align(alignment: Alignment.center, child: Text("Nolleguiden!")),
        ),
      ),
    );
  }
}
