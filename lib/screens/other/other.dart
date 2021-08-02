import 'package:flutter/material.dart';

class OtherContent extends StatelessWidget {
  final catagories = ["Sångbok", "Bildgalleri", "Hilbert Café"];
  final about = ["F-sektionen", "F-appen"];
  final settings = ["Konto"];
  final support = ["Kontakt", "Anonym kontaktsida"];

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: _generateListTiles(catagories) +
            [
              ListTile(
                  title: Text(
                "Om",
                style: _style(),
              ))
            ] +
            _generateListTiles(about) +
            [
              ListTile(
                  title: Text(
                "Inställningar",
                style: _style(),
              ))
            ] +
            _generateListTiles(settings) +
            [ListTile(title: Text("Support", style: _style()))] +
            _generateListTiles(support));
  }
}

List<Widget> _generateListTiles(List<String> tileTexts) {
  List<Widget> tiles = [];
  for (String tileText in tileTexts) {
    tiles.add(Card(
      margin: EdgeInsets.all(2),
      child: InkWell(
          child: ListTile(
        title: Text(tileText),
        onTap: () => _goToTilePage(tileText),
      )),
    ));
  }
  return tiles;
}

void _goToTilePage(String title) {
  //todo
}

TextStyle _style() {
  return TextStyle(fontWeight: FontWeight.bold);
}
