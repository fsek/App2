import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:fsek_mobile/screens/job_catalog/job_card.dart';
import 'package:fsek_mobile/screens/guild_meeting/proposition_card.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/document.service.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class JobCatalogPage extends StatefulWidget {
  @override
  _JobCatalogPageState createState() => _JobCatalogPageState();
}

class _JobCatalogPageState extends State<JobCatalogPage>
    with TickerProviderStateMixin {
  List<JobInfo> jobInfos = [];
  List<JobInfo> allJobInfos = [];

  // Filter variables
  List<String> programmeFilter = List.empty();
  List<String> companyFilter = List.empty();
  List<String> locationFilter = List.empty();

  //bad helpvariables that are most likely unneeded
  bool searchFocus = false;
  String initChar = "";

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    jobInfos.add(new JobInfo("axis", "programmer", "Lund", "F", "https://foi.easycruit.com/intranet/exjobb/vacancy/3266643/12388"));
    jobInfos.add(new JobInfo("cellavision", "cancer", "Jönköping", "Pi", "https://foi.easycruit.com/intranet/exjobb/vacancy/3266643/12388"));
    jobInfos.add(new JobInfo("cellavision", "programmer", "Kalmar", "Pi", "https://foi.easycruit.com/intranet/exjobb/vacancy/3266643/12388"));
    allJobInfos = List.from(jobInfos);

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
    return listEquals(allJobInfos, [])
        ? Scaffold(
            body: Center(
                child: CircularProgressIndicator(color: Colors.orange[600])))
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      child: Column(children: [
                        Text("Jobbkatalogen",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
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
                                        jobInfos = allJobInfos;
                                      }))
                              : SizedBox.shrink()),
                      onChanged: (search) {
                        List<String> searchTerms = search
                            .toLowerCase()
                            .trim()
                            .split(new RegExp(r"\s+"));
                        setState(() {
                          initChar = "";
                          jobInfos = allJobInfos.where((document) {
                              return searchTerms.every((term) => document
                                  .jobTitle
                                  .toLowerCase()
                                  .contains(term));
                            }).toList();
                        });
                      },
                    ),
                  )),
                  Row(children: [
                    Expanded(
                        child: MultiSelectDialogField(
                        title: Text("Program"),
                        buttonText: Text("Program"),
                      items: [ "F", "pi", "n"].map((p) => MultiSelectItem(p, p)).toList(),
                      listType: MultiSelectListType.CHIP,
                      onConfirm: (List<String> values) {
                        setState(() {
                          print("HELLO!filter" + programmeFilter.toString());
                          programmeFilter = values;
                          jobInfos = filterJobs(allJobInfos);
                        });
                      },
                      confirmText: Text("Bekräfta"),
                      cancelText: Text("Avbryt"),
                      chipDisplay: MultiSelectChipDisplay<String>.none(),
                      searchable: true,
                    )),
                    Expanded(
                        child: MultiSelectDialogField(
                        title: Text("Företag"),
                        buttonText: Text("Företag"),
                      items: allJobInfos.map( (job) => job.company).toSet()
                          .map(
                              (company) => MultiSelectItem(company, company))
                          .toList(),
                      listType: MultiSelectListType.CHIP,
                      onConfirm: (List<String> values) {
                        setState(() {
                          companyFilter = values;
                          jobInfos = filterJobs(allJobInfos);
                        });
                      },
                      confirmText: Text("Bekräfta"),
                      cancelText: Text("Avbryt"),
                      chipDisplay: MultiSelectChipDisplay<String>.none(),
                      searchable: true,
                      searchHint: "Axis, Ericsson...",
                    )),
                  ]),
                  Expanded(
                    child: jobInfos.length > 0
                        ? ListView(
                            children: jobInfos!
                                .map((jobInfos) =>
                                    _generateDocumentTile(jobInfos))
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
                          jobInfos.length.toString() +
                          " av " +
                          allJobInfos.length.toString() +
                          " jobb"))
                ],
              ),
            ));
  }

  List<JobInfo> filterJobs(List<JobInfo> allJobs) {
    List<JobInfo> jobs = [];
    print(programmeFilter);
    print(List.from(["F"]));
    
    for (JobInfo job in allJobs) {
      print(job.programme);
      print("filtering");
        if ((programmeFilter.isEmpty || programmeFilter.contains(job.programme))
            && (companyFilter.isEmpty || companyFilter.contains(job.company)) 
            && (locationFilter.isEmpty || locationFilter.contains(job.location))) {
          jobs.add(job);
          print("filtering2");
        }
    }
    print(jobs);
    return jobs;
  }

  Widget _generateDocumentTile(JobInfo jobInfo) {
    return Column(
      children: [JobCard(jobInfo: jobInfo)],
    );
  }
}