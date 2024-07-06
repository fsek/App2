import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fsek_mobile/april_fools.dart';

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
    
    return Stack(children: [
      Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Organisationsträd",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    ),
      Image.asset(
        backgroundWoodPath,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,),
      Image.asset(
        backgroundPaperPath,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,),
      Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Organisationsträd",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    ),
    ]);
  }
}
