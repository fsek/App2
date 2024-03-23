import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/book_seller/advertisement.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/services/service_locator.dart';

import '../../services/book_seller.service.dart';

class BookSellerPage extends StatefulWidget {
  @override
  _BookSellerPageState createState() => _BookSellerPageState();
}

class _BookSellerPageState extends State<BookSellerPage> {
  List<Advertisement> _ads = [];

  void initState() {
    locator<BookSellerService>().getAll().then((value) => setState(() {
          this._ads = value;
        }));
    //this._ads = [Advertisement()];
  }

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).toString();
    var t = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(t.otherBook),
        ),
        body: ListView(
          children: _generateListTiles(this._ads),
        ));
  }
}

List<Widget> _generateListTiles(List<Advertisement> ads) {
  List<Widget> tiles = [];
  for (Advertisement ad in ads) {
    tiles.add(Card(
        margin: EdgeInsets.all(10),
        child: InkWell(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Row(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    ad.title ?? "Ny bok",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(ad.author ?? "Säkert Jonas Månsson"),
                  Text(
                    "${ad.price ?? 10000}kr",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ])
              ])),
        )));
  }
  return tiles;
}
