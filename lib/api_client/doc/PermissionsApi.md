# api_client.api.PermissionsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**permissionsChangePostPermission**](PermissionsApi.md#permissionschangepostpermission) | **POST** /permissions/update-permission | Change Post Permission
[**permissionsCreatePermission**](PermissionsApi.md#permissionscreatepermission) | **POST** /permissions/ | Create Permission
[**permissionsGetAllPermissions**](PermissionsApi.md#permissionsgetallpermissions) | **GET** /permissions/ | Get All Permissions
[**permissionsRemovePermission**](PermissionsApi.md#permissionsremovepermission) | **DELETE** /permissions/ | Remove Permission


# **permissionsChangePostPermission**
> JsonObject permissionsChangePostPermission(updatePermission)

Change Post Permission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getPermissionsApi();
final UpdatePermission updatePermission = ; // UpdatePermission | 

try {
    final response = api.permissionsChangePostPermission(updatePermission);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PermissionsApi->permissionsChangePostPermission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updatePermission** | [**UpdatePermission**](UpdatePermission.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **permissionsCreatePermission**
> PermissionRead permissionsCreatePermission(permissionCreate)

Create Permission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getPermissionsApi();
final PermissionCreate permissionCreate = ; // PermissionCreate | 

try {
    final response = api.permissionsCreatePermission(permissionCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PermissionsApi->permissionsCreatePermission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **permissionCreate** | [**PermissionCreate**](PermissionCreate.md)|  | 

### Return type

[**PermissionRead**](PermissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **permissionsGetAllPermissions**
> BuiltList<PermissionRead> permissionsGetAllPermissions()

Get All Permissions

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getPermissionsApi();

try {
    final response = api.permissionsGetAllPermissions();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PermissionsApi->permissionsGetAllPermissions: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;PermissionRead&gt;**](PermissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **permissionsRemovePermission**
> PermissionRead permissionsRemovePermission(permissionRemove)

Remove Permission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getPermissionsApi();
final PermissionRemove permissionRemove = ; // PermissionRemove | 

try {
    final response = api.permissionsRemovePermission(permissionRemove);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PermissionsApi->permissionsRemovePermission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **permissionRemove** | [**PermissionRemove**](PermissionRemove.md)|  | 

### Return type

[**PermissionRead**](PermissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

