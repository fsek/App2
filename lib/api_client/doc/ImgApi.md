# api_client.api.ImgApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://10.0.2.2:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**imgDeleteImage**](ImgApi.md#imgdeleteimage) | **DELETE** /img/{id} | Delete Image
[**imgGetImage**](ImgApi.md#imggetimage) | **GET** /img/{id} | Get Image
[**imgUploadImage**](ImgApi.md#imguploadimage) | **POST** /img/ | Upload Image


# **imgDeleteImage**
> BuiltMap<String, String> imgDeleteImage(id)

Delete Image

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getImgApi();
final int id = 56; // int | 

try {
    final response = api.imgDeleteImage(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ImgApi->imgDeleteImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**BuiltMap&lt;String, String&gt;**

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **imgGetImage**
> JsonObject imgGetImage(id)

Get Image

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getImgApi();
final int id = 56; // int | 

try {
    final response = api.imgGetImage(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ImgApi->imgGetImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **imgUploadImage**
> BuiltMap<String, String> imgUploadImage(albumId, file)

Upload Image

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getImgApi();
final int albumId = 56; // int | 
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.imgUploadImage(albumId, file);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ImgApi->imgUploadImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumId** | **int**|  | 
 **file** | **MultipartFile**|  | 

### Return type

**BuiltMap&lt;String, String&gt;**

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

