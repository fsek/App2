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
            builder: (context) => EventPage(event_id: event.id ?? -1)));
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
                Text(
                  event.title ?? "ingen titel",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange[600],
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  /* better error checking */
                  DateFormat("kk:mm").format(event.start ?? DateTime.now()) +
                      " - " +
                      DateFormat("kk:mm").format(event.end ?? DateTime.now()),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  event.location ?? "intigheten",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
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
                  DateFormat("MMMMEEEEd").format(
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
    );
  }
}
