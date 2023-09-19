import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:fsek_mobile/screens/exjob_catalog/exjob_card.dart';
import 'package:fsek_mobile/screens/guild_meeting/proposition_card.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/document.service.dart';

class ExjobCatalogPage extends StatefulWidget {
  @override
  _ExjobCatalogPageState createState() => _ExjobCatalogPageState();
}

class _ExjobCatalogPageState extends State<ExjobCatalogPage>
    with TickerProviderStateMixin {
  List<ExjobInfo>? exjobInfos = [];
  List<ExjobInfo>? allExjobInfos = [];

  //bad helpvariables that are most likely unneeded
  bool searchFocus = false;
  String initChar = "";

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    allExjobInfos!.add(new ExjobInfo("axis", "programmer"));
    allExjobInfos!.add(new ExjobInfo("cellavision", "cancer"));
    /*
    locator<DocumentService>()
        .getPropositions("Val")
        .then((value) => setState(() {
              if (!listEquals(value, [])) {
                this.documents = value!;
                documents!.sort((a, b) => a.document_name!
                    .compareTo(b.document_name!)); // handle null?
                allDocuments = List.from(documents!);
              } else {
                this.documents = null;
                allDocuments = null;
              }
            }));
            */
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return listEquals(allExjobInfos, [])
        ? Scaffold(
            appBar: AppBar(title: Text(t.propositionsPageTitle)),
            body: Center(
                child: CircularProgressIndicator(color: Colors.orange[600])))
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(title: Text(t.propositionsPageTitle)),
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
                                  onPressed: () =>
                                      FocusScope.of(context).unfocus())
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
                                        exjobInfos= allExjobInfos;
                                      }))
                              : SizedBox.shrink()),
                      onChanged: (search) {
                        List<String> searchTerms = search
                            .toLowerCase()
                            .trim()
                            .split(new RegExp(r"\s+"));
                        setState(() {
                          initChar = "";
                          if (allExjobInfos != null) {
                            exjobInfos = allExjobInfos!.where((document) {
                              return searchTerms.every((term) => document
                                  .jobTitle!
                                  .toLowerCase()
                                  .contains(term));
                            }).toList();
                          }
                        });
                      },
                    ),
                  )),
                  Expanded(
                    child: exjobInfos != null
                        ? ListView(
                            children: exjobInfos!
                                .map((exjobInfos) =>
                                    _generateDocumentTile(exjobInfos))
                                .toList(),
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

  Widget _generateDocumentTile(ExjobInfo exjobInfo) {
    return Column(
      children: [ExjobCard(exjobInfo: exjobInfo)],
    );
  }
}
