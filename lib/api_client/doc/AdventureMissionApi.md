# api_client.api.AdventureMissionApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adventureMissionDeleteAdventureMission**](AdventureMissionApi.md#adventuremissiondeleteadventuremission) | **DELETE** /adventure-mission/delete/{id} | Delete Adventure Mission
[**adventureMissionGetAdventureMission**](AdventureMissionApi.md#adventuremissiongetadventuremission) | **GET** /adventure-mission/{id} | Get Adventure Mission
[**adventureMissionGetAllAdventureMissions**](AdventureMissionApi.md#adventuremissiongetalladventuremissions) | **GET** /adventure-mission/all | Get All Adventure Missions
[**adventureMissionPatchAdventureMission**](AdventureMissionApi.md#adventuremissionpatchadventuremission) | **PATCH** /adventure-mission/patch/{id} | Patch Adventure Mission
[**adventureMissionPostAdventureMission**](AdventureMissionApi.md#adventuremissionpostadventuremission) | **POST** /adventure-mission/ | Post Adventure Mission


# **adventureMissionDeleteAdventureMission**
> AdventureMissionRead adventureMissionDeleteAdventureMission(id)

Delete Adventure Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getAdventureMissionApi();
final int id = 56; // int | 

try {
    final response = api.adventureMissionDeleteAdventureMission(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdventureMissionApi->adventureMissionDeleteAdventureMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**AdventureMissionRead**](AdventureMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adventureMissionGetAdventureMission**
> AdventureMissionRead adventureMissionGetAdventureMission(id)

Get Adventure Mission

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAdventureMissionApi();
final int id = 56; // int | 

try {
    final response = api.adventureMissionGetAdventureMission(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdventureMissionApi->adventureMissionGetAdventureMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**AdventureMissionRead**](AdventureMissionRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adventureMissionGetAllAdventureMissions**
> BuiltList<AdventureMissionRead> adventureMissionGetAllAdventureMissions()

Get All Adventure Missions

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAdventureMissionApi();

try {
    final response = api.adventureMissionGetAllAdventureMissions();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdventureMissionApi->adventureMissionGetAllAdventureMissions: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdventureMissionRead&gt;**](AdventureMissionRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adventureMissionPatchAdventureMission**
> AdventureMissionRead adventureMissionPatchAdventureMission(id, adventureMissionCreate)

Patch Adventure Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getAdventureMissionApi();
final int id = 56; // int | 
final AdventureMissionCreate adventureMissionCreate = ; // AdventureMissionCreate | 

try {
    final response = api.adventureMissionPatchAdventureMission(id, adventureMissionCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdventureMissionApi->adventureMissionPatchAdventureMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **adventureMissionCreate** | [**AdventureMissionCreate**](AdventureMissionCreate.md)|  | 

### Return type

[**AdventureMissionRead**](AdventureMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adventureMissionPostAdventureMission**
> AdventureMissionRead adventureMissionPostAdventureMission(adventureMissionCreate)

Post Adventure Mission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getAdventureMissionApi();
final AdventureMissionCreate adventureMissionCreate = ; // AdventureMissionCreate | 

try {
    final response = api.adventureMissionPostAdventureMission(adventureMissionCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdventureMissionApi->adventureMissionPostAdventureMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **adventureMissionCreate** | [**AdventureMissionCreate**](AdventureMissionCreate.md)|  | 

### Return type

[**AdventureMissionRead**](AdventureMissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

