import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:fsek_mobile/screens/nollning/questscreen/goodbyePaperPage.dart";

//behöver vecka, synas eller inte, klarade,total

class PaperWidget extends StatefulWidget {
  final int week;
  final String content;
  final bool finalWeek;

  //creating a new button
  const PaperWidget({
    Key? key,
    required this.week,
    required this.content,
    required this.finalWeek,
  }) : super(key: key);

  @override
  _PaperWidgetState createState() => _PaperWidgetState();
}

class _PaperWidgetState extends State<PaperWidget> {
  List<int>? totalMissionsList;
  List<int>? acceptedMissionsList;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    String locale = Localizations.localeOf(context).toString();

    //accessing week from widget
    int week = widget.week;
    bool finalWeek = widget.finalWeek;
    String content = widget.content;

    //assets
    String paperPath = "assets/img/nollning-24/uppdrag/questscreen_paper_cropped.png";
    String goodbyePaperPath = locale == "sv" ? "assets/img/nollning-24/uppdrag/questscreen_goodbye_paper_cropped.png" : "assets/img/nollning-24/uppdrag/questscreen_goodbye_paper_english.png";

    // Determine which path to use based on the length of _adventureWeeks
    String currentPaperPath = finalWeek ? goodbyePaperPath : paperPath;

    //make it clickable if its the goodbyepaper

    Widget paperContent = SizedBox(
      width: MediaQuery.of(context).size.width * 0.28, // Set width to 1/3 of the screen width
      child: AspectRatio(
        aspectRatio: 1325 / 1856, // Maintain the 1325:1856 aspect ratio
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(currentPaperPath),
              fit: BoxFit.contain, //or contain
            ),
          ),
          child: currentPaperPath == paperPath
              ? Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          (week != 5) ? t.weekQuests + " " + week.toString() : "",
                          // totalMissionsList!.length.toString() +
                          //     acceptedMissionsList!.length.toString(),
                          style: TextStyle(
                            fontFamily: 'Testament',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        content,
                        style: TextStyle(
                          fontFamily: 'Testament',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 96, 55, 8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );

    // Only wrap the paperContent with GestureDetector if it's the goodbye paper
    return (finalWeek == true)
        ? GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GoodbyePaperPage(),
                  // Navigate to the GoodbyePaperPage
                ),
              );
            },
            child: paperContent,
          )
        : paperContent;
  }
}
