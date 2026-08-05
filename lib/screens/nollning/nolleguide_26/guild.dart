import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/portraitFactory.dart';
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

  Future<void> loadGuildJson() async {
    final jsonString = await rootBundle.loadString("$path/data_guild.json");
    setState(() {
      this.jsonString = jsonString;
    });
  }

  @override
  void initState(){
    super.initState();
    loadGuildJson();
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

    const largePortraitSize = 5;
    const smallPortraitSize = 2;
    const doublePortraitSize = 10;

    void pushNavigator({required int index, required String imagePath}) => Navigator.push(context, TextOverlayRoute(
        portrait: imagePath,
        text: data["people"][index]["text"][locale]));

    return PortraitFactory.addSpacing(space: 24, items: [
      Image.asset(fosetTitle),
      PortraitFactory.generatePortrait(imagePath: frame, size: largePortraitSize,
          onTap: () => pushNavigator(index: 0, imagePath: frame)), //TODO: FÖSET
      PortraitFactory.generateDoublePortrait(leftImagePath: frame, rightImagePath: frame, size: doublePortraitSize,
          leftOnTap: () => pushNavigator(index: 1, imagePath: frame),
          rightOnTap: () => pushNavigator(index: 2, imagePath: frame)), //TODO: FÖSET
      PortraitFactory.generateDoublePortrait(leftImagePath: frame, rightImagePath: frame, size: doublePortraitSize,
          leftOnTap: () => pushNavigator(index: 3, imagePath: frame),
          rightOnTap: () => pushNavigator(index: 4, imagePath: frame)), //TODO: FÖSET
      PortraitFactory.generateDoublePortrait(leftImagePath: frame, rightImagePath: frame, size: doublePortraitSize,
          leftOnTap: () => pushNavigator(index: 5, imagePath: frame),
          rightOnTap: () => pushNavigator(index: 6, imagePath: frame)), //TODO: FÖSET
      Image.asset(organisationTitle),
      PortraitFactory.generatePortrait(imagePath: presidentPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 7, imagePath: presidentPortrait)),
      PortraitFactory.generatePortrait(imagePath: vpPortrait, size: smallPortraitSize,
          onTap: () => pushNavigator(index: 8, imagePath: vpPortrait)),
      Image.asset(boardTitle),
      PortraitFactory.generatePortrait(imagePath: boardPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 9, imagePath: boardPortrait)),
      PortraitFactory.generatePortrait(imagePath: frame, size: smallPortraitSize,
          onTap: () => pushNavigator(index: 10, imagePath: frame)), //TODO: Ledamöter
      Image.asset(studentcouncilTitle),
      PortraitFactory.generatePortrait(imagePath: eduPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 11, imagePath: eduPortrait)),
      Image.asset(sexTitle),
      PortraitFactory.generatePortrait(imagePath: sexPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 12, imagePath: sexPortrait)),
      Image.asset(tavernTitle),
      PortraitFactory.generatePortrait(imagePath: tavernPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 13, imagePath: tavernPortrait)),
      Image.asset(jubileeTitle),
      PortraitFactory.generatePortrait(imagePath: jubileePortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 14, imagePath: jubileePortrait)),
      Image.asset(serviceTitle),
      PortraitFactory.generatePortrait(imagePath: frame, size: largePortraitSize,
          onTap: () => pushNavigator(index: 15, imagePath: frame)), //TODO: Sekreterare
      Image.asset(truthTitle),
      PortraitFactory.generatePortrait(imagePath: truthPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 16, imagePath: truthPortrait)),
      PortraitFactory.generatePortrait(imagePath: spiderPortrait, size: smallPortraitSize,
          onTap: () => pushNavigator(index: 17, imagePath: spiderPortrait)),
      Image.asset(samvetetTitle),
      PortraitFactory.generatePortrait(imagePath: samvetetPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 18, imagePath: samvetetPortrait)),
      Image.asset(libuTitle),
      PortraitFactory.generatePortrait(imagePath: libuPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 19, imagePath: libuPortrait)),
      Image.asset(facilitiesTitle),
      PortraitFactory.generatePortrait(imagePath: prylPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 20, imagePath: prylPortrait)),
      Image.asset(crTitle),
      PortraitFactory.generatePortrait(imagePath: crPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 21, imagePath: crPortrait)),
      PortraitFactory.generatePortrait(imagePath: faradPortrait, size: smallPortraitSize,
          onTap: () => pushNavigator(index: 22, imagePath: faradPortrait)),
      Image.asset(cultureTitle),
      PortraitFactory.generatePortrait(imagePath: culturePortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 23, imagePath: culturePortrait)),
      PortraitFactory.generateDoublePortrait(leftImagePath: reisemeisterPortrait, rightImagePath: sportPortrait, size: doublePortraitSize,
          leftOnTap: () => pushNavigator(index: 24, imagePath: reisemeisterPortrait),
          rightOnTap: () => pushNavigator(index: 25, imagePath: sportPortrait)),
      Image.asset(frejaTitle),
      PortraitFactory.generatePortrait(imagePath: frejaPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 26, imagePath: frejaPortrait)),
      Image.asset(accountingTitle),
      PortraitFactory.generatePortrait(imagePath: treasurerPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 27, imagePath: treasurerPortrait)),
      PortraitFactory.generatePortrait(imagePath: bookPortrait, size: smallPortraitSize,
          onTap: () => pushNavigator(index: 28, imagePath: bookPortrait)),
      Image.asset(cafeTitle),
      PortraitFactory.generatePortrait(imagePath: cafePortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 29, imagePath: cafePortrait)),
      Image.asset(processionTitle),
      PortraitFactory.generatePortrait(imagePath: heraldPortrait, size: largePortraitSize,
          onTap: () => pushNavigator(index: 30, imagePath: heraldPortrait))
    ]);
  }
}