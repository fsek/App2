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

class _JobCatalogPageState extends State<JobCatalogPage> with TickerProviderStateMixin {
  bool allJobsAreRead = false;
  List<JobInfo> jobInfos = [];
  List<JobInfo> allJobInfos = [];
  List<String> companies = [];

  // Filter variables
  List<String> companyFilter = List.empty();
  List<JobType> jobTypeFilter = List.empty();
  List<String> programmeFilter = List.empty();

  //bad helpvariables that are most likely unneeded
  bool searchFocus = false;
  String initChar = "";

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    locator<DocumentService>().getOthers("Job").then((value) => setState(() {
          DateTime currentTime = DateTime.now();
          print("start reading");
          if (!listEquals(value, [])) {
            print("jobs exist");
            for (ElectionDocument? doc in value!) {
              bool somethingWrong;
              List<String> jobData = doc!.document_name!.split('|');
              String jobTitle = jobData[0];
              String company = jobData[1];
              JobType jobType = JobType.values.firstWhere((e) => e.name == jobData[2]);
              // Fulsnabbhack för att göra om pi till π.
              List<String> programmes = jobData[3].split(',').toList().map((p) => p == "pi" ? "π" : p).toList();
              DateTime deadline = DateTime.parse(jobData[4]);
              deadline = deadline.add(const Duration(hours: 23, minutes: 59, seconds: 59));
              if (currentTime.isBefore(deadline))
                allJobInfos.add(JobInfo(jobTitle, company, jobType, programmes, deadline, doc.url!));
              else
                print("after deadline");
            }
            print("all reading done");
            jobInfos = allJobInfos;
            companies = allJobInfos.map((job) => job.company).toSet().toList();
            allJobsAreRead = true;
          } else {
            allJobInfos = List.empty();
            print("no jobs read");
          }
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
    return allJobsAreRead == false
        ? Scaffold(
            body: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircularProgressIndicator(color: Colors.orange[600]),
            Text("Läser in jobb..."),
          ])))
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
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
                                        jobInfos = allJobInfos;
                                      }))
                              : SizedBox.shrink()),
                      onChanged: (search) {
                        List<String> searchTerms = search.toLowerCase().trim().split(new RegExp(r"\s+"));
                        setState(() {
                          initChar = "";
                          jobInfos = filterJobs(allJobInfos).where((job) {
                            return searchTerms.every((term) => job.jobTitle.toLowerCase().contains(term));
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
                      items: ["F", "π", "n"].map((p) => MultiSelectItem(p, p)).toList(),
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
                      items: companies
                          .map((company) => MultiSelectItem(company, company))
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
                    Expanded(
                        child: MultiSelectDialogField<JobType>(
                      title: Text("Typ"),
                      buttonText: Text("Typ"),
                      items: JobType.values
                          .map((jobType) => MultiSelectItem(jobType, JobInfo.jobTypeString[jobType]!))
                          .toList(),
                      listType: MultiSelectListType.CHIP,
                      onConfirm: (List<JobType> values) {
                        setState(() {
                          jobTypeFilter = values;
                          jobInfos = filterJobs(allJobInfos);
                        });
                      },
                      confirmText: Text("Bekräfta"),
                      cancelText: Text("Avbryt"),
                      chipDisplay: MultiSelectChipDisplay<JobType>.none(),
                      searchable: true,
                      searchHint: "Axis, Ericsson...",
                    )),
                  ]),
                  Expanded(
                    child: jobInfos.length > 0
                        // Material widget is for some reason needed to prevent weird clipping behaviour when scrolling
                        ? Material(
                            child: ListView.builder(
                                shrinkWrap: false,
                                itemCount: jobInfos.length,
                                itemBuilder: (context, index) {
                                  return JobCard(jobInfo: jobInfos[index]);
                                }
                                //children: jobInfos
                                //    .map((jobInfos) =>
                                //        _generateDocumentTile(jobInfos))
                                //    .toList(),
                                ))
                        : Padding(
                            padding: EdgeInsets.symmetric(vertical: 80, horizontal: 45),
                            child: Text(
                              "Tyvärr finns det inga jobb ute just nu som passar dina specifikationer :(",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                  ),
                  Container(
                      alignment: Alignment.bottomCenter,
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Text(
                          "Visar " + jobInfos.length.toString() + " av " + allJobInfos.length.toString() + " jobb"))
                ],
              ),
            ));
  }

  List<JobInfo> filterJobs(List<JobInfo> allJobs) {
    List<JobInfo> jobs = [];

    for (JobInfo job in allJobs) {
      print(job.jobTitle);
      if ((programmeFilter.isEmpty || job.programmes.where((p) => programmeFilter.contains(p)).length > 0) &&
          (companyFilter.isEmpty || companyFilter.contains(job.company)) &&
          (jobTypeFilter.isEmpty || jobTypeFilter.contains(job.jobType))) {
        jobs.add(job);
      }
    }
    print(jobs);
    return jobs;
  }
}
