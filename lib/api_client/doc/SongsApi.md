# api_client.api.SongsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**songsCreateSong**](SongsApi.md#songscreatesong) | **POST** /songs/ | Create Song
[**songsDeleteSong**](SongsApi.md#songsdeletesong) | **DELETE** /songs/{song_id} | Delete Song
[**songsGetAllSongs**](SongsApi.md#songsgetallsongs) | **GET** /songs/ | Get All Songs
[**songsGetSong**](SongsApi.md#songsgetsong) | **GET** /songs/{song_id} | Get Song
[**songsUpdateSong**](SongsApi.md#songsupdatesong) | **PATCH** /songs/{song_id} | Update Song


# **songsCreateSong**
> SongRead songsCreateSong(songCreate)

Create Song

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getSongsApi();
final SongCreate songCreate = ; // SongCreate | 

try {
    final response = api.songsCreateSong(songCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SongsApi->songsCreateSong: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **songCreate** | [**SongCreate**](SongCreate.md)|  | 

### Return type

[**SongRead**](SongRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **songsDeleteSong**
> SongRead songsDeleteSong(songId)

Delete Song

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getSongsApi();
final int songId = 56; // int | 

try {
    final response = api.songsDeleteSong(songId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SongsApi->songsDeleteSong: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **songId** | **int**|  | 

### Return type

[**SongRead**](SongRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **songsGetAllSongs**
> BuiltList<SongRead> songsGetAllSongs()

Get All Songs

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getSongsApi();

try {
    final response = api.songsGetAllSongs();
    print(response);
} catch on DioException (e) {
    print('Exception when calling SongsApi->songsGetAllSongs: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;SongRead&gt;**](SongRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **songsGetSong**
> SongRead songsGetSong(songId)

Get Song

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getSongsApi();
final int songId = 56; // int | 

try {
    final response = api.songsGetSong(songId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SongsApi->songsGetSong: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **songId** | **int**|  | 

### Return type

[**SongRead**](SongRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **songsUpdateSong**
> SongRead songsUpdateSong(songId, songCreate)

Update Song

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getSongsApi();
final int songId = 56; // int | 
final SongCreate songCreate = ; // SongCreate | 

try {
    final response = api.songsUpdateSong(songId, songCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SongsApi->songsUpdateSong: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **songId** | **int**|  | 
 **songCreate** | [**SongCreate**](SongCreate.md)|  | 

### Return type

[**SongRead**](SongRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

