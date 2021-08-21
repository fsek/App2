import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/contact/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsek_mobile/screens/gallery/gallery.dart';
import 'package:fsek_mobile/screens/other/aboutGuild.dart';
import 'package:fsek_mobile/screens/settings/settings.dart';
import 'package:fsek_mobile/screens/songbook/songbook.dart';
import 'package:fsek_mobile/services/notifications.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/user.service.dart';
import 'package:fsek_mobile/util/authentication/authentication_bloc.dart';
import 'package:fsek_mobile/util/authentication/authentication_event.dart';

import 'fap.dart';


class OtherContent extends StatelessWidget {
  final catagories = ["Sångbok", "Bildgalleri", "Hilbert Café"];
  final about = ["F-sektionen", "F-appen"];
  final settings = ["Konto"];
  final support = ["Kontakt", "Anonym kontaktsida"];
  final Map<String, Widget> routeMap = {
    "Sångbok": SongbookPage(),
    "Bildgalleri": GalleryPage(),
    "Hilbert Café": Container(),
    "F-sektionen": AboutGuildPage(),
    "F-appen": FapPage(),
    "Konto": SettingsPage(),
    "Kontakt": ContactPage(),
    "Anonym Kontaksida": Container()
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
        [
          ListTile(title: Text("Support", style: _style()))
        ] +
        _generateListTiles(support, context) + 
        [
          Card(
            margin: EdgeInsets.all(2),
            child: InkWell(
              child: ListTile(
                title: Text("Logga ut"),
                onTap: () {
                  locator<NotificationsService>().logOutDevice().then((value) {
                    BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                  });
                },
            )),
          )
        ]);
  }

  List<Widget> _generateListTiles(
    List<String> tileTexts, BuildContext context) {
    List<Widget> tiles = [];
    for (String tileText in tileTexts) {
      tiles.add(Card(
        margin: EdgeInsets.all(2),
        child: InkWell(
          child: ListTile(
            title: Text(tileText),
            onTap: () => goToTilePage(tileText, context),
        )),
      ));
    }
    return tiles;
  }

  void goToTilePage(String title, BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => routeMap[title]!));
  }

  TextStyle _style() {
    return TextStyle(fontWeight: FontWeight.bold);
  }
}
