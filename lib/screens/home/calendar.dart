import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fsek_mobile/models/home/calendarevent.dart';
import 'package:fsek_mobile/services/event.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/screens/event/event.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now().toLocal();
  DateTime _now = DateTime.now().toLocal();
  DateTime _selectedDay = DateTime.now().toLocal();
  List<CalendarEvent> _selectedEvents = [];
  Map<DateTime, List<CalendarEvent>> _events = {};

  void initState() {
    _selectedDay = DateTime.utc(_now.year, _now.month, _now.day);

    locator<EventService>().getEvents().then((value) => setState(() {
          this._events = value;
          _selectedEvents = _getEventsForDay(_selectedDay);
        }));
    super.initState();
  }

  void openEventPage(CalendarEvent event) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EventPage(eventId: event.id ?? -1)));
  }

  List<CalendarEvent> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  Widget createEventCard(CalendarEvent event) {
    return Container(
      child: Card(
        child: InkWell(
          onTap: () => openEventPage(event),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Text(
                    event.title ?? "ingen titel",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange[600],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 20,
                    ),
                    Text(
                      /* better error checking */
                      "  " +
                          DateFormat("kk:mm").format(
                              event.start?.toLocal() ?? DateTime.now()) +
                          " - " +
                          DateFormat("kk:mm")
                              .format(event.end?.toLocal() ?? DateTime.now()) +
                          ", " +
                          DateFormat("MMMMd", "sv_SE")
                              .format(event.start?.toLocal() ?? DateTime.now()),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.room,
                      size: 20,
                    ),
                    Text(
                      "  " + (event.location ?? "intigheten"),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    locator<EventService>().getEvents().then((value) => setState(() {
          this._events = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: () => _onRefresh(),
        child: ListView(
          children: [
            Column(
              children: [
                TableCalendar(
                  availableGestures: AvailableGestures.horizontalSwipe,
                  locale: "sv_SE",
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  firstDay: DateTime.now().subtract(Duration(days: 365 * 5)),
                  lastDay: DateTime.now().add(Duration(days: 365 * 5)),
                  focusedDay: _focusedDay,
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay =
                          focusedDay; // update `_focusedDay` here as well
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
                    "  " +
                        DateFormat("MMMMEEEEd", "sv_SE").format(_selectedDay),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            ..._selectedEvents.map((CalendarEvent e) => createEventCard(e)),
          ],
        ),
      ),
    );
  }
}
