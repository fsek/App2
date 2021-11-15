import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/cafe/cafe_shift.dart';
import 'package:fsek_mobile/screens/cafe/cafe_shift.dart';
import 'package:fsek_mobile/services/cafe.service.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class CafePage extends StatefulWidget {
  @override
  _CafePageState createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  DateTime _now = DateTime.now().toLocal();
  DateTime _focusedDay = DateTime.now().toLocal();
  DateTime _selectedDay = DateTime.now().toLocal();
  List<CafeShift> _selectedEvents = [];
  Map<DateTime, List<CafeShift>> _events = {};

  void initState() {
    _selectedDay = DateTime.utc(_now.year, _now.month, _now.day);
    locator<CafeService>().getShiftsForCalendar().then((value) => setState(() {
          this._events = value;
          _selectedEvents = _getEventsForDay(_selectedDay);
        }));
    super.initState();
  }

  List<CafeShift> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  Widget createCafeShiftCard(CafeShift shift) {
    return Card(
      child: Card(
          child: InkWell(
        onTap: () => openCafeShiftPage(shift),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 7),
                child: Column(
                  children: [
                    Text(
                      shift.duration ?? "för alltid",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.orange[600],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      shift.user?.name ?? "Ledigt pass",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void openCafeShiftPage(CafeShift shift) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CafeShiftPage(shiftId: shift.id ?? -1)));
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
            ..._selectedEvents.map((CafeShift e) => createCafeShiftCard(e)),
          ],
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    locator<CafeService>().getShiftsForCalendar().then((value) => setState(() {
          this._events = value;
        }));
  }
}
