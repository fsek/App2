import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
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

  

 return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7E5127),
      ),
      body: SingleChildScrollView(
        child: Center(child: Stack(
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
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/12),
              child: Center(child: 
                  Container(
                    height: MediaQuery.of(context).size.height/1.1,
                    width: MediaQuery.of(context).size.width/1.1,
                    alignment: Alignment.topCenter,
                    child: 
                      Image.asset(
                        tlthButtonPath,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
            ))), 
          ),
          Center(child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/5.8, right: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/5.8, left: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            )))
            ])),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/3.3),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height/1.8,
                  width: MediaQuery.of(context).size.width/1.8,
                  child: Image.asset(
                      fsekButtonPath,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                )
              ))
          ),
          Center(child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.55, right: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.55, left: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            ])),
          Center(child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.2, right: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.2, left: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            ])),
          Center(child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.94, right: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.94, left: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            ])),
          Center(child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.73, right: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.73, left: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            ])),
          Center(child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.555, right: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.555, left: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            ])),
          Center(child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.42, right: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.42, left: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            ])),
          Center(child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.3),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            )))])),
          Center(child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.08, right: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.08, left: MediaQuery.of(context).size.width/2.5),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            ])),
          Center(child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.011),
              child: Container(
                height: MediaQuery.of(context).size.height/2.4,
                width: MediaQuery.of(context).size.width/2.4,
                child: Image.asset(
                  orgTextButtonPath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
            ))),
            ])),      
          ]))));
  }
}

