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
      Image.asset(
        backgroundPath,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
      Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    ),
    ]);
  }
}
