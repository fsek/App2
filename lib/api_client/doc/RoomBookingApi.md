# api_client.api.RoomBookingApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**roomBookingCreateRoomBooking**](RoomBookingApi.md#roombookingcreateroombooking) | **POST** /rooms/ | Create Room Booking
[**roomBookingGetAllRoomBookings**](RoomBookingApi.md#roombookinggetallroombookings) | **GET** /rooms/get_all | Get All Room Bookings
[**roomBookingGetBookingsByRoom**](RoomBookingApi.md#roombookinggetbookingsbyroom) | **GET** /rooms/get_by_room/ | Get Bookings By Room
[**roomBookingGetRoomBooking**](RoomBookingApi.md#roombookinggetroombooking) | **GET** /rooms/get_booking/{booking_id} | Get Room Booking
[**roomBookingGetRoomBookingsBetweenTimes**](RoomBookingApi.md#roombookinggetroombookingsbetweentimes) | **POST** /rooms/get_between_times | Get Room Bookings Between Times
[**roomBookingRemoveRoomBooking**](RoomBookingApi.md#roombookingremoveroombooking) | **DELETE** /rooms/{booking_id} | Remove Room Booking
[**roomBookingUpdateRoomBooking**](RoomBookingApi.md#roombookingupdateroombooking) | **PATCH** /rooms/{booking_id} | Update Room Booking


# **roomBookingCreateRoomBooking**
> BuiltList<RoomBookingRead> roomBookingCreateRoomBooking(roomBookingCreate)

Create Room Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getRoomBookingApi();
final RoomBookingCreate roomBookingCreate = ; // RoomBookingCreate | 

try {
    final response = api.roomBookingCreateRoomBooking(roomBookingCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RoomBookingApi->roomBookingCreateRoomBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomBookingCreate** | [**RoomBookingCreate**](RoomBookingCreate.md)|  | 

### Return type

[**BuiltList&lt;RoomBookingRead&gt;**](RoomBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **roomBookingGetAllRoomBookings**
> BuiltList<RoomBookingRead> roomBookingGetAllRoomBookings()

Get All Room Bookings

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getRoomBookingApi();

try {
    final response = api.roomBookingGetAllRoomBookings();
    print(response);
} catch on DioException (e) {
    print('Exception when calling RoomBookingApi->roomBookingGetAllRoomBookings: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;RoomBookingRead&gt;**](RoomBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **roomBookingGetBookingsByRoom**
> BuiltList<RoomBookingRead> roomBookingGetBookingsByRoom(room)

Get Bookings By Room

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getRoomBookingApi();
final String room = room_example; // String | 

try {
    final response = api.roomBookingGetBookingsByRoom(room);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RoomBookingApi->roomBookingGetBookingsByRoom: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **room** | **String**|  | 

### Return type

[**BuiltList&lt;RoomBookingRead&gt;**](RoomBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **roomBookingGetRoomBooking**
> RoomBookingRead roomBookingGetRoomBooking(bookingId)

Get Room Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getRoomBookingApi();
final int bookingId = 56; // int | 

try {
    final response = api.roomBookingGetRoomBooking(bookingId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RoomBookingApi->roomBookingGetRoomBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookingId** | **int**|  | 

### Return type

[**RoomBookingRead**](RoomBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **roomBookingGetRoomBookingsBetweenTimes**
> BuiltList<RoomBookingRead> roomBookingGetRoomBookingsBetweenTimes(roomBookingsBetweenDates)

Get Room Bookings Between Times

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getRoomBookingApi();
final RoomBookingsBetweenDates roomBookingsBetweenDates = ; // RoomBookingsBetweenDates | 

try {
    final response = api.roomBookingGetRoomBookingsBetweenTimes(roomBookingsBetweenDates);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RoomBookingApi->roomBookingGetRoomBookingsBetweenTimes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomBookingsBetweenDates** | [**RoomBookingsBetweenDates**](RoomBookingsBetweenDates.md)|  | 

### Return type

[**BuiltList&lt;RoomBookingRead&gt;**](RoomBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **roomBookingRemoveRoomBooking**
> RoomBookingRead roomBookingRemoveRoomBooking(bookingId)

Remove Room Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getRoomBookingApi();
final int bookingId = 56; // int | 

try {
    final response = api.roomBookingRemoveRoomBooking(bookingId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RoomBookingApi->roomBookingRemoveRoomBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookingId** | **int**|  | 

### Return type

[**RoomBookingRead**](RoomBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **roomBookingUpdateRoomBooking**
> RoomBookingRead roomBookingUpdateRoomBooking(bookingId, roomBookingUpdate)

Update Room Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getRoomBookingApi();
final int bookingId = 56; // int | 
final RoomBookingUpdate roomBookingUpdate = ; // RoomBookingUpdate | 

try {
    final response = api.roomBookingUpdateRoomBooking(bookingId, roomBookingUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RoomBookingApi->roomBookingUpdateRoomBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookingId** | **int**|  | 
 **roomBookingUpdate** | [**RoomBookingUpdate**](RoomBookingUpdate.md)|  | 

### Return type

[**RoomBookingRead**](RoomBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

