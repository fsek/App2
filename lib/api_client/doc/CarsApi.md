# api_client.api.CarsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**carsCreateCarBooking**](CarsApi.md#carscreatecarbooking) | **POST** /car/ | Create Car Booking
[**carsGetAllCarBookings**](CarsApi.md#carsgetallcarbookings) | **GET** /car/ | Get All Car Bookings
[**carsGetCarBooking**](CarsApi.md#carsgetcarbooking) | **GET** /car/{booking_id} | Get Car Booking
[**carsRemoveCarBooking**](CarsApi.md#carsremovecarbooking) | **DELETE** /car/{booking_id} | Remove Car Booking
[**carsUpdateCarBooking**](CarsApi.md#carsupdatecarbooking) | **PATCH** /car/{booking_id} | Update Car Booking


# **carsCreateCarBooking**
> CarBookingRead carsCreateCarBooking(carBookingCreate)

Create Car Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCarsApi();
final CarBookingCreate carBookingCreate = ; // CarBookingCreate | 

try {
    final response = api.carsCreateCarBooking(carBookingCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarsApi->carsCreateCarBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **carBookingCreate** | [**CarBookingCreate**](CarBookingCreate.md)|  | 

### Return type

[**CarBookingRead**](CarBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **carsGetAllCarBookings**
> BuiltList<CarBookingRead> carsGetAllCarBookings()

Get All Car Bookings

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCarsApi();

try {
    final response = api.carsGetAllCarBookings();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarsApi->carsGetAllCarBookings: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CarBookingRead&gt;**](CarBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **carsGetCarBooking**
> CarBookingRead carsGetCarBooking(bookingId)

Get Car Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCarsApi();
final int bookingId = 56; // int | 

try {
    final response = api.carsGetCarBooking(bookingId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarsApi->carsGetCarBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookingId** | **int**|  | 

### Return type

[**CarBookingRead**](CarBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **carsRemoveCarBooking**
> CarBookingRead carsRemoveCarBooking(bookingId)

Remove Car Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCarsApi();
final int bookingId = 56; // int | 

try {
    final response = api.carsRemoveCarBooking(bookingId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarsApi->carsRemoveCarBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookingId** | **int**|  | 

### Return type

[**CarBookingRead**](CarBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **carsUpdateCarBooking**
> CarBookingRead carsUpdateCarBooking(bookingId, carBookingUpdate)

Update Car Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCarsApi();
final int bookingId = 56; // int | 
final CarBookingUpdate carBookingUpdate = ; // CarBookingUpdate | 

try {
    final response = api.carsUpdateCarBooking(bookingId, carBookingUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarsApi->carsUpdateCarBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookingId** | **int**|  | 
 **carBookingUpdate** | [**CarBookingUpdate**](CarBookingUpdate.md)|  | 

### Return type

[**CarBookingRead**](CarBookingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

