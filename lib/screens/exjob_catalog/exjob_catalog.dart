import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:fsek_mobile/screens/exjob_catalog/exjob_card.dart';
import 'package:fsek_mobile/screens/guild_meeting/proposition_card.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/document.service.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ExjobCatalogPage extends StatefulWidget {
  @override
  _ExjobCatalogPageState createState() => _ExjobCatalogPageState();
}

class _ExjobCatalogPageState extends State<ExjobCatalogPage>
    with TickerProviderStateMixin {
  List<ExjobInfo> exjobInfos = [];
  List<ExjobInfo> allExjobInfos = [];

  //bad helpvariables that are most likely unneeded
  bool searchFocus = false;
  String initChar = "";

  // Filter variables
  String companyFilter = "All";
  String programmeFilter = "All";

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    exjobInfos!.add(new ExjobInfo("axis", "programmer", "F"));
    exjobInfos!.add(new ExjobInfo("cellavision", "cancer", "Pi"));
    allExjobInfos = List.from(exjobInfos!);

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
            appBar: AppBar(title: Text("Ex-jobbskatalogen")),
            body: Center(
                child: CircularProgressIndicator(color: Colors.orange[600])))
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(title: Text("Ex-jobbskatalogen")),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      child: Column(children: [
                        Text("Ex-jobbskatalogen",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Container(
                          padding: EdgeInsets.all(5),
                        ),
                        Text(
                            "Denna katalog innehåller endast jobb från sponsorföretag, bla bla bla")
                      ])),
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
                                        exjobInfos = allExjobInfos;
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
                  Row(children: [
                    /*Expanded(
                        child: MultiSelectDialogField(
                      items: allExjobInfos!
                          .map(
                              (exJob) => MultiSelectItem(exJob, exJob.company!))
                          .toList(),
                      listType: MultiSelectListType.CHIP,
                      onConfirm: (values) {
                        //companyFilter = values;
                      },
                    )),*/
                    DropdownButton<String>(
                      value: companyFilter,
                      items: allExjobInfos!
                          .map<DropdownMenuItem<String>>((ExjobInfo info) {
                        return DropdownMenuItem<String>(
                          value: info.company,
                          child: Text(info.company!),
                        );
                      }).toList()
                        ..add(DropdownMenuItem<String>(
                          value: "All",
                          child: Text("All"),
                        )),
                      onChanged: (String? selectedCompany) {
                        setState(() {
                          /*companyFilter = selectedCompany!;
                          if (companyFilter != "All") {
                            exjobInfos = allExjobInfos!.where((jobInfo) {
                              return jobInfo.company == companyFilter;
                            }).toList();
                          } else {
                            exjobInfos = allExjobInfos;
                          }
                          */
                        });
                      },
                    ),
                    DropdownButton<String>(
                      value: programmeFilter,
                      items: List<String>.from(["F", "Pi", "n", "All"])
                          .map<DropdownMenuItem<String>>((String p) {
                        return DropdownMenuItem<String>(
                          value: p,
                          child: Text(p),
                        );
                      }).toList(),
                      onChanged: (String? selectedProgramme) {
                        setState(() {
                          /*
                          programmeFilter = selectedProgramme!;
                          if (programmeFilter != "All") {
                            exjobInfos = allExjobInfos!.where((jobInfo) {
                              return jobInfo.programme == programmeFilter;
                            }).toList();
                          } else {
                            exjobInfos = allExjobInfos;
                          }
                          */
                        });
                      },
                    ),
                  ]),
                  Expanded(
                    child: exjobInfos.length > 0
                        ? ListView(
                            children: exjobInfos!
                                .map((exjobInfos) =>
                                    _generateDocumentTile(exjobInfos))
                                .toList(),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 80, horizontal: 45),
                            child: Text(
                              "Tyvärr finns det inga jobb ute just nu som passar dina specifikationer :(",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                  ),
                  Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(10),
                      child: Text("Visar " +
                          exjobInfos.length.toString() +
                          " av " +
                          allExjobInfos.length.toString() +
                          " jobb"))
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
