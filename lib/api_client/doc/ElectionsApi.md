# api_client.api.ElectionsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**electionsCreateElection**](ElectionsApi.md#electionscreateelection) | **POST** /election/ | Create Election
[**electionsDeleteElection**](ElectionsApi.md#electionsdeleteelection) | **DELETE** /election/{election_id} | Delete Election
[**electionsGetAllElections**](ElectionsApi.md#electionsgetallelections) | **GET** /election/ | Get All Elections
[**electionsGetAllElectionsMember**](ElectionsApi.md#electionsgetallelectionsmember) | **GET** /election/member/ | Get All Elections Member
[**electionsGetElection**](ElectionsApi.md#electionsgetelection) | **GET** /election/{election_id} | Get Election
[**electionsGetElectionMember**](ElectionsApi.md#electionsgetelectionmember) | **GET** /election/member/{election_id} | Get Election Member
[**electionsGetVisibleElection**](ElectionsApi.md#electionsgetvisibleelection) | **GET** /election/visible | Get Visible Election
[**electionsPopulateElection**](ElectionsApi.md#electionspopulateelection) | **POST** /election/{election_id}/populate | Populate Election
[**electionsUpdateElection**](ElectionsApi.md#electionsupdateelection) | **PATCH** /election/{election_id} | Update Election


# **electionsCreateElection**
> ElectionRead electionsCreateElection(electionCreate)

Create Election

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getElectionsApi();
final ElectionCreate electionCreate = ; // ElectionCreate | 

try {
    final response = api.electionsCreateElection(electionCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ElectionsApi->electionsCreateElection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionCreate** | [**ElectionCreate**](ElectionCreate.md)|  | 

### Return type

[**ElectionRead**](ElectionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **electionsDeleteElection**
> ElectionRead electionsDeleteElection(electionId)

Delete Election

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getElectionsApi();
final int electionId = 56; // int | 

try {
    final response = api.electionsDeleteElection(electionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ElectionsApi->electionsDeleteElection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionId** | **int**|  | 

### Return type

[**ElectionRead**](ElectionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **electionsGetAllElections**
> BuiltList<ElectionRead> electionsGetAllElections()

Get All Elections

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getElectionsApi();

try {
    final response = api.electionsGetAllElections();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ElectionsApi->electionsGetAllElections: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ElectionRead&gt;**](ElectionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **electionsGetAllElectionsMember**
> BuiltList<ElectionMemberRead> electionsGetAllElectionsMember()

Get All Elections Member

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getElectionsApi();

try {
    final response = api.electionsGetAllElectionsMember();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ElectionsApi->electionsGetAllElectionsMember: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ElectionMemberRead&gt;**](ElectionMemberRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **electionsGetElection**
> ElectionRead electionsGetElection(electionId)

Get Election

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getElectionsApi();
final int electionId = 56; // int | 

try {
    final response = api.electionsGetElection(electionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ElectionsApi->electionsGetElection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionId** | **int**|  | 

### Return type

[**ElectionRead**](ElectionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **electionsGetElectionMember**
> ElectionMemberRead electionsGetElectionMember(electionId)

Get Election Member

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getElectionsApi();
final int electionId = 56; // int | 

try {
    final response = api.electionsGetElectionMember(electionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ElectionsApi->electionsGetElectionMember: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionId** | **int**|  | 

### Return type

[**ElectionMemberRead**](ElectionMemberRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **electionsGetVisibleElection**
> ElectionMemberRead electionsGetVisibleElection()

Get Visible Election

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getElectionsApi();

try {
    final response = api.electionsGetVisibleElection();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ElectionsApi->electionsGetVisibleElection: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ElectionMemberRead**](ElectionMemberRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **electionsPopulateElection**
> ElectionRead electionsPopulateElection(electionId, electionPopulate)

Populate Election

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getElectionsApi();
final int electionId = 56; // int | 
final ElectionPopulate electionPopulate = ; // ElectionPopulate | 

try {
    final response = api.electionsPopulateElection(electionId, electionPopulate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ElectionsApi->electionsPopulateElection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionId** | **int**|  | 
 **electionPopulate** | [**ElectionPopulate**](ElectionPopulate.md)|  | 

### Return type

[**ElectionRead**](ElectionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **electionsUpdateElection**
> ElectionRead electionsUpdateElection(electionId, electionUpdate)

Update Election

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getElectionsApi();
final int electionId = 56; // int | 
final ElectionUpdate electionUpdate = ; // ElectionUpdate | 

try {
    final response = api.electionsUpdateElection(electionId, electionUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ElectionsApi->electionsUpdateElection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionId** | **int**|  | 
 **electionUpdate** | [**ElectionUpdate**](ElectionUpdate.md)|  | 

### Return type

[**ElectionRead**](ElectionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

