import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/cafe/cafe.dart';
import 'package:fsek_mobile/screens/contact/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsek_mobile/screens/gallery/gallery.dart';
import 'package:fsek_mobile/screens/other/aboutGuild.dart';
import 'package:fsek_mobile/screens/placeholder/placeholder.dart';
import 'package:fsek_mobile/screens/settings/language_settings.dart';
import 'package:fsek_mobile/screens/settings/settings.dart';
import 'package:fsek_mobile/screens/songbook/songbook.dart';
import 'package:fsek_mobile/services/notifications.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/util/authentication/authentication_bloc.dart';
import 'package:fsek_mobile/util/authentication/authentication_event.dart';
import 'package:url_launcher/url_launcher.dart';

import 'fap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtherContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return ListView(children: [
      _generateListTile(t.otherSongbook, SongbookPage(), context),
      _generateListTile(t.otherGallery, GalleryPage(), context),
      _generateListTile(t.otherCafe, CafePage(), context),
      _generateSeparator(t.otherAbout),
      _generateListTile(t.otherAboutGuild, AboutGuildPage(), context),
      _generateListTile(t.otherFap, FapPage(), context),
      _generateSeparator(t.otherSettings),
      _generateListTile(t.otherAccount, SettingsPage(), context),
      _generateListTile(t.otherLanguage, LanguageSettingsPage(), context),
      _generateSeparator("Support"),
      _generateListTile(t.otherContact, ContactPage(), context),
      _generateListTile(t.otherAnon, Container(), context,
          isLink: true, linkTarget: "http://contact.fsektionen.se"),
      _generateLogoutTile(context)
    ]);
  }

  Widget _generateListTile(String text, Widget page, BuildContext context,
      {bool isLink = false, String linkTarget = ""}) {
    var t = AppLocalizations.of(context)!;
    return Card(
      margin: EdgeInsets.all(2),
      child: InkWell(
          child: ListTile(
        title: Text(text),
        onTap:
            isLink ? () => launch(linkTarget) : () => _goToPage(page, context),
        trailing: isLink ? Icon(Icons.open_in_new_rounded) : SizedBox.shrink(),
      )),
    );
  }

  Widget _generateSeparator(String text) {
    return ListTile(
        title: Text(
      text,
      style: _style(),
    ));
  }

  void _goToPage(Widget page, BuildContext context) {
    var t = AppLocalizations.of(context)!;
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  Widget _generateLogoutTile(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Card(
      margin: EdgeInsets.all(2),
      child: InkWell(
          child: ListTile(
        tileColor: Colors.red[600],
        title: Text(
          t.otherLogOut,
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
    );
  }

  Future<bool?> _confirmLogout(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(t.otherLogOutConfirm),
            actions: [
              TextButton(
                child: Text(t.otherCancel.toUpperCase()),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              TextButton(
                child: Text(t.otherLogOut.toUpperCase()),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

  TextStyle _style() {
    return TextStyle(fontWeight: FontWeight.bold);
  }
}
