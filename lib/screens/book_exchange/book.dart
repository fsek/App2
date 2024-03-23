import 'package:fsek_mobile/april_fools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/models/exchangebook/onebook.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey[200]),
            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 2, 0, 16),
                child: Text(
                  book.title!,
                  style: TextStyle(
                      color: (isAprilFools
                          ? Color(0xFFF17F9F)
                          : Colors.orange[600]),
                      fontSize: 24),
                ),
              ),
              book.melody != null && book.melody != ""
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "${t.songbookMelody}: ",
                              style: TextStyle(
                                  color: (isAprilFools
                                      ? Color(0xFFF17F9F)
                                      : Colors.orange[600]))),
                          TextSpan(
                              text: book.melody!,
                              style: TextStyle(color: Colors.black))
                        ]),
                      ),
                    )
                  : SizedBox.shrink(),
              book.author != null && book.author != ""
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "${t.songbookAuthor}: ",
                              style: TextStyle(
                                  color: (isAprilFools
                                      ? Color(0xFFF17F9F)
                                      : Colors.orange[600]))),
                          TextSpan(
                              text: book.author!,
                              style: TextStyle(color: Colors.black))
                        ]),
                      ),
                    )
                  : SizedBox.shrink(),
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(14, 6, 14, 14),
            child: Html(
              data: book.content!,
              style: {
                "p": Style(fontSize: FontSize(16), lineHeight: LineHeight(1.5))
              },
            ),
          )
        ])));
  }
}
