# api_client.api.EventsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**eventsAddTagToEvent**](EventsApi.md#eventsaddtagtoevent) | **POST** /events/add-tag | Add Tag To Event
[**eventsCreateEvent**](EventsApi.md#eventscreateevent) | **POST** /events/ | Create Event
[**eventsEventRemove**](EventsApi.md#eventseventremove) | **DELETE** /events/{event_id} | Event Remove
[**eventsEventUpdate**](EventsApi.md#eventseventupdate) | **PATCH** /events/{event_id} | Event Update
[**eventsGetAllEventSignups**](EventsApi.md#eventsgetalleventsignups) | **GET** /events/event-signups/all/{event_id} | Get All Event Signups
[**eventsGetAllEvents**](EventsApi.md#eventsgetallevents) | **GET** /events/ | Get All Events
[**eventsGetEventCsv**](EventsApi.md#eventsgeteventcsv) | **GET** /events/get-event-csv/{event_id} | Get Event Csv
[**eventsGetEventTags**](EventsApi.md#eventsgeteventtags) | **GET** /events/get-event-tags/{event_id} | Get Event Tags
[**eventsGetRandomEventSignup**](EventsApi.md#eventsgetrandomeventsignup) | **GET** /events/event-signups/random/{event_id} | Get Random Event Signup
[**eventsGetSingleEvent**](EventsApi.md#eventsgetsingleevent) | **GET** /events/{eventId} | Get Single Event


# **eventsAddTagToEvent**
> AddEventTag eventsAddTagToEvent(addEventTag)

Add Tag To Event

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventsApi();
final AddEventTag addEventTag = ; // AddEventTag | 

try {
    final response = api.eventsAddTagToEvent(addEventTag);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsAddTagToEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addEventTag** | [**AddEventTag**](AddEventTag.md)|  | 

### Return type

[**AddEventTag**](AddEventTag.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsCreateEvent**
> EventRead eventsCreateEvent(eventCreate)

Create Event

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventsApi();
final EventCreate eventCreate = ; // EventCreate | 

try {
    final response = api.eventsCreateEvent(eventCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsCreateEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventCreate** | [**EventCreate**](EventCreate.md)|  | 

### Return type

[**EventRead**](EventRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsEventRemove**
> EventRead eventsEventRemove(eventId)

Event Remove

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventsApi();
final int eventId = 56; // int | 

try {
    final response = api.eventsEventRemove(eventId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsEventRemove: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 

### Return type

[**EventRead**](EventRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsEventUpdate**
> EventRead eventsEventUpdate(eventId, eventUpdate)

Event Update

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventsApi();
final int eventId = 56; // int | 
final EventUpdate eventUpdate = ; // EventUpdate | 

try {
    final response = api.eventsEventUpdate(eventId, eventUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsEventUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 
 **eventUpdate** | [**EventUpdate**](EventUpdate.md)|  | 

### Return type

[**EventRead**](EventRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsGetAllEventSignups**
> BuiltList<UserRead> eventsGetAllEventSignups(eventId)

Get All Event Signups

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventsApi();
final int eventId = 56; // int | 

try {
    final response = api.eventsGetAllEventSignups(eventId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsGetAllEventSignups: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 

### Return type

[**BuiltList&lt;UserRead&gt;**](UserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsGetAllEvents**
> BuiltList<EventRead> eventsGetAllEvents()

Get All Events

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getEventsApi();

try {
    final response = api.eventsGetAllEvents();
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsGetAllEvents: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;EventRead&gt;**](EventRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsGetEventCsv**
> JsonObject eventsGetEventCsv(eventId)

Get Event Csv

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventsApi();
final int eventId = 56; // int | 

try {
    final response = api.eventsGetEventCsv(eventId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsGetEventCsv: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsGetEventTags**
> BuiltList<EventTagRead> eventsGetEventTags(eventId)

Get Event Tags

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getEventsApi();
final int eventId = 56; // int | 

try {
    final response = api.eventsGetEventTags(eventId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsGetEventTags: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 

### Return type

[**BuiltList&lt;EventTagRead&gt;**](EventTagRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsGetRandomEventSignup**
> BuiltList<UserRead> eventsGetRandomEventSignup(eventId)

Get Random Event Signup

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getEventsApi();
final int eventId = 56; // int | 

try {
    final response = api.eventsGetRandomEventSignup(eventId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsGetRandomEventSignup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 

### Return type

[**BuiltList&lt;UserRead&gt;**](UserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsGetSingleEvent**
> EventRead eventsGetSingleEvent(eventId)

Get Single Event

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getEventsApi();
final int eventId = 56; // int | 

try {
    final response = api.eventsGetSingleEvent(eventId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsGetSingleEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 

### Return type

[**EventRead**](EventRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

