import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for CafeApi
void main() {
  final instance = ApiClient().getCafeApi();

  group(CafeApi, () {
    // Create Shift
    //
    //Future<CafeShiftCreate> cafeCreateShift(CafeShiftCreate cafeShiftCreate) async
    test('test cafeCreateShift', () async {
      // TODO
    });

    // Delete Shift
    //
    //Future cafeDeleteShift(int shiftId) async
    test('test cafeDeleteShift', () async {
      // TODO
    });

    // Signoff From Shift
    //
    //Future<CafeShiftRead> cafeSignoffFromShift(int shiftId) async
    test('test cafeSignoffFromShift', () async {
      // TODO
    });

    // Signup To Shift
    //
    //Future<CafeShiftRead> cafeSignupToShift(int shiftId) async
    test('test cafeSignupToShift', () async {
      // TODO
    });

    // Update Shift
    //
    //Future<CafeShiftRead> cafeUpdateShift(int shiftId, CafeShiftUpdate cafeShiftUpdate) async
    test('test cafeUpdateShift', () async {
      // TODO
    });

    // View All Shifts
    //
    //Future<BuiltList<CafeShiftRead>> cafeViewAllShifts() async
    test('test cafeViewAllShifts', () async {
      // TODO
    });

    // View Shift
    //
    //Future<CafeShiftRead> cafeViewShift(int shiftId) async
    test('test cafeViewShift', () async {
      // TODO
    });

    // View Shifts Between Dates
    //
    //Future<BuiltList<CafeShiftRead>> cafeViewShiftsBetweenDates(DateTime startDate, DateTime endDate) async
    test('test cafeViewShiftsBetweenDates', () async {
      // TODO
    });

  });
}
