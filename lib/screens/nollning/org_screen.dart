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
    String orgTextButtonPath = "assets/img/nollning-24/organization_tree/orgscreen_textbutton.png";
    String fsekButtonPath = "assets/img/nollning-24/organization_tree/orgscreen_fsek.png";
    String orgFortPath = "assets/img/nollning-24/organization_tree/orgscreen_fortdesign.png";

/*
    return Stack(children: [SingleChildScrollView(
      child: Column(children: [PhotoView(imageProvider: AssetImage(backgroundWoodPath))],

      )
    )]);
  }
}*/

    
    return Stack(children: [
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
      Padding(padding: EdgeInsets.only(top: 80), child: Container(
        alignment: Alignment.topCenter,
        child: Image.asset(
          tlthButtonPath,
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width/1.5,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,),)),
      Padding(padding: EdgeInsets.only(top: 160, left: 30), child: Container(alignment: Alignment.topCenter, 
      child: Row(
        children: [Stack(children: [
          Image.asset(
            orgTextButtonPath, 
            height: MediaQuery.of(context).size.height/2.3, 
            width: MediaQuery.of(context).size.width/2.3,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter), 
          FittedBox(fit: BoxFit.contain, child: Text("Organisation", style: Theme.of(context).textTheme.headlineMedium))]), 
          Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), 
          Padding(padding: EdgeInsets.only(top: 7, left: 40), child: Text("Sektioner", style: Theme.of(context).textTheme.headlineMedium))])],))),
          Padding(padding: EdgeInsets.only(top: 150), child: Container(alignment: Alignment.center, 
            child: Image.asset(
              fsekButtonPath,
              height: MediaQuery.of(context).size.height/1.5,
              width: MediaQuery.of(context).size.width/1.5,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,))),
          Padding(padding: EdgeInsets.only(top: 110, left: 30), child: Container(alignment: Alignment.center, child: Row(children: [Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)]), 
            Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)])]))),
          Padding(padding: EdgeInsets.only(top: 210, left: 30), child: Container(alignment: Alignment.center, child: Row(children: [Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)]), 
            Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)])]))),
          Padding(padding: EdgeInsets.only(top: 310, left: 30), child: Container(alignment: Alignment.center, child: Row(children: [Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)]), 
            Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)])]))),
          Padding(padding: EdgeInsets.only(top: 410, left: 30), child: Container(alignment: Alignment.center, child: Row(children: [Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)]), 
            Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)])]))),
          Padding(padding: EdgeInsets.only(top: 510, left: 30), child: Container(alignment: Alignment.center, child: Row(children: [Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)]), 
            Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)])]))),
          Padding(padding: EdgeInsets.only(top: 575, left: 30), child: Container(alignment: Alignment.center, child: Row(children: [Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)]), 
            Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)])]))),
          Padding(padding: EdgeInsets.only(top: 630), child: Container(
            alignment: Alignment.topCenter,
            child: Stack(children: [Image.asset(
              orgTextButtonPath,
              height: MediaQuery.of(context).size.height/2.3,
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,), 
              Text("", style: Theme.of(context).textTheme.headlineMedium)]))),  
          Padding(padding: EdgeInsets.only(top: 750, left: 30), child: Container(alignment: Alignment.center, child: Row(children: [Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)]), 
            Stack(children: [Image.asset(
              orgTextButtonPath, 
              height: MediaQuery.of(context).size.height/2.3, 
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter), Text("", style: Theme.of(context).textTheme.headlineMedium)])]))),
          Padding(padding: EdgeInsets.only(top: 805), child: Container(
            alignment: Alignment.topCenter,
            child: Stack(children: [Image.asset(
              orgTextButtonPath,
              height: MediaQuery.of(context).size.height/2.3,
              width: MediaQuery.of(context).size.width/2.3,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,), 
              Text("", style: Theme.of(context).textTheme.headlineMedium)]))),
          Padding(padding: EdgeInsets.only(top: 50), child: Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              orgFortPath,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter
            ))),
      Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Color(0xFF7E5127),
        //title: Text(
          //"Organisationsträd",
          //style: Theme.of(context).textTheme.headlineMedium,
        //),
      ),
    ),
    ]);
  }
}


