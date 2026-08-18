# api_client.api.EncloseMooseApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**encloseMooseAdminCreateLevel**](EncloseMooseApi.md#enclosemooseadmincreatelevel) | **POST** /enclose-moose/admin/levels | Admin Create Level
[**encloseMooseAdminDeleteLevel**](EncloseMooseApi.md#enclosemooseadmindeletelevel) | **DELETE** /enclose-moose/admin/levels/{level_id} | Admin Delete Level
[**encloseMooseAdminGetAllLevelSubmissions**](EncloseMooseApi.md#enclosemooseadmingetalllevelsubmissions) | **GET** /enclose-moose/admin/submissions/{level_id} | Admin Get All Level Submissions
[**encloseMooseAdminGetAllLevels**](EncloseMooseApi.md#enclosemooseadmingetalllevels) | **GET** /enclose-moose/admin/levels | Admin Get All Levels
[**encloseMooseAdminGetLevel**](EncloseMooseApi.md#enclosemooseadmingetlevel) | **GET** /enclose-moose/admin/levels/{level_id} | Admin Get Level
[**encloseMooseAdminUpdateLevel**](EncloseMooseApi.md#enclosemooseadminupdatelevel) | **PATCH** /enclose-moose/admin/levels/{level_id} | Admin Update Level
[**encloseMooseGetAllLevels**](EncloseMooseApi.md#enclosemoosegetalllevels) | **GET** /enclose-moose/levels | Get All Levels
[**encloseMooseGetAllSubmissions**](EncloseMooseApi.md#enclosemoosegetallsubmissions) | **GET** /enclose-moose/submissions | Get All Submissions
[**encloseMooseGetLevel**](EncloseMooseApi.md#enclosemoosegetlevel) | **GET** /enclose-moose/levels/{level_id} | Get Level
[**encloseMooseGetSubmission**](EncloseMooseApi.md#enclosemoosegetsubmission) | **GET** /enclose-moose/submissions/{level_id} | Get Submission
[**encloseMooseSubmitSolution**](EncloseMooseApi.md#enclosemoosesubmitsolution) | **POST** /enclose-moose/submissions/{level_id} | Submit Solution


# **encloseMooseAdminCreateLevel**
> EncloseMooseLevelRead encloseMooseAdminCreateLevel(encloseMooseLevelCreate)

Admin Create Level

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getEncloseMooseApi();
final EncloseMooseLevelCreate encloseMooseLevelCreate = ; // EncloseMooseLevelCreate | 

try {
    final response = api.encloseMooseAdminCreateLevel(encloseMooseLevelCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling EncloseMooseApi->encloseMooseAdminCreateLevel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **encloseMooseLevelCreate** | [**EncloseMooseLevelCreate**](EncloseMooseLevelCreate.md)|  | 

### Return type

[**EncloseMooseLevelRead**](EncloseMooseLevelRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **encloseMooseAdminDeleteLevel**
> EncloseMooseLevelRead encloseMooseAdminDeleteLevel(levelId)

Admin Delete Level

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getEncloseMooseApi();
final int levelId = 56; // int | 

try {
    final response = api.encloseMooseAdminDeleteLevel(levelId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling EncloseMooseApi->encloseMooseAdminDeleteLevel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **levelId** | **int**|  | 

### Return type

[**EncloseMooseLevelRead**](EncloseMooseLevelRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **encloseMooseAdminGetAllLevelSubmissions**
> BuiltList<EncloseMooseSubmissionRead> encloseMooseAdminGetAllLevelSubmissions(levelId)

Admin Get All Level Submissions

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getEncloseMooseApi();
final int levelId = 56; // int | 

try {
    final response = api.encloseMooseAdminGetAllLevelSubmissions(levelId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling EncloseMooseApi->encloseMooseAdminGetAllLevelSubmissions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **levelId** | **int**|  | 

### Return type

[**BuiltList&lt;EncloseMooseSubmissionRead&gt;**](EncloseMooseSubmissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **encloseMooseAdminGetAllLevels**
> BuiltList<EncloseMooseLevelRead> encloseMooseAdminGetAllLevels()

Admin Get All Levels

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getEncloseMooseApi();

try {
    final response = api.encloseMooseAdminGetAllLevels();
    print(response);
} on DioException catch (e) {
    print('Exception when calling EncloseMooseApi->encloseMooseAdminGetAllLevels: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;EncloseMooseLevelRead&gt;**](EncloseMooseLevelRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **encloseMooseAdminGetLevel**
> EncloseMooseLevelRead encloseMooseAdminGetLevel(levelId)

Admin Get Level

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getEncloseMooseApi();
final int levelId = 56; // int | 

try {
    final response = api.encloseMooseAdminGetLevel(levelId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling EncloseMooseApi->encloseMooseAdminGetLevel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **levelId** | **int**|  | 

### Return type

[**EncloseMooseLevelRead**](EncloseMooseLevelRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **encloseMooseAdminUpdateLevel**
> EncloseMooseLevelRead encloseMooseAdminUpdateLevel(levelId, encloseMooseLevelUpdate)

Admin Update Level

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getEncloseMooseApi();
final int levelId = 56; // int | 
final EncloseMooseLevelUpdate encloseMooseLevelUpdate = ; // EncloseMooseLevelUpdate | 

try {
    final response = api.encloseMooseAdminUpdateLevel(levelId, encloseMooseLevelUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling EncloseMooseApi->encloseMooseAdminUpdateLevel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **levelId** | **int**|  | 
 **encloseMooseLevelUpdate** | [**EncloseMooseLevelUpdate**](EncloseMooseLevelUpdate.md)|  | 

### Return type

[**EncloseMooseLevelRead**](EncloseMooseLevelRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **encloseMooseGetAllLevels**
> BuiltList<EncloseMooseLevelRead> encloseMooseGetAllLevels()

Get All Levels

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getEncloseMooseApi();

try {
    final response = api.encloseMooseGetAllLevels();
    print(response);
} on DioException catch (e) {
    print('Exception when calling EncloseMooseApi->encloseMooseGetAllLevels: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;EncloseMooseLevelRead&gt;**](EncloseMooseLevelRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **encloseMooseGetAllSubmissions**
> BuiltList<EncloseMooseSubmissionRead> encloseMooseGetAllSubmissions()

Get All Submissions

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getEncloseMooseApi();

try {
    final response = api.encloseMooseGetAllSubmissions();
    print(response);
} on DioException catch (e) {
    print('Exception when calling EncloseMooseApi->encloseMooseGetAllSubmissions: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;EncloseMooseSubmissionRead&gt;**](EncloseMooseSubmissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **encloseMooseGetLevel**
> EncloseMooseLevelRead encloseMooseGetLevel(levelId)

Get Level

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getEncloseMooseApi();
final int levelId = 56; // int | 

try {
    final response = api.encloseMooseGetLevel(levelId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling EncloseMooseApi->encloseMooseGetLevel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **levelId** | **int**|  | 

### Return type

[**EncloseMooseLevelRead**](EncloseMooseLevelRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **encloseMooseGetSubmission**
> EncloseMooseSubmissionRead encloseMooseGetSubmission(levelId)

Get Submission

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getEncloseMooseApi();
final int levelId = 56; // int | 

try {
    final response = api.encloseMooseGetSubmission(levelId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling EncloseMooseApi->encloseMooseGetSubmission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **levelId** | **int**|  | 

### Return type

[**EncloseMooseSubmissionRead**](EncloseMooseSubmissionRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **encloseMooseSubmitSolution**
> EncloseMooseLevelRead encloseMooseSubmitSolution(levelId, encloseMooseSubmissionCreate)

Submit Solution

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getEncloseMooseApi();
final int levelId = 56; // int | 
final EncloseMooseSubmissionCreate encloseMooseSubmissionCreate = ; // EncloseMooseSubmissionCreate | 

try {
    final response = api.encloseMooseSubmitSolution(levelId, encloseMooseSubmissionCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling EncloseMooseApi->encloseMooseSubmitSolution: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **levelId** | **int**|  | 
 **encloseMooseSubmissionCreate** | [**EncloseMooseSubmissionCreate**](EncloseMooseSubmissionCreate.md)|  | 

### Return type

[**EncloseMooseLevelRead**](EncloseMooseLevelRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

