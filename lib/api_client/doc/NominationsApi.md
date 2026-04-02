# api_client.api.NominationsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**nominationsCreateNomination**](NominationsApi.md#nominationscreatenomination) | **POST** /nominations/{sub_election_id} | Create Nomination
[**nominationsDeleteNomination**](NominationsApi.md#nominationsdeletenomination) | **DELETE** /nominations/{nomination_id} | Delete Nomination
[**nominationsGetAllElectionNominations**](NominationsApi.md#nominationsgetallelectionnominations) | **GET** /nominations/election/{election_id} | Get All Election Nominations
[**nominationsGetAllSubElectionNominations**](NominationsApi.md#nominationsgetallsubelectionnominations) | **GET** /nominations/sub-election/{sub_election_id} | Get All Sub Election Nominations


# **nominationsCreateNomination**
> JsonObject nominationsCreateNomination(subElectionId, nominationCreate)

Create Nomination

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNominationsApi();
final int subElectionId = 56; // int | 
final NominationCreate nominationCreate = ; // NominationCreate | 

try {
    final response = api.nominationsCreateNomination(subElectionId, nominationCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NominationsApi->nominationsCreateNomination: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subElectionId** | **int**|  | 
 **nominationCreate** | [**NominationCreate**](NominationCreate.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nominationsDeleteNomination**
> nominationsDeleteNomination(nominationId)

Delete Nomination

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNominationsApi();
final int nominationId = 56; // int | 

try {
    api.nominationsDeleteNomination(nominationId);
} on DioException catch (e) {
    print('Exception when calling NominationsApi->nominationsDeleteNomination: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nominationId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nominationsGetAllElectionNominations**
> BuiltList<NominationRead> nominationsGetAllElectionNominations(electionId)

Get All Election Nominations

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNominationsApi();
final int electionId = 56; // int | 

try {
    final response = api.nominationsGetAllElectionNominations(electionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NominationsApi->nominationsGetAllElectionNominations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionId** | **int**|  | 

### Return type

[**BuiltList&lt;NominationRead&gt;**](NominationRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nominationsGetAllSubElectionNominations**
> BuiltList<NominationRead> nominationsGetAllSubElectionNominations(subElectionId)

Get All Sub Election Nominations

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNominationsApi();
final int subElectionId = 56; // int | 

try {
    final response = api.nominationsGetAllSubElectionNominations(subElectionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NominationsApi->nominationsGetAllSubElectionNominations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subElectionId** | **int**|  | 

### Return type

[**BuiltList&lt;NominationRead&gt;**](NominationRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

