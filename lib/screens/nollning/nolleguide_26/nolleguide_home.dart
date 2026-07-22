import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/faculty.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/guild.dart';

class NolleGuideHomePage extends StatefulWidget {
  @override
  _NolleGuideHomeState createState() => _NolleGuideHomeState();
}

enum HomePageState {home, studentLife}

class _NolleGuideHomeState extends State<NolleGuideHomePage> {
  HomePageState currentState = HomePageState.home;

  static const String path = "assets/data/nollning_26/nolleguide";

  static const double zoomX = 2.2; // We need to do this terribleness to make the arcade machine
  static const double zoomY = 3;   // fit the screen...

  Widget generateItem({
    required double screenWidth,
    required double top,
    required double left,
    required String asset,
    required double width,
    VoidCallback? onTap,
}) {
    return Positioned(
      top: top,
      left: left,
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Image.asset(asset, width: screenWidth * width),
        ),
      )
    );
  }

  List<Widget> generateHomePage({
    required double screenWidth,
    required double screenHeight,
    required bool isSwedish,
    required String titleAsset,
    required String studentlivetAsset,
    required String stodAsset,
    required String kladkodAsset,
    required String ordlistaAsset,
    required String etiquetteAsset,
    required String poweredByAsset,
}){
    return [
      Positioned(
        top: screenHeight * 0.15,
        left: isSwedish ? screenWidth * 0.05 : screenWidth * 0.015,
        child: Center(
          child: Image.asset(
            titleAsset,
            width: isSwedish ? screenWidth * 0.9 : screenWidth,
          ),
        ),
      ),
      generateItem(
        screenWidth: screenWidth,
        top: screenHeight * 0.23,
        left: screenWidth * -0.08,
        asset: studentlivetAsset,
        width: 0.9,
        onTap: () => setState(() {
          this.currentState = HomePageState.studentLife;
        })
      ),
      generateItem(
        screenWidth: screenWidth,
        top: screenHeight * 0.3,
        left: isSwedish ? screenWidth * 0.31 : screenWidth * 0.26,
        asset: stodAsset,
        width: 0.9,
      ),
      generateItem(
        screenWidth: screenWidth,
        top: screenHeight * 0.37,
        left: isSwedish ? screenWidth * -0.14 : screenWidth * -0.13,
        asset: kladkodAsset,
        width: 0.9,
      ),
      generateItem(
        screenWidth: screenWidth,
        top: screenHeight * 0.44,
        left: isSwedish ? screenWidth * 0.25 : screenWidth * 0.22,
        asset: ordlistaAsset,
        width: 0.9,
      ),
      generateItem(
        screenWidth: screenWidth,
        top: screenHeight * 0.51,
        left: isSwedish ? screenWidth * -0.09 : screenWidth * -0.13,
        asset: etiquetteAsset,
        width: 0.9,
      ),
      generateItem(
        screenWidth: screenWidth,
        top: screenHeight * 0.59,
        left: screenWidth * 0.46,
        asset: poweredByAsset,
        width: 0.4,
      ),
    ];
  }

  List<Widget> generateStudentLifePage({
    required double screenWidth,
    required double screenHeight,
    required bool isSwedish,
    required String titleAsset,
    required String backAsset,
    required String karenAsset,
    required String sektionenAsset,
    required String lundAsset
}) {
    return [
      Positioned(
        top: screenHeight * 0.15,
        left: isSwedish ? screenWidth * 0.08 : screenWidth * 0.1,
        child: Center(
          child: Image.asset(
            titleAsset,
            width: screenWidth * 0.9,
          ),
        ),
      ),
      generateItem(
          screenWidth: screenWidth,
          top: screenHeight * 0.23,
          left: 0,
          asset: sektionenAsset,
          width: 0.75,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GuildPage()))
      ),
      generateItem(
          screenWidth: screenWidth,
          top: screenHeight * 0.36,
          left: isSwedish ? screenWidth * 0.23 : screenWidth * 0.35,
          asset: karenAsset,
          width: isSwedish ? 0.75 : 0.6,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FacultyPage()))
      ),
      generateItem(
          screenWidth: screenWidth,
          top: isSwedish ? screenHeight * 0.49 : screenHeight * 0.47,
          left: isSwedish ? screenWidth * 0.05 : screenWidth * 0.04,
          asset: lundAsset,
          width: 0.75,
      ),
      generateItem(
          screenWidth: screenWidth,
          top: screenHeight * 0.6,
          left: isSwedish ? screenWidth * 0.5 : screenWidth * 0.6,
          asset: backAsset,
          width: isSwedish ? 0.4 : 0.3,
          onTap: () => setState(() {
            this.currentState = HomePageState.home;
          })
      )
    ];
}

  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final isSwedish = t.localeName == "sv";;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final background = "${path}/background.png";

    // Home page
    final homePageTitle = "${path}/homescreen/title_${t.localeName}.png";
    final studentlivet = "${path}/homescreen/studentlivet_${t.localeName}.png";
    final stod = "${path}/homescreen/stod_${t.localeName}.png";
    final kladkod = "${path}/homescreen/kladkod_${t.localeName}.png";
    final ordlista = "${path}/homescreen/ordlista_${t.localeName}.png";
    final etiquette = "${path}/homescreen/etiquette_${t.localeName}.png";
    final poweredBy = "${path}/homescreen/powered_by.png";

    // Student life page
    final studentLifeTitle = "${path}/studentlife/title_${t.localeName}.png";
    final sektionen = "${path}/studentlife/sektionen_${t.localeName}.png";
    final karen = "${path}/studentlife/karen_${t.localeName}.png";
    final lund = "${path}/studentlife/lund.png";
    final back = "${path}/studentlife/back_${t.localeName}.png";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.red),
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
                ...switch(currentState){
                  HomePageState.home => generateHomePage(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      isSwedish: isSwedish,
                      titleAsset: homePageTitle,
                      studentlivetAsset: studentlivet,
                      stodAsset: stod,
                      kladkodAsset: kladkod,
                      ordlistaAsset: ordlista,
                      etiquetteAsset: etiquette,
                      poweredByAsset: poweredBy
                ),
                  HomePageState.studentLife => generateStudentLifePage(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      isSwedish: isSwedish,
                      titleAsset: studentLifeTitle,
                      backAsset: back,
                      karenAsset: karen,
                      sektionenAsset: sektionen,
                      lundAsset: lund),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}