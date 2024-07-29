import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class GuildScreenPage extends StatefulWidget {
  @override
  _GuildScreenState createState() => _GuildScreenState();
}



class _GuildScreenState extends State<GuildScreenPage> {

  void initState(){
    super.initState();
  }


  Widget build(BuildContext context){


    String backgroundPaperPath = "assets/img/nollning-24/nolleguide/nolleguide_paper.png";
    String backgroundWoodPath = "assets/img/nollning-24/organization_tree/orgscreen_wood_background.png";

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    var t =  AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: Text(
        ""
      ),
    );
  }
}