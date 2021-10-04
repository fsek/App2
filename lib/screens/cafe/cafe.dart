import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/services/nollning.service.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fsek_mobile/models/home/calendarevent.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class CafePage extends StatefulWidget {
  @override
  _CafePageState createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  DateTime _focusedDay = DateTime.now().toLocal();
  DateTime _selectedDay = DateTime.now().toLocal();
  List<CalendarEvent> _selectedEvents = [];
  Map<DateTime, List<CalendarEvent>> _events = {};

  void initState() {
    locator<NollningService>().testGetThings();
    super.initState();
  }

  List<CalendarEvent> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hilbert Café"),
      ),
      body: RefreshIndicator(
        onRefresh: () => _onRefresh(),
        child: ListView(
          children: [
            TableCalendar(
              availableGestures: AvailableGestures.horizontalSwipe,
              locale: "sv_SE",
              startingDayOfWeek: StartingDayOfWeek.monday,
              firstDay: DateTime.now().subtract(Duration(days: 365 * 5)),
              lastDay: DateTime.now().add(Duration(days: 365 * 5)),
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.week,
              availableCalendarFormats: {CalendarFormat.week: "Week"},
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                  _selectedEvents = _getEventsForDay(selectedDay);
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              eventLoader: (day) {
                return _getEventsForDay(day);
              },
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 20,
              color: Colors.orange[600],
              child: Text(
                /* It's too late to write pretty code, take this formatting space*/
                "  " + DateFormat("MMMMEEEEd", "sv_SE").format(_selectedDay),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {}
}
