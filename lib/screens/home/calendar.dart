import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fsek_mobile/models/home/event.dart';
import 'package:fsek_mobile/services/event.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Event> _selectedEvents = [];
  Map<DateTime, List<Event>> _events = {
    DateTime(2021, 08, 27): [Event("nollning")]
  };

  void initState() {
    print("!");
    super.initState();
    _events = {
      DateTime(2021, 08, 27): [Event("nollning")]
    };
    print(_events);
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [Event("nollning")];
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
            height: 20,
            color: Colors.orange[600],
          ),
          Expanded(
            child: SizedBox(
              height: 200,
              child: ListView(
                children: <Widget>[
                  ..._selectedEvents.map(
                    (Event e) => _EventTextBox(),
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

class _EventTextBox extends StatelessWidget {
  String? title;
  String? location;
  DateTime? startTime;
  DateTime? endTime;
  @override
  Widget build(BuildContext context) {
    print(locator<EventService>().getEvents());
    return Container(
      child: Card(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "hej",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange[600],
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        ),
      ],
    );
*/