import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/karen.dart';

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

    const double zoomX = 2.2; // We need to do this terribleness to make the arcade machine
    const double zoomY = 3;   // fit the screen...

    var tempLocaleName = "en"; // TODO: Change this back when not testing
    var isSwedish = t.localeName == "sv";

    const String path = "assets/data/nollning_26/nolleguide/homescreen";
    String background = "${path}/background.png";
    String title = "${path}/titel_${t.localeName}.png";
    String studentlivet = "${path}/studentlivet_${t.localeName}.png";
    String stod = "${path}/stod_${t.localeName}.png";
    String kladkod = "${path}/kladkod_${t.localeName}.png";
    String ordlista = "${path}/ordlista_${t.localeName}.png";
    String etiquette = "${path}/etiquette_${t.localeName}.png";
    String poweredBy = "${path}/powered_by.png";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(
        panEnabled: true,
        child: FittedBox(
          fit: BoxFit.cover, // scales the whole fixed canvas to fill the real screen
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.hardEdge,
              children: [
                Transform.translate(
                  offset: Offset(screenWidth * 0.02, screenHeight * 0.18),
                  child: Transform.scale(
                    scaleX: zoomX,
                    scaleY: zoomY,
                    child: Image.asset(background, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.15,
                  left: isSwedish
                      ? screenWidth * 0.05
                      : screenWidth * 0.015,
                  child: Center(
                    child: Image.asset(title,
                        width:
                        isSwedish
                            ? screenWidth * 0.9
                            : screenWidth),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.23,
                  left: screenWidth * -0.08,
                  child: Center(
                    child: InkWell(
                        onTap: () => (Navigator.push(context, MaterialPageRoute(builder: (context) => KarenPage()))),
                        child: Image.asset(studentlivet, width: screenWidth * 0.9)
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.3,
                  left: isSwedish
                      ? screenWidth * 0.31
                      : screenWidth * 0.26,
                  child: Center(
                    child: InkWell(
                        onTap: () => (),
                        child: Image.asset(stod, width: screenWidth * 0.9)
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.37,
                  left: isSwedish
                      ? screenWidth * -0.14
                      : screenWidth * -0.13,
                  child: Center(
                    child: InkWell(
                        onTap: () => (),
                        child: Image.asset(kladkod, width: screenWidth * 0.9)
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.44,
                  left: isSwedish
                      ? screenWidth * 0.25
                      : screenWidth * 0.22,
                  child: Center(
                    child: InkWell(
                        onTap: () => (),
                        child: Image.asset(ordlista, width: screenWidth * 0.9)
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.51,
                  left: isSwedish
                      ? screenWidth * -0.09
                      : screenWidth * -0.13,
                  child: Center(
                    child: InkWell(
                        onTap: () => (),
                        child: Image.asset(etiquette, width: screenWidth * 0.9)
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.59,
                  left: screenWidth * 0.46,
                  child: Center(
                    child: InkWell(
                        onTap: () => (),
                        child: Image.asset(poweredBy, width: screenWidth * 0.4)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}