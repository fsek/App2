import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/portraitFactory.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/wallFactory.dart';

class GuildPage extends StatefulWidget {
  @override
  _GuildPageState createState() => _GuildPageState();
}

class _GuildPageState extends State<GuildPage> {
  static const path = "assets/data/nollning_26/nolleguide/studentlife/guild";

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
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
              children: generateWallContent(locale: t.localeName),
              screenHeight: screenHeight))
    );
  }

  List<Widget> generateWallContent({
    required String locale
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
    final String faradPortrait = portrait("farad");
    final String frejaPortrait = portrait("freja");
    final String heraldPortrait = portrait("herald");
    final String jubileePortrait = portrait("jubilee");
    final String libuPortrait = portrait("libu", isLocale: false);
    final String presidentPortrait = portrait("president");
    final String reisemeisterPortrait = portrait("reisemeister", isLocale: false);
    final String samvetetPortrait = portrait("samvetet");
    final String sexPortrait = portrait("sex");
    final String sportPortrait = portrait("sport");
    final String tavernPortrait = portrait("tavern");
    final String treasurerPortrait = portrait("treasurer");
    final String truthPortrait = portrait("truth");
    final String vpPortrait = portrait("vp");

    final String frame = "$path/frame.png";

    const largePortraitSize = 5;
    const smallPortraitSize = 2;
    const doublePortraitSize = 10;

    return PortraitFactory.addSpacing(space: 24, items: [
      Image.asset(fosetTitle),
      PortraitFactory.generatePortrait(imagePath: frame, size: largePortraitSize), //TODO: FÖSET
      PortraitFactory.generateDoublePortrait(leftImagePath: frame, rightImagePath: frame, size: doublePortraitSize), //TODO: FÖSET
      PortraitFactory.generateDoublePortrait(leftImagePath: frame, rightImagePath: frame, size: doublePortraitSize), //TODO: FÖSET
      PortraitFactory.generateDoublePortrait(leftImagePath: frame, rightImagePath: frame, size: doublePortraitSize), //TODO: FÖSET
      Image.asset(organisationTitle),
      PortraitFactory.generatePortrait(imagePath: presidentPortrait, size: largePortraitSize),
      PortraitFactory.generatePortrait(imagePath: vpPortrait, size: smallPortraitSize),
      Image.asset(boardTitle),
      PortraitFactory.generatePortrait(imagePath: boardPortrait, size: largePortraitSize),
      PortraitFactory.generatePortrait(imagePath: frame, size: smallPortraitSize), //TODO: Ledamöter
      Image.asset(studentcouncilTitle),
      PortraitFactory.generatePortrait(imagePath: frame, size: largePortraitSize), //TODO: utbildningsminister
      Image.asset(sexTitle),
      PortraitFactory.generatePortrait(imagePath: sexPortrait, size: largePortraitSize),
      Image.asset(tavernTitle),
      PortraitFactory.generatePortrait(imagePath: tavernPortrait, size: largePortraitSize),
      Image.asset(jubileeTitle),
      PortraitFactory.generatePortrait(imagePath: jubileePortrait, size: largePortraitSize),
      Image.asset(serviceTitle),
      PortraitFactory.generatePortrait(imagePath: frame, size: largePortraitSize), //TODO: sekret service
      Image.asset(truthTitle),
      PortraitFactory.generatePortrait(imagePath: truthPortrait, size: largePortraitSize),
      PortraitFactory.generatePortrait(imagePath: frame, size: smallPortraitSize), //TODO: Spindelförman
      Image.asset(samvetetTitle),
      PortraitFactory.generatePortrait(imagePath: samvetetPortrait, size: largePortraitSize),
      Image.asset(libuTitle),
      PortraitFactory.generatePortrait(imagePath: libuPortrait, size: largePortraitSize),
      Image.asset(facilitiesTitle),
      PortraitFactory.generatePortrait(imagePath: frame, size: largePortraitSize), //TODO: Prylmästare
      Image.asset(crTitle),
      PortraitFactory.generatePortrait(imagePath: crPortrait, size: largePortraitSize),
      PortraitFactory.generatePortrait(imagePath: faradPortrait, size: smallPortraitSize),
      Image.asset(cultureTitle),
      PortraitFactory.generatePortrait(imagePath: culturePortrait, size: largePortraitSize),
      PortraitFactory.generateDoublePortrait(leftImagePath: reisemeisterPortrait, rightImagePath: sportPortrait, size: doublePortraitSize),
      Image.asset(frejaTitle),
      PortraitFactory.generatePortrait(imagePath: frejaPortrait, size: largePortraitSize),
      Image.asset(accountingTitle),
      PortraitFactory.generatePortrait(imagePath: treasurerPortrait, size: largePortraitSize),
      PortraitFactory.generatePortrait(imagePath: bookPortrait, size: smallPortraitSize),
      Image.asset(cafeTitle),
      PortraitFactory.generatePortrait(imagePath: cafePortrait, size: largePortraitSize),
      Image.asset(processionTitle),
      PortraitFactory.generatePortrait(imagePath: heraldPortrait, size: largePortraitSize)
    ]);
  }
}