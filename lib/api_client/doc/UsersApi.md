# api_client.api.UsersApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersGetAllUsers**](UsersApi.md#usersgetallusers) | **GET** /users/ | Get All Users
[**usersGetMe**](UsersApi.md#usersgetme) | **GET** /users/me | Get Me
[**usersUpdateSelf**](UsersApi.md#usersupdateself) | **PATCH** /users/update/me | Update Self
[**usersUpdateUser**](UsersApi.md#usersupdateuser) | **PATCH** /users/update/{user_id} | Update User
[**usersUpdateUserStatus**](UsersApi.md#usersupdateuserstatus) | **PATCH** /users/member-status/{user_id} | Update User Status


# **usersGetAllUsers**
> BuiltList<UserRead> usersGetAllUsers()

Get All Users

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();

try {
    final response = api.usersGetAllUsers();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersGetAllUsers: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;UserRead&gt;**](UserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersGetMe**
> UserRead usersGetMe()

Get Me

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();

try {
    final response = api.usersGetMe();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersGetMe: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserRead**](UserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUpdateSelf**
> UserRead usersUpdateSelf(userUpdate)

Update Self

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final UserUpdate userUpdate = ; // UserUpdate | 

try {
    final response = api.usersUpdateSelf(userUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersUpdateSelf: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userUpdate** | [**UserUpdate**](UserUpdate.md)|  | 

### Return type

[**UserRead**](UserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUpdateUser**
> UserRead usersUpdateUser(userId, userUpdate)

Update User

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final int userId = 56; // int | 
final UserUpdate userUpdate = ; // UserUpdate | 

try {
    final response = api.usersUpdateUser(userId, userUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersUpdateUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **userUpdate** | [**UserUpdate**](UserUpdate.md)|  | 

### Return type

[**UserRead**](UserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUpdateUserStatus**
> UserRead usersUpdateUserStatus(userId, updateUserMember)

Update User Status

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final int userId = 56; // int | 
final UpdateUserMember updateUserMember = ; // UpdateUserMember | 

try {
    final response = api.usersUpdateUserStatus(userId, updateUserMember);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersUpdateUserStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **updateUserMember** | [**UpdateUserMember**](UpdateUserMember.md)|  | 

### Return type

[**UserRead**](UserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

