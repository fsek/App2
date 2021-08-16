import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkable/linkable.dart';

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
            headerText: "Nolleakuten: +46-736215088",
            bodyText:
                "Detta numret går till Föset alla dygnets timmar och skall bara "
                "användas vid nödsituation. Vid en allvarlig olycka bör du ringa "
                "112 först, men tänk på att det är ytterst viktigt att vi får "
                "reda på vad som har hänt. Lägg in numret i din telefon nu!\n"
                "\nVi har även en mailadress som du kan nå oss på gällande mindre "
                "brådskande ärenden. Om du vill vara anonym kan du alltid kontakta "
                "oss, likabehandlingsutskottet eller styrelsen genom det anonyma "
                "kontaktformuläret.\n\n Epost: foset@fsektionen.se",
          ),
          _EmergencyText(
            headerText: "Viktiga kontakter",
            bodyText:
                "Som ny student på LTH är det lätt att känna sig förvirrad "
                "eller bara frågvis. Som tur är finns det gott om folk som har "
                "stenkoll på precis det du behöver veta, eller som är där för "
                "dig om du behöver prata. Förutom de personer vi presenterar för "
                "dig här kan du naturligtvis vända dig till oss i Föset eller dina faddrar!",
          ),
          _EmergencyText(
            headerText: "Studie och karriärvägledningen",
            bodyText:
                "Om du har frågor som gäller din utbildning, vilket en stor del "
                "av ditt liv på LTH gör, så ska du vända dig hit. Du kanske är orolig "
                "för att du läser fel kurser, eller för att du kanske rent av valt "
                "fel program. Till exempel om du är intresserad av läsa utomlands, "
                "eller om du kanske har svårt att hitta studiemotivationen. Oavsett "
                "vad kan du vända dig till din studievägledare, som du kan besöka mitt "
                "i E-huset högst upp på våning 5. Du ser dem även i Hilbert café varje "
                "fredag förmiddag under läsveckorna, ta tillfället i akt att säga hej eller ställa frågor!\n"
                "\nTeknisk Fysik och Teknisk Nanovetenskap\n"
                "Maria Sörensson \n"
                "E-post: "
                "maria.sorensson@kansli.lth.se\n"
                "Tel: "
                "+46-462220854\n"
                "Drop-in tisdag kl 12:00-13:00\n"
                "Drop-in fredag kl 09:30-11:00 i Hilbert Café\n"

                "\nTeknisk Matematik\n"
                "Karin Cherfils-Karlsson\n"
                "E-post: "
                "karin.cherfils-karlsson@kansli.lth.se\n"
                "Tel: "
                "+46-462223736\n"
                "Drop-in fredag kl 09:30-11:00 i Hilbert Café",
          ),
          _EmergencyText(
            headerText: "Avdelningen för pedagogiskt stöd",
            bodyText:
              "Här finns tre samordnare tillgängliga för att diskutera "
              "dina eventuella behov av pedagogiska stödåtgärder. Som funktionshindrad "
              "har man samma rätt som andra studenter att få undervisning av hög kvalitet "
              "och en bra studiemiljö. För att du ska få ta del av stödinsatser så "
              "som anteckningshjälp, stöd av mentor och individuell handledning, "
              "måste ditt funktionshinder vara varaktigt.\n"
              "\nChristina Rowa"
              "\nPedagogiskt stöd samordnare för LTH"
              "\nE-post: christina.rowa@stu.lu.se"
              "\nTel: +46-462227050"
              "\nGenetikhuset, Sölvegatan 29 B, Lund\n"
              "\nLäs mer om pedagogiskt stöd:"
              "\nhttps://www.lu.se/studera/livet-som-student/service-och-stod/pedagogiskt-stod"
            ,
          ),
          _EmergencyText(
            headerText: "Kurator",
            bodyText:
              "Om man har personliga bekymmer, har hamnat i någon form av "
              "kris eller bara vill prata med någon kan man vända sig till "
              "studiekuratorn för F, n och π. Du hittar henne mitt i E-huset högst "
              "upp på våning 5. Hon är utbildad socionom, och har naturligtvis tystnadsplikt.\n"
              "\nEmma Hammarlund"
              "\nStudiekurator F, n och π"
              "\nE-post: emma.hammarlund@lth.lu.se"
              "\nTel: +46-462227247"
            ,
          ),
          _EmergencyText(
            headerText: "Studenthälsan",
            bodyText:
              "Här finns kuratorer, sjuksköterskor, psykologer, psykiater, "
              "allmänläkare, sjukgymnaster och vårdadministratörer. Hit kan alla "
              "studenter vid Lunds Universitet vända sig. Här finns gruppkurser som "
              "“Tentaångest” och “Våga tala”. Alla besök ska tidsbokas, och besöken "
              "kostar 60 SEK. Studenthälsan fungerar som ett komplement till vårdcentralen "
              "och personalen har naturligtvis tystnadsplikt.\n"

              "\nTel: +46-462224377"
              "\nParadisgatan 5B, Lund\n"
              "\nLäs mer om Studenthälsan:"
              "\nhttps://www.lu.se/studera/livet-som-student/service-och-stod/pedagogiskt-stod"
            ,
          ),
          _EmergencyText(
            headerText: "Likabehandlingsordförande",
            bodyText:
              "Mig når ni bäst via mail men om ni vill vara anonyma kan ni även använda "
              "det anonyma kontaktformuläret på F-sektionens hemsida. Tveka inte att höra "
              "av om ni känner er osäkra, obekväma eller orättvist behandlade.\n"
              "\nJakob Wiren"
              "\nE-post: libo@fsektionen.se"
              "\nAnonymt kontaktformulär:"
              "\nhttps://contact.fsektionen.se"
            ,
          ),
          _EmergencyText(
            headerText: "Utbildningsminister",
            bodyText:
              "Ni får gärna kontakta mig om ni har några frågor eller "
              "funderingar angående utbildningen eller något studierelaterat event "
              "eller projekt som ni vill driva. Jag nås bäst via email, men ni kan "
              "även komma fram till mig i MH och snacka om ni vill.\n"
              "\nDaniel Nesic"
              "\nE-post: um@fsektionen.se"
            ,
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
        child: Flexible(child:Linkable(text: text, style: headerStyle))
      ),
      color: color,
      width: double.infinity,
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
