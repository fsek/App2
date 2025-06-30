# api_client.api.EventSignupApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**eventSignupEventSignoffRoute**](EventSignupApi.md#eventsignupeventsignoffroute) | **DELETE** /event-signup/{event_id} | Event Signoff Route
[**eventSignupEventSignupRoute**](EventSignupApi.md#eventsignupeventsignuproute) | **POST** /event-signup/{event_id} | Event Signup Route
[**eventSignupGetMeEventSignup**](EventSignupApi.md#eventsignupgetmeeventsignup) | **GET** /event-signup/me-signup/{event_id} | Get Me Event Signup
[**eventSignupUpdateEventSignupRoute**](EventSignupApi.md#eventsignupupdateeventsignuproute) | **PATCH** /event-signup/{event_id} | Update Event Signup Route


# **eventSignupEventSignoffRoute**
> EventSignupRead eventSignupEventSignoffRoute(eventId, userId)

Event Signoff Route

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventSignupApi();
final int eventId = 56; // int | 
final int userId = 56; // int | 

try {
    final response = api.eventSignupEventSignoffRoute(eventId, userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventSignupApi->eventSignupEventSignoffRoute: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 
 **userId** | **int**|  | 

### Return type

[**EventSignupRead**](EventSignupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventSignupEventSignupRoute**
> EventSignupRead eventSignupEventSignupRoute(eventId, eventSignupCreate)

Event Signup Route

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventSignupApi();
final int eventId = 56; // int | 
final EventSignupCreate eventSignupCreate = ; // EventSignupCreate | 

try {
    final response = api.eventSignupEventSignupRoute(eventId, eventSignupCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventSignupApi->eventSignupEventSignupRoute: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 
 **eventSignupCreate** | [**EventSignupCreate**](EventSignupCreate.md)|  | 

### Return type

[**EventSignupRead**](EventSignupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventSignupGetMeEventSignup**
> EventSignupRead eventSignupGetMeEventSignup(eventId)

Get Me Event Signup

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventSignupApi();
final int eventId = 56; // int | 

try {
    final response = api.eventSignupGetMeEventSignup(eventId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventSignupApi->eventSignupGetMeEventSignup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 

### Return type

[**EventSignupRead**](EventSignupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventSignupUpdateEventSignupRoute**
> EventSignupRead eventSignupUpdateEventSignupRoute(eventId, eventSignupUpdate)

Update Event Signup Route

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventSignupApi();
final int eventId = 56; // int | 
final EventSignupUpdate eventSignupUpdate = ; // EventSignupUpdate | 

try {
    final response = api.eventSignupUpdateEventSignupRoute(eventId, eventSignupUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventSignupApi->eventSignupUpdateEventSignupRoute: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 
 **eventSignupUpdate** | [**EventSignupUpdate**](EventSignupUpdate.md)|  | 

### Return type

[**EventSignupRead**](EventSignupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

