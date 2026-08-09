import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/portraitSpacing.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/portraitBuilder.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/wallFactory.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/overlay.dart';


class GuildPage extends StatefulWidget {
  @override
  _GuildPageState createState() => _GuildPageState();
}

class _GuildPageState extends State<GuildPage> {
  static const path = "assets/data/nollning_26/nolleguide/studentlife/guild";
  bool isTextOverlayVisible = false;

  String? jsonString;

  Future<void> _loadJson() async {
    final jsonString = await rootBundle.loadString("$path/data_guild.json");
    setState(() {
      this.jsonString = jsonString;
    });
  }

  @override
  void initState(){
    super.initState();
    _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if(this.jsonString == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final Map<String, dynamic> data = jsonDecode(this.jsonString!);

    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: new Color.fromRGBO(41, 171, 226, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(panEnabled: true,
              child: WallFactory.generateWall(
                  children: generateWallContent(locale: t.localeName, data: data),
                  screenHeight: screenHeight)
          )
    );
  }

  List<Widget> generateWallContent({
    required String locale,
    required Map<String, dynamic> data
  }) {
    String title(String name, {bool isLocale = true}) {
      if(!isLocale) return "$path/title_${name}.png";
      return "$path/title_${name}_$locale.png";
    }

    final String accountingTitle = title("accounting");
    final String boardTitle = title("board");
    final String cafeTitle = title("cafe");
    final String cultureTitle = title("culture");
    final String facilitiesTitle = title("facilities");
    final String crTitle = title("fnu");
    final String fosetTitle = title("foset");
    final String frejaTitle = title("freja", isLocale: false);
    final String jubileeTitle = title("jubilee");
    final String libuTitle = title("libu");
    final String organisationTitle = title("organisation", isLocale: false);
    final String processionTitle = title("procession");
    final String samvetetTitle = title("samvetet");
    final String serviceTitle = title("service");
    final String sexTitle = title("sex");
    final String studentcouncilTitle = title("studentcouncil");
    final String tavernTitle = title("tavern");
    final String truthTitle = title("truth");

    String portrait(String name, {bool isLocale = true}) {
      if(!isLocale) return "$path/portrait_${name}.png";
      return "$path/portrait_${name}_$locale.png";
    }

    final String boardPortrait = portrait("board");
    final String bookPortrait = portrait("book");
    final String cafePortrait = portrait("cafe");
    final String crPortrait = portrait("cr");
    final String culturePortrait = portrait("culture");
    final String eduPortrait = portrait("edu");
    final String faradPortrait = portrait("farad");
    final String frejaPortrait = portrait("freja");
    final String heraldPortrait = portrait("herald");
    final String jubileePortrait = portrait("jubilee");
    final String libuPortrait = portrait("libu", isLocale: false);
    final String presidentPortrait = portrait("president");
    final String prylPortrait = portrait("pryl");
    final String reisemeisterPortrait = portrait("reisemeister", isLocale: false);
    final String samvetetPortrait = portrait("samvetet");
    final String sexPortrait = portrait("sex");
    final String spiderPortrait = portrait("spider");
    final String sportPortrait = portrait("sport");
    final String tavernPortrait = portrait("tavern");
    final String treasurerPortrait = portrait("treasurer");
    final String truthPortrait = portrait("truth");
    final String vpPortrait = portrait("vp");

    final String frame = "$path/frame.png";

    const largePortraitFlex = 5;
    const smallPortraitFlex = 2;
    const doublePortraitFlex = 10;

    void pushNavigator({required int index, required String imagePath}) =>
        Navigator.push(context, TextOverlayRoute(
            portrait: imagePath,
            text: data["people"][index]["text"][locale]));

    return [
      Image.asset(fosetTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: frame, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 0, imagePath: frame)), //TODO: FÖSET
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: frame, flex: doublePortraitFlex,
            onTap: () => pushNavigator(index: 1, imagePath: frame)), //TODO: FÖSET
        PortraitData(imagePath: frame, flex: doublePortraitFlex,
            onTap: () => pushNavigator(index: 2, imagePath: frame)), //TODO: FÖSET
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: frame, flex: doublePortraitFlex,
            onTap: () => pushNavigator(index: 3, imagePath: frame)), //TODO: FÖSET
        PortraitData(imagePath: frame, flex: doublePortraitFlex,
            onTap: () => pushNavigator(index: 4, imagePath: frame)), //TODO: FÖSET
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: frame, flex: doublePortraitFlex,
            onTap: () => pushNavigator(index: 5, imagePath: frame)), //TODO: FÖSET
        PortraitData(imagePath: frame, flex: doublePortraitFlex,
            onTap: () => pushNavigator(index: 6, imagePath: frame)), //TODO: FÖSET
      ]),
      Image.asset(organisationTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: presidentPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 7, imagePath: presidentPortrait)),
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: vpPortrait, flex: smallPortraitFlex,
            onTap: () => pushNavigator(index: 8, imagePath: vpPortrait)),
      ]),
      Image.asset(boardTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: boardPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 9, imagePath: boardPortrait)),
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: frame, flex: smallPortraitFlex,
            onTap: () => pushNavigator(index: 10, imagePath: frame)), //TODO: Ledamöter
      ]),
      Image.asset(studentcouncilTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: eduPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 11, imagePath: eduPortrait)),
      ]),
      Image.asset(sexTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: sexPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 12, imagePath: sexPortrait)),
      ]),
      Image.asset(tavernTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: tavernPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 13, imagePath: tavernPortrait)),
      ]),
      Image.asset(jubileeTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: jubileePortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 14, imagePath: jubileePortrait)),
      ]),
      Image.asset(serviceTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: frame, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 15, imagePath: frame)), //TODO: Sekreterare
      ]),
      Image.asset(truthTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: truthPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 16, imagePath: truthPortrait)),
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: spiderPortrait, flex: smallPortraitFlex,
            onTap: () => pushNavigator(index: 17, imagePath: spiderPortrait)),
      ]),
      Image.asset(samvetetTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: samvetetPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 18, imagePath: samvetetPortrait)),
      ]),
      Image.asset(libuTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: libuPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 19, imagePath: libuPortrait)),
      ]),
      Image.asset(facilitiesTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: prylPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 20, imagePath: prylPortrait)),
      ]),
      Image.asset(crTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: crPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 21, imagePath: crPortrait)),
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: faradPortrait, flex: smallPortraitFlex,
            onTap: () => pushNavigator(index: 22, imagePath: faradPortrait)),
      ]),
      Image.asset(cultureTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: culturePortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 23, imagePath: culturePortrait)),
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: reisemeisterPortrait, flex: doublePortraitFlex,
            onTap: () => pushNavigator(index: 24, imagePath: reisemeisterPortrait)),
        PortraitData(imagePath: sportPortrait, flex: doublePortraitFlex,
            onTap: () => pushNavigator(index: 25, imagePath: sportPortrait)),
      ]),
      Image.asset(frejaTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: frejaPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 26, imagePath: frejaPortrait)),
      ]),
      Image.asset(accountingTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: treasurerPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 27, imagePath: treasurerPortrait)),
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: bookPortrait, flex: smallPortraitFlex,
            onTap: () => pushNavigator(index: 28, imagePath: bookPortrait)),
      ]),
      Image.asset(cafeTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: cafePortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 29, imagePath: cafePortrait)),
      ]),
      Image.asset(processionTitle),
      PortraitRow(portraits: [
        PortraitData(imagePath: heraldPortrait, flex: largePortraitFlex,
            onTap: () => pushNavigator(index: 30, imagePath: heraldPortrait)),
      ]),
    ].withSpacing(24);
  }
}