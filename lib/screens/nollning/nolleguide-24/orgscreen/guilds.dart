import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GuildScreenPage extends StatefulWidget {
  @override
  _GuildScreenState createState() => _GuildScreenState();
}

class _GuildScreenState extends State<GuildScreenPage> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    String backgroundPaperPath = "assets/img/nollning-24/nolleguide/nolleguide_paper.png";
    String backgroundWoodPath = "assets/img/nollning-24/nolleguide/wood_background.png";

    double screenWidth = MediaQuery.of(context).size.width;

    var t = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(
          child: Container(
              child: Stack(
        children: [
          Positioned.fill(child: Image.asset(backgroundWoodPath, fit: BoxFit.fill)),
          Positioned.fill(
              child: Image.asset(
            backgroundPaperPath,
            fit: BoxFit.fill,
          )),
          Container(
              margin: EdgeInsets.only(top: 70, left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text(t.guilds, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Testament", fontSize: screenWidth / 10, color: Color(0xFF540909)))),
                  SizedBox(height: 30),
                  Text(
                    t.guildsInfo,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: screenWidth / 30,
                    ),
                  ),
                ],
              ))
        ],
      ))),
    );
  }
}
