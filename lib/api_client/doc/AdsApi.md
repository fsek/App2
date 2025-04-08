# api_client.api.AdsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adsCreateAd**](AdsApi.md#adscreatead) | **POST** /ad/ | Create Ad
[**adsGetAdById**](AdsApi.md#adsgetadbyid) | **GET** /ad/{id} | Get Ad By Id
[**adsGetAdByUser**](AdsApi.md#adsgetadbyuser) | **GET** /ad/username/{username} | Get Ad By User
[**adsGetAllAds**](AdsApi.md#adsgetallads) | **GET** /ad/ | Get All Ads
[**adsGetBookAdByAuthor**](AdsApi.md#adsgetbookadbyauthor) | **GET** /ad/authorname/{authorname} | Get Book Ad By Author
[**adsGetBookAdByTitle**](AdsApi.md#adsgetbookadbytitle) | **GET** /ad/title/{stitle} | Get Book Ad By Title
[**adsRemoveAd**](AdsApi.md#adsremovead) | **DELETE** /ad/{id} | Remove Ad
[**adsRemoveAdSuperUser**](AdsApi.md#adsremoveadsuperuser) | **DELETE** /ad/manage-route/{id} | Remove Ad Super User
[**adsUpdateAd**](AdsApi.md#adsupdatead) | **PATCH** /ad/updateAd/{ad_id} | Update Ad


# **adsCreateAd**
> AdRead adsCreateAd(adCreate)

Create Ad

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAdsApi();
final AdCreate adCreate = ; // AdCreate | 

try {
    final response = api.adsCreateAd(adCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdsApi->adsCreateAd: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **adCreate** | [**AdCreate**](AdCreate.md)|  | 

### Return type

[**AdRead**](AdRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adsGetAdById**
> AdRead adsGetAdById(id)

Get Ad By Id

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAdsApi();
final int id = 56; // int | 

try {
    final response = api.adsGetAdById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdsApi->adsGetAdById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**AdRead**](AdRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adsGetAdByUser**
> BuiltList<AdRead> adsGetAdByUser(username)

Get Ad By User

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAdsApi();
final String username = username_example; // String | 

try {
    final response = api.adsGetAdByUser(username);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdsApi->adsGetAdByUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | 

### Return type

[**BuiltList&lt;AdRead&gt;**](AdRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adsGetAllAds**
> BuiltList<AdRead> adsGetAllAds()

Get All Ads

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAdsApi();

try {
    final response = api.adsGetAllAds();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdsApi->adsGetAllAds: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdRead&gt;**](AdRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adsGetBookAdByAuthor**
> BuiltList<AdRead> adsGetBookAdByAuthor(authorname)

Get Book Ad By Author

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAdsApi();
final String authorname = authorname_example; // String | 

try {
    final response = api.adsGetBookAdByAuthor(authorname);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdsApi->adsGetBookAdByAuthor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorname** | **String**|  | 

### Return type

[**BuiltList&lt;AdRead&gt;**](AdRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adsGetBookAdByTitle**
> BuiltList<AdRead> adsGetBookAdByTitle(stitle)

Get Book Ad By Title

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAdsApi();
final String stitle = stitle_example; // String | 

try {
    final response = api.adsGetBookAdByTitle(stitle);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdsApi->adsGetBookAdByTitle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **stitle** | **String**|  | 

### Return type

[**BuiltList&lt;AdRead&gt;**](AdRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adsRemoveAd**
> AdRead adsRemoveAd(id)

Remove Ad

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getAdsApi();
final int id = 56; // int | 

try {
    final response = api.adsRemoveAd(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdsApi->adsRemoveAd: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**AdRead**](AdRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adsRemoveAdSuperUser**
> AdRead adsRemoveAdSuperUser(id)

Remove Ad Super User

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getAdsApi();
final int id = 56; // int | 

try {
    final response = api.adsRemoveAdSuperUser(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdsApi->adsRemoveAdSuperUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**AdRead**](AdRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adsUpdateAd**
> AdRead adsUpdateAd(adId, adUpdate)

Update Ad

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getAdsApi();
final int adId = 56; // int | 
final AdUpdate adUpdate = ; // AdUpdate | 

try {
    final response = api.adsUpdateAd(adId, adUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdsApi->adsUpdateAd: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **adId** | **int**|  | 
 **adUpdate** | [**AdUpdate**](AdUpdate.md)|  | 

### Return type

[**AdRead**](AdRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

