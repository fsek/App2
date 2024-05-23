import 'package:flutter/material.dart';
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
    String backgroundPath = "assets/img/nollning-24/organization_tree/orgscreen_paper.png";

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
    SingleChildScrollView(child: Column(children: [
    Image.asset(
        backgroundPath,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
    ), 
    Container(width: 1000, height: 1000, color: Colors.red.withOpacity(0.5)),  
    ])),
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
