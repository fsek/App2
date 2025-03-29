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
[**usersUpdateMe**](UsersApi.md#usersupdateme) | **PATCH** /users/me | Update Me
[**usersUpdateUser**](UsersApi.md#usersupdateuser) | **PATCH** /users/member-status/{user_id} | Update User


# **usersGetAllUsers**
> BuiltList<UserRead> usersGetAllUsers()

Get All Users

### Example
```dart
import 'package:api_client/api.dart';

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

No authorization required

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

# **usersUpdateMe**
> UserRead usersUpdateMe(meUpdate)

Update Me

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final MeUpdate meUpdate = ; // MeUpdate | 

try {
    final response = api.usersUpdateMe(meUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersUpdateMe: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meUpdate** | [**MeUpdate**](MeUpdate.md)|  | 

### Return type

[**UserRead**](UserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUpdateUser**
> JsonObject usersUpdateUser(userId, updateUserMember)

Update User

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final int userId = 56; // int | 
final UpdateUserMember updateUserMember = ; // UpdateUserMember | 

try {
    final response = api.usersUpdateUser(userId, updateUserMember);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersUpdateUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **updateUserMember** | [**UpdateUserMember**](UpdateUserMember.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

