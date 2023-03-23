import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutGuildMeetingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    
    return Scaffold(
        appBar: AppBar(
          title: Text("Om sektionsmötet"),
        ),
        body: Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text("VT 2023",
                   style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: """Mötet kommer äga rum den 24 till 25 april. Kandidera och nominera kan du göra via """,
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: """valsidan""",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('https://fsektionen.se/val');
                            },
                        ),
                        TextSpan(
                          text: """. Motioner skickas till """,
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: """sekreteraren""",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('mailto:sekreterare@fsektionen.se');
                            },
                        ),
                        TextSpan(
                          text: """ innan motionsstoppet.\n\nFöljande datum och tider gäller för terminsmötet 24 till 25 april - Vårterminsmötet (MH:G preliminärt):\nMötet öppnar och återupptas kl. 17.59 på samtliga datum.\n\nFöljande datum gäller inför terminsmötet:\n10 februari - Valet öppnar på hemsidan.\n3 mars - Valet stänger på hemsidan för mötesvalda poster.\n23 mars - Motionsstop\n30 mars - Anslag av föredragningslistan.\n\nFör mer information om vad de olika händelserna innebär, se kalendern på hemsidan. Har du ytterligare frågor angående mötet, kontakta """,
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: """styrelsen""",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('mailto:styrelsen@fsektionen.se');
                            },
                        ),
                        TextSpan(
                          text: """.\n\nI sektionens tjänst,\nHanna Areskoug, sekreterare 2023""",
                          style: TextStyle(height: 1.5))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Motioner och propositioner",
                   style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: """Under terminsmötet kommer diverse förslag på förändringar och användningar av sektionens pengar att avhandlas. Dessa s.k. motioner och propositioner inkommer från sektionens gemene medlem respektive sektionens styrelse. Om du har en idé på en motion och vill ha tips eller hjälp att skriva den, kontakta """,
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: """styrelsen""",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('mailto:styrelsen@fsektionen.se');
                            },
                        ),
                        TextSpan(
                          text: """ eller den relevanta """,
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: """utskottsordföranden""",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('https://fsektionen.se/kontakter');
                            },
                        ),
                        TextSpan(
                          text: """ beroende på vad din idé behandlar. Färdiga motioner skickas in till """,
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: """sekreteraren""",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('mailto:sekreterare@fsektionen.se');
                            },
                        ),
                        TextSpan(
                          text: """ innan motionsstoppet.""",
                          style: TextStyle(height: 1.5))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Engagemang och val",
                   style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: """Ett sätt att engagera sig inom F-sektionen är att söka några av våra poster i anslutning till höst- eller vårterminsmöte. Kandidatur till en post sker via """,
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: """valsidan""",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('https://fsektionen.se/val');
                            },
                        ),
                        TextSpan(
                          text: """. Det går också att nominera någon du anser lämplig till en specifik post, denna person måste sedan själv gå in och kandidera. Större poster väljes under mötet och resterande poster väljes i efterhand av styrelsen. För mer information om engagemang och val se Policy för val.""",
                          style: TextStyle(height: 1.5)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Poster som väljs under sektionsmötet (större poster)",
                    style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(
                    height: 8,
                  ),
                  Text("""Söker du en post som väljes under ett sektionsmöte kommer du bli kallad för intervju av valberedningen. Av alla sökande kommer valberedningen sedan nominera en kandidat till sektionsmötet. Den som inte blir nominerad av valberedningen kan fortfarande motkandidera under mötet. Alla kandidater till en post anslås på en plansch där de presenteras med bild och text. Du kan alltid kandidera till en post under mötet trots att du inte kandiderat via webplatsen.""",
                   style: TextStyle(height: 1.5)),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Val förrättade av styrelsen",
                   style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(
                    height: 8,
                  ),
                  Text("""Söker du en sådan post som inte väljs under mötet kommer du kallas på intervju efter mötet. Detta mötet brukar hållas av nya och gamla utskottsordförande och ibland någon från valberedningen och någon som avgår från samma post. Denna grupp av människor nominerar därefter rekommenderat antal personer till den aktuella posten. Det är sedan styrelsen som i valmöte väljer in funktionärerna.""",
                   style: TextStyle(height: 1.5)),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )));
  }
}
