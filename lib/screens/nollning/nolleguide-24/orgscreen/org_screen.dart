import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/nations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/committee_page.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/spex.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/others.dart';
import 'package:fsek_mobile/services/preload_asset.service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/guilds.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrganizationScreenPage extends StatefulWidget {
  @override
  _OrganizationScreenState createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreenPage> {
  ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.zero,
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.horizontal()),
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
  );
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    String backgroundPaperPath = "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_paper.png";
    String backgroundWoodPath = "assets/img/nollning-24/nolleguide/wood_background.png";

    String tlthButtonPath = "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_tlth.png";
    String frejaButtonPath = "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_freja.png";
    String orgFortPath = "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_fortdesign.png";

    String fsekButtonPath = "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_fsek_${t.localeName}.png";
    String introductionCommitteePath =
        "assets/img/nollning-24/nolleguide/organization_tree/introduction_${t.localeName}.png";
    String cafePath = "assets/img/nollning-24/nolleguide/organization_tree/cafe_${t.localeName}.png";
    String spexPath = "assets/img/nollning-24/nolleguide/organization_tree/spex.png";
    String accountingDepartmentPath =
        "assets/img/nollning-24/nolleguide/organization_tree/accounting_${t.localeName}.png";
    String ministryOfTruthPath = "assets/img/nollning-24/nolleguide/organization_tree/truth_${t.localeName}.png";
    String consciencePath = "assets/img/nollning-24/nolleguide/organization_tree/conscience_${t.localeName}.png";
    String guildsPath = "assets/img/nollning-24/nolleguide/organization_tree/guilds_${t.localeName}.png";
    String managementPath = "assets/img/nollning-24/nolleguide/organization_tree/management_${t.localeName}.png";
    String nationsPath = "assets/img/nollning-24/nolleguide/organization_tree/nations_${t.localeName}.png";
    String organizationPath = "assets/img/nollning-24/nolleguide/organization_tree/organisation.png";
    String othersPath = "assets/img/nollning-24/nolleguide/organization_tree/others_${t.localeName}.png";
    String processionPath = "assets/img/nollning-24/nolleguide/organization_tree/procession_${t.localeName}.png";
    String ministryOfCulturePath = "assets/img/nollning-24/nolleguide/organization_tree/culture_${t.localeName}.png";
    String festivitiesCommitteePath =
        "assets/img/nollning-24/nolleguide/organization_tree/festivities_${t.localeName}.png";
    String educationalCouncilPath = "assets/img/nollning-24/nolleguide/organization_tree/education_${t.localeName}.png";
    String corporateRelationsPath = "assets/img/nollning-24/nolleguide/organization_tree/corporate_sv.png";
    String facilitiesCommitteePath =
        "assets/img/nollning-24/nolleguide/organization_tree/facilities_${t.localeName}.png";

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF7E5127), //#540909 för den röda färgen
          title: Text(
            t.organizationTree,
            style: TextStyle(
              fontFamily: "Testament",
              fontSize: screenWidth / 15,
              color: Color(0xFFE9CA97),
            ),
          )),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(backgroundWoodPath, fit: BoxFit.cover),
            Image.asset(backgroundPaperPath, fit: BoxFit.cover),
            Image.asset(orgFortPath, fit: BoxFit.cover),
            Padding(
                padding: EdgeInsets.only(top: 70),
                child: Column(children: [
                  Row(children: [
                    _otherButton(tlthButtonPath,
                        onTap: () => launchUrl(Uri.parse('https://www.tlth.se/nollning/')),
                        padding: EdgeInsets.only(left: 60, right: 60, bottom: 5)),
                  ]),
                  Row(
                    children: [
                      _committeeButton("Teknologkåren", "teknologkarenPaths", "teknologkaren.json", organizationPath,
                          leftmost: true),
                      _otherButton(guildsPath,
                          onTap: _pushAndPreload(GuildScreenPage()), padding: EdgeInsets.only(left: 5, right: 40)),
                    ],
                  ),
                  Row(children: [
                    _otherButton(fsekButtonPath,
                        onTap: () => launchUrl(Uri.parse('https://fsektionen.se/')),
                        padding: EdgeInsets.only(top: 15, left: 60, right: 60, bottom: 5)),
                  ]),
                  Row(children: [
                    _committeeButton(t.theManagement, "managementPaths", "management.json", managementPath,
                        leftmost: true),
                    _committeeButton(t.introductionCommittee, "fosetPaths", "foset.json", introductionCommitteePath,
                        leftmost: false),
                  ]),
                  Row(children: [
                    _committeeButton(
                        t.ministryOfCulture, "culturePaths", "ministryOfCulture.json", ministryOfCulturePath,
                        leftmost: true),
                    _committeeButton(t.festivitiesCommittee, "festivitiesPath", "festivitiesCommittee.json",
                        festivitiesCommitteePath,
                        leftmost: false),
                  ]),
                  Row(children: [
                    _committeeButton(
                        t.educationalCouncil, "educationPaths", "educationalCouncil.json", educationalCouncilPath,
                        leftmost: true),
                    _committeeButton(t.theAccountingDepartment, "accountingPaths", "accountingDepartment.json",
                        accountingDepartmentPath,
                        leftmost: false),
                  ]),
                  Row(children: [
                    _committeeButton(t.hilbertCafe, "cafePaths", "cafe.json", cafePath, leftmost: true),
                    _committeeButton(
                        t.corporateRelations, "corporatePaths", "corporateRelations.json", corporateRelationsPath,
                        leftmost: false),
                  ]),
                  Row(children: [
                    _committeeButton(
                        t.facilitiesCommittee, "facilitiesPaths", "facilitiesCommittee.json", facilitiesCommitteePath,
                        leftmost: true),
                    _committeeButton(t.theConscience, "consciencePaths", "conscience.json", consciencePath,
                        leftmost: false),
                  ]),
                  Row(children: [
                    _committeeButton(t.ministryOfTruth, "truthPaths", "ministryOfTruth.json", ministryOfTruthPath,
                        leftmost: true),
                    _committeeButton(t.theProcession, "processtionPaths", "procession.json", processionPath,
                        leftmost: false),
                  ]),
                  Row(children: [
                    _otherButton(othersPath,
                        onTap: _pushAndPreload(OthersScreenPage()),
                        padding: EdgeInsets.only(left: 115, right: 115, bottom: 40)),
                  ]),
                  Row(
                    children: [
                      _committeeButton("FREJA", "frejaPaths", "freja.json", frejaButtonPath, leftmost: true),
                      _otherButton(nationsPath,
                          onTap: _pushAndPreload(NationScreenPage()), padding: EdgeInsets.only(left: 5, right: 40)),
                    ],
                  ),
                  Row(children: [
                    _otherButton(spexPath,
                        onTap: _pushAndPreload(SpexPage()), padding: EdgeInsets.only(left: 115, right: 115)),
                  ]),
                ]))
          ],
        ),
      ),
    );
  }

  Widget _committeeButton(String committeeName, String assetNames, String dataPath, String buttonPath,
      {bool leftmost = true}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: leftmost ? 40 : 5, right: leftmost ? 5 : 40),
        child: ElevatedButton(
          style: _buttonStyle,
          onPressed: _pushAndPreload(
            CommitteePage(committeeName: committeeName, committeeDataLocation: dataPath),
            assetNames: assetNames,
          ),
          child: Image.asset(buttonPath),
        ),
      ),
    );
  }

  Widget _otherButton(String buttonPath, {required Function() onTap, EdgeInsetsGeometry padding = EdgeInsets.zero}) {
    return Expanded(
      child: Padding(
          padding: padding,
          child: ElevatedButton(
            style: _buttonStyle,
            onPressed: onTap,
            child: Image.asset(buttonPath),
          )),
    );
  }

  Function() _pushAndPreload(Widget destination, {String assetNames = "backgroundPaths"}) {
    return () async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      await preloadAssets(context, assetNames);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
    };
  }
}
