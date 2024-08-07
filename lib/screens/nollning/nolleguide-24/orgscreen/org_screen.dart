import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/april_fools.dart';
import 'package:fsek_mobile/screens/cafe/cafe.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/accountingDepartment.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/cafe.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/conscience.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/corporateRelations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/educationalCouncil.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/facilitiesCommittee.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/festivitiesCommittee.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/foset.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/freja.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/management.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/ministryOfCulture.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/ministryOfTruth.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/nations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/procession.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/spex.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/teknologkaren.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/others.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide/people.dart';
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
    var t =  AppLocalizations.of(context)!;
    
    String backgroundPaperPath = "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_paper.png";
    String backgroundWoodPath = "assets/img/nollning-24/nolleguide/wood_background.png";

    String tlthButtonPath = "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_tlth.png";
    String frejaButtonPath = "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_freja.png";
    String orgFortPath = "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_fortdesign.png";

    String fsekButtonPath = "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_fsek_${t.localeName}.png";
    String introductionCommitteePath = "assets/img/nollning-24/nolleguide/organization_tree/introduction_${t.localeName}.png";
    String cafePath = "assets/img/nollning-24/nolleguide/organization_tree/cafe_${t.localeName}.png";
    String spexPath = "assets/img/nollning-24/nolleguide/organization_tree/spex.png";
    String accountingDepartmentPath = "assets/img/nollning-24/nolleguide/organization_tree/accounting_${t.localeName}.png";
    String ministryOfTruthPath = "assets/img/nollning-24/nolleguide/organization_tree/truth_${t.localeName}.png";
    String consciencePath = "assets/img/nollning-24/nolleguide/organization_tree/conscience_${t.localeName}.png";
    String guildsPath = "assets/img/nollning-24/nolleguide/organization_tree/guilds_${t.localeName}.png";
    String managementPath = "assets/img/nollning-24/nolleguide/organization_tree/management_${t.localeName}.png";
    String nationsPath = "assets/img/nollning-24/nolleguide/organization_tree/nations_${t.localeName}.png";
    String organizationPath = "assets/img/nollning-24/nolleguide/organization_tree/organisation.png";
    String othersPath = "assets/img/nollning-24/nolleguide/organization_tree/others_${t.localeName}.png";
    String processionPath = "assets/img/nollning-24/nolleguide/organization_tree/procession_${t.localeName}.png";
    String ministryOfCulturePath = "assets/img/nollning-24/nolleguide/organization_tree/culture_${t.localeName}.png";
    String festivitiesCommitteePath = "assets/img/nollning-24/nolleguide/organization_tree/festivities_${t.localeName}.png";
    String educationalCouncilPath = "assets/img/nollning-24/nolleguide/organization_tree/education_${t.localeName}.png";
    String corporateRelationsPath = "assets/img/nollning-24/nolleguide/organization_tree/corporate_sv.png";
    String facilitiesCommitteePath = "assets/img/nollning-24/nolleguide/organization_tree/facilities_${t.localeName}.png";

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    

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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (TeknologkarenScreenPage())));},
                                  child:
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          organizationPath
                                        ),
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
                                          guildsPath,
                                        ),
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (ManagementScreenPage())));},
                                  child:
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          managementPath,
                                        ), 
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (FosetScreenPage())));},
                                  child: 
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          introductionCommitteePath,
                                        ),
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (MinistryOfCultureScreenPage())));},
                                  child: 
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          ministryOfCulturePath,
                                        ),                 
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (FestivitiesCommitteeScreenPage())));},
                                  child: 
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          festivitiesCommitteePath,
                                        ),    
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (EducationalCouncilScreenPage())));},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          educationalCouncilPath,
                                        ),
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (AccountingDepartmentScreenPage())));},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          accountingDepartmentPath,
                                        ),
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (CafeScreenPage())));},
                                  child: 
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          cafePath,
                                        ),
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (CorporateRelationsScreenPage())));},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          corporateRelationsPath,
                                        ),
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (FacilitiesCommitteeScreenPage())));},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          facilitiesCommitteePath,
                                        ),
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (ConscienceScreenPage())));},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          consciencePath,
                                        ),
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (MinistryOfTruthScreenPage())));},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          ministryOfTruthPath,
                                        ),
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (ProcessionScreenPage())));},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          processionPath,
                                        ),
                      ]))))),
                    ])),
                  SizedBox(
                    width: screenWidth,
                    child: Container(    
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (OthersScreenPage())));},
                                  child: 
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          othersPath,
                                        ),
                      ]))),
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (FrejaScreenPage())));},
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
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (NationScreenPage())));},
                                  child:  
                                    Stack(
                                      children: [        
                                        Image.asset(
                                          nationsPath,
                                        ),
                      ]))))),
                    ],
                    )),
                  SizedBox(
                    width: screenWidth,
                    child: Container(    
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
                                          spexPath,
                                        ),
                      ]))))),
      ])) 
    )]
    )
  ))
  );
  }
}