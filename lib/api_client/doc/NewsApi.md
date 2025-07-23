# api_client.api.NewsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**newsBumpNews**](NewsApi.md#newsbumpnews) | **PATCH** /news/bump/{news_id} | Bump News
[**newsCreateNews**](NewsApi.md#newscreatenews) | **POST** /news/ | Create News
[**newsDeleteNews**](NewsApi.md#newsdeletenews) | **DELETE** /news/{news_id} | Delete News
[**newsGetAllNews**](NewsApi.md#newsgetallnews) | **GET** /news/all | Get All News
[**newsGetNews**](NewsApi.md#newsgetnews) | **GET** /news/{news_id} | Get News
[**newsGetPaginatedNews**](NewsApi.md#newsgetpaginatednews) | **GET** /news/page/{page_nbr} | Get Paginated News
[**newsGetPinnedNews**](NewsApi.md#newsgetpinnednews) | **GET** /news/pinned/ | Get Pinned News
[**newsUpdateNews**](NewsApi.md#newsupdatenews) | **PATCH** /news/{news_id} | Update News


# **newsBumpNews**
> NewsRead newsBumpNews(newsId)

Bump News

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNewsApi();
final int newsId = 56; // int | 

try {
    final response = api.newsBumpNews(newsId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NewsApi->newsBumpNews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newsId** | **int**|  | 

### Return type

[**NewsRead**](NewsRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsCreateNews**
> NewsRead newsCreateNews(newsCreate)

Create News

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNewsApi();
final NewsCreate newsCreate = ; // NewsCreate | 

try {
    final response = api.newsCreateNews(newsCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NewsApi->newsCreateNews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newsCreate** | [**NewsCreate**](NewsCreate.md)|  | 

### Return type

[**NewsRead**](NewsRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsDeleteNews**
> newsDeleteNews(newsId)

Delete News

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNewsApi();
final int newsId = 56; // int | 

try {
    api.newsDeleteNews(newsId);
} catch on DioException (e) {
    print('Exception when calling NewsApi->newsDeleteNews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newsId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsGetAllNews**
> BuiltList<NewsRead> newsGetAllNews()

Get All News

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getNewsApi();

try {
    final response = api.newsGetAllNews();
    print(response);
} catch on DioException (e) {
    print('Exception when calling NewsApi->newsGetAllNews: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;NewsRead&gt;**](NewsRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsGetNews**
> NewsRead newsGetNews(newsId)

Get News

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getNewsApi();
final int newsId = 56; // int | 

try {
    final response = api.newsGetNews(newsId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NewsApi->newsGetNews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newsId** | **int**|  | 

### Return type

[**NewsRead**](NewsRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsGetPaginatedNews**
> BuiltList<NewsRead> newsGetPaginatedNews(pageNbr)

Get Paginated News

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getNewsApi();
final int pageNbr = 56; // int | 

try {
    final response = api.newsGetPaginatedNews(pageNbr);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NewsApi->newsGetPaginatedNews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNbr** | **int**|  | 

### Return type

[**BuiltList&lt;NewsRead&gt;**](NewsRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsGetPinnedNews**
> BuiltList<NewsRead> newsGetPinnedNews()

Get Pinned News

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getNewsApi();

try {
    final response = api.newsGetPinnedNews();
    print(response);
} catch on DioException (e) {
    print('Exception when calling NewsApi->newsGetPinnedNews: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;NewsRead&gt;**](NewsRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsUpdateNews**
> NewsRead newsUpdateNews(newsId, newsUpdate)

Update News

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getNewsApi();
final int newsId = 56; // int | 
final NewsUpdate newsUpdate = ; // NewsUpdate | 

try {
    final response = api.newsUpdateNews(newsId, newsUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NewsApi->newsUpdateNews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newsId** | **int**|  | 
 **newsUpdate** | [**NewsUpdate**](NewsUpdate.md)|  | 

### Return type

[**NewsRead**](NewsRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

