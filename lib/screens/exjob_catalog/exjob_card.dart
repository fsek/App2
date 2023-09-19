import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:fsek_mobile/screens/guild_meeting/pdf.dart';

//temporary
class ExjobInfo {
  String? company;
  String? jobTitle;

  ExjobInfo(this.company, this.jobTitle);
}

class ExjobCard extends StatefulWidget {
  //final ElectionDocument? proposition;
  final ExjobInfo? exjobInfo;

  const ExjobCard({Key? key, required this.exjobInfo})
      : super(key: key);

  @override
  _ExjobCardState createState() => _ExjobCardState();
}

class _ExjobCardState extends State<ExjobCard> {
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
    return widget.exjobInfo == null
        ? Container()
        : Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                border: Border(bottom: BorderSide(color: bottomColor))),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(children: [
              Center(
                  child: Text(
                widget.exjobInfo!.jobTitle!,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: InkWell(
                          onTap: () => {/*openFile(widget.proposition!)*/},
                          child: ListTile(
                            tileColor: buttonColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            title: Center(
                                child: Text(
                              t.readProposition,
                            )),
                            visualDensity: VisualDensity(vertical: -3),
                          ))),
                ],
              )
            ]));
  }

  void openFile(ElectionDocument document) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PdfPage(url: document.url!, title: document.document_name!)));
  }
}