import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for CarsApi
void main() {
  final instance = ApiClient().getCarsApi();

  group(CarsApi, () {
    // Create Booking
    //
    //Future<CarCreate> carsCreateBooking(CarCreate carCreate) async
    test('test carsCreateBooking', () async {
      // TODO
    });

    // Get All Booking
    //
    //Future<BuiltList<CarRead>> carsGetAllBooking() async
    test('test carsGetAllBooking', () async {
      // TODO
    });

    // Get Booking
    //
    //Future<CarRead> carsGetBooking(int bookingId) async
    test('test carsGetBooking', () async {
      // TODO
    });

    // Remove Booking
    //
    //Future<CarRead> carsRemoveBooking(int bookingId) async
    test('test carsRemoveBooking', () async {
      // TODO
    });

    // Update Booking
    //
    //Future<CarRead> carsUpdateBooking(int bookingId, CarUpdate carUpdate) async
    test('test carsUpdateBooking', () async {
      // TODO
    });

  });
}
