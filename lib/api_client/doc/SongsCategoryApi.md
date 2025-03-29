# api_client.api.SongsCategoryApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**songsCategoryCreateSongCategory**](SongsCategoryApi.md#songscategorycreatesongcategory) | **POST** /songs-category/ | Create Song Category
[**songsCategoryDeleteSongCategory**](SongsCategoryApi.md#songscategorydeletesongcategory) | **DELETE** /songs-category/{category_id} | Delete Song Category
[**songsCategoryGetAllSongCategories**](SongsCategoryApi.md#songscategorygetallsongcategories) | **GET** /songs-category/ | Get All Song Categories
[**songsCategoryGetSongCategory**](SongsCategoryApi.md#songscategorygetsongcategory) | **GET** /songs-category/{category_id} | Get Song Category
[**songsCategoryUpdateSongCategory**](SongsCategoryApi.md#songscategoryupdatesongcategory) | **PATCH** /songs-category/{category_id} | Update Song Category


# **songsCategoryCreateSongCategory**
> SongCategoryRead songsCategoryCreateSongCategory(songCategoryCreate)

Create Song Category

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getSongsCategoryApi();
final SongCategoryCreate songCategoryCreate = ; // SongCategoryCreate | 

try {
    final response = api.songsCategoryCreateSongCategory(songCategoryCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SongsCategoryApi->songsCategoryCreateSongCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **songCategoryCreate** | [**SongCategoryCreate**](SongCategoryCreate.md)|  | 

### Return type

[**SongCategoryRead**](SongCategoryRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **songsCategoryDeleteSongCategory**
> SongCategoryRead songsCategoryDeleteSongCategory(categoryId)

Delete Song Category

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getSongsCategoryApi();
final int categoryId = 56; // int | 

try {
    final response = api.songsCategoryDeleteSongCategory(categoryId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SongsCategoryApi->songsCategoryDeleteSongCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryId** | **int**|  | 

### Return type

[**SongCategoryRead**](SongCategoryRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **songsCategoryGetAllSongCategories**
> BuiltList<SongCategoryRead> songsCategoryGetAllSongCategories()

Get All Song Categories

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getSongsCategoryApi();

try {
    final response = api.songsCategoryGetAllSongCategories();
    print(response);
} catch on DioException (e) {
    print('Exception when calling SongsCategoryApi->songsCategoryGetAllSongCategories: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;SongCategoryRead&gt;**](SongCategoryRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **songsCategoryGetSongCategory**
> SongCategoryRead songsCategoryGetSongCategory(categoryId)

Get Song Category

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getSongsCategoryApi();
final int categoryId = 56; // int | 

try {
    final response = api.songsCategoryGetSongCategory(categoryId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SongsCategoryApi->songsCategoryGetSongCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryId** | **int**|  | 

### Return type

[**SongCategoryRead**](SongCategoryRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **songsCategoryUpdateSongCategory**
> SongCategoryRead songsCategoryUpdateSongCategory(categoryId, songCategoryCreate)

Update Song Category

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getSongsCategoryApi();
final int categoryId = 56; // int | 
final SongCategoryCreate songCategoryCreate = ; // SongCategoryCreate | 

try {
    final response = api.songsCategoryUpdateSongCategory(categoryId, songCategoryCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SongsCategoryApi->songsCategoryUpdateSongCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryId** | **int**|  | 
 **songCategoryCreate** | [**SongCategoryCreate**](SongCategoryCreate.md)|  | 

### Return type

[**SongCategoryRead**](SongCategoryRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

