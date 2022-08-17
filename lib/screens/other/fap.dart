import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/fredmansky/fredmansky.dart';
import 'package:fsek_mobile/services/fredmansky.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FapPage extends StatefulWidget {
  @override
  _FapPageState createState() => _FapPageState();
}

class _FapPageState extends State<FapPage> {
  int fredmanskyCounter = 0;
  double scale = 0.0;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    List<String> knackare = [
      "Ludwig Linder, ${t.fapSuper} 2021",
      "Lukas Gustavsson, ${t.fapSpiderMaster} 20/21",
      "Teodor Åberg, ${t.fapSuper} 2021",
      "Emil Manelius, ${t.fapSpiderMaster} 21/22",
      "Nils Thorin, ${t.fapSpider} 2021",
      "Simon Löwgren, ${t.fapSpider} 2021",
      "Magdalena Ohlsson, ${t.fapSpider} 2022",
    ];
    List<String> inspiration = ["https://www.youtube.com/watch?v=k238XpMMn38"];
    TapGestureRecognizer fredmansTap = TapGestureRecognizer()
      ..onTap = () => setState(() {
            fredmanskyCounter++;
            if (fredmanskyCounter == 7) scale = 1.0;
          });

    return Scaffold(
      appBar: AppBar(
        title: Text(t.fapAbout),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.fapFap,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.apply(color: Colors.orange[600]),
            ),
            SizedBox(
              height: 10,
            ),
            Text(t.fapVersion),
            SizedBox(
              height: 10,
            ),
            Text(t.fapPower),
            SizedBox(
              height: 10,
            ),
            Text(
              t.fapConstructed,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.apply(color: Colors.orange[700]),
            ),
            ...(knackare.map((e) => Text(e)).toList()),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: t.fapInspired),
                  TextSpan(
                    text: t.fapDev,
                    style: TextStyle(color: Colors.grey[700]),
                    recognizer: fredmansTap,
                  ),
                ],
              ),
            ),
            ...(inspiration
                .map((e) => TextButton(
                    onPressed: () => launch(e),
                    child: Text("Link " + inspiration.indexOf(e).toString())))
                .toList()),
            Spacer(),
            Row(
              children: [
                Spacer(),
                _fredmansBeerButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _fredmansBeerButton() {
    return AnimatedScale(
      scale: scale,
      duration: Duration(seconds: 1),
      child: InkWell(
        onTap: () {
          locator<FredmanskyService>().toggleFredmansky().then((value) {
            if (value.enabled!) {
              _joinPopup(context);
            } else
              _leavePopup(context);
          });
        },
        child: Image.asset(
          "assets/img/FredmanskyBeer.png",
          height: 100,
        ),
      ),
    );
  }

  void _leavePopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Your Beer Life has Ended"),
            content: Text(
                "You are a disgrace to spoders everywhere across the world, no more beer for you"),
            actions: [
              TextButton(
                child: Text("Unlit fam"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void _joinPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("A New Life with Beer"),
            content: Text(
                "Congratulations fren, a new life will start on friday 15.00"),
            actions: [
              TextButton(
                child: Text("Lit fam"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
