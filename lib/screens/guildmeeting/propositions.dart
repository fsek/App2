import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:fsek_mobile/screens/guildmeeting/pdf.dart';
import 'package:fsek_mobile/models/songbook/songbookEntry.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/document.service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/models/documents/document_collection.dart';

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> with TickerProviderStateMixin {
  List<ElectionDocument> documents = [];
  List<ElectionDocument> allDocuments = [];

  //bad helpvariables that are most likely unneeded
  bool searchFocus = false;
  String initChar = "";

  TextEditingController _controller = TextEditingController();

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    locator<DocumentService>().getPropositions("Val").then((value) => setState(() {
          this.documents = value!;
          documents.sort((a, b) => a.document_name!.compareTo(b.document_name!)); // handle null?
          allDocuments = List.from(documents);
          documents = [];
          allDocuments = [];
        }));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return allDocuments == []
        ? Scaffold(
            appBar: AppBar(title: Text(t.songbookSongbook)),
            body: Center(child: CircularProgressIndicator(color: Colors.orange[600])))
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(title: Text(t.songbookSongbook)),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FocusScope(
                      child: Focus(
                    onFocusChange: (focus) {
                      print(focus);
                      setState(() {
                        searchFocus = focus;
                      });
                    },
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          prefixIcon: searchFocus
                              ? IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.grey[800],
                                  ),
                                  onPressed: () => FocusScope.of(context).unfocus())
                              : Icon(
                                  Icons.search,
                                  color: Colors.grey[800],
                                ),
                          hintText: t.songbookSearch,
                          suffixIcon: _controller.text.length > 0
                              ? IconButton(
                                  icon: Icon(Icons.clear),
                                  color: Colors.grey[800],
                                  onPressed: () => setState(() {
                                        _controller.clear();
                                        FocusScope.of(context).unfocus();
                                        documents = allDocuments;
                                      }))
                              : SizedBox.shrink()),
                      onChanged: (search) {
                        List<String> searchTerms = search.toLowerCase().trim().split(new RegExp(r"\s+"));
                        setState(() {
                          initChar = "";
                          documents = allDocuments.where((document) {
                            return searchTerms.every((term) => document.document_name!.toLowerCase().contains(term));
                          }).toList();
                        });
                      },
                    ),
                  )),
                  Expanded(
                    child: documents.isNotEmpty
                        ? ListView(
                            children: documents.map((document) => _generateDocumentTile(document)).toList(),
                          )
                        : Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(t.noProposition),
                          ),
                  )
                ],
              ),
            ));
  }

  Widget _generateDocumentTile(ElectionDocument document) {
    //This way of doing it is probably really stupid. but so be it
    List<Widget> index = [];
    if (document.document_name![0] != initChar) {
      initChar = document.document_name![0];
      index.add(Container(
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: ListTile(
          title: Text(
            initChar,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ));
    }
    return Column(
      children: index +
          [
            Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.grey[400]!),
                )),
                child: InkWell(
                  onTap: () => openFile(document),
// openFile(song.id!),
                  child: ListTile(title: Text(document.document_name == null ? "" : document.document_name!)),
                ))
          ],
    );
  }

  void openFile(ElectionDocument document) {
    print(document.url! + " is url");
    Navigator.push(context, MaterialPageRoute(builder: (context) => PdfPage(url: document.url!, title: document.document_name!)));
  }
}
