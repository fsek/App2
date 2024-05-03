import 'package:flutter/material.dart';
import 'package:linkable/linkable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

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
            headerPhoneNumber: t.emergencyNumOne,
            bodyText: t.emergencyContentOne,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleTwo,
            headerPhoneNumber: t.emergencyNumTwo,
            bodyText: t.emergencyContentTwo,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleThree,
            headerPhoneNumber: t.emergencyNumThree,
            bodyText: t.emergencyContentThree,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleFour,
            headerPhoneNumber: t.emergencyNumFour,
            bodyText: t.emergencyContentFour,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleFive,
            headerPhoneNumber: t.emergencyNumFive,
            bodyText: t.emergencyContentFive,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleSix,
            headerPhoneNumber: t.emergencyNumSix,
            bodyText: t.emergencyContentSix,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleSeven,
            headerPhoneNumber: t.emergencyNumSeven,
            bodyText: t.emergencyContentSeven,
          ),
          _EmergencyText(
            headerText: t.emergencyTitleEight,
            // Dummy number because this title is different
            headerPhoneNumber: "",
            bodyText: t.emergencyContentEight,
          )
        ],
      ),
    );
  }
}

class _EmergencyText extends StatelessWidget {
  final String headerText;
  final String headerPhoneNumber;
  final String bodyText;

  _EmergencyText(
      {required this.headerText,
      required this.headerPhoneNumber,
      required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _HeaderText(headerText, headerPhoneNumber),
          _BodyText(bodyText),
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String phoneNumber;
  final String text;
  final TextStyle headerNumStyle = TextStyle(
    fontSize: 25.0,
    color: Colors.blue,
  );
  final TextStyle headerStyle = TextStyle(
    fontSize: 25.0,
    color: Colors.black,
  );
  final Color? color = Colors.grey[200];

  Future<void> _launchPhoneNumber(String phoneNumber) async {
    // phoneNumber can contain "-" and " ", launchUri removes these
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  _HeaderText(this.text, this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () {
            _launchPhoneNumber(phoneNumber);
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: phoneNumber, style: headerNumStyle),
                TextSpan(text: text, style: headerStyle),
              ],
            ),
          ),
        ),
      ),
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
