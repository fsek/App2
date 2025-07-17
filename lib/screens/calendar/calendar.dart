import 'package:flutter/material.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fsek_mobile/models/home/calendarevent.dart';
import 'package:fsek_mobile/services/event.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/screens/event/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now().toLocal();
  DateTime _now = DateTime.now().toLocal();
  DateTime _selectedDay = DateTime.now().toLocal();
  List<EventRead> _selectedEvents = [];
  List<EventRead> _events = [];

  void initState() {
    _selectedDay = DateTime.utc(_now.year, _now.month, _now.day);

    ApiService.apiClient
        .getEventsApi()
        .eventsGetAllEvents()
        .then((value) => setState(() {
              this._events = value.data!.toList();
              _selectedEvents = _getEventsForDay(_selectedDay);
            }));
    super.initState();
  }

  void openEventPage(EventRead event) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EventPage(eventId: event.id)));
  }

  List<EventRead> _getEventsForDay(DateTime day) {
    return this._events.where((item) => isSameDay(item.startsAt, day)).toList();
  }

  Future<void> _onRefresh() async {
    ApiService.apiClient
        .getEventsApi()
        .eventsGetAllEvents()
        .then((value) => setState(() {
              this._events = value.data!.toList();
              _selectedEvents = _getEventsForDay(_selectedDay);
            }));
  }

  Widget createEventCard(EventRead event) {
    String locale = Localizations.localeOf(context).toString();
    var t = AppLocalizations.of(context)!;
    return Container(
      child: Card(
        shadowColor: null,
        color: null,
        child: InkWell(
          onTap: () => openEventPage(event),
          child: Container(
            margin: EdgeInsets.zero,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Text(
                      t.localeName == "en" ? event.titleEn : event.titleSv,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
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
                            DateFormat("HH:mm")
                                .format(event.startsAt.toLocal()) +
                            " - " +
                            DateFormat("HH:mm").format(event.endsAt.toLocal()) +
                            ", " +
                            DateFormat("MMMMd", locale)
                                .format(event.startsAt.toLocal()),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Alcohol is served
                            if (event.alcoholEventType == "Alcohol-Served")
                              Icon(Icons.wine_bar_rounded, size: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.room,
                        size: 20,
                      ),
                      Text(
                        "  " +
                            "intigheten", // (event.location ?? "intigheten"), TODO change this when event actually has a location
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
              margin: EdgeInsets.all(10),
            ),
          ),
        ),
        // Introduction events background needs access to entire card
        margin: EdgeInsets.all(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).toString();
    if (locale == "sv") {
      DateFormat("MMMMEEEEd", "sv_SE").format(_selectedDay);
    } else {
      DateFormat("MMMMEEEEd", "en_US").format(_selectedDay);
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).colorScheme.onSecondary,
      child: RefreshIndicator(
        onRefresh: () => _onRefresh(),
        child: ListView(
          children: [
            Column(
              children: [
                TableCalendar(
                  calendarStyle: CalendarStyle(
                      markerDecoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          shape: BoxShape.circle)),
                  availableGestures: AvailableGestures.horizontalSwipe,
                  locale: locale,
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
              ],
            ),
            ..._selectedEvents.map((EventRead e) => createEventCard(e)),
            Container(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
