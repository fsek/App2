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
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    String backgroundPath = "assets/img/bakgrund_scaled.png";
    DateTime now = DateTime.now();
    DateTime kmTakeOverStart = DateTime(2022, 9, 2, 21, 0);
    DateTime kmTakeOverEnd = DateTime(2022, 9, 10, 10, 0);
    if (kmTakeOverStart.compareTo(now) < 0 &&
        kmTakeOverEnd.compareTo(now) > 0) {
      backgroundPath = "assets/img/bakgrund_km_scaled.png";
    }

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
                flex: 4,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navigationButton(
                      '/manners',
                      "assets/img/Allt du behöver veta.png",
                      t.nolleguideEtiquette),
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
