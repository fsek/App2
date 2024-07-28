import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/april_fools.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/kladguide.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/org_screen.dart';



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
    String backgroundNolleGuidePath = "assets/img/nollning-24/nolleguide/nolleguidescreen_background.png";
    String stodfunktionerPath = "assets/img/nollning-24/nolleguide/nolleguidescreen_stodfunktioner.png";
    String ordlistaPath = "assets/img/nollning-24/nolleguide/nolleguidescreen_ordlista.png";
    String studentvettPath = "assets/img/nollning-24/nolleguide/nolleguidescreen_studentvett.png";
    String organisationPath = "assets/img/nollning-24/nolleguide/nolleguidescreen_organisation.png";
    String kladguidePath = "assets/img/nollning-24/nolleguide/nolleguidescreen_kladguide.png";
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
                      onPressed: () {}, 
                      child: Image.asset(
                        stodfunktionerPath,
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
                      onPressed: () {}, 
                      child: Image.asset(
                        ordlistaPath,
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
                      onPressed: () {}, 
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
                        kladguidePath,
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