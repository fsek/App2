import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:url_launcher/url_launcher.dart';

enum JobType {
  internship,
  part_time,
  full_time,
  summer,
  ex_job,
}

//temporary
class JobInfo {
  String jobTitle;
  String company;
  JobType jobType;
  List<String> programmes;
  DateTime deadline;
  String url;

  JobInfo(this.jobTitle, this.company, this.jobType, this.programmes, this.deadline, this.url);
}

class JobCard extends StatefulWidget {
  final JobInfo jobInfo;

  const JobCard({Key? key, required this.jobInfo}) : super(key: key);

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  Map<JobType, Color> jobTypeColor = {
    JobType.internship: Colors.purple,
    JobType.part_time: Colors.yellow,
    JobType.full_time: Colors.orange,
    JobType.summer: Colors.green,
    JobType.ex_job: Colors.blue,
  };

  Color bottomColor = Colors.grey[400]!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Container(
        decoration: BoxDecoration(
            color: jobTypeColor[widget.jobInfo.jobType]!.withOpacity(0.2),
            border: Border(bottom: BorderSide(color: bottomColor))),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(children: [
          Text(
            widget.jobInfo.company,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.jobInfo.jobTitle,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          Center(
              child: Text(
            widget.jobInfo.programmes.toString().substring(1, widget.jobInfo.programmes.toString().length - 1),
            textAlign: TextAlign.center,
          )),
          SizedBox(height: 10),
          Container(
              child: InkWell(
                  onTap: () async {
                    Uri url = Uri.parse(widget.jobInfo.url);
                    if (await launchUrl(url)) {
                      //launchUrl(url, mode: LaunchMode.inAppWebView);
                    }
                  },
                  child: ListTile(
                    tileColor: jobTypeColor[widget.jobInfo.jobType]!.withOpacity(0.3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    title: Center(
                        child: Text(
                      "Till ansökansportalen",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    visualDensity: VisualDensity(vertical: -3),
                  ))),
          Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Deadline: " + widget.jobInfo.deadline.toString().split(' ')[0],
              ))
        ]));
  }

  void openFile(ElectionDocument document) {
    /*
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PdfPage(url: document.url!, title: document.document_name!)));
                */
  }
}
