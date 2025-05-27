# api_client.api.UsersApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersAdminGetAllUsers**](UsersApi.md#usersadmingetallusers) | **GET** /users/admin/all/ | Admin Get All Users
[**usersAdminGetUser**](UsersApi.md#usersadmingetuser) | **GET** /users/admin/{user_id} | Admin Get User
[**usersAdminUpdateUser**](UsersApi.md#usersadminupdateuser) | **PATCH** /users/admin/update/{user_id} | Admin Update User
[**usersGetMe**](UsersApi.md#usersgetme) | **GET** /users/me | Get Me
[**usersGetUser**](UsersApi.md#usersgetuser) | **GET** /users/{user_id} | Get User
[**usersGetUserPosts**](UsersApi.md#usersgetuserposts) | **GET** /users/posts/{user_id} | Get User Posts
[**usersUpdateSelf**](UsersApi.md#usersupdateself) | **PATCH** /users/update/me | Update Self
[**usersUpdateUserStatus**](UsersApi.md#usersupdateuserstatus) | **PATCH** /users/admin/member-status/{user_id} | Update User Status


# **usersAdminGetAllUsers**
> BuiltList<AdminUserRead> usersAdminGetAllUsers()

Admin Get All Users

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();

try {
    final response = api.usersAdminGetAllUsers();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersAdminGetAllUsers: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdminUserRead&gt;**](AdminUserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersAdminGetUser**
> AdminUserRead usersAdminGetUser(userId)

Admin Get User

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final int userId = 56; // int | 

try {
    final response = api.usersAdminGetUser(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersAdminGetUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**AdminUserRead**](AdminUserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersAdminUpdateUser**
> AdminUserRead usersAdminUpdateUser(userId, userUpdate)

Admin Update User

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final int userId = 56; // int | 
final UserUpdate userUpdate = ; // UserUpdate | 

try {
    final response = api.usersAdminUpdateUser(userId, userUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersAdminUpdateUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **userUpdate** | [**UserUpdate**](UserUpdate.md)|  | 

### Return type

[**AdminUserRead**](AdminUserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersGetMe**
> AdminUserRead usersGetMe()

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

[**AdminUserRead**](AdminUserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersGetUser**
> UserRead usersGetUser(userId)

Get User

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final int userId = 56; // int | 

try {
    final response = api.usersGetUser(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersGetUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**UserRead**](UserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersGetUserPosts**
> BuiltList<PostRead> usersGetUserPosts(userId)

Get User Posts

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final int userId = 56; // int | 

try {
    final response = api.usersGetUserPosts(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersGetUserPosts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**BuiltList&lt;PostRead&gt;**](PostRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUpdateSelf**
> AdminUserRead usersUpdateSelf(userUpdate)

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

[**AdminUserRead**](AdminUserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUpdateUserStatus**
> AdminUserRead usersUpdateUserStatus(userId, updateUserMember)

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

[**AdminUserRead**](AdminUserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

