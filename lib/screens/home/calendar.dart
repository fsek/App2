import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fsek_mobile/models/home/calendarevent.dart';
import 'package:fsek_mobile/services/event.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/screens/event/event.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<CalendarEvent> _selectedEvents = [];
  Map<DateTime, List<CalendarEvent>> _events = {};

  void initState() {
    locator<EventService>().getEvents().then((value) => setState(() {
          this._events = value;
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
                          DateFormat("kk:mm")
                              .format(event.start ?? DateTime.now()) +
                          " - " +
                          DateFormat("kk:mm")
                              .format(event.end ?? DateTime.now()) +
                          ", " +
                          DateFormat("MMMMd", "sv_SE")
                              .format(event.start ?? DateTime.now()),
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

  void _onRefresh() async {
    locator<EventService>()
        .getEvents()
        .then((value) => setState(() {
              this._events = value;
              _refreshController.refreshCompleted();
            }))
        .catchError(
      (e) {
        _refreshController.refreshFailed();
      },
    );
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: _onRefresh,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            TableCalendar(
              locale: "sv_SE",
              startingDayOfWeek: StartingDayOfWeek.monday,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
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
                "  " +
                    DateFormat("MMMMEEEEd", "sv_SE").format(
                      _selectedDay ?? DateTime.now(),
                    ),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 200,
                child: ListView(
                  children: <Widget>[
                    ..._selectedEvents.map(
                      (CalendarEvent e) => createEventCard(e),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
