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
          Image.asset(
            assetPath,
            height: 100,
          ),
          Text(label),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nolleguide'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navigationButton(
                  '/people', "assets/img/information.png", "Vi på F-sek")
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navigationButton(
                  '/manners', "assets/img/information.png", "Vett & Etikett"),
              _navigationButton(
                  '/wordlist', "assets/img/information.png", "Ordlista"),
            ],
          ),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    );
    ;
  }
}
