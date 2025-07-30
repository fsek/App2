# api_client.api.MailAliasApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**mailAliasAddMember**](MailAliasApi.md#mailaliasaddmember) | **POST** /mail-alias/alias/{alias_email}/add_member | Add Member
[**mailAliasCreateAlias**](MailAliasApi.md#mailaliascreatealias) | **POST** /mail-alias/alias | Create Alias
[**mailAliasDeleteAlias**](MailAliasApi.md#mailaliasdeletealias) | **DELETE** /mail-alias/alias/{alias_email} | Delete Alias
[**mailAliasListAliases**](MailAliasApi.md#mailaliaslistaliases) | **GET** /mail-alias/aliases | List Aliases
[**mailAliasRemoveMember**](MailAliasApi.md#mailaliasremovemember) | **DELETE** /mail-alias/alias/{alias_email}/remove_member | Remove Member


# **mailAliasAddMember**
> AliasRead mailAliasAddMember(aliasEmail, memberEmail)

Add Member

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getMailAliasApi();
final String aliasEmail = aliasEmail_example; // String | 
final String memberEmail = memberEmail_example; // String | 

try {
    final response = api.mailAliasAddMember(aliasEmail, memberEmail);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MailAliasApi->mailAliasAddMember: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aliasEmail** | **String**|  | 
 **memberEmail** | **String**|  | 

### Return type

[**AliasRead**](AliasRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mailAliasCreateAlias**
> AliasRead mailAliasCreateAlias(alias)

Create Alias

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getMailAliasApi();
final String alias = alias_example; // String | 

try {
    final response = api.mailAliasCreateAlias(alias);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MailAliasApi->mailAliasCreateAlias: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **alias** | **String**|  | 

### Return type

[**AliasRead**](AliasRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mailAliasDeleteAlias**
> BuiltMap<String, String> mailAliasDeleteAlias(aliasEmail)

Delete Alias

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getMailAliasApi();
final String aliasEmail = aliasEmail_example; // String | 

try {
    final response = api.mailAliasDeleteAlias(aliasEmail);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MailAliasApi->mailAliasDeleteAlias: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aliasEmail** | **String**|  | 

### Return type

**BuiltMap&lt;String, String&gt;**

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mailAliasListAliases**
> BuiltList<AliasRead> mailAliasListAliases()

List Aliases

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getMailAliasApi();

try {
    final response = api.mailAliasListAliases();
    print(response);
} catch on DioException (e) {
    print('Exception when calling MailAliasApi->mailAliasListAliases: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AliasRead&gt;**](AliasRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mailAliasRemoveMember**
> AliasRead mailAliasRemoveMember(aliasEmail, memberEmail)

Remove Member

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getMailAliasApi();
final String aliasEmail = aliasEmail_example; // String | 
final String memberEmail = memberEmail_example; // String | 

try {
    final response = api.mailAliasRemoveMember(aliasEmail, memberEmail);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MailAliasApi->mailAliasRemoveMember: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aliasEmail** | **String**|  | 
 **memberEmail** | **String**|  | 

### Return type

[**AliasRead**](AliasRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

