import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SektionScreenPage extends StatefulWidget {
  @override
  _SektionScreenState createState() => _SektionScreenState();
}



class _SektionScreenState extends State<SektionScreenPage> {

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