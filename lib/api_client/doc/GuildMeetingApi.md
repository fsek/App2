# api_client.api.GuildMeetingApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**guildMeetingGetGuildMeeting**](GuildMeetingApi.md#guildmeetinggetguildmeeting) | **GET** /guild-meeting/ | Get Guild Meeting
[**guildMeetingUpdateGuildMeeting**](GuildMeetingApi.md#guildmeetingupdateguildmeeting) | **PATCH** /guild-meeting/ | Update Guild Meeting


# **guildMeetingGetGuildMeeting**
> GuildMeetingRead guildMeetingGetGuildMeeting()

Get Guild Meeting

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getGuildMeetingApi();

try {
    final response = api.guildMeetingGetGuildMeeting();
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildMeetingApi->guildMeetingGetGuildMeeting: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GuildMeetingRead**](GuildMeetingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **guildMeetingUpdateGuildMeeting**
> GuildMeetingRead guildMeetingUpdateGuildMeeting(guildMeetingUpdate)

Update Guild Meeting

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getGuildMeetingApi();
final GuildMeetingUpdate guildMeetingUpdate = ; // GuildMeetingUpdate | 

try {
    final response = api.guildMeetingUpdateGuildMeeting(guildMeetingUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildMeetingApi->guildMeetingUpdateGuildMeeting: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildMeetingUpdate** | [**GuildMeetingUpdate**](GuildMeetingUpdate.md)|  | 

### Return type

[**GuildMeetingRead**](GuildMeetingRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

