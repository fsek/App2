import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutGuildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(t.aboutGuildTitle),
        ),
        body: Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.aboutGuildGuild,
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "${t.aboutGuildOne}${t.aboutGuildTwo}${t.aboutGuildThree}"
                      "\n\n${t.aboutGuildFour}${t.aboutGuildFive}\n\n${t.aboutGuildSix}"
                      "${t.aboutGuildSeven}${t.aboutGuildEight}\n\n${t.aboutGuildNine}${t.aboutGuildTen}${t.aboutGuildEleven}${t.aboutGuildTwelve}",
                      style: TextStyle(height: 1.5)),
                ],
              ),
            )));
  }
}
