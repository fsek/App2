import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/contact/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsek_mobile/screens/gallery/gallery.dart';
import 'package:fsek_mobile/screens/other/aboutGuild.dart';
import 'package:fsek_mobile/screens/placeholder/placeholder.dart';
import 'package:fsek_mobile/screens/settings/settings.dart';
import 'package:fsek_mobile/screens/songbook/songbook.dart';
import 'package:fsek_mobile/services/notifications.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/util/authentication/authentication_bloc.dart';
import 'package:fsek_mobile/util/authentication/authentication_event.dart';
import 'package:url_launcher/url_launcher.dart';

import 'fap.dart';

class OtherContent extends StatelessWidget {
  final catagories = ["Sångbok", "Bildgalleri", "Hilbert Café"];
  final about = ["F-sektionen", "F-appen"];
  final settings = ["Konto"];
  final support = ["Kontakt", "Anonym kontaktsida"];
  final Map<String, Widget> routeMap = {
    "Sångbok": SongbookPage(),
    "Bildgalleri": PlaceholderPage(
        title: "Bildgalleri",
        disc: "Här kommer du "
            "snart kunna kolla på bilder från nutida och dåtida evenemang som "
            "F-sektionen har hållt i!"),
    "Hilbert Café": PlaceholderPage(
        title: "Hilbert Café",
        disc: "Här kommer du kunna "
            "Se tillgängliga pass och boka in dig ifall du är sugen på att jobba"),
    "F-sektionen": AboutGuildPage(),
    "F-appen": FapPage(),
    "Konto": SettingsPage(),
    "Kontakt": ContactPage(),
    "Anonym kontaktsida": Container()
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: _generateListTiles(catagories, context) +
            [
              ListTile(
                  title: Text(
                "Om",
                style: _style(),
              ))
            ] +
            _generateListTiles(about, context) +
            [
              ListTile(
                  title: Text(
                "Inställningar",
                style: _style(),
              ))
            ] +
            _generateListTiles(settings, context) +
            [ListTile(title: Text("Support", style: _style()))] +
            _generateListTiles(support, context) +
            [
              Card(
                margin: EdgeInsets.all(2),
                child: InkWell(
                    child: ListTile(
                  tileColor: Colors.red[600],
                  title: Text(
                    "Logga ut",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    bool? logout = await _confirmLogout(context);
                    if (logout ?? false) {
                      locator<NotificationsService>().logOutDevice().then((value) {
                        BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                      });
                    }
                  },
                )),
              )
            ]);
  }

  Future<bool?> _confirmLogout(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Är du säker på att du vill logga ut?"),
            actions: [
              TextButton(
                child: Text("AVBRYT"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              TextButton(
                child: Text("LOGGA UT"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

  List<Widget> _generateListTiles(List<String> tileTexts, BuildContext context) {
    List<Widget> tiles = [];
    for (String tileText in tileTexts) {
      tiles.add(Card(
        margin: EdgeInsets.all(2),
        child: InkWell(
            child: ListTile(
          title: Text(tileText),
          onTap: () => goToTilePage(tileText, context),
          trailing: tileText != "Anonym kontaktsida" ? SizedBox.shrink() : Icon(Icons.open_in_new_rounded),
        )),
      ));
    }
    return tiles;
  }

  void goToTilePage(String title, BuildContext context) {
    if (title == "Anonym kontaktsida") {
      launch("http://contact.fsektionen.se");
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => routeMap[title]!));
  }

  TextStyle _style() {
    return TextStyle(fontWeight: FontWeight.bold);
  }
}
