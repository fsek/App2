# api_client.api.GroupsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**groupsAddUserToGroup**](GroupsApi.md#groupsaddusertogroup) | **POST** /groups/add_user/{id} | Add User To Group
[**groupsGetGroups**](GroupsApi.md#groupsgetgroups) | **GET** /groups/ | Get Groups
[**groupsGetSingleGroup**](GroupsApi.md#groupsgetsinglegroup) | **GET** /groups/{id} | Get Single Group
[**groupsPatchGroup**](GroupsApi.md#groupspatchgroup) | **PATCH** /groups/{id} | Patch Group
[**groupsRemoveGroup**](GroupsApi.md#groupsremovegroup) | **DELETE** /groups/delete/{id} | Remove Group
[**groupsRemoveUserFromGroup**](GroupsApi.md#groupsremoveuserfromgroup) | **DELETE** /groups/remove_user_from_group/{id} | Remove User From Group
[**groupsUploadGroup**](GroupsApi.md#groupsuploadgroup) | **POST** /groups/ | Upload Group


# **groupsAddUserToGroup**
> GroupRead groupsAddUserToGroup(id, groupAddUser)

Add User To Group

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getGroupsApi();
final int id = 56; // int | 
final GroupAddUser groupAddUser = ; // GroupAddUser | 

try {
    final response = api.groupsAddUserToGroup(id, groupAddUser);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GroupsApi->groupsAddUserToGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **groupAddUser** | [**GroupAddUser**](GroupAddUser.md)|  | 

### Return type

[**GroupRead**](GroupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **groupsGetGroups**
> BuiltList<GroupRead> groupsGetGroups(groupType)

Get Groups

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getGroupsApi();
final String groupType = groupType_example; // String | 

try {
    final response = api.groupsGetGroups(groupType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GroupsApi->groupsGetGroups: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **groupType** | **String**|  | [optional] 

### Return type

[**BuiltList&lt;GroupRead&gt;**](GroupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **groupsGetSingleGroup**
> GroupRead groupsGetSingleGroup(id)

Get Single Group

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getGroupsApi();
final int id = 56; // int | 

try {
    final response = api.groupsGetSingleGroup(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GroupsApi->groupsGetSingleGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**GroupRead**](GroupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **groupsPatchGroup**
> GroupRead groupsPatchGroup(id, groupCreate)

Patch Group

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getGroupsApi();
final int id = 56; // int | 
final GroupCreate groupCreate = ; // GroupCreate | 

try {
    final response = api.groupsPatchGroup(id, groupCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GroupsApi->groupsPatchGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **groupCreate** | [**GroupCreate**](GroupCreate.md)|  | 

### Return type

[**GroupRead**](GroupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **groupsRemoveGroup**
> GroupRead groupsRemoveGroup(id)

Remove Group

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getGroupsApi();
final int id = 56; // int | 

try {
    final response = api.groupsRemoveGroup(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GroupsApi->groupsRemoveGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**GroupRead**](GroupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **groupsRemoveUserFromGroup**
> GroupRead groupsRemoveUserFromGroup(id, groupRemoveUser)

Remove User From Group

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getGroupsApi();
final int id = 56; // int | 
final GroupRemoveUser groupRemoveUser = ; // GroupRemoveUser | 

try {
    final response = api.groupsRemoveUserFromGroup(id, groupRemoveUser);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GroupsApi->groupsRemoveUserFromGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **groupRemoveUser** | [**GroupRemoveUser**](GroupRemoveUser.md)|  | 

### Return type

[**GroupRead**](GroupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **groupsUploadGroup**
> GroupRead groupsUploadGroup(groupCreate)

Upload Group

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getGroupsApi();
final GroupCreate groupCreate = ; // GroupCreate | 

try {
    final response = api.groupsUploadGroup(groupCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GroupsApi->groupsUploadGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **groupCreate** | [**GroupCreate**](GroupCreate.md)|  | 

### Return type

[**GroupRead**](GroupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

