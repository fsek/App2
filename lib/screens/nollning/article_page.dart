import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/models/nollning/nolleguide/article.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key, required this.a}) : super(key: key);

  final Article a;

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.mannersEtiquette),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 8, 2),
                child: Text(
                  a.title![locale]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
                child: Html(
                  data: a.content![locale]!,
                  style: {
                    "body": Style(
                      fontSize: FontSize(16.0),
                    ),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
