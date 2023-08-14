import 'package:flutter/material.dart';
import 'package:linkable/linkable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//TODO: fixa länkar i texten.

class EmergencyContactsPage extends StatefulWidget {
  @override
  _EmergencyContactsPageState createState() => _EmergencyContactsPageState();
}

class _EmergencyContactsPageState extends State<EmergencyContactsPage> {
  void initState() {
    super.initState();
  }

  TextStyle headerStyle = TextStyle(
    fontSize: 26.0,
    color: Colors.black,
  );
  TextStyle bodyStyle = TextStyle(
    fontSize: 26.0,
    color: Colors.black,
  );
  TextStyle linkStyle = TextStyle(
    color: Colors.blue,
  );
//lägg  in translations för allt nedan!
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.emergencyContacts),
      ),
      body: ListView(
        children: <Widget>[
          _EmergencyText(
            headerText: t.emergencyTitleOne,
            bodyText: t.emergencyContentOne,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleTwo,
            bodyText: t.emergencyContentTwo,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleThree,
            bodyText: t.emergencyContentThree,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleFour,
            bodyText: t.emergencyContentFour,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleFive,
            bodyText: t.emergencyContentFive,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleSix,
            bodyText: t.emergencyContentSix,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleSeven,
            bodyText: t.emergencyContentSeven,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleEight,
            bodyText: t.emergencyContentEight,
          )
        ],
      ),
    );
  }
}

class _EmergencyText extends StatelessWidget {
  final String headerText;
  final String bodyText;

  _EmergencyText({required this.headerText, required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _HeaderText(headerText),
          _BodyText(bodyText),
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String text;
  final TextStyle headerStyle = TextStyle(
    fontSize: 25.0,
    color: Colors.black,
  );
  final Color? color = Colors.grey[200];

  _HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Row(children: [
            Flexible(child: Linkable(text: text, style: headerStyle))
          ])),
      color: color,
    );
  }
}

class _BodyText extends StatelessWidget {
  final String text;
  final TextStyle bodyStyle = TextStyle(
    fontSize: 15.0,
    color: Colors.black,
  );

  _BodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Container(
          alignment: Alignment.centerLeft,
          child: Linkable(text: text, style: bodyStyle)),
    );
  }
}
