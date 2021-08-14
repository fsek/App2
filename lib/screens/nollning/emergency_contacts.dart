import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontaktinformation'),
      ),
      body: ListView(
        children: <Widget>[
          _EmergencyText(
            headerText: "Nolleakuten: 076-764 96 69",
            bodyText:
                "Detta numret går till Föset alla dygnets timmar och skall bara "
                "användas vid nödsituation. Vid en allvarlig olycka bör du ringa "
                "112 först, men tänk på att det är ytterst viktigt att vi får "
                "reda på vad som har hänt. Lägg in numret i din telefon nu!\n\n"
                "Vi har även en mailadress som du kan nå oss på gällande mindre "
                "brådskande ärenden. Om du vill vara anonym kan du alltid kontakta "
                "oss, likabehandlingsutskottet eller styrelsen genom det anonyma "
                "kontaktformuläret.\n\n Epost: foset@fsektionen.se",
          ),
          _EmergencyText(
            headerText: "Viktiga kontakter",
            bodyText: "en bit text som förhoppningsvis tar flera rader och så",
          ),
          _EmergencyText(
            headerText: "Studie och karriärvägledningen",
            bodyText: "en bit text som förhoppningsvis tar flera rader och så",
          ),
          _EmergencyText(
            headerText: "Avdelningen för pedagogiskt stöd",
            bodyText: "en bit text som förhoppningsvis tar flera rader och så",
          ),
          _EmergencyText(
            headerText: "Kurator",
            bodyText: "en bit text som förhoppningsvis tar flera rader och så",
          ),
          _EmergencyText(
            headerText: "Studenthälsan",
            bodyText: "en bit text som förhoppningsvis tar flera rader och så",
          ),
          _EmergencyText(
            headerText: "Likabehandlingsordförande",
            bodyText: "en bit text som förhoppningsvis tar flera rader och så",
          ),
          _EmergencyText(
            headerText: "Utbildningsminister",
            bodyText: "en bit text som förhoppningsvis tar flera rader och så",
          ),
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
    fontSize: 26.0,
    color: Colors.black,
  );
  final double height = 48;
  final Color? color = Colors.grey[200];

  _HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            style: headerStyle,
            children: <TextSpan>[
              TextSpan(
                text: text,
              ),
            ],
          ),
        ),
      ),
      color: color,
      width: double.infinity,
      height: height,
    );
  }
}

class _BodyText extends StatelessWidget {
  final String text;
  final TextStyle headerStyle = TextStyle(
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
        child: RichText(
          text: TextSpan(
            style: headerStyle,
            children: <TextSpan>[
              TextSpan(
                text: text,
              ),
            ],
          ),
        ),
      ),
      width: double.infinity,
    );
  }
}
