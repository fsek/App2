import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/april_fools.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/spex.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/guilds.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrganizationScreenPage extends StatefulWidget {
  @override
  _OrganizationScreenState createState() => _OrganizationScreenState();
}


class _OrganizationScreenState extends State<OrganizationScreenPage> {
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String backgroundPaperPath = "assets/img/nollning-24/organization_tree/orgscreen_paper.png";
    String backgroundWoodPath = "assets/img/nollning-24/organization_tree/orgscreen_wood_background.png";
    String tlthButtonPath = "assets/img/nollning-24/organization_tree/orgscreen_tlth.png";
    String orgTextButtonPath = "assets/img/nollning-24/organization_tree/orgscreen_textbutton.png";
    String fsekButtonPath = "assets/img/nollning-24/organization_tree/orgscreen_fsek.png";
    String frejaButtonPath = "assets/img/nollning-24/organization_tree/orgscreen_freja.png";
    String orgFortPath = "assets/img/nollning-24/organization_tree/orgscreen_fortdesign.png";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var t =  AppLocalizations.of(context)!;

return Scaffold(
  appBar: AppBar(
        backgroundColor: Color(0xFF7E5127), //#540909 för den röda färgen
        title: Text(
          t.organizationTree,
          style: TextStyle(
            fontFamily: "Testament",
            fontSize: screenWidth/15,
            color: Color(0xFFE9CA97),
        ),
      )),
  body: InteractiveViewer(
  panEnabled: true,
  child:
   SingleChildScrollView(
    child: Stack(
      children: [
        Image.asset(
          backgroundWoodPath,
          fit: BoxFit.cover,
        ),
        Image.asset(
          backgroundPaperPath,
          fit: BoxFit.cover,
        ),
        Image.asset(
          orgFortPath,
          fit: BoxFit.cover,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 70),
            child: 
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 60, right: 60),
                    child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.horizontal()
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                      ),
                      onPressed: () {launchUrl(Uri.parse('https://www.tlth.se/nollning/'));},
                      child: Image.asset(
                        tlthButtonPath,
                  ))),
                  SizedBox(
                    width: screenWidth,
                    child:
                    Row(
                      children: [
                        Expanded(child:
                            Container(    
                              margin: EdgeInsets.only(top: 5 , left: 40, right: 5), 
                              child:
                              Center(   
                                child: 
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child:
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                          fit: BoxFit.cover
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          child: Center(
                                            child:
                                              Text(
                                                t.organization,
                                                style: TextStyle(
                                                  fontFamily: "Testament",
                                                  fontSize: screenWidth/24,
                                                  color: Color(0xFFE9CA97),
                                        )))),
                          ]))))),
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 5, left: 5, right: 40), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GuildScreenPage()));},
                                  child:
                                    Stack(
                                      children: [ 
                                        Image.asset(
                                          orgTextButtonPath,
                                          fit: BoxFit.cover
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          child: Center(
                                            child:
                                              Text(
                                                t.guilds,
                                                style: TextStyle(
                                                  fontFamily: "Testament",
                                                  fontSize: screenWidth/22,
                                                  color: Color(0xFFE9CA97),   
                                    )))),
                      ]))))),
                    ],
                    )),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 60, right: 60),
                    child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.horizontal()
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                      ),
                      onPressed: () {launchUrl(Uri.parse('https://fsektionen.se/'));},
                      child: Image.asset(
                        fsekButtonPath,
                  ))),
                  SizedBox(
                    width: screenWidth,
                    child:
                    Row(
                      children: [
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 5, left: 40, right: 5), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child:
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          child: Center(
                                            child:
                                              Text(
                                                t.theManagement,
                                                style: TextStyle(
                                                  fontFamily: "Testament",
                                                  fontSize: screenWidth/30,
                                                  color: Color(0xFFE9CA97),
                                    )))),
                      ]))))),
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 5, left: 5, right: 40), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child: 
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          child: Center(
                                            child: 
                                              Text(
                                                t.introductionCommittee,
                                                style: TextStyle(
                                                  fontFamily: "Testament",
                                                  fontSize: screenWidth/35,
                                                  color: Color(0xFFE9CA97),                                   
                                    )))),
                      ]))))),
                    ],
                    )),
                  SizedBox(
                    width: screenWidth,
                    child:
                    Row(
                      children: [
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0 , left: 40, right: 5), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child: 
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          child: Center(
                                            child:
                                              Text(
                                                t.ministryOfCulture,
                                                style: TextStyle(
                                                  fontFamily: "Testament",
                                                  fontSize: screenWidth/30,
                                                  color: Color(0xFFE9CA97),                                     
                                    )))),
                      ]))))),
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0, left: 5, right: 40), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child: 
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 7),
                                          child: Center(
                                            child: 
                                              Text(
                                                t.festivitiesCommittee,
                                                style: TextStyle(
                                                  fontFamily: "Testament",
                                                  fontSize: screenWidth/33,
                                                  color: Color(0xFFE9CA97),
                                    )))),
                      ]))))),
                    ])),
                  SizedBox(
                    width: screenWidth,
                    child:
                    Row(
                      children: [
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0 , left: 40, right: 5), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          child: Center(
                                            child: Expanded(child:
                                              Text(
                                              t.educationalCouncil,
                                              style: TextStyle(
                                                fontFamily: "Testament",
                                                //fontSize: screenWidth/24,
                                                color: Color(0xFFE9CA97),                                     
                                    ))))),
                      ]))))),
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0, left: 5, right: 40), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 8),
                                          child: Center(
                                            child:
                                              Text(
                                                t.theAccountingDepartment,
                                                style: TextStyle(
                                                  fontFamily: "Testament",
                                                  fontSize: screenWidth/37,
                                                  color: Color(0xFFE9CA97),
                                    )))),
                      ]))))),
                    ],
                    )),
                  SizedBox(
                    width: screenWidth,
                    child:
                    Row(
                      children: [
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0 , left: 40, right: 5), 
                              child: 
                              Center(   
                                child: 
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child: 
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          child: Center(
                                            child:
                                              Text(
                                                t.hilbertCafe,
                                                style: TextStyle(
                                                fontFamily: "Testament",
                                                fontSize: screenWidth/30,
                                                color: Color(0xFFE9CA97),                                     
                                    )))),
                            ]))))),
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0, left: 5, right: 40), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          child: Center(
                                            child:
                                              Text(
                                                t.corporateRelations,
                                                style: TextStyle(
                                                  fontFamily: "Testament",
                                                  fontSize: screenWidth/32,
                                                  color: Color(0xFFE9CA97),                                   
                                    )))),
                      ]))))),
                    ],
                    )),
                  SizedBox(
                    width: screenWidth,
                    child: Row(
                      children: [
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0 , left: 40, right: 5), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          child: Center(
                                            child:
                                              Text(
                                                t.facilitiesCommittee,
                                                style: TextStyle(
                                                  fontFamily: "Testament",
                                                  fontSize: screenWidth/31,
                                                  color: Color(0xFFE9CA97),
                                    )))),
                        ]))))),
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0, left: 5, right: 40), 
                              child: Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          child: Center( 
                                            child:
                                              Text(
                                                t.theConscience,
                                                style: TextStyle(
                                                  fontFamily: "Testament",
                                                  fontSize: screenWidth/28,
                                                  color: Color(0xFFE9CA97),
                                    )))),
                      ]))))),
                    ])),
                  SizedBox(
                    width: screenWidth,
                    child:
                    Row(
                      children: [
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0 , left: 40, right: 5), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 7),
                                          child: 
                                            Center(
                                              child:
                                                Text(
                                                  t.ministryOfTruth,
                                                  style: TextStyle(
                                                    fontFamily: "Testament",
                                                    fontSize: screenWidth/34,
                                                    color: Color(0xFFE9CA97),                               
                                    )))),
                        ]))))),
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0, left: 5, right: 40), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          child: 
                                            Center(
                                              child:
                                                Text(
                                                  t.theProcession,
                                                  style: TextStyle(
                                                    fontFamily: "Testament",
                                                    fontSize: screenWidth/30,
                                                    color: Color(0xFFE9CA97),
                                      
                                    )))),
                      ]))))),
                    ])),
                  SizedBox(
                    width: screenWidth,
                    child:
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0, left: 115, right: 115), 
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child: 
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          child: Center(
                                            child:
                                              Text(
                                                t.others,
                                                style: TextStyle(
                                                  fontFamily: "Testament",
                                                  fontSize: screenWidth/22,
                                                  color: Color(0xFFE9CA97),                 
                                    )))),
                      ])))),
                    ),
                  SizedBox(
                    width: screenWidth,
                    child:
                    Row(
                      children: [
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 40, left: 40, right: 5), 
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child:           
                                    Image.asset(
                                      frejaButtonPath,
                        )))),
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 40, left: 5, right: 40), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          child: 
                                            Center(
                                              child:
                                                Text(
                                                  t.nations,
                                                  style: TextStyle(
                                                    fontFamily: "Testament",
                                                    fontSize: screenWidth/21,
                                                    color: Color(0xFFE9CA97),
                                      
                                    )))),
                      ]))))),
                    ],
                    )),
                  SizedBox(
                    width: screenWidth,
                    child:
                        Expanded(
                          child:
                            Container(    
                              margin: EdgeInsets.only(top: 0, left: 115, right: 115), 
                              child: 
                              Center(   
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(),
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.horizontal()
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent
                                  ),
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SpexPage()));},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          orgTextButtonPath,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          child: 
                                            Center(
                                              child:
                                                Text(
                                                  "spex",
                                                  style: TextStyle(
                                                    fontFamily: "Testament",
                                                    fontSize: screenWidth/22,
                                                    color: Color(0xFFE9CA97),                            
                                    )))),
                      ])))))),
      ])) 
    )]
    )
  ))
  );
  }
}