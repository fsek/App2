# api_client.api.KeyvalsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**keyvalsDeleteKeyval**](KeyvalsApi.md#keyvalsdeletekeyval) | **DELETE** /keyvals/{key} | Delete Keyval
[**keyvalsGetKeyval**](KeyvalsApi.md#keyvalsgetkeyval) | **GET** /keyvals/{key} | Get Keyval
[**keyvalsGetKeyvals**](KeyvalsApi.md#keyvalsgetkeyvals) | **GET** /keyvals/ | Get Keyvals
[**keyvalsPostKeyval**](KeyvalsApi.md#keyvalspostkeyval) | **POST** /keyvals/ | Post Keyval
[**keyvalsUpdateKeyval**](KeyvalsApi.md#keyvalsupdatekeyval) | **PATCH** /keyvals/{key} | Update Keyval


# **keyvalsDeleteKeyval**
> KeyvalRead keyvalsDeleteKeyval(key)

Delete Keyval

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getKeyvalsApi();
final String key = key_example; // String | 

try {
    final response = api.keyvalsDeleteKeyval(key);
    print(response);
} on DioException catch (e) {
    print('Exception when calling KeyvalsApi->keyvalsDeleteKeyval: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key** | **String**|  | 

### Return type

[**KeyvalRead**](KeyvalRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **keyvalsGetKeyval**
> KeyvalRead keyvalsGetKeyval(key)

Get Keyval

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getKeyvalsApi();
final String key = key_example; // String | 

try {
    final response = api.keyvalsGetKeyval(key);
    print(response);
} on DioException catch (e) {
    print('Exception when calling KeyvalsApi->keyvalsGetKeyval: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key** | **String**|  | 

### Return type

[**KeyvalRead**](KeyvalRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **keyvalsGetKeyvals**
> BuiltList<KeyvalRead> keyvalsGetKeyvals()

Get Keyvals

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getKeyvalsApi();

try {
    final response = api.keyvalsGetKeyvals();
    print(response);
} on DioException catch (e) {
    print('Exception when calling KeyvalsApi->keyvalsGetKeyvals: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;KeyvalRead&gt;**](KeyvalRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **keyvalsPostKeyval**
> KeyvalRead keyvalsPostKeyval(keyvalCreate)

Post Keyval

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getKeyvalsApi();
final KeyvalCreate keyvalCreate = ; // KeyvalCreate | 

try {
    final response = api.keyvalsPostKeyval(keyvalCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling KeyvalsApi->keyvalsPostKeyval: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **keyvalCreate** | [**KeyvalCreate**](KeyvalCreate.md)|  | 

### Return type

[**KeyvalRead**](KeyvalRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **keyvalsUpdateKeyval**
> KeyvalRead keyvalsUpdateKeyval(key, keyvalUpdate)

Update Keyval

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getKeyvalsApi();
final String key = key_example; // String | 
final KeyvalUpdate keyvalUpdate = ; // KeyvalUpdate | 

try {
    final response = api.keyvalsUpdateKeyval(key, keyvalUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling KeyvalsApi->keyvalsUpdateKeyval: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key** | **String**|  | 
 **keyvalUpdate** | [**KeyvalUpdate**](KeyvalUpdate.md)|  | 

### Return type

[**KeyvalRead**](KeyvalRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

