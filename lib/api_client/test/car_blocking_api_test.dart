import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for CarBlockingApi
void main() {
  final instance = ApiClient().getCarBlockingApi();

  group(CarBlockingApi, () {
    // Block User From Car Booking
    //
    //Future<CarBlockRead> carBlockingBlockUserFromCarBooking(CarBlockCreate carBlockCreate) async
    test('test carBlockingBlockUserFromCarBooking', () async {
      // TODO
    });

    // Get All Car Booking Blocks
    //
    //Future<BuiltList<CarBlockRead>> carBlockingGetAllCarBookingBlocks() async
    test('test carBlockingGetAllCarBookingBlocks', () async {
      // TODO
    });

    // Unblock User From Car Booking
    //
    //Future<CarBlockRead> carBlockingUnblockUserFromCarBooking(int userId) async
    test('test carBlockingUnblockUserFromCarBooking', () async {
      // TODO
    });

  });
}
