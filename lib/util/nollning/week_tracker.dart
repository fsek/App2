import 'package:flutter/material.dart';

class WeekTracker {
  /* Not used anymore but will be left in because otherwise stuff breaks */
  static const List<Color> weekColors = [
    Color(0xFFf77e14), // v0
    Color(0xFFf77e14), // v1
    Color(0xFFf77e14), // v2
    Color(0xFFf77e14), // v3
    Color(0xFFf77e14), // v4
    Color(0xFFf77e14), // for other times and purposes
  ];

  /* This is used though */
  static int determineWeek({bool differentPreIntroduction = false}) {
    DateTime now = DateTime.now();
    DateTime v0 = DateTime(2026, 8, 24, 0, 0);
    DateTime v1 = DateTime(2026, 8, 31, 0, 0);
    DateTime v2 = DateTime(2026, 9, 7, 0, 0);
    DateTime v3 = DateTime(2026, 9, 14, 0, 0);
    DateTime v4 = DateTime(2026, 9, 21, 0, 0);

    List<DateTime> weeks = [v0, v1, v2, v3, v4];

    for (int i = 0; i < weeks.length; i++) {
      // If we have gotten to week 4 then end of list so edge-case
      if (i == 4) {
        // if its week 4 and current time is after start time of week 4
        if (now.compareTo(weeks[i]) > 0) {
          return i;
        }
      } else if (now.compareTo(weeks[i]) > 0 &&
          now.compareTo(weeks[i + 1]) < 0) {
        return i;
      }
    }

    // If it for some reason doesn't find one I guess default to week 0 for no spoilers?
    // or 4 for generic stuff, like coloring in with orange
    if (differentPreIntroduction)
      return 4;
    else
      return 0;
  }
}
