# api_client.api.AlbumsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**albumsAddAlbumPhotographer**](AlbumsApi.md#albumsaddalbumphotographer) | **PATCH** /albums/add_photographer | Add Album Photographer
[**albumsCreateAlbum**](AlbumsApi.md#albumscreatealbum) | **POST** /albums/ | Create Album
[**albumsDeleteAlbumYear**](AlbumsApi.md#albumsdeletealbumyear) | **DELETE** /albums/year/{year} | Delete Album Year
[**albumsDeleteOneAlbum**](AlbumsApi.md#albumsdeleteonealbum) | **DELETE** /albums/{album_id} | Delete One Album
[**albumsGetAlbums**](AlbumsApi.md#albumsgetalbums) | **GET** /albums/all | Get Albums
[**albumsGetOneAlbum**](AlbumsApi.md#albumsgetonealbum) | **GET** /albums/{album_id} | Get One Album
[**albumsPatchAlbum**](AlbumsApi.md#albumspatchalbum) | **PATCH** /albums/{album_id} | Patch Album
[**albumsRemoveAlbumPhotographer**](AlbumsApi.md#albumsremovealbumphotographer) | **PATCH** /albums/remove_photographer | Remove Album Photographer


# **albumsAddAlbumPhotographer**
> AlbumRead albumsAddAlbumPhotographer(albumPhotographerAdd)

Add Album Photographer

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAlbumsApi();
final AlbumPhotographerAdd albumPhotographerAdd = ; // AlbumPhotographerAdd | 

try {
    final response = api.albumsAddAlbumPhotographer(albumPhotographerAdd);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AlbumsApi->albumsAddAlbumPhotographer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumPhotographerAdd** | [**AlbumPhotographerAdd**](AlbumPhotographerAdd.md)|  | 

### Return type

[**AlbumRead**](AlbumRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **albumsCreateAlbum**
> AlbumRead albumsCreateAlbum(albumCreate)

Create Album

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAlbumsApi();
final AlbumCreate albumCreate = ; // AlbumCreate | 

try {
    final response = api.albumsCreateAlbum(albumCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AlbumsApi->albumsCreateAlbum: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumCreate** | [**AlbumCreate**](AlbumCreate.md)|  | 

### Return type

[**AlbumRead**](AlbumRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **albumsDeleteAlbumYear**
> BuiltMap<String, String> albumsDeleteAlbumYear(year)

Delete Album Year

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAlbumsApi();
final int year = 56; // int | 

try {
    final response = api.albumsDeleteAlbumYear(year);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AlbumsApi->albumsDeleteAlbumYear: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **year** | **int**|  | 

### Return type

**BuiltMap&lt;String, String&gt;**

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **albumsDeleteOneAlbum**
> AlbumRead albumsDeleteOneAlbum(albumId)

Delete One Album

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAlbumsApi();
final int albumId = 56; // int | 

try {
    final response = api.albumsDeleteOneAlbum(albumId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AlbumsApi->albumsDeleteOneAlbum: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumId** | **int**|  | 

### Return type

[**AlbumRead**](AlbumRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **albumsGetAlbums**
> BuiltList<AlbumRead> albumsGetAlbums()

Get Albums

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAlbumsApi();

try {
    final response = api.albumsGetAlbums();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AlbumsApi->albumsGetAlbums: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AlbumRead&gt;**](AlbumRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **albumsGetOneAlbum**
> AlbumRead albumsGetOneAlbum(albumId)

Get One Album

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAlbumsApi();
final int albumId = 56; // int | 

try {
    final response = api.albumsGetOneAlbum(albumId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AlbumsApi->albumsGetOneAlbum: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumId** | **int**|  | 

### Return type

[**AlbumRead**](AlbumRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **albumsPatchAlbum**
> AlbumRead albumsPatchAlbum(albumId, albumPatch)

Patch Album

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAlbumsApi();
final int albumId = 56; // int | 
final AlbumPatch albumPatch = ; // AlbumPatch | 

try {
    final response = api.albumsPatchAlbum(albumId, albumPatch);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AlbumsApi->albumsPatchAlbum: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumId** | **int**|  | 
 **albumPatch** | [**AlbumPatch**](AlbumPatch.md)|  | 

### Return type

[**AlbumRead**](AlbumRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **albumsRemoveAlbumPhotographer**
> AlbumRead albumsRemoveAlbumPhotographer(albumPhotographerAdd)

Remove Album Photographer

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getAlbumsApi();
final AlbumPhotographerAdd albumPhotographerAdd = ; // AlbumPhotographerAdd | 

try {
    final response = api.albumsRemoveAlbumPhotographer(albumPhotographerAdd);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AlbumsApi->albumsRemoveAlbumPhotographer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumPhotographerAdd** | [**AlbumPhotographerAdd**](AlbumPhotographerAdd.md)|  | 

### Return type

[**AlbumRead**](AlbumRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

