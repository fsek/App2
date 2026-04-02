# api_client.api.SubElectionsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**subElectionsCreateSubElection**](SubElectionsApi.md#subelectionscreatesubelection) | **POST** /sub-election/ | Create Sub Election
[**subElectionsDeleteSubElection**](SubElectionsApi.md#subelectionsdeletesubelection) | **DELETE** /sub-election/{sub_election_id} | Delete Sub Election
[**subElectionsGetSubElection**](SubElectionsApi.md#subelectionsgetsubelection) | **GET** /sub-election/{sub_election_id} | Get Sub Election
[**subElectionsMoveElectionPost**](SubElectionsApi.md#subelectionsmoveelectionpost) | **PATCH** /sub-election/{sub_election_id}/move-election-post | Move Election Post
[**subElectionsUpdateSubElection**](SubElectionsApi.md#subelectionsupdatesubelection) | **PATCH** /sub-election/{sub_election_id} | Update Sub Election


# **subElectionsCreateSubElection**
> SubElectionRead subElectionsCreateSubElection(subElectionCreate)

Create Sub Election

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getSubElectionsApi();
final SubElectionCreate subElectionCreate = ; // SubElectionCreate | 

try {
    final response = api.subElectionsCreateSubElection(subElectionCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SubElectionsApi->subElectionsCreateSubElection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subElectionCreate** | [**SubElectionCreate**](SubElectionCreate.md)|  | 

### Return type

[**SubElectionRead**](SubElectionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subElectionsDeleteSubElection**
> SubElectionRead subElectionsDeleteSubElection(subElectionId)

Delete Sub Election

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getSubElectionsApi();
final int subElectionId = 56; // int | 

try {
    final response = api.subElectionsDeleteSubElection(subElectionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SubElectionsApi->subElectionsDeleteSubElection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subElectionId** | **int**|  | 

### Return type

[**SubElectionRead**](SubElectionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subElectionsGetSubElection**
> SubElectionRead subElectionsGetSubElection(subElectionId)

Get Sub Election

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getSubElectionsApi();
final int subElectionId = 56; // int | 

try {
    final response = api.subElectionsGetSubElection(subElectionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SubElectionsApi->subElectionsGetSubElection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subElectionId** | **int**|  | 

### Return type

[**SubElectionRead**](SubElectionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subElectionsMoveElectionPost**
> SubElectionRead subElectionsMoveElectionPost(subElectionId, movePostRequest)

Move Election Post

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getSubElectionsApi();
final int subElectionId = 56; // int | 
final MovePostRequest movePostRequest = ; // MovePostRequest | 

try {
    final response = api.subElectionsMoveElectionPost(subElectionId, movePostRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SubElectionsApi->subElectionsMoveElectionPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subElectionId** | **int**|  | 
 **movePostRequest** | [**MovePostRequest**](MovePostRequest.md)|  | 

### Return type

[**SubElectionRead**](SubElectionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subElectionsUpdateSubElection**
> SubElectionRead subElectionsUpdateSubElection(subElectionId, subElectionUpdate)

Update Sub Election

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getSubElectionsApi();
final int subElectionId = 56; // int | 
final SubElectionUpdate subElectionUpdate = ; // SubElectionUpdate | 

try {
    final response = api.subElectionsUpdateSubElection(subElectionId, subElectionUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SubElectionsApi->subElectionsUpdateSubElection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subElectionId** | **int**|  | 
 **subElectionUpdate** | [**SubElectionUpdate**](SubElectionUpdate.md)|  | 

### Return type

[**SubElectionRead**](SubElectionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

