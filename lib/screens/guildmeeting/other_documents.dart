import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fsek_mobile/screens/guildmeeting/pdf.dart';

import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/document.service.dart';


class otherDocumentsPage extends StatefulWidget {
  @override
  _otherDocumentsPageState createState() => _otherDocumentsPageState();
}

bool isLoading = true;
class _otherDocumentsPageState extends State<otherDocumentsPage> {
  List<ElectionDocument> listan = []; // Håller alla "övriga" dokument
  
  @override
  void initState() {
    locator<DocumentService>().getOthers("Val").then((value) => setState(() {
      this.listan = value ?? listan; //Kortform för: "if value !null listan = value else listan = listan".
    }))
    .then((value) => setState(() {isLoading = false;})); //Måste vara i en ".then" för annars kan "isLoading" sättas innan ".getOthers" returnerar.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold( 
      appBar: AppBar(title: Text(t.otherDocuments)),
      body: !listEquals(listan, []) ? //list.equals är mycket viktigt, annars jämför den pointers
        Column( //Det finns övriga dokument
          children: [
            Expanded(
              child: ListView(
                children: listan
                .map((document) => _generateDocumentWidget(document)).toList(),
              )
            )
          ]
        ) : isLoading ?
        Center(child: CircularProgressIndicator(color: Colors.orange[600])) : //Laddar
        Center(child: Text(t.noOtherDocuments, style: TextStyle(fontStyle: FontStyle.italic))) //Inga övriga dokument
    );
  }

  Widget _generateDocumentWidget(ElectionDocument document){ 
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[400]!),
        )
      ),
      child: InkWell(
        onTap: () => openDocument(document),
          child: ListTile(
            title: Text(document.document_name == null ? 
              "Titel saknas" : document.document_name!) //Hårdkodad sträng för vem orkar slänga med context hit?
          )
      )
    );
  }

  void openDocument(ElectionDocument document) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => PdfPage(url: document.url!, title: document.document_name!)));
  }
}