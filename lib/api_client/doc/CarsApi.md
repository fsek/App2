# api_client.api.CarsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**carsCreateBooking**](CarsApi.md#carscreatebooking) | **POST** /car/ | Create Booking
[**carsGetAllBooking**](CarsApi.md#carsgetallbooking) | **GET** /car/ | Get All Booking
[**carsGetBooking**](CarsApi.md#carsgetbooking) | **GET** /car/{booking_id} | Get Booking
[**carsRemoveBooking**](CarsApi.md#carsremovebooking) | **DELETE** /car/{booking_id} | Remove Booking
[**carsUpdateBooking**](CarsApi.md#carsupdatebooking) | **PATCH** /car/{booking_id} | Update Booking


# **carsCreateBooking**
> CarCreate carsCreateBooking(carCreate)

Create Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCarsApi();
final CarCreate carCreate = ; // CarCreate | 

try {
    final response = api.carsCreateBooking(carCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarsApi->carsCreateBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **carCreate** | [**CarCreate**](CarCreate.md)|  | 

### Return type

[**CarCreate**](CarCreate.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **carsGetAllBooking**
> BuiltList<CarRead> carsGetAllBooking()

Get All Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCarsApi();

try {
    final response = api.carsGetAllBooking();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarsApi->carsGetAllBooking: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CarRead&gt;**](CarRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **carsGetBooking**
> CarRead carsGetBooking(bookingId)

Get Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCarsApi();
final int bookingId = 56; // int | 

try {
    final response = api.carsGetBooking(bookingId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarsApi->carsGetBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookingId** | **int**|  | 

### Return type

[**CarRead**](CarRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **carsRemoveBooking**
> CarRead carsRemoveBooking(bookingId)

Remove Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCarsApi();
final int bookingId = 56; // int | 

try {
    final response = api.carsRemoveBooking(bookingId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarsApi->carsRemoveBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookingId** | **int**|  | 

### Return type

[**CarRead**](CarRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **carsUpdateBooking**
> CarRead carsUpdateBooking(bookingId, carUpdate)

Update Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCarsApi();
final int bookingId = 56; // int | 
final CarUpdate carUpdate = ; // CarUpdate | 

try {
    final response = api.carsUpdateBooking(bookingId, carUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarsApi->carsUpdateBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookingId** | **int**|  | 
 **carUpdate** | [**CarUpdate**](CarUpdate.md)|  | 

### Return type

[**CarRead**](CarRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

