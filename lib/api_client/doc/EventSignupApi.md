# api_client.api.EventSignupApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**eventSignupEventSignoffRoute**](EventSignupApi.md#eventsignupeventsignoffroute) | **DELETE** /event-signup/{event_id} | Event Signoff Route
[**eventSignupEventSignupRoute**](EventSignupApi.md#eventsignupeventsignuproute) | **POST** /event-signup/{event_id} | Event Signup Route
[**eventSignupUpdateEventSignupRoute**](EventSignupApi.md#eventsignupupdateeventsignuproute) | **PATCH** /event-signup/{event_id} | Update Event Signup Route


# **eventSignupEventSignoffRoute**
> EventRead eventSignupEventSignoffRoute(eventId, eventSignupDelete)

Event Signoff Route

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventSignupApi();
final int eventId = 56; // int | 
final EventSignupDelete eventSignupDelete = ; // EventSignupDelete | 

try {
    final response = api.eventSignupEventSignoffRoute(eventId, eventSignupDelete);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventSignupApi->eventSignupEventSignoffRoute: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 
 **eventSignupDelete** | [**EventSignupDelete**](EventSignupDelete.md)|  | 

### Return type

[**EventRead**](EventRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventSignupEventSignupRoute**
> EventRead eventSignupEventSignupRoute(eventId, eventSignupCreate)

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

[**EventRead**](EventRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventSignupUpdateEventSignupRoute**
> EventRead eventSignupUpdateEventSignupRoute(eventId, eventSignupUpdate)

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

[**EventRead**](EventRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

