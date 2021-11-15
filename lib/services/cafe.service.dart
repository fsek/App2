import 'package:fsek_mobile/models/cafe/cafe_shift.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class CafeService extends AbstractService {
  /// {cafe_shift:
  ///    {id: 760,
  ///     start: 2021-10-04T13:59:00.000+02:00,
  ///     duration: 13:59-14:59,
  ///     isme: false,
  ///     councils: {chosen: {},
  ///                available: {Sexmästeriet: 2,
  ///                            Prylmästeriet: 1}
  ///                },
  ///     group: null}
  /// }
  ///

  /// {years: {2021:
  ///   {months: {September:
  ///     {days: {Tisdag - 28/9: [],
  ///             Onsdag - 29/9: [],
  ///             Torsdag - 30/9: [{id: 743, start: 2021-09-30T13:59:00.000+02:00, duration: 13:59-14:59, user: null}, {id: 744, start: 2021-09-30T13:59:00.000+02:00, duration: 13:59-14:59, user: null}, {id: 745, start: 2021-09-30T15:59:00.000+02:00, duration: 15:59-17:59, user: null}, {id: 746, start: 2021-09-30T15:59:00.000+02:00, duration: 15:59-17:59, user: null}]}},
  ///     Oktober:
  ///     {days: {Fredag - 1/10: [{id: 747, start: 2021-10-01T13:59:00.000+02:00, duration: 13:59-14:59, user: null}, {id: 748, start: 2021-10-01T13:59:00.000+02:00, duration: 13:59-14:59, user: null}, {id: 749, start: 2021-10-01T15:59:00.000+02:00, duration: 15:59-17:59, user: null}, {id: 750, start: 2021-10-01T15:59:00.000+02:00, duration: 15:59-17:59, user: null}],
  ///             Måndag - 4/10: []}}}}}}

  Future<Map<DateTime, List<CafeShift>>> getCafeShiftBetweenDates(DateTime startTime, DateTime endTime) async {
    String start = "${startTime.year}-${startTime.month}-${startTime.day}";
    String end = "${endTime.year}-${endTime.month}-${endTime.day}";
    Map json = await AbstractService.get("/cafe?start=" + start + "&end=" + end);
    //let's get parsing boiz
    Map<DateTime, List<CafeShift>> shiftMap = {};
    (json['years'] as Map).forEach((keyYear, year) {
      (year['months'] as Map).forEach((keyMonth, month) {
        (month['days'] as Map).forEach((keyDay, day) {
          String date = (keyDay as String).split(" - ")[1];
          shiftMap[_parseDate(keyYear, date)] = (day as List).map((data) => CafeShift.fromJson(data)).toList();
        });
      });
    });
    return shiftMap;
  }

  DateTime _parseDate(String year, String date) {
    List<String> split = date.split("/");
    int month = int.parse(split[1]);
    int day = int.parse(split[0]);
    return DateTime.utc(int.parse(year), month, day);
  }

  Future<Map<DateTime, List<CafeShift>>> getShiftsForCalendar() async {
    DateTime now = DateTime.now();
    return getCafeShiftBetweenDates(now.subtract(Duration(days: 7)), now.add(Duration(days: 49)));
  }

  Future<CafeShift> getShift(int id) async {
    Map json = await AbstractService.get("/cafe/$id");
    return CafeShift.fromJson(json['cafe_shift']);
  }

  Future<Map> cafeShiftSignup(CafeShift shift) {
    return AbstractService.post('/cafe', mapBody: {
      "user_id": shift.id,
      "council_ids": shift.councils,
      "group": shift.group,
      // Add cafe competition?
      // "competition": shift.competition
    });
  }
}
