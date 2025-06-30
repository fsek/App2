# api_client.api.NollningApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**nollningAddCompletedMission**](NollningApi.md#nollningaddcompletedmission) | **POST** /group_mission/{id} | Add Completed Mission
[**nollningAddGroupToNollning**](NollningApi.md#nollningaddgrouptonollning) | **POST** /nollning/add_group/{id} | Add Group To Nollning
[**nollningDeleteGroupMission**](NollningApi.md#nollningdeletegroupmission) | **DELETE** /nollning/delete_group_mission/{id} | Delete Group Mission
[**nollningDeleteNollning**](NollningApi.md#nollningdeletenollning) | **DELETE** /nollning/delete/{id} | Delete Nollning
[**nollningEditCompletedMission**](NollningApi.md#nollningeditcompletedmission) | **PATCH** /group_mission/{id} | Edit Completed Mission
[**nollningGetAllNollning**](NollningApi.md#nollninggetallnollning) | **GET** /nollning/all | Get All Nollning
[**nollningGetAllNollningGroups**](NollningApi.md#nollninggetallnollninggroups) | **GET** /nollning/ | Get All Nollning Groups
[**nollningGetCompletedMissions**](NollningApi.md#nollninggetcompletedmissions) | **GET** /group_mission/{nollning_id} | Get Completed Missions
[**nollningPatchNollning**](NollningApi.md#nollningpatchnollning) | **PATCH** /nollning/patch/{id} | Patch Nollning
[**nollningPostNollning**](NollningApi.md#nollningpostnollning) | **POST** /nollning/ | Post Nollning
[**nollningRemoveGroupFromNollning**](NollningApi.md#nollningremovegroupfromnollning) | **DELETE** /nollning/remove_group/{nollning_group_id} | Remove Group From Nollning


# **nollningAddCompletedMission**
> GroupMissionRead nollningAddCompletedMission(id, groupMissionCreate)

Add Completed Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getNollningApi();
final int id = 56; // int | 
final GroupMissionCreate groupMissionCreate = ; // GroupMissionCreate | 

try {
    final response = api.nollningAddCompletedMission(id, groupMissionCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningAddCompletedMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **groupMissionCreate** | [**GroupMissionCreate**](GroupMissionCreate.md)|  | 

### Return type

[**GroupMissionRead**](GroupMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningAddGroupToNollning**
> NollningRead nollningAddGroupToNollning(id, nollningAddGroup)

Add Group To Nollning

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getNollningApi();
final int id = 56; // int | 
final NollningAddGroup nollningAddGroup = ; // NollningAddGroup | 

try {
    final response = api.nollningAddGroupToNollning(id, nollningAddGroup);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningAddGroupToNollning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **nollningAddGroup** | [**NollningAddGroup**](NollningAddGroup.md)|  | 

### Return type

[**NollningRead**](NollningRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningDeleteGroupMission**
> NollningDeleteMission nollningDeleteGroupMission(id, nollningDeleteMission)

Delete Group Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getNollningApi();
final int id = 56; // int | 
final NollningDeleteMission nollningDeleteMission = ; // NollningDeleteMission | 

try {
    final response = api.nollningDeleteGroupMission(id, nollningDeleteMission);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningDeleteGroupMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **nollningDeleteMission** | [**NollningDeleteMission**](NollningDeleteMission.md)|  | 

### Return type

[**NollningDeleteMission**](NollningDeleteMission.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningDeleteNollning**
> BuiltMap<String, String> nollningDeleteNollning(id)

Delete Nollning

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getNollningApi();
final int id = 56; // int | 

try {
    final response = api.nollningDeleteNollning(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningDeleteNollning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**BuiltMap&lt;String, String&gt;**

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningEditCompletedMission**
> GroupMissionRead nollningEditCompletedMission(id, groupMissionEdit)

Edit Completed Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getNollningApi();
final int id = 56; // int | 
final GroupMissionEdit groupMissionEdit = ; // GroupMissionEdit | 

try {
    final response = api.nollningEditCompletedMission(id, groupMissionEdit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningEditCompletedMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **groupMissionEdit** | [**GroupMissionEdit**](GroupMissionEdit.md)|  | 

### Return type

[**GroupMissionRead**](GroupMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
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

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningGetAllNollningGroups**
> BuiltList<NollningGroupRead> nollningGetAllNollningGroups(id)

Get All Nollning Groups

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getNollningApi();
final int id = 56; // int | 

try {
    final response = api.nollningGetAllNollningGroups(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningGetAllNollningGroups: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**BuiltList&lt;NollningGroupRead&gt;**](NollningGroupRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningGetCompletedMissions**
> BuiltList<GroupMissionRead> nollningGetCompletedMissions(nollningId)

Get Completed Missions

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getNollningApi();
final int nollningId = 56; // int | 

try {
    final response = api.nollningGetCompletedMissions(nollningId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningGetCompletedMissions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nollningId** | **int**|  | 

### Return type

[**BuiltList&lt;GroupMissionRead&gt;**](GroupMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nollningPatchNollning**
> NollningRead nollningPatchNollning(id, nollningCreate)

Patch Nollning

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getNollningApi();
final int id = 56; // int | 
final NollningCreate nollningCreate = ; // NollningCreate | 

try {
    final response = api.nollningPatchNollning(id, nollningCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NollningApi->nollningPatchNollning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **nollningCreate** | [**NollningCreate**](NollningCreate.md)|  | 

### Return type

[**NollningRead**](NollningRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

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

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

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

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

