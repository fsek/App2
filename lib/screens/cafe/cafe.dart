import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/cafe/cafe_shift.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
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
    _selectedDay = DateTime.utc(_now.year, _now.month, _now.day);
    _loadInitData();
  }

  Future<void> _loadInitData() async {
    final now = DateTime.now().toUtc();
    final cafeDates = CafeViewBetweenDates((b) => b 
    ..startDate = now.subtract(Duration(days: 7)).toUtc()
    ..endDate = now.add(Duration(days: 49)).toUtc());

    final response = await ApiService.apiClient
        .getCafeApi().cafeViewShiftsBetweenDates(cafeViewBetweenDates: cafeDates);
    final responseData = response.data;
    setState(() {
      if (responseData != null) {
        this._events = cafeShiftMap(responseData.toList());
      } else {
        this._events = {};
      }
      this._selectedEvents = _getEventsForDay(_selectedDay);
    });
  }

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
    final now = DateTime.now().toUtc();
    _selectedDay = DateTime.utc(now.year, now.month, now.day);
    final cafeDates = CafeViewBetweenDates((b) => b 
    ..startDate = now.subtract(Duration(days: 7)).toUtc()
    ..endDate = now.add(Duration(days: 49)).toUtc());

    final response = await ApiService.apiClient
        .getCafeApi().cafeViewShiftsBetweenDates(cafeViewBetweenDates: cafeDates);
    final responseData = response.data;
    setState(() {
      if (responseData != null) {
        this._events = cafeShiftMap(responseData.toList());
      } else {
        this._events = {};
      }
    }
    );
  }


  String dateTimeToHourAndMinute(DateTime date) {
    final localDate = date.toLocal();
    return "${localDate.hour.toString().padLeft(2, '0')}:${localDate.minute.toString().padLeft(2, '0')}";
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
                      dateTimeToHourAndMinute(shift.startsAt) + " - " + dateTimeToHourAndMinute(shift.endsAt),
                      style: TextStyle(
                        fontSize: 15,
                        color: (Theme.of(context).colorScheme.primary),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Center(child: Text(
                      shift.user != null
                          ? "${shift.user?.firstName} ${shift.user?.lastName}"
                          : t.cafeShiftShift,
                      style: TextStyle(
                        fontSize: 18,
                        color: (shift.user != null
                            ? Theme.of(context).colorScheme.onInverseSurface
                            : Theme.of(context).colorScheme.onSurface),
                      ),
                    ))
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
        ),
      ),
    ).then((value) =>
        // after returning from cafe_shift page, update the calendar
        _loadInitData());
  }


  List<Widget> createCafeShiftCards(List<CafeShiftRead> dayshifts) {
    List<Widget> shiftList = [];

    dayshifts.sort((a, b) { 
      int comp = a.startsAt.compareTo(b.startsAt);
      if(comp != 0) return comp;
      else return a.id.compareTo(b.id);
    }); 



    for(int i = 0; i < dayshifts.length; i++) {
      if(i == dayshifts.length - 1) {
        shiftList.add(Row(children: [Expanded(child: createCafeShiftCard(dayshifts[i]))]));
      } else {
          if(dayshifts[i].startsAt.compareTo(dayshifts[i+1].startsAt) == 0) {
          shiftList.add(Row(children: [
            Expanded(child: createCafeShiftCard(dayshifts[i])), 
            Expanded(child: createCafeShiftCard(dayshifts[i+1]))],));
          i++;
          } else {
          shiftList.add(Row(children: [createCafeShiftCard(dayshifts[i])],));
        }
      }
    }

    return shiftList;
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
                      color: Theme.of(context).colorScheme.onSurface,
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
            ...createCafeShiftCards(_selectedEvents),
          ],
        ),
      ),
    );
  }
}
