import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:url_launcher/url_launcher.dart';

enum JobType{
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
  //final ElectionDocument? proposition;
  final JobInfo jobInfo;

  const JobCard({Key? key, required this.jobInfo}) : super(key: key);

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  Color buttonColor = Colors.orange[700]!.withOpacity(0.3);
  Color backgroundColor = Colors.orange[700]!.withOpacity(0.2);
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
            color: backgroundColor,
            border: Border(bottom: BorderSide(color: bottomColor))),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
              widget.jobInfo.company,
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          Text(
            widget.jobInfo.jobTitle,
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
          Text(
            widget.jobInfo.programmes.toString().substring(1, widget.jobInfo.programmes.toString().length - 1),
            ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: InkWell(
                      onTap: () async {
                        Uri url = Uri.parse(widget.jobInfo.url);
                        if (await launchUrl(url)) {
                          //launchUrl(url, mode: LaunchMode.inAppWebView);
                        }
                      },
                      child: ListTile(
                        tileColor: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        title: Center(
                            child: Text(
                          "Till ansökansportalen",
                        )),
                        visualDensity: VisualDensity(vertical: -3),
                      ))),
            ],
          )
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
