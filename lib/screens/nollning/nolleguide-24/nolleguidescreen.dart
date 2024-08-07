import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/kladguide.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/stodfunktioner.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/wordlist.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/org_screen.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/studentvett.dart';
import 'package:fsek_mobile/screens/nollning/schedule.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class NolleGuideScreenPage extends StatefulWidget {
  @override
  _NolleGuideScreenState createState() => _NolleGuideScreenState();
}


class _NolleGuideScreenState extends State<NolleGuideScreenPage> {
  void initState(){
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var t =  AppLocalizations.of(context)!;

    String backgroundNolleGuidePath = "assets/img/nollning-24/nolleguide/nolleguidescreen_background.png";
    String supportfunctionsPath = "assets/img/nollning-24/nolleguide/supportfunctions_${t.localeName}.png";
    String wordlistPath = "assets/img/nollning-24/nolleguide/wordlist_${t.localeName}.png";
    String studentvettPath = "assets/img/nollning-24/nolleguide/studentvett_${t.localeName}.png";
    String organisationPath = "assets/img/nollning-24/nolleguide/nolleguidescreen_organisation.png";
    String dresscodePath = "assets/img/nollning-24/nolleguide/dresscodes_${t.localeName}.png";


    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF222F28),
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              backgroundNolleGuidePath,
              fit: BoxFit.cover
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 150, left: screenWidth/5, right: screenWidth/5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.horizontal()
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (StodFunktionerScreenPage())));}, 
                      child: Image.asset(
                        supportfunctionsPath,
                        fit: BoxFit.cover
                      ))
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: screenWidth/5, right: screenWidth/5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.horizontal()
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (WordListPage())));}, 
                      child: Image.asset(
                        wordlistPath,
                        fit: BoxFit.cover
                      ))
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: screenWidth/5, right: screenWidth/5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.horizontal()
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (StudentvettScreenPage())));}, 
                      child: Image.asset(
                        studentvettPath,
                        fit: BoxFit.cover
                      ))
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: screenWidth/5, right: screenWidth/5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.horizontal()
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (OrganizationScreenPage())));}, 
                      child: Image.asset(
                        organisationPath,
                        fit: BoxFit.cover
                      ))
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: screenWidth/5, right: screenWidth/5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.horizontal()
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => KladguidePage()));}, 
                      child: Image.asset(
                        dresscodePath,
                        fit: BoxFit.cover
                      ))
                  ),
                ]
              )
            ),
          ],
        ),
      )
    );
  }
}