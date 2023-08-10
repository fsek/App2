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
            padding: EdgeInsets.all(1),
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
    String backgroundPath = "assets/img/nollning-23/nolleguide/nolleguide-background.png";
    String locale = Localizations.localeOf(context).toString();

    // if it for some reason is something different dont break everything
    if (locale != "sv" && locale != "en") {
      locale = "sv";
    }

    return Stack(
      children: [
        // Padding(
        //   padding: EdgeInsets.only(top: 0), //MediaQuery.of(context).size.height / 9),
        //   child: Image.asset(
        //     backgroundPath,
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     fit: BoxFit.cover,
        //     alignment: Alignment.topCenter,
        //   ),
        // ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(),
            body: Stack(
              children: [
                Image.asset(
                  backgroundPath,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 4),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(flex: 4),
                        _navigationButton('/manners',
                            "assets/img/nollning-23/nolleguide/button-studentlivet-$locale.png", t.nolleguideEtiquette),
                        _navigationButton('/people', "assets/img/nollning-23/nolleguide/button-fsektionen-$locale.png",
                            t.nolleguideWeAtFsek),
                        _navigationButton('/wordlist', "assets/img/nollning-23/nolleguide/button-ordlista-$locale.png",
                            t.nolleguideWordlist),
                        _navigationButton('/messages',
                            "assets/img/nollning-23/nolleguide/button-meddelanden-$locale.png", t.nolleguideWordlist),
                        Spacer(flex: 2),
                      ],
                    ),
                    Spacer(flex: 2),
                  ],
                )
              ],
            )),
      ],
    );
  }
}
