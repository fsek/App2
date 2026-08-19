# api_client.api.PreregMembersApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**preregMembersCreateMultiplePreregMembers**](PreregMembersApi.md#preregmemberscreatemultiplepreregmembers) | **POST** /prereg-members/multiple | Create Multiple Prereg Members
[**preregMembersCreatePreregMember**](PreregMembersApi.md#preregmemberscreatepreregmember) | **POST** /prereg-members/ | Create Prereg Member
[**preregMembersDeleteMultiplePreregMembers**](PreregMembersApi.md#preregmembersdeletemultiplepreregmembers) | **DELETE** /prereg-members/multiple | Delete Multiple Prereg Members
[**preregMembersDeletePreregMember**](PreregMembersApi.md#preregmembersdeletepreregmember) | **DELETE** /prereg-members/{prereg_member_id} | Delete Prereg Member
[**preregMembersGetAllPreregMemberInfo**](PreregMembersApi.md#preregmembersgetallpreregmemberinfo) | **GET** /prereg-members/ | Get All Prereg Member Info
[**preregMembersGetPreregMemberInfo**](PreregMembersApi.md#preregmembersgetpreregmemberinfo) | **GET** /prereg-members/{prereg_member_id} | Get Prereg Member Info
[**preregMembersUpdatePreregMember**](PreregMembersApi.md#preregmembersupdatepreregmember) | **PATCH** /prereg-members/{prereg_member_id} | Update Prereg Member


# **preregMembersCreateMultiplePreregMembers**
> BuiltList<PreregMemberRead> preregMembersCreateMultiplePreregMembers(preregMemberCreate)

Create Multiple Prereg Members

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getPreregMembersApi();
final BuiltList<PreregMemberCreate> preregMemberCreate = ; // BuiltList<PreregMemberCreate> | 

try {
    final response = api.preregMembersCreateMultiplePreregMembers(preregMemberCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PreregMembersApi->preregMembersCreateMultiplePreregMembers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **preregMemberCreate** | [**BuiltList&lt;PreregMemberCreate&gt;**](PreregMemberCreate.md)|  | 

### Return type

[**BuiltList&lt;PreregMemberRead&gt;**](PreregMemberRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **preregMembersCreatePreregMember**
> PreregMemberRead preregMembersCreatePreregMember(preregMemberCreate)

Create Prereg Member

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getPreregMembersApi();
final PreregMemberCreate preregMemberCreate = ; // PreregMemberCreate | 

try {
    final response = api.preregMembersCreatePreregMember(preregMemberCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PreregMembersApi->preregMembersCreatePreregMember: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **preregMemberCreate** | [**PreregMemberCreate**](PreregMemberCreate.md)|  | 

### Return type

[**PreregMemberRead**](PreregMemberRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **preregMembersDeleteMultiplePreregMembers**
> BuiltList<PreregMemberRead> preregMembersDeleteMultiplePreregMembers(requestBody)

Delete Multiple Prereg Members

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getPreregMembersApi();
final BuiltList<int> requestBody = ; // BuiltList<int> | 

try {
    final response = api.preregMembersDeleteMultiplePreregMembers(requestBody);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PreregMembersApi->preregMembersDeleteMultiplePreregMembers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestBody** | [**BuiltList&lt;int&gt;**](int.md)|  | 

### Return type

[**BuiltList&lt;PreregMemberRead&gt;**](PreregMemberRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **preregMembersDeletePreregMember**
> PreregMemberRead preregMembersDeletePreregMember(preregMemberId)

Delete Prereg Member

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getPreregMembersApi();
final int preregMemberId = 56; // int | 

try {
    final response = api.preregMembersDeletePreregMember(preregMemberId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PreregMembersApi->preregMembersDeletePreregMember: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **preregMemberId** | **int**|  | 

### Return type

[**PreregMemberRead**](PreregMemberRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **preregMembersGetAllPreregMemberInfo**
> BuiltList<PreregMemberRead> preregMembersGetAllPreregMemberInfo()

Get All Prereg Member Info

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getPreregMembersApi();

try {
    final response = api.preregMembersGetAllPreregMemberInfo();
    print(response);
} on DioException catch (e) {
    print('Exception when calling PreregMembersApi->preregMembersGetAllPreregMemberInfo: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;PreregMemberRead&gt;**](PreregMemberRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **preregMembersGetPreregMemberInfo**
> PreregMemberRead preregMembersGetPreregMemberInfo(preregMemberId)

Get Prereg Member Info

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getPreregMembersApi();
final int preregMemberId = 56; // int | 

try {
    final response = api.preregMembersGetPreregMemberInfo(preregMemberId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PreregMembersApi->preregMembersGetPreregMemberInfo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **preregMemberId** | **int**|  | 

### Return type

[**PreregMemberRead**](PreregMemberRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **preregMembersUpdatePreregMember**
> PreregMemberRead preregMembersUpdatePreregMember(preregMemberId, preregMemberUpdate)

Update Prereg Member

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getPreregMembersApi();
final int preregMemberId = 56; // int | 
final PreregMemberUpdate preregMemberUpdate = ; // PreregMemberUpdate | 

try {
    final response = api.preregMembersUpdatePreregMember(preregMemberId, preregMemberUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PreregMembersApi->preregMembersUpdatePreregMember: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **preregMemberId** | **int**|  | 
 **preregMemberUpdate** | [**PreregMemberUpdate**](PreregMemberUpdate.md)|  | 

### Return type

[**PreregMemberRead**](PreregMemberRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

