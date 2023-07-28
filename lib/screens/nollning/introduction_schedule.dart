import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class IntroductionSchedule extends StatefulWidget {
  final int currentWeek; // the current introduction week, and thus the final allowed week to swipe to
  final int week; // the week we are showing on this schedule-page
  final bool firstTime; // if we are entering this week for the first time from the schedule, and thus should automatically continue flipping in initState
  // final List<Color> overleafColors; // colors for the different weeks, used for the overleafs colors
  const IntroductionSchedule({key, required this.currentWeek, this.week = 0, this.firstTime = false}) : super(key: key);
  @override
  _IntroductionScheduleState createState() => _IntroductionScheduleState();
}

class _IntroductionScheduleState extends State<IntroductionSchedule> {
  static const List<Color> overleafColors = [
    Color(0xFF202C57), // v0
    Color(0xFF4B6357), // v1
    Color(0xFF9B4C52), // v2
    Color(0xFF260F3F), // v3
    Color(0xFF165C7F), // v4
  ];

  void initState() {
    super.initState();

    // this here is to flip to the current introduction week when you are first entering the calendar, but not to do it whilst flipping around in the calendar.
    if (widget.firstTime && widget.week < widget.currentWeek) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.of(context).push(TurnPageRoute(
          overleafColor: overleafColors[widget.week],
          builder: (context) => IntroductionSchedule(
            week: widget.week + 1,
            currentWeek: widget.currentWeek,
            firstTime: (widget.firstTime && widget.week + 1 < widget.currentWeek),
          ),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int sensitivity = 8; // swipe sensitivity - higher number means more movement is needed to register a swipe
    // String backgroundPath = "";
    // if (widget.week % 2 == 0)
    //   backgroundPath = "assets/img/algresan.png";
    // else
    //   backgroundPath = "assets/img/underConstruction.png";
    String backgroundPath = "assets/img/nollning-23/schema/Nollningsschema_v${widget.week}.png";
    return Stack(
      children: [
        Image.asset(
          backgroundPath,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Center(
              child: GestureDetector(onHorizontalDragEnd: (DragEndDetails details) {
                if (details.primaryVelocity! > sensitivity) {
                  _swipe("right");
                } else if (details.primaryVelocity! < -sensitivity) {
                  _swipe("left");
                }
              }),
            ),
            Center(
              child: Text(widget.week.toString(), style: TextStyle(fontSize: 42)),
            ),
            // a back button so you can leave the calendar without having to swipe all the way to the left
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 52.0, 0, 0),
                  child: IconButton(
                      onPressed: _goBack,
                      icon: Text(
                        String.fromCharCode(Icons.arrow_back_rounded.codePoint),
                        style: TextStyle(color: Colors.black, inherit: false, fontSize: 40.0, fontWeight: FontWeight.w900, fontFamily: Icons.arrow_back_rounded.fontFamily, package: Icons.arrow_back_rounded.fontPackage),
                      ))),
            )
          ]),
        ),
      ],
    );
  }

  void _swipe(String direction) {
    if (widget.week == 0 && direction == "right") {
      _goBack();
    }

    // if we aren't on week 0 and swiping left, or week 4 and swiping right, we may change page
    if (widget.week > 0 && direction == "right") {
      Navigator.of(context).pop(); // pop to go left (decrease page numbering). This is to ensure that the animations go reverse when they are supposed to
    } else if (widget.week < widget.currentWeek && direction == "left") {
      // push to go right (increase page numbering)
      Navigator.of(context).push(
        TurnPageRoute(
          overleafColor: overleafColors[widget.week],
          builder: (context) => IntroductionSchedule(week: widget.week + 1, currentWeek: widget.currentWeek),
        ),
      );
    }
  }

  void _goBack() {
    // pop the whole stack until we are back at homepage
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
