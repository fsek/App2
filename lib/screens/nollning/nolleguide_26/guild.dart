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
      body: WallFactory.generateWall(
          children: generateWallContent(locale: t.localeName),
          screenHeight: screenHeight)
    );
  }

  List<Widget> generateWallContent({
    required String locale
  }) {
    final String accountingTitle = "$path/title_accounting_$locale.png";
    final String boardTitle = "$path/title_board_$locale.png";
    final String cafeTitle = "$path/title_cafe_$locale.png";
    final String cultureTitle = "$path/title_culture_$locale.png";
    final String facilitiesTitle = "$path/title_facilities_$locale.png";
    final String crTitle = "$path/title_fnu_$locale.png";
    final String fosetTitle = "$path/title_foset_$locale.png";
    final String frejaTitle = "$path/title_freja.png";
    final String jubileeTitle = "$path/title_jubilee_$locale.png";
    final String libuTitle = "$path/title_libu_$locale.png";
    final String organisationTitle = "$path/title_organisation.png";
    final String processionTitle = "$path/title_procession_$locale.png";
    final String samvetetTitle = "$path/title_samvetet_$locale.png";
    final String serviceTitle = "$path/title_service_$locale.png";
    final String sexTitle = "$path/title_sex_$locale.png";
    final String studentcouncilTitle = "$path/title_studentcouncil_$locale.png";
    final String tavernTitle = "$path/title_tavern_$locale.png";
    final String truthTitle = "$path/title_truth_$locale.png";

    final String boardPortrait = "$path/portrait_board_$locale.png";
    final String bookPortrait = "$path/portrait_book_$locale.png";
    final String cafePortrait = "$path/portrait_cafe_$locale.png";
    final String crPortrait = "$path/portrait_cr_$locale.png";
    final String culturePortrait = "$path/portrait_culture_$locale.png";
    final String frejaPortrait = "$path/portrait_freja_$locale.png";
    final String heraldPortrait = "$path/portrait_herald_$locale.png";
    final String jubileePortrait = "$path/portrait_jubilee_$locale.png";
    final String libuPortrait = "$path/portrait_libu.png";
    final String presidentPortrait = "$path/portrait_president_$locale.png";
    final String reisemeisterPortrait = "$path/portrait_reisemeister.png";
    final String samvetetPortrait = "$path/portrait_samvetet_$locale.png";
    final String sexPortrait = "$path/portrait_sex_$locale.png";
    final String sportPortrait = "$path/portrait_sport_$locale.png";
    final String tavernPortrait = "$path/portrait_tavern_$locale.png";
    final String treasurerPortrait = "$path/portrait_treasurer_$locale.png";
    final String truthPortrait = "$path/portrait_truth_$locale.png";
    final String vpPortrait = "$path/portrait_vp_$locale.png";

    final String frame = "$path/frame.png";

    const largePortraitSize = 5;
    const smallPortraitSize = 2;
    const doublePortraitSize = 10;

    return PortraitFactory.addSpacing(space: 24, items: [
      Image.asset(fosetTitle),
      PortraitFactory.generatePortrait(imagePath: frame, size: largePortraitSize),
      PortraitFactory.generateDoublePortrait(leftImagePath: frame, rightImagePath: frame, size: doublePortraitSize),
      PortraitFactory.generateDoublePortrait(leftImagePath: frame, rightImagePath: frame, size: doublePortraitSize),
      PortraitFactory.generateDoublePortrait(leftImagePath: frame, rightImagePath: frame, size: doublePortraitSize),
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
      PortraitFactory.generatePortrait(imagePath: jubileePortrait, size: smallPortraitSize), //TODO: Spindelförman
      Image.asset(samvetetTitle),
      PortraitFactory.generatePortrait(imagePath: samvetetPortrait, size: largePortraitSize),
      Image.asset(libuTitle),
      PortraitFactory.generatePortrait(imagePath: libuPortrait, size: largePortraitSize),
      Image.asset(facilitiesTitle),
      PortraitFactory.generatePortrait(imagePath: frame, size: largePortraitSize), //TODO: Prysmästare
      Image.asset(crTitle),
      PortraitFactory.generatePortrait(imagePath: crPortrait, size: largePortraitSize),
      PortraitFactory.generatePortrait(imagePath: frame, size: smallPortraitSize), //TODO: Farad(VAKANT)
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