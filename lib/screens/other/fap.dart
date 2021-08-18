import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class FapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> knackare = [
      "Ludwig Linder, su-perman 2021",
      "Lukas Gustavsson, Spindelförman 20/21",
      "Teodor Åberg, su-perman 2021",
      "Emil Manelius, Spindelförman 21/22",
      "Nils Thorin, Spindelman 2021",
      "Hannes Ryberg, su-perman 2021",
    ];
    List<String> inspiration = [
      "https://www.youtube.com/watch?v=k238XpMMn38"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Om F-appen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("F-appen", style: Theme.of(context).textTheme.headline4?.apply(color: Colors.orange[600]),),
            SizedBox(height: 10,),
            Text("Version: ja"),
            SizedBox(height: 10,),
            Text("Powered by Kaffe, su-perman tårar, och Flutter"),
            SizedBox(height: 10,),
            Text("Knackad av F-sektionens su-per- och spindelmän:", style: Theme.of(context).textTheme.bodyText1?.apply(color: Colors.orange[700]),),
            ...(knackare.map((e) => Text(e)).toList()),
            SizedBox(height: 20,),
            Text("Vad inspirerade nätet under utvecklingen:"),
            ...(inspiration.map((e) => TextButton(onPressed: () => launch(e), child: Text("Link " + inspiration.indexOf(e).toString()))).toList()),
          ],
        ),
      ),
    );
  }
}
