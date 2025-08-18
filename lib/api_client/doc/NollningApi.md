# api_client.api.NollningApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**nollningAddGroupMission**](NollningApi.md#nollningaddgroupmission) | **POST** /nollning/groups/missions/{nollning_group_id} | Add Group Mission
[**nollningAddGroupToNollning**](NollningApi.md#nollningaddgrouptonollning) | **POST** /nollning/add_group/{nollning_id} | Add Group To Nollning
[**nollningCreateAdventureMission**](NollningApi.md#nollningcreateadventuremission) | **POST** /nollning/missions/{nollning_id} | Create Adventure Mission
[**nollningDeleteAdventureMission**](NollningApi.md#nollningdeleteadventuremission) | **DELETE** /nollning/missions/{mission_id} | Delete Adventure Mission
[**nollningDeleteGroupMission**](NollningApi.md#nollningdeletegroupmission) | **DELETE** /nollning/groups/missions/{nollning_group_id} | Delete Group Mission
[**nollningDeleteNollning**](NollningApi.md#nollningdeletenollning) | **DELETE** /nollning/{nollning_id} | Delete Nollning
[**nollningEditAdventureMission**](NollningApi.md#nollningeditadventuremission) | **PATCH** /nollning/missions/{mission_id} | Edit Adventure Mission
[**nollningEditGroupMission**](NollningApi.md#nollningeditgroupmission) | **PATCH** /nollning/groups/missions/{nollning_group_id} | Edit Group Mission
[**nollningGetAdventureMission**](NollningApi.md#nollninggetadventuremission) | **GET** /nollning/missions/{mission_id} | Get Adventure Mission
[**nollningGetAllAdventureMissionsInNollning**](NollningApi.md#nollninggetalladventuremissionsinnollning) | **GET** /nollning/missions/{nollning_id} | Get All Adventure Missions In Nollning
[**nollningGetAllNollning**](NollningApi.md#nollninggetallnollning) | **GET** /nollning/ | Get All Nollning
[**nollningGetAllNollningGroups**](NollningApi.md#nollninggetallnollninggroups) | **GET** /nollning/groups/{nollning_id} | Get All Nollning Groups
[**nollningGetGroupMissionsFromNollningGroup**](NollningApi.md#nollninggetgroupmissionsfromnollninggroup) | **GET** /nollning/groups/missions/{nollning_group_id} | Get Group Missions From Nollning Group
[**nollningGetNollning**](NollningApi.md#nollninggetnollning) | **GET** /nollning/{nollning_id} | Get Nollning
[**nollningGetNollningByYear**](NollningApi.md#nollninggetnollningbyyear) | **GET** /nollning/year/{year} | Get Nollning By Year
[**nollningPatchNollning**](NollningApi.md#nollningpatchnollning) | **PATCH** /nollning/{nollning_id} | Patch Nollning
[**nollningPostNollning**](NollningApi.md#nollningpostnollning) | **POST** /nollning/ | Post Nollning
[**nollningRemoveGroupFromNollning**](NollningApi.md#nollningremovegroupfromnollning) | **DELETE** /nollning/remove_group/{nollning_group_id} | Remove Group From Nollning


# **nollningAddGroupMission**
> GroupMissionRead nollningAddGroupMission(nollningGroupId, groupMissionCreate)

Add Group Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int nollningGroupId = 56; // int | 
final GroupMissionCreate groupMissionCreate = ; // GroupMissionCreate | 

try {
    final response = api.nollningAddGroupMission(nollningGroupId, groupMissionCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningAddGroupMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningGroupId** | **int**|  | 
 **groupMissionCreate** | [**GroupMissionCreate**](GroupMissionCreate.md)|  | 

### Return type

[**GroupMissionRead**](GroupMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningAddGroupToNollning**
> NollningRead nollningAddGroupToNollning(nollningId, nollningAddGroup)

Add Group To Nollning

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int nollningId = 56; // int | 
final NollningAddGroup nollningAddGroup = ; // NollningAddGroup | 

try {
    final response = api.nollningAddGroupToNollning(nollningId, nollningAddGroup);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningAddGroupToNollning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningId** | **int**|  | 
 **nollningAddGroup** | [**NollningAddGroup**](NollningAddGroup.md)|  | 

### Return type

[**NollningRead**](NollningRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningCreateAdventureMission**
> AdventureMissionRead nollningCreateAdventureMission(nollningId, adventureMissionCreate)

Create Adventure Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int nollningId = 56; // int | 
final AdventureMissionCreate adventureMissionCreate = ; // AdventureMissionCreate | 

try {
    final response = api.nollningCreateAdventureMission(nollningId, adventureMissionCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningCreateAdventureMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningId** | **int**|  | 
 **adventureMissionCreate** | [**AdventureMissionCreate**](AdventureMissionCreate.md)|  | 

### Return type

[**AdventureMissionRead**](AdventureMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningDeleteAdventureMission**
> AdventureMissionRead nollningDeleteAdventureMission(missionId, nollningId)

Delete Adventure Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int missionId = 56; // int | 
final int nollningId = 56; // int | 

try {
    final response = api.nollningDeleteAdventureMission(missionId, nollningId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningDeleteAdventureMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **missionId** | **int**|  | 
 **nollningId** | **int**|  | 

### Return type

[**AdventureMissionRead**](AdventureMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningDeleteGroupMission**
> GroupMissionRead nollningDeleteGroupMission(nollningGroupId, groupMissionDelete)

Delete Group Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int nollningGroupId = 56; // int | 
final GroupMissionDelete groupMissionDelete = ; // GroupMissionDelete | 

try {
    final response = api.nollningDeleteGroupMission(nollningGroupId, groupMissionDelete);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningDeleteGroupMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningGroupId** | **int**|  | 
 **groupMissionDelete** | [**GroupMissionDelete**](GroupMissionDelete.md)|  | 

### Return type

[**GroupMissionRead**](GroupMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningDeleteNollning**
> BuiltMap<String, String> nollningDeleteNollning(nollningId)

Delete Nollning

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int nollningId = 56; // int | 

try {
    final response = api.nollningDeleteNollning(nollningId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningDeleteNollning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningId** | **int**|  | 

### Return type

**BuiltMap&lt;String, String&gt;**

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningEditAdventureMission**
> AdventureMissionRead nollningEditAdventureMission(missionId, adventureMissionCreate)

Edit Adventure Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int missionId = 56; // int | 
final AdventureMissionCreate adventureMissionCreate = ; // AdventureMissionCreate | 

try {
    final response = api.nollningEditAdventureMission(missionId, adventureMissionCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningEditAdventureMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **missionId** | **int**|  | 
 **adventureMissionCreate** | [**AdventureMissionCreate**](AdventureMissionCreate.md)|  | 

### Return type

[**AdventureMissionRead**](AdventureMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningEditGroupMission**
> GroupMissionRead nollningEditGroupMission(nollningGroupId, groupMissionEdit)

Edit Group Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int nollningGroupId = 56; // int | 
final GroupMissionEdit groupMissionEdit = ; // GroupMissionEdit | 

try {
    final response = api.nollningEditGroupMission(nollningGroupId, groupMissionEdit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningEditGroupMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningGroupId** | **int**|  | 
 **groupMissionEdit** | [**GroupMissionEdit**](GroupMissionEdit.md)|  | 

### Return type

[**GroupMissionRead**](GroupMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningGetAdventureMission**
> AdventureMissionRead nollningGetAdventureMission(missionId)

Get Adventure Mission

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getNollningApi();
final int missionId = 56; // int | 

try {
    final response = api.nollningGetAdventureMission(missionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningGetAdventureMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **missionId** | **int**|  | 

### Return type

[**AdventureMissionRead**](AdventureMissionRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningGetAllAdventureMissionsInNollning**
> BuiltList<AdventureMissionRead> nollningGetAllAdventureMissionsInNollning(nollningId)

Get All Adventure Missions In Nollning

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getNollningApi();
final int nollningId = 56; // int | 

try {
    final response = api.nollningGetAllAdventureMissionsInNollning(nollningId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningGetAllAdventureMissionsInNollning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningId** | **int**|  | 

### Return type

[**BuiltList&lt;AdventureMissionRead&gt;**](AdventureMissionRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningGetAllNollning**
> BuiltList<NollningRead> nollningGetAllNollning()

Get All Nollning

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();

try {
    final response = api.nollningGetAllNollning();
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningGetAllNollning: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;NollningRead&gt;**](NollningRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningGetAllNollningGroups**
> BuiltList<NollningGroupRead> nollningGetAllNollningGroups(nollningId)

Get All Nollning Groups

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int nollningId = 56; // int | 

try {
    final response = api.nollningGetAllNollningGroups(nollningId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningGetAllNollningGroups: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningId** | **int**|  | 

### Return type

[**BuiltList&lt;NollningGroupRead&gt;**](NollningGroupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningGetGroupMissionsFromNollningGroup**
> BuiltList<GroupMissionRead> nollningGetGroupMissionsFromNollningGroup(nollningGroupId)

Get Group Missions From Nollning Group

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int nollningGroupId = 56; // int | 

try {
    final response = api.nollningGetGroupMissionsFromNollningGroup(nollningGroupId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningGetGroupMissionsFromNollningGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningGroupId** | **int**|  | 

### Return type

[**BuiltList&lt;GroupMissionRead&gt;**](GroupMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningGetNollning**
> NollningRead nollningGetNollning(nollningId)

Get Nollning

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int nollningId = 56; // int | 

try {
    final response = api.nollningGetNollning(nollningId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningGetNollning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningId** | **int**|  | 

### Return type

[**NollningRead**](NollningRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningGetNollningByYear**
> NollningRead nollningGetNollningByYear(year)

Get Nollning By Year

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int year = 56; // int | 

try {
    final response = api.nollningGetNollningByYear(year);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningGetNollningByYear: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **year** | **int**|  | 

### Return type

[**NollningRead**](NollningRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningPatchNollning**
> NollningRead nollningPatchNollning(nollningId, nollningCreate)

Patch Nollning

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int nollningId = 56; // int | 
final NollningCreate nollningCreate = ; // NollningCreate | 

try {
    final response = api.nollningPatchNollning(nollningId, nollningCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningPatchNollning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningId** | **int**|  | 
 **nollningCreate** | [**NollningCreate**](NollningCreate.md)|  | 

### Return type

[**NollningRead**](NollningRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningPostNollning**
> NollningRead nollningPostNollning(nollningCreate)

Post Nollning

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final NollningCreate nollningCreate = ; // NollningCreate | 

try {
    final response = api.nollningPostNollning(nollningCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningPostNollning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningCreate** | [**NollningCreate**](NollningCreate.md)|  | 

### Return type

[**NollningRead**](NollningRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningRemoveGroupFromNollning**
> NollningGroupRead nollningRemoveGroupFromNollning(nollningGroupId)

Remove Group From Nollning

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNollningApi();
final int nollningGroupId = 56; // int | 

try {
    final response = api.nollningRemoveGroupFromNollning(nollningGroupId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningRemoveGroupFromNollning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningGroupId** | **int**|  | 

### Return type

[**NollningGroupRead**](NollningGroupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

