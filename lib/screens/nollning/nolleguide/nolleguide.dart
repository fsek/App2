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
        ]));
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    String backgroundPath = "assets/img/jubel_background_nolleguide.png";

    return Stack(
      children: [
        Image.asset(
          backgroundPath,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Nolleguide'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navigationButton(
                      '/manners', "assets/img/info.png", t.nolleguideEtiquette),
                  _navigationButton('/people', "assets/img/Personer.png",
                      t.nolleguideWeAtFsek),
                  _navigationButton('/wordlist', "assets/img/Ordlista.png",
                      t.nolleguideWordlist),
                ],
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
