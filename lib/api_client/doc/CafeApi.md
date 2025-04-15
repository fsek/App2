# api_client.api.CafeApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cafeCreateShift**](CafeApi.md#cafecreateshift) | **POST** /cafe-shifts/ | Create Shift
[**cafeDeleteShift**](CafeApi.md#cafedeleteshift) | **DELETE** /cafe-shifts/{shift_id} | Delete Shift
[**cafeSignoffFromShift**](CafeApi.md#cafesignofffromshift) | **PATCH** /cafe-shifts/sign-off/{shift_id} | Signoff From Shift
[**cafeSignupToShift**](CafeApi.md#cafesignuptoshift) | **PATCH** /cafe-shifts/sign-up/{shift_id} | Signup To Shift
[**cafeUpdateShift**](CafeApi.md#cafeupdateshift) | **PATCH** /cafe-shifts/update/{shift_id} | Update Shift
[**cafeViewAllShifts**](CafeApi.md#cafeviewallshifts) | **GET** /cafe-shifts/view-shifts | View All Shifts
[**cafeViewShift**](CafeApi.md#cafeviewshift) | **GET** /cafe-shifts/{shift_id} | View Shift
[**cafeViewShiftsBetweenDates**](CafeApi.md#cafeviewshiftsbetweendates) | **GET** /cafe-shifts/view-between-dates | View Shifts Between Dates


# **cafeCreateShift**
> CafeShiftCreate cafeCreateShift(cafeShiftCreate)

Create Shift

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCafeApi();
final CafeShiftCreate cafeShiftCreate = ; // CafeShiftCreate | 

try {
    final response = api.cafeCreateShift(cafeShiftCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CafeApi->cafeCreateShift: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cafeShiftCreate** | [**CafeShiftCreate**](CafeShiftCreate.md)|  | 

### Return type

[**CafeShiftCreate**](CafeShiftCreate.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cafeDeleteShift**
> cafeDeleteShift(shiftId)

Delete Shift

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCafeApi();
final int shiftId = 56; // int | 

try {
    api.cafeDeleteShift(shiftId);
} catch on DioException (e) {
    print('Exception when calling CafeApi->cafeDeleteShift: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **shiftId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cafeSignoffFromShift**
> CafeShiftRead cafeSignoffFromShift(shiftId)

Signoff From Shift

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCafeApi();
final int shiftId = 56; // int | 

try {
    final response = api.cafeSignoffFromShift(shiftId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CafeApi->cafeSignoffFromShift: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **shiftId** | **int**|  | 

### Return type

[**CafeShiftRead**](CafeShiftRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cafeSignupToShift**
> CafeShiftRead cafeSignupToShift(shiftId)

Signup To Shift

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCafeApi();
final int shiftId = 56; // int | 

try {
    final response = api.cafeSignupToShift(shiftId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CafeApi->cafeSignupToShift: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **shiftId** | **int**|  | 

### Return type

[**CafeShiftRead**](CafeShiftRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cafeUpdateShift**
> CafeShiftRead cafeUpdateShift(shiftId, cafeShiftUpdate)

Update Shift

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCafeApi();
final int shiftId = 56; // int | 
final CafeShiftUpdate cafeShiftUpdate = ; // CafeShiftUpdate | 

try {
    final response = api.cafeUpdateShift(shiftId, cafeShiftUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CafeApi->cafeUpdateShift: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **shiftId** | **int**|  | 
 **cafeShiftUpdate** | [**CafeShiftUpdate**](CafeShiftUpdate.md)|  | 

### Return type

[**CafeShiftRead**](CafeShiftRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cafeViewAllShifts**
> BuiltList<CafeShiftRead> cafeViewAllShifts()

View All Shifts

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCafeApi();

try {
    final response = api.cafeViewAllShifts();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CafeApi->cafeViewAllShifts: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CafeShiftRead&gt;**](CafeShiftRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cafeViewShift**
> CafeShiftRead cafeViewShift(shiftId)

View Shift

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCafeApi();
final int shiftId = 56; // int | 

try {
    final response = api.cafeViewShift(shiftId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CafeApi->cafeViewShift: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **shiftId** | **int**|  | 

### Return type

[**CafeShiftRead**](CafeShiftRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cafeViewShiftsBetweenDates**
> BuiltList<CafeShiftRead> cafeViewShiftsBetweenDates(startDate, endDate)

View Shifts Between Dates

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCafeApi();
final DateTime startDate = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime endDate = 2013-10-20T19:20:30+01:00; // DateTime | 

try {
    final response = api.cafeViewShiftsBetweenDates(startDate, endDate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CafeApi->cafeViewShiftsBetweenDates: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **startDate** | **DateTime**|  | 
 **endDate** | **DateTime**|  | 

### Return type

[**BuiltList&lt;CafeShiftRead&gt;**](CafeShiftRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

