import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfPage extends StatelessWidget {
  const PdfPage({Key? key, required this.url, required this.title}) : super(key: key);
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: false,
        pageFling: false,
        onError: (error) {
          print(error.toString());
        },
        onPageChanged: (int? page, int? total) {
          print('page change: $page/$total');
        },
      ).cachedFromUrl(url),
    );
  }
}
