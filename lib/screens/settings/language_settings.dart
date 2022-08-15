import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fsek_mobile/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class LanguageSettingsPage extends StatefulWidget {
  LanguageSettingsPage({Key? key}) : super(key: key);

  @override
  LanguageSettingsState createState() => LanguageSettingsState();
}

class LanguageSettingsState<LanguageSettingsPage> extends State {
  String? _locale;

  void initState() {
    super.initState();
  }

  void _setLocale(BuildContext context, String? locale) {
    setState(
      () {
        this._locale = locale!;
        FsekMobileApp.of(context)!.setLocale(locale);
        if (_locale == "en") {
          AbstractService.updateApiUrl(false);
        } else {
          AbstractService.updateApiUrl(true);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _locale = Localizations.localeOf(context).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
      ),
      body: Column(
        children: [
          RadioListTile<String>(
            title: Text("Svenska"),
            value: 'sv',
            groupValue: _locale,
            onChanged: (value) => _setLocale(context, value),
          ),
          RadioListTile<String>(
            title: Text("English"),
            value: 'en',
            groupValue: _locale,
            onChanged: (value) => _setLocale(context, value),
          ),
        ],
      ),
    );
  }
}

/*
Column(
          children: [
            InkWell(
              onTap: () {
                FsekMobileApp.of(context)!.setLocale('sv');
              },
              child: Card(
                child: Text("Byt språk lol"),
              ),
            ),
          ],*/