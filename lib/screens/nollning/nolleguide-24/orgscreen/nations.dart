import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';


class NationScreenPage extends StatefulWidget {
  @override
  _NationScreenState createState() => _NationScreenState();
}



class _NationScreenState extends State<NationScreenPage> {

  


  void initState(){
    super.initState();
  }


  Widget build(BuildContext context){

    var t =  AppLocalizations.of(context)!;

    String backgroundPaperPath = "assets/img/nollning-24/nolleguide/nolleguide_paper.png";
    String backgroundWoodPath = "assets/img/nollning-24/nolleguide/wood_background.png";

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
        child: SingleChildScrollView(
          child:
            Stack(
              children: [
                Image.asset(backgroundWoodPath),
                Image.asset(backgroundPaperPath),
                Container(
                  margin: EdgeInsets.only(top: 100, left: 50, right: 50),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child:
                      Text(
                        t.nations,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Testament",
                            fontSize: screenWidth/10,
                            color: Color(0xFF540909)
                        )
                      )
                    ),
                    SizedBox(height: 30),
                    Text(
                      t.nationsInfo,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: screenWidth/22,
                        ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                              onPressed: () {launchUrl(Uri.parse(t.nationsWebsite));}, 
                              style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    surfaceTintColor: Colors.transparent,
                                    minimumSize: Size(0,0),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                    ),
                              child: Expanded(child: Text(
                                t.nationsWebsite,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF5269D1),
                                  fontSize: screenWidth/22
                                )
                              )
                            )
                        )
                  ],
                )
                )
              ],
            )
        )
      ),
    );

  }
}