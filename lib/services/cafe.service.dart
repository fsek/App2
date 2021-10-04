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

  Future<List<CafeShift>> getCafeShiftBetweenDates(DateTime startTime, DateTime endTime) async {
    String start = "${startTime.year}-${startTime.month}-${startTime.day}";
    String end = "${endTime.year}-${endTime.month}-${endTime.day}";
    Map json = await AbstractService.get("/cafe?start=" + start + "&end=" + end);
    //let's get parsing boiz
  }
}
