import 'package:flutter/material.dart';
import 'package:fsek_mobile/util/nollning/week_tracker.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class IntroductionSchedule extends StatefulWidget {
  final int currentWeek; // the current introduction week, and thus the final allowed week to swipe to
  final int week; // the week we are showing on this schedule-page
  final bool firstTime; // if we are entering this week for the first time from the schedule, and thus should automatically continue flipping in initState
  const IntroductionSchedule({key, required this.currentWeek, this.week = 0, this.firstTime = false}) : super(key: key);
  @override
  _IntroductionScheduleState createState() => _IntroductionScheduleState();
}

class _IntroductionScheduleState extends State<IntroductionSchedule> {
  void initState() {
    super.initState();

    // this here is to flip to the current introduction week when you are first entering the calendar, but not to do it whilst flipping around in the calendar.
    if (widget.firstTime && widget.week < widget.currentWeek) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.of(context).push(TurnPageRoute(
          overleafColor: WeekTracker.weekColors[widget.week],
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
    String basePath = "assets/img/nollning-23/schema/";
    String backgroundPath = basePath + "Schema_v${widget.week}.png";
    String upperBackgroundPath = basePath + "Schema_fill_top.png";
    String lowerBackgroundPath = basePath + "Schema_fill_bottom.png";
    String backArrowPath = basePath + "backArrow_white.png";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeekTracker.weekColors[widget.week],
        leading: InkWell(onTap: () => _goBack(), child: Image.asset(backArrowPath)),
        leadingWidth: MediaQuery.of(context).size.width / 4,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
          // decoration: BoxDecoration(image: DecorationImage(image: AssetImage(backgroundPath), fit: BoxFit.cover)),
          children: [
            Stack(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(upperBackgroundPath),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(lowerBackgroundPath),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(backgroundPath),
              ),
            ]),
            Center(
              child: GestureDetector(onHorizontalDragEnd: (DragEndDetails details) {
                if (details.primaryVelocity! > sensitivity) {
                  _swipe("right");
                } else if (details.primaryVelocity! < -sensitivity) {
                  _swipe("left");
                }
              }),
            ),
          ]),
    );
  }

  void _swipe(String direction) {
    if (widget.week == 0 && direction == "right") {
      _goBack();
    }
    // if we aren't on week 0 and swiping left, or week 4 and swiping right, we may change page
    if (widget.week > 0 && direction == "right") {
      Navigator.of(context).pop(); // pop to go left (decrease page numbering). This is to ensure that the animations go reverse when they are supposed to
    } else if (widget.week < 4 && direction == "left") {
      // push to go right (increase page numbering)
      Navigator.of(context).push(
        TurnPageRoute(
          overleafColor: WeekTracker.weekColors[widget.week],
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
