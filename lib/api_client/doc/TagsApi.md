# api_client.api.TagsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**tagsDeleteTag**](TagsApi.md#tagsdeletetag) | **DELETE** /tags/{tag_id} | Delete Tag
[**tagsEditTag**](TagsApi.md#tagsedittag) | **PATCH** /tags/ | Edit Tag
[**tagsGetTags**](TagsApi.md#tagsgettags) | **GET** /tags/ | Get Tags
[**tagsPostTag**](TagsApi.md#tagsposttag) | **POST** /tags/ | Post Tag


# **tagsDeleteTag**
> TagRead tagsDeleteTag(tagId)

Delete Tag

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getTagsApi();
final int tagId = 56; // int | 

try {
    final response = api.tagsDeleteTag(tagId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TagsApi->tagsDeleteTag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagId** | **int**|  | 

### Return type

[**TagRead**](TagRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tagsEditTag**
> TagRead tagsEditTag(tagEdit)

Edit Tag

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getTagsApi();
final TagEdit tagEdit = ; // TagEdit | 

try {
    final response = api.tagsEditTag(tagEdit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TagsApi->tagsEditTag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagEdit** | [**TagEdit**](TagEdit.md)|  | 

### Return type

[**TagRead**](TagRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tagsGetTags**
> BuiltList<TagRead> tagsGetTags()

Get Tags

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getTagsApi();

try {
    final response = api.tagsGetTags();
    print(response);
} catch on DioException (e) {
    print('Exception when calling TagsApi->tagsGetTags: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;TagRead&gt;**](TagRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tagsPostTag**
> TagRead tagsPostTag(tagCreate)

Post Tag

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getTagsApi();
final TagCreate tagCreate = ; // TagCreate | 

try {
    final response = api.tagsPostTag(tagCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TagsApi->tagsPostTag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagCreate** | [**TagCreate**](TagCreate.md)|  | 

### Return type

[**TagRead**](TagRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

