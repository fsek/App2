import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class StodFunktionerScreenPage extends StatefulWidget {
  @override
  _StodFunktionerScreenState createState() => _StodFunktionerScreenState();
}



Future<void> _launchPhoneNumber(String phoneNumber) async {
    // phoneNumber can contain "-" and " ", launchUri removes these
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
}


Future<void> _launchMail(String phoneNumber) async {
  final Uri launchUri = Uri(
      scheme: 'mailto',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
}

class _StodFunktionerScreenState extends State<StodFunktionerScreenPage> {

  void initState(){
    super.initState();
  }


  Widget build(BuildContext context){

    String backgroundPaperPath = "assets/img/nollning-24/nolleguide/nolleguide_paper.png";
    String backgroundWoodPath = "assets/img/nollning-24/nolleguide/wood_background.png";

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    var t =  AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
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
                            Center(
                              child: Text(
                                t.supportFunctions,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Testament",
                                  fontSize: screenWidth/15,
                                  color: Color(0xFF540909)
                                )
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              t.supportIntro,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                fontSize: screenWidth/29
                              ),
                            ),
                            SizedBox(height: 80),
                            Text(
                              t.supportImportantContacts,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Testament",
                                fontSize: screenWidth/24,
                                color: Color(0xFF540909)
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              t.supportImportantContactsContent,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth/29
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              t.supportEmergency,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: screenWidth/29
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              t.schoolCareerCousellor,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth/27
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              t.schoolCareerCousellorContent,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth/29
                              ),
                            ),
                            SizedBox(height: 40),
                            Text(
                              t.careerCounsellorOne,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth/29
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {_launchPhoneNumber(t.counsellorOneNumber);}, 
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
                              child: Text(
                                t.counsellorOneNumber,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth/29,
                                  color: Colors.black
                                )
                              )
                              ),
                            ElevatedButton(
                              onPressed: () {_launchMail(t.counsellorOneEmail);}, 
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
                                t.counsellorOneEmail,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF5269D1),
                                  fontSize: screenWidth/29
                                )
                              ))
                              )
                          ],
                      ))
                  ],
                ),
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
                            Text(
                              t.careerCounsellorTwo,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth/29
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {_launchPhoneNumber(t.counsellorTwoNumber);}, 
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
                              child: Text(
                                t.counsellorTwoNumber,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth/29,
                                  color: Colors.black
                                )
                              )
                              ),
                            ElevatedButton(
                              onPressed: () {_launchMail(t.counsellorTwoEmail);}, 
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
                                t.counsellorTwoEmail,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF5269D1),
                                  fontSize: screenWidth/29
                                )
                              ))
                              ),
                            SizedBox(height: 20),
                            Text(
                              t.careerCounsellorThree,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth/29
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {_launchPhoneNumber(t.counsellorThreeNumber);}, 
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
                              child: Text(
                                t.counsellorThreeNumber,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth/29,
                                  color: Colors.black
                                )
                              )
                              ),
                            ElevatedButton(
                              onPressed: () {_launchMail(t.counsellorThreeEmail);}, 
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
                                t.counsellorThreeEmail,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF5269D1),
                                  fontSize: screenWidth/29
                                )
                              ))
                              ),
                            SizedBox(height: 20),
                            Text(
                              t.internationalCoordinators,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth/27
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              t.internationalCoordinatorsContent,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth/29
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {launchUrl(Uri.parse(t.internationalCoordinatorsWebsite));}, 
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
                                t.internationalCoordinatorsWebsite,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF5269D1),
                                  fontSize: screenWidth/29
                                )
                              ))
                              ),
                      ],
                    ))
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(backgroundWoodPath),
                    Image.asset(backgroundPaperPath),
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(backgroundWoodPath),
                    Image.asset(backgroundPaperPath),
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(backgroundWoodPath),
                    Image.asset(backgroundPaperPath),
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(backgroundWoodPath),
                    Image.asset(backgroundPaperPath),
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(backgroundWoodPath),
                    Image.asset(backgroundPaperPath),
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(backgroundWoodPath),
                    Image.asset(backgroundPaperPath),
                  ],
                )
              ],
            )
          ],
        )
      )
    );
  }
}