import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for RoomBookingApi
void main() {
  final instance = ApiClient().getRoomBookingApi();

  group(RoomBookingApi, () {
    // Create Room Booking
    //
    //Future<RoomBookingRead> roomBookingCreateRoomBooking(RoomBookingCreate roomBookingCreate) async
    test('test roomBookingCreateRoomBooking', () async {
      // TODO
    });

    // Get All Room Bookings
    //
    //Future<BuiltList<RoomBookingRead>> roomBookingGetAllRoomBookings() async
    test('test roomBookingGetAllRoomBookings', () async {
      // TODO
    });

    // Get Bookings By Room
    //
    //Future<BuiltList<RoomBookingRead>> roomBookingGetBookingsByRoom(String room) async
    test('test roomBookingGetBookingsByRoom', () async {
      // TODO
    });

    // Get Room Booking
    //
    //Future<RoomBookingRead> roomBookingGetRoomBooking(int bookingId) async
    test('test roomBookingGetRoomBooking', () async {
      // TODO
    });

    // Get Room Bookings Between Times
    //
    //Future<BuiltList<RoomBookingRead>> roomBookingGetRoomBookingsBetweenTimes(RoomBookingsBetweenDates roomBookingsBetweenDates) async
    test('test roomBookingGetRoomBookingsBetweenTimes', () async {
      // TODO
    });

    // Remove Room Booking
    //
    //Future<RoomBookingRead> roomBookingRemoveRoomBooking(int bookingId) async
    test('test roomBookingRemoveRoomBooking', () async {
      // TODO
    });

    // Update Room Booking
    //
    //Future<RoomBookingRead> roomBookingUpdateRoomBooking(int bookingId, RoomBookingUpdate roomBookingUpdate) async
    test('test roomBookingUpdateRoomBooking', () async {
      // TODO
    });

  });
}
