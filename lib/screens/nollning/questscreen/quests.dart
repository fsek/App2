import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/adventure_data.dart';
import 'package:fsek_mobile/services/nollning.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/util/nollning/week_tracker.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission_week.dart';
import 'package:fsek_mobile/screens/nollning/questscreen/paperWidget.dart';
import 'package:fsek_mobile/screens/nollning/questscreen/finishedMissions.dart';

class QuestPage extends StatefulWidget {
  @override
  _QuestPageState createState() => _QuestPageState();
}

class _QuestPageState extends State<QuestPage> {
  // AdventureData? _adventureData;
  List<AdventureMissionWeek>? _adventureWeeks;
  List<int>? totalMissionsList;
  List<int>? acceptedMissionsList;
  List<double>? progressList;
  int? totalPoints;
  int? maxTotalPoints;
  AdventureData? adventureData;

  void initState() {
    locator<NollningService>().getAdventureWeeks().then((value) => setState(() {
          this._adventureWeeks = value;
          this.totalMissionsList = totalMissions(_adventureWeeks!);
          this.acceptedMissionsList = acceptedMissions(_adventureWeeks!);
        }));

    locator<NollningService>().getAdventures().then((value) => setState(() {
          this.adventureData = value;
          totalPoints = value.total_group_points ?? 0;
        }));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // String locale = Localizations.localeOf(context).toString();

    //assets
    String backgroundPath = "assets/img/nollning-24/uppdrag/questscreen_background.png";
    String woodBoardPath = "assets/img/nollning-24/uppdrag/questscreen_woodboard_cropped.png";
    // String titlePath =
    //     "assets/img/nollning-24/uppdrag/questscreen_titletext_cropped.png";
    // String titlePathEnglish =
    //     "assets/img/nollning-24/uppdrag/questscreen_titletext_cropped.png";

    // String currentTitlePath = locale == ("sv") ? titlePath : titlePathEnglish;

    return
        // Scaffold(
        //     appBar: AppBar(
        //       backgroundColor:
        //           Color.fromARGB(255, 118, 110, 99), // Transparent background
        //       elevation: 0, // Remove shadow
        //       leading: IconButton(
        //         icon:
        //             Icon(Icons.arrow_back, color: Colors.black), // Back arrow icon
        //         onPressed: () {
        //           Navigator.pop(context); // Go back to the previous screen
        //         },
        //       ),
        //     ),
        //     body:
        Stack(
      children: [
        //Background
        Positioned.fill(
            child: Image.asset(
          backgroundPath,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        )),

        Align(
          alignment: Alignment.topCenter, // Align to the top center
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              // height: MediaQuery.of(context).size.width *
              //     0.55, // Adjust width as needed
              // height: MediaQuery.of(context).size.height *
              //     0.8, // Adjust height as needed
              // child: AspectRatio(
              //   aspectRatio: 0.352, // Your woodboard's aspect ratio
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(woodBoardPath),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Align(
                      //   alignment:
                      //       Alignment.center, // Center the title horizontally
                      //   child: SizedBox(
                      //       // height:
                      //       //     //100, // Set a fixed height for the title
                      //       //     MediaQuery.of(context).size.height / 12,
                      //       // child: Image.asset(
                      //       //   currentTitlePath,
                      //       //   width: MediaQuery.of(context).size.width * 0.7,
                      //       //   alignment: Alignment(0, 0.6),
                      //       // ),
                      //       ),
                      // ),
                      getPaperRow(0, 1),
                      SizedBox(
                        height: 10,
                      ),
                      getPaperRow(2, 3),
                      SizedBox(
                        height: 10,
                      ),
                      getPaperRow(4, 5),
                    ],
                  ),
                ],
              )
              // Container(
              //   padding: EdgeInsets.all(40.0),
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage(woodBoardPath),
              //       fit: BoxFit.contain, // Keeps the aspect ratio
              //     ),
              //   ),
              //   child:
              // ),
              ),
        ),
      ],
    );
    // );
  }

  Widget getPaper(week) {
    //text for button
    String content = '';
    if (_adventureWeeks != null && totalMissionsList != null && acceptedMissionsList != null && week < totalMissionsList!.length && week < acceptedMissionsList!.length) {
      content = '${acceptedMissionsList![week]}/${totalMissionsList![week]}';
    } else {
      content = ''; // Default text if data is not available
    }
    int week_tracker = WeekTracker.determineWeek(differentPreIntroduction: true);

    bool finalWeek = (week_tracker == 5 && week == 5);

    return PaperWidget(week: week, content: content, finalWeek: finalWeek);
  }

  Widget getPaperRow(
    week,
    weekAfter,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [getPaper(week), getPaper(weekAfter)],
    );
  }
}
