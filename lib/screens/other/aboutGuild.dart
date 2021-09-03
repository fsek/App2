import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutGuildPage extends StatelessWidget {
  final String text = "F-sektionen inom TLTH är en ideell förening för studenter som läser "
      "något av civilingenjörsprogrammen Teknisk Fysik, Teknisk Matematik "
      "eller Teknisk Nanovetenskap och har till ändamål att främja kamratskap "
      "bland medlemmarna och tillvarata medlemmarnas gemensamma intressen."
      "\n\nSektionen är belägen i Mattehuset och här hittar du bland annat "
      "uppehållsrum, mikrovågsugnar och gött häng. I Mattehuset finns även "
      "Hilbert Café som vi driver, och här kan du bland annat köpa gott kaffe, "
      "baguetter och sallader.\n\nF-sektionen har en mängd olika utskott, som "
      "var och ett leds av en utskottsordförande. De flesta utskottsordföranden "
      "sitter med i sektionens nämnd, som är sektionens operativa del. "
      "Styrelsen är sektionens beslutande del, och den tar beslut i frågor som "
      "rör hela sektionen centralt.\n\nSom medlem kan du välja att vara "
      "väldigt aktiv och engagerad, lite lagom eller kanske bara delta på "
      "något enstaka event. Om du har några frågor är det bara att höra av "
      "sig, se 'Kontakt' här i appen eller på vår hemsida. Annars kan du "
      "alltid svänga förbi styrelserummet som ligger i den södra delen av "
      "Hilbertkorridoren; där hittar du nästan alltid någon sektionsaktiv. "
      "Vi hoppas att du ska trivas på sektionen!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("F-sektionen", style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 8,
                  ),
                  Text(text, style: TextStyle(height: 1.5)),
                ],
              ),
            )));
  }
}
