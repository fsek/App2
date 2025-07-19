import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/cafe/cafe_shift.dart';
import 'package:fsek_mobile/screens/cafe/cafe_shift.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/services/cafe.service.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';

class CafePage extends StatefulWidget {
  @override
  _CafePageState createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  DateTime _now = DateTime.now().toLocal();
  DateTime _focusedDay = DateTime.now().toLocal();
  DateTime _selectedDay = DateTime.now().toLocal();
  List<CafeShiftRead> _selectedEvents = [];
  Map<DateTime, List<CafeShiftRead>> _events = {};

  void initState() {
    super.initState();
    _loadInitData();
  }

  Future<void> _loadInitData() async {
    final now = DateTime.now().toUtc();
    _selectedDay = DateTime.utc(_now.year, _now.month, _now.day);
    final response = await ApiService.apiClient
        .getCafeApi()
        .cafeViewShiftsBetweenDates(
            startDate:
                truncateToMilliSeconds(now.subtract(Duration(days: 7)).toUtc()),
            endDate:
                truncateToMilliSeconds(now.add(Duration(days: 49)).toUtc()));
    final responseData = response.data;
    setState(() {
      if (responseData != null) {
        this._events = cafeShiftMap(responseData.toList());
      } else {
        this._events = {};
      }

      _selectedDay = DateTime.utc(_now.year, _now.month, _now.day);
      this._selectedEvents = _getEventsForDay(_selectedDay);
    });
  }

  DateTime truncateToMilliSeconds(DateTime dt) => DateTime.utc(
      dt.year, dt.month, dt.day, dt.hour, dt.minute, dt.second, dt.millisecond);

  Map<DateTime, List<CafeShiftRead>> cafeShiftMap(List<CafeShiftRead> shifts) {
    Map<DateTime, List<CafeShiftRead>> shiftsMap = {};
    shifts.forEach((shift) {
      final date = DateTime.utc(
          shift.startsAt.year, shift.startsAt.month, shift.startsAt.day);
      shiftsMap.putIfAbsent(date, () => []).add(shift);
    });

    return shiftsMap;
  }

  List<CafeShiftRead> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  Future<void> _onRefresh() async {
    final now = DateTime.now();
    final response = await ApiService.apiClient
        .getCafeApi()
        .cafeViewShiftsBetweenDates(
            startDate: now.subtract(Duration(days: 7)),
            endDate: now.add(Duration(days: 49)));
    final responseData = response.data;

    setState(() {
      if (responseData != null) {
        this._events = cafeShiftMap(responseData.toList());
      } else {
        this._events = {};
      }
    });
  }

  Widget createCafeShiftCard(CafeShiftRead shift) {
    var t = AppLocalizations.of(context)!;
    return Card(
      color: (shift.user != null)
          ? Theme.of(context).colorScheme.surfaceTint
          : null,
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
                      shift.endsAt
                          .difference(shift.startsAt)
                          .inMinutes
                          .toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: (Theme.of(context).colorScheme.primary),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      shift.user != null
                          ? "${shift.user?.firstName} ${shift.user?.lastName}"
                          : t.cafeShiftShift,
                      style: TextStyle(
                        fontSize: 18,
                        color: (shift.user != null
                            ? Theme.of(context).colorScheme.onInverseSurface
                            : Theme.of(context).colorScheme.onSurface),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void openCafeShiftPage(CafeShiftRead shift) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CafeShiftPage(
          shiftId: shift.id,
          cafeUser: shift.user,
        ),
      ),
    ).then((value) =>
        // after returning from cafe_shift page, update the calendar
        _loadInitData());
  }

  List<Widget> createPairShifts(List<CafeShiftRead> dayShifts) {
    // create pairs of shifts (which we will assume to have the same time)
    List<Widget> pairList = [];
    Row pair;
    for (var i = 0; i < dayShifts.length / 2; i++) {
      pair = Row(
        children: [
          Expanded(child: createCafeShiftCard(dayShifts[2 * i])),
          Expanded(child: createCafeShiftCard(dayShifts[2 * i + 1])),
        ],
      );
      pairList.add(pair);
    }
    return pairList;
  }

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Hilbert Café"),
      ),
      body: RefreshIndicator(
        onRefresh: () => _onRefresh(),
        child: ListView(
          children: [
            TableCalendar(
              calendarStyle: CalendarStyle(
                  markerDecoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      shape: BoxShape.circle)),
              availableGestures: AvailableGestures.horizontalSwipe,
              locale: locale,
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
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                /* It's too late to write pretty code, take this formatting space*/
                "  " + DateFormat("MMMMEEEEd", locale).format(_selectedDay),
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
            ...createPairShifts(_selectedEvents),
          ],
        ),
      ),
    );
  }
}
