# api_client.api.CouncilApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**councilCreateCouncil**](CouncilApi.md#councilcreatecouncil) | **POST** /councils/ | Create Council
[**councilDeleteCouncil**](CouncilApi.md#councildeletecouncil) | **DELETE** /councils/{council_id} | Delete Council
[**councilGetAllCouncils**](CouncilApi.md#councilgetallcouncils) | **GET** /councils/ | Get All Councils
[**councilGetCouncil**](CouncilApi.md#councilgetcouncil) | **GET** /councils/{council_id} | Get Council
[**councilUpdateCouncil**](CouncilApi.md#councilupdatecouncil) | **PATCH** /councils/update_council/{council_id} | Update Council


# **councilCreateCouncil**
> CouncilRead councilCreateCouncil(councilCreate)

Create Council

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCouncilApi();
final CouncilCreate councilCreate = ; // CouncilCreate | 

try {
    final response = api.councilCreateCouncil(councilCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CouncilApi->councilCreateCouncil: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **councilCreate** | [**CouncilCreate**](CouncilCreate.md)|  | 

### Return type

[**CouncilRead**](CouncilRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **councilDeleteCouncil**
> CouncilRead councilDeleteCouncil(councilId)

Delete Council

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCouncilApi();
final int councilId = 56; // int | 

try {
    final response = api.councilDeleteCouncil(councilId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CouncilApi->councilDeleteCouncil: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **councilId** | **int**|  | 

### Return type

[**CouncilRead**](CouncilRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **councilGetAllCouncils**
> BuiltList<CouncilRead> councilGetAllCouncils()

Get All Councils

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCouncilApi();

try {
    final response = api.councilGetAllCouncils();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CouncilApi->councilGetAllCouncils: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CouncilRead&gt;**](CouncilRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **councilGetCouncil**
> CouncilRead councilGetCouncil(councilId)

Get Council

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCouncilApi();
final int councilId = 56; // int | 

try {
    final response = api.councilGetCouncil(councilId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CouncilApi->councilGetCouncil: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **councilId** | **int**|  | 

### Return type

[**CouncilRead**](CouncilRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **councilUpdateCouncil**
> CouncilRead councilUpdateCouncil(councilId, councilUpdate)

Update Council

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCouncilApi();
final int councilId = 56; // int | 
final CouncilUpdate councilUpdate = ; // CouncilUpdate | 

try {
    final response = api.councilUpdateCouncil(councilId, councilUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CouncilApi->councilUpdateCouncil: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **councilId** | **int**|  | 
 **councilUpdate** | [**CouncilUpdate**](CouncilUpdate.md)|  | 

### Return type

[**CouncilRead**](CouncilRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

