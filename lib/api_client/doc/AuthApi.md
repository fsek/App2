# api_client.api.AuthApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authAuthCookieLogin**](AuthApi.md#authauthcookielogin) | **POST** /auth/login | Auth:Cookie.Login
[**authAuthCookieLogout**](AuthApi.md#authauthcookielogout) | **DELETE** /auth/logout | Auth:Cookie.Logout
[**authAuthCookieLogoutAll**](AuthApi.md#authauthcookielogoutall) | **DELETE** /auth/logout-all | Auth:Cookie.Logout All
[**authAuthCookieRefresh**](AuthApi.md#authauthcookierefresh) | **POST** /auth/refresh | Auth:Cookie.Refresh
[**authAuthCookieUpdateEmail**](AuthApi.md#authauthcookieupdateemail) | **PATCH** /auth/update-email | Auth:Cookie.Update Email
[**authAuthCookieUpdatePassword**](AuthApi.md#authauthcookieupdatepassword) | **PATCH** /auth/update-password | Auth:Cookie.Update Password
[**authRegisterRegister**](AuthApi.md#authregisterregister) | **POST** /auth/register | Register:Register
[**authResetForgotPassword**](AuthApi.md#authresetforgotpassword) | **POST** /auth/forgot-password | Reset:Forgot Password
[**authResetResetPassword**](AuthApi.md#authresetresetpassword) | **POST** /auth/reset-password | Reset:Reset Password
[**authVerifyRequestToken**](AuthApi.md#authverifyrequesttoken) | **POST** /auth/request-verify-token | Verify:Request-Token
[**authVerifyVerify**](AuthApi.md#authverifyverify) | **POST** /auth/verify | Verify:Verify


# **authAuthCookieLogin**
> BearerResponse authAuthCookieLogin(username, password, grantType, scope, clientId, clientSecret)

Auth:Cookie.Login

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final String username = username_example; // String | 
final String password = password_example; // String | 
final String grantType = grantType_example; // String | 
final String scope = scope_example; // String | 
final String clientId = clientId_example; // String | 
final String clientSecret = clientSecret_example; // String | 

try {
    final response = api.authAuthCookieLogin(username, password, grantType, scope, clientId, clientSecret);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authAuthCookieLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | 
 **password** | **String**|  | 
 **grantType** | **String**|  | [optional] 
 **scope** | **String**|  | [optional] [default to '']
 **clientId** | **String**|  | [optional] 
 **clientSecret** | **String**|  | [optional] 

### Return type

[**BearerResponse**](BearerResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authAuthCookieLogout**
> JsonObject authAuthCookieLogout()

Auth:Cookie.Logout

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAuthApi();

try {
    final response = api.authAuthCookieLogout();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authAuthCookieLogout: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authAuthCookieLogoutAll**
> JsonObject authAuthCookieLogoutAll()

Auth:Cookie.Logout All

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAuthApi();

try {
    final response = api.authAuthCookieLogoutAll();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authAuthCookieLogoutAll: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authAuthCookieRefresh**
> BearerResponse authAuthCookieRefresh()

Auth:Cookie.Refresh

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAuthApi();

try {
    final response = api.authAuthCookieRefresh();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authAuthCookieRefresh: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BearerResponse**](BearerResponse.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authAuthCookieUpdateEmail**
> UserRead authAuthCookieUpdateEmail(newEmail, username, password, grantType, scope, clientId, clientSecret)

Auth:Cookie.Update Email

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAuthApi();
final String newEmail = newEmail_example; // String | 
final String username = username_example; // String | 
final String password = password_example; // String | 
final String grantType = grantType_example; // String | 
final String scope = scope_example; // String | 
final String clientId = clientId_example; // String | 
final String clientSecret = clientSecret_example; // String | 

try {
    final response = api.authAuthCookieUpdateEmail(newEmail, username, password, grantType, scope, clientId, clientSecret);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authAuthCookieUpdateEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newEmail** | **String**|  | 
 **username** | **String**|  | 
 **password** | **String**|  | 
 **grantType** | **String**|  | [optional] 
 **scope** | **String**|  | [optional] [default to '']
 **clientId** | **String**|  | [optional] 
 **clientSecret** | **String**|  | [optional] 

### Return type

[**UserRead**](UserRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authAuthCookieUpdatePassword**
> JsonObject authAuthCookieUpdatePassword(newPassword, username, password, grantType, scope, clientId, clientSecret)

Auth:Cookie.Update Password

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAuthApi();
final String newPassword = newPassword_example; // String | 
final String username = username_example; // String | 
final String password = password_example; // String | 
final String grantType = grantType_example; // String | 
final String scope = scope_example; // String | 
final String clientId = clientId_example; // String | 
final String clientSecret = clientSecret_example; // String | 

try {
    final response = api.authAuthCookieUpdatePassword(newPassword, username, password, grantType, scope, clientId, clientSecret);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authAuthCookieUpdatePassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newPassword** | **String**|  | 
 **username** | **String**|  | 
 **password** | **String**|  | 
 **grantType** | **String**|  | [optional] 
 **scope** | **String**|  | [optional] [default to '']
 **clientId** | **String**|  | [optional] 
 **clientSecret** | **String**|  | [optional] 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRegisterRegister**
> UserRead authRegisterRegister(userCreate)

Register:Register

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final UserCreate userCreate = ; // UserCreate | 

try {
    final response = api.authRegisterRegister(userCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authRegisterRegister: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userCreate** | [**UserCreate**](UserCreate.md)|  | 

### Return type

[**UserRead**](UserRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authResetForgotPassword**
> JsonObject authResetForgotPassword(bodyAuthResetForgotPassword)

Reset:Forgot Password

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final BodyAuthResetForgotPassword bodyAuthResetForgotPassword = ; // BodyAuthResetForgotPassword | 

try {
    final response = api.authResetForgotPassword(bodyAuthResetForgotPassword);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authResetForgotPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bodyAuthResetForgotPassword** | [**BodyAuthResetForgotPassword**](BodyAuthResetForgotPassword.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authResetResetPassword**
> JsonObject authResetResetPassword(bodyAuthResetResetPassword)

Reset:Reset Password

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final BodyAuthResetResetPassword bodyAuthResetResetPassword = ; // BodyAuthResetResetPassword | 

try {
    final response = api.authResetResetPassword(bodyAuthResetResetPassword);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authResetResetPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bodyAuthResetResetPassword** | [**BodyAuthResetResetPassword**](BodyAuthResetResetPassword.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authVerifyRequestToken**
> JsonObject authVerifyRequestToken(bodyAuthVerifyRequestToken)

Verify:Request-Token

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final BodyAuthVerifyRequestToken bodyAuthVerifyRequestToken = ; // BodyAuthVerifyRequestToken | 

try {
    final response = api.authVerifyRequestToken(bodyAuthVerifyRequestToken);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authVerifyRequestToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bodyAuthVerifyRequestToken** | [**BodyAuthVerifyRequestToken**](BodyAuthVerifyRequestToken.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authVerifyVerify**
> UserRead authVerifyVerify(bodyAuthVerifyVerify)

Verify:Verify

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final BodyAuthVerifyVerify bodyAuthVerifyVerify = ; // BodyAuthVerifyVerify | 

try {
    final response = api.authVerifyVerify(bodyAuthVerifyVerify);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authVerifyVerify: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bodyAuthVerifyVerify** | [**BodyAuthVerifyVerify**](BodyAuthVerifyVerify.md)|  | 

### Return type

[**UserRead**](UserRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

