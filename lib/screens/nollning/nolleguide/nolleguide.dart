import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  Widget _navigationButton(String path, String assetPath, String label) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, path);
        },
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              assetPath,
              height: 70,
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    String backgroundPath =
        "assets/img/nollning-23/nolleguide/nolleguide-background.png";

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 9),
          child: Image.asset(
            backgroundPath,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Nolleguide'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 7),
                  _navigationButton(
                      '/manners',
                      "assets/img/nollning-23/nolleguide/studentlivet.png",
                      t.nolleguideEtiquette),
                  _navigationButton(
                      '/people',
                      "assets/img/nollning-23/nolleguide/personer.png",
                      t.nolleguideWeAtFsek),
                  _navigationButton(
                      '/wordlist',
                      "assets/img/nollning-23/nolleguide/ordlista.png",
                      t.nolleguideWordlist),
                  _navigationButton(
                      '/messages',
                      "assets/img/nollning-23/nolleguide/meddelanden.png",
                      t.nolleguideWordlist),
                  Spacer(flex: 1),
                ],
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ],
    );
  }
}
