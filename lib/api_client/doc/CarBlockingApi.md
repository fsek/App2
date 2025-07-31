# api_client.api.CarBlockingApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**carBlockingBlockUserFromCarBooking**](CarBlockingApi.md#carblockingblockuserfromcarbooking) | **POST** /car/block/ | Block User From Car Booking
[**carBlockingGetAllCarBookingBlocks**](CarBlockingApi.md#carblockinggetallcarbookingblocks) | **GET** /car/block/ | Get All Car Booking Blocks
[**carBlockingUnblockUserFromCarBooking**](CarBlockingApi.md#carblockingunblockuserfromcarbooking) | **DELETE** /car/block/{user_id} | Unblock User From Car Booking


# **carBlockingBlockUserFromCarBooking**
> CarBlockRead carBlockingBlockUserFromCarBooking(carBlockCreate)

Block User From Car Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCarBlockingApi();
final CarBlockCreate carBlockCreate = ; // CarBlockCreate | 

try {
    final response = api.carBlockingBlockUserFromCarBooking(carBlockCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarBlockingApi->carBlockingBlockUserFromCarBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **carBlockCreate** | [**CarBlockCreate**](CarBlockCreate.md)|  | 

### Return type

[**CarBlockRead**](CarBlockRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **carBlockingGetAllCarBookingBlocks**
> BuiltList<CarBlockRead> carBlockingGetAllCarBookingBlocks()

Get All Car Booking Blocks

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCarBlockingApi();

try {
    final response = api.carBlockingGetAllCarBookingBlocks();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarBlockingApi->carBlockingGetAllCarBookingBlocks: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CarBlockRead&gt;**](CarBlockRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **carBlockingUnblockUserFromCarBooking**
> CarBlockRead carBlockingUnblockUserFromCarBooking(userId)

Unblock User From Car Booking

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCarBlockingApi();
final int userId = 56; // int | 

try {
    final response = api.carBlockingUnblockUserFromCarBooking(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CarBlockingApi->carBlockingUnblockUserFromCarBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**CarBlockRead**](CarBlockRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

