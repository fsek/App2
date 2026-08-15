import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/screens/event/event.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

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
        MaterialPageRoute(builder: (context) => EventPage(event: event, eventId: event.id)));
  }
  List<EventRead> _getEventsForDay(DateTime day) {

    final events = this._events.where((item) => isSameDay(item.startsAt.toLocal(), day)).toList();
    events.sort((a, b) => a.startsAt.compareTo(b.startsAt));
    return events;
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

  Widget? checkAlcoholEventType(String alcType, {bool isNollning = false}){
    switch (alcType) {
      case "Alcohol-Served":
        if (isNollning) {
          return Image.asset("assets/data/nollning_26/calendar/alcfull_icon.png");
        }

        return Icon(Icons.wine_bar_rounded);

      case "Alcohol":
        if (isNollning) {
          return Image.asset("assets/data/nollning_26/calendar/byob_icon.png");
        }

        return null;

      default:
        if (isNollning) {
          return Image.asset("assets/data/nollning_26/calendar/alcfree_icon.png");
        }

        return null;
    }
  }

  Widget createEventCard(EventRead event) {
    String locale = Localizations.localeOf(context).toString();
    var t = AppLocalizations.of(context)!;

    final formattedStartTime = DateFormat("HH:mm").format(event.startsAt.toLocal());
    final formattedEndTime = DateFormat("HH:mm").format(event.endsAt.toLocal());
    final formattedDay = DateFormat("MMMMd", locale).format(event.startsAt.toLocal());

    final alcPolicyImage = checkAlcoholEventType(event.alcoholEventType, isNollning: event.isNollningEvent);

    return Card(
      elevation: 5,
      shadowColor: null,
      color: null,
      margin: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () => openEventPage(event),
        child: LayoutBuilder(
          builder: (context, constraints) {
            const imageWidth = 940;
            // const imageHeight = 280;

            final scale = imageWidth / constraints.maxWidth;

            const horizontalSlice = 70.0;
            const verticalSlice = 108.5;
            final scaledCenterSlice = Rect.fromLTWH(
              horizontalSlice / scale,
              verticalSlice / scale,
              (imageWidth - 2 * horizontalSlice) / scale,
              1 / scale
            );

            return Container(
              padding: event.isNollningEvent ? const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40) : const EdgeInsets.all(10),
              decoration: !event.isNollningEvent ? null : BoxDecoration(
                image: DecorationImage(
                  image: ResizeImage(  // Can not just use scale in DecorationImage because it is prone to floating point errors
                    AssetImage("assets/data/nollning_26/calendar/event_banner.png"),
                    width: constraints.maxWidth.toInt()  // imageWidth / scale
                    // height: (constraints.maxWidth * imageHeight / imageWidth).toInt()  // imageHeight / scale
                  ),
                  invertColors: Theme.of(context).brightness == Brightness.dark,  // is this the correct way to do this?
                  centerSlice: scaledCenterSlice  // To hide stretching
                )
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: Text(
                            t.localeName == "en" ? event.titleEn : event.titleSv,
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            // overflow: TextOverflow.ellipsis
                          )
                        ),

                        Row(
                          children: [
                            const Icon(
                              Icons.access_time_rounded,
                              size: 20
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                /* better error checking */
                                "$formattedStartTime - $formattedEndTime, $formattedDay",
                                style: const TextStyle(
                                  fontSize: 14,
                                )
                              )
                            ),
                          ]
                        ),

                        Row(
                          children: [
                            const Icon(
                              Icons.room,
                              size: 20,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                event.location,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.onSurface,
                                )
                              )
                            ),
                          ],
                        ),
                      ],
                    )
                  ),

                  if (alcPolicyImage != null)
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: alcPolicyImage
                    ),
                ]
              )
            );
          }
        )
      )
    );
  }

  Widget? _getMarkers(List<EventRead> events) {
    if (events.isEmpty) return null;

    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: events.map((event) {
          final alcPolicyImage = checkAlcoholEventType(event.alcoholEventType, isNollning: event.isNollningEvent);

          if (!event.isNollningEvent || alcPolicyImage == null) {
            return Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inverseSurface,
                shape: BoxShape.circle
              )
            );
          }

          return Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            child: alcPolicyImage
          );
        }).toList()
      )
    );
  }

  Future<void> openExportCalendarLink() async {
  final uri = Uri.parse("https://fsektionen.se/calendar/subscribe");

  await launchUrl(
    uri,
    mode: LaunchMode.externalApplication  // for some reason it gives a PlatformError when not having this
  );
}

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).toString();

    return Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).colorScheme.surface,
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
                  headerStyle: HeaderStyle(
                    leftChevronIcon: Icon(
                      color: Theme.of(context).primaryColor,
                      Icons.chevron_left,
                      size: 25
                    ),

                    rightChevronIcon: Icon(
                      color: Theme.of(context).primaryColor,
                      Icons.chevron_right,
                      size: 25
                    )
                  ),
                  calendarBuilders: CalendarBuilders<EventRead>(
                    markerBuilder: (context, day, events) => _getMarkers(events),
                    headerTitleBuilder: (context, day) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat("MMMM yyyy", locale).format(day),
                          style: const TextStyle(
                            fontSize: 18
                          )
                        ),

                        IconButton(
                          icon: const Icon(Icons.open_in_browser_rounded),
                          color: Theme.of(context).primaryColor,
                          onPressed: openExportCalendarLink
                        ),
                      ]
                    )
                  )
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