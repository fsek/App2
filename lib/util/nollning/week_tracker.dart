import 'package:flutter/material.dart';

class WeekTracker {
  static const List<Color> weekColors = [
    Color(0xFF202C57), // v0
    Color(0xFF4B6357), // v1
    Color(0xFF9B4C52), // v2
    Color(0xFF260F3F), // v3
    Color(0xFF165C7F), // v4
    Color(0xFFf77e14), // for other times and purposes
  ];

  static int determineWeek({bool differentPreIntroduction = false}) {
    DateTime now = DateTime.now();
    DateTime v0 = DateTime(2024, 8, 19, 0, 0);
    DateTime v1 = DateTime(2024, 8, 26, 0, 0);
    DateTime v2 = DateTime(2024, 9, 2, 0, 0);
    DateTime v3 = DateTime(2024, 9, 9, 0, 0);
    DateTime v4 = DateTime(2024, 9, 16, 0, 0);

    List<DateTime> weeks = [v0, v1, v2, v3, v4];

    for (int i = 0; i < weeks.length; i++) {
      // If we have gotten to week 4 then end of list so edge-case
      if (i == 4) {
        // if its week 4 and current time is after start time of week 4
        if (now.compareTo(weeks[i]) > 0) {
          return i;
        }
      } else if (now.compareTo(weeks[i]) > 0 && now.compareTo(weeks[i + 1]) < 0) {
        return i;
      }
    }

    // If it for some reason doesnt find one I guess default to week 0 for no spoilers?
    // or 5 for generic stuff, like coloring in with orange
    if (differentPreIntroduction)
      return 5;
    else
      return 0;
  }
}
