# api_client.api.UserDoorAccessApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userDoorAccessDeleteUserAccess**](UserDoorAccessApi.md#userdooraccessdeleteuseraccess) | **DELETE** /user_access/ | Delete User Access
[**userDoorAccessGetAllUserAccesses**](UserDoorAccessApi.md#userdooraccessgetalluseraccesses) | **GET** /user_access/ | Get All User Accesses
[**userDoorAccessPostUserAccess**](UserDoorAccessApi.md#userdooraccesspostuseraccess) | **POST** /user_access/ | Post User Access
[**userDoorAccessUpdateUserAccess**](UserDoorAccessApi.md#userdooraccessupdateuseraccess) | **PATCH** /user_access/ | Update User Access


# **userDoorAccessDeleteUserAccess**
> userDoorAccessDeleteUserAccess(accessId)

Delete User Access

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUserDoorAccessApi();
final int accessId = 56; // int | 

try {
    api.userDoorAccessDeleteUserAccess(accessId);
} catch on DioException (e) {
    print('Exception when calling UserDoorAccessApi->userDoorAccessDeleteUserAccess: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accessId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userDoorAccessGetAllUserAccesses**
> BuiltList<UserAccessRead> userDoorAccessGetAllUserAccesses()

Get All User Accesses

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUserDoorAccessApi();

try {
    final response = api.userDoorAccessGetAllUserAccesses();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserDoorAccessApi->userDoorAccessGetAllUserAccesses: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;UserAccessRead&gt;**](UserAccessRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userDoorAccessPostUserAccess**
> UserAccessRead userDoorAccessPostUserAccess(userAccessCreate)

Post User Access

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUserDoorAccessApi();
final UserAccessCreate userAccessCreate = ; // UserAccessCreate | 

try {
    final response = api.userDoorAccessPostUserAccess(userAccessCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserDoorAccessApi->userDoorAccessPostUserAccess: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userAccessCreate** | [**UserAccessCreate**](UserAccessCreate.md)|  | 

### Return type

[**UserAccessRead**](UserAccessRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userDoorAccessUpdateUserAccess**
> UserAccessRead userDoorAccessUpdateUserAccess(userAccessUpdate)

Update User Access

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUserDoorAccessApi();
final UserAccessUpdate userAccessUpdate = ; // UserAccessUpdate | 

try {
    final response = api.userDoorAccessUpdateUserAccess(userAccessUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserDoorAccessApi->userDoorAccessUpdateUserAccess: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userAccessUpdate** | [**UserAccessUpdate**](UserAccessUpdate.md)|  | 

### Return type

[**UserAccessRead**](UserAccessRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

