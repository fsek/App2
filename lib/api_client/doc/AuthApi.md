# api_client.api.AuthApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authAuthJwtLogin**](AuthApi.md#authauthjwtlogin) | **POST** /auth/login | Auth:Jwt.Login
[**authAuthJwtLogout**](AuthApi.md#authauthjwtlogout) | **POST** /auth/logout | Auth:Jwt.Logout
[**authRegisterRegister**](AuthApi.md#authregisterregister) | **POST** /auth/register | Register:Register
[**authResetForgotPassword**](AuthApi.md#authresetforgotpassword) | **POST** /auth/forgot-password | Reset:Forgot Password
[**authResetResetPassword**](AuthApi.md#authresetresetpassword) | **POST** /auth/reset-password | Reset:Reset Password
[**authVerifyRequestToken**](AuthApi.md#authverifyrequesttoken) | **POST** /auth/request-verify-token | Verify:Request-Token
[**authVerifyVerify**](AuthApi.md#authverifyverify) | **POST** /auth/verify | Verify:Verify


# **authAuthJwtLogin**
> BearerResponse authAuthJwtLogin(username, password, grantType, scope, clientId, clientSecret)

Auth:Jwt.Login

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
    final response = api.authAuthJwtLogin(username, password, grantType, scope, clientId, clientSecret);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authAuthJwtLogin: $e\n');
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

# **authAuthJwtLogout**
> JsonObject authAuthJwtLogout()

Auth:Jwt.Logout

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getAuthApi();

try {
    final response = api.authAuthJwtLogout();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authAuthJwtLogout: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
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

