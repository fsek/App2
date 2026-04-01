# api_client.api.CandidatesApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**candidatesCreateCandidation**](CandidatesApi.md#candidatescreatecandidation) | **POST** /candidate/{sub_election_id} | Create Candidation
[**candidatesDeleteCandidate**](CandidatesApi.md#candidatesdeletecandidate) | **DELETE** /candidate/{sub_election_id}/candidate/{user_id} | Delete Candidate
[**candidatesDeleteCandidation**](CandidatesApi.md#candidatesdeletecandidation) | **DELETE** /candidate/ | Delete Candidation
[**candidatesGetAllElectionCandidates**](CandidatesApi.md#candidatesgetallelectioncandidates) | **GET** /candidate/election/{election_id} | Get All Election Candidates
[**candidatesGetAllSubElectionCandidates**](CandidatesApi.md#candidatesgetallsubelectioncandidates) | **GET** /candidate/sub-election/{sub_election_id} | Get All Sub Election Candidates
[**candidatesGetAllSubElectionCandidationsCsv**](CandidatesApi.md#candidatesgetallsubelectioncandidationscsv) | **GET** /candidate/sub-election/{sub_election_id}/csv | Get All Sub Election Candidations Csv
[**candidatesGetCandidate**](CandidatesApi.md#candidatesgetcandidate) | **GET** /candidate/{candidate_id} | Get Candidate
[**candidatesGetMyCandidations**](CandidatesApi.md#candidatesgetmycandidations) | **GET** /candidate/my-candidations/{election_id} | Get My Candidations


# **candidatesCreateCandidation**
> CandidateRead candidatesCreateCandidation(subElectionId, postId, userId)

Create Candidation

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCandidatesApi();
final int subElectionId = 56; // int | 
final int postId = 56; // int | 
final int userId = 56; // int | 

try {
    final response = api.candidatesCreateCandidation(subElectionId, postId, userId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CandidatesApi->candidatesCreateCandidation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subElectionId** | **int**|  | 
 **postId** | **int**|  | 
 **userId** | **int**|  | 

### Return type

[**CandidateRead**](CandidateRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **candidatesDeleteCandidate**
> candidatesDeleteCandidate(subElectionId, userId)

Delete Candidate

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCandidatesApi();
final int subElectionId = 56; // int | 
final int userId = 56; // int | 

try {
    api.candidatesDeleteCandidate(subElectionId, userId);
} on DioException catch (e) {
    print('Exception when calling CandidatesApi->candidatesDeleteCandidate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subElectionId** | **int**|  | 
 **userId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **candidatesDeleteCandidation**
> candidatesDeleteCandidation(electionPostId, candidateId)

Delete Candidation

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCandidatesApi();
final int electionPostId = 56; // int | 
final int candidateId = 56; // int | 

try {
    api.candidatesDeleteCandidation(electionPostId, candidateId);
} on DioException catch (e) {
    print('Exception when calling CandidatesApi->candidatesDeleteCandidation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionPostId** | **int**|  | 
 **candidateId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **candidatesGetAllElectionCandidates**
> BuiltList<CandidateRead> candidatesGetAllElectionCandidates(electionId)

Get All Election Candidates

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCandidatesApi();
final int electionId = 56; // int | 

try {
    final response = api.candidatesGetAllElectionCandidates(electionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CandidatesApi->candidatesGetAllElectionCandidates: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionId** | **int**|  | 

### Return type

[**BuiltList&lt;CandidateRead&gt;**](CandidateRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **candidatesGetAllSubElectionCandidates**
> BuiltList<CandidateRead> candidatesGetAllSubElectionCandidates(subElectionId)

Get All Sub Election Candidates

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCandidatesApi();
final int subElectionId = 56; // int | 

try {
    final response = api.candidatesGetAllSubElectionCandidates(subElectionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CandidatesApi->candidatesGetAllSubElectionCandidates: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subElectionId** | **int**|  | 

### Return type

[**BuiltList&lt;CandidateRead&gt;**](CandidateRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **candidatesGetAllSubElectionCandidationsCsv**
> JsonObject candidatesGetAllSubElectionCandidationsCsv(subElectionId)

Get All Sub Election Candidations Csv

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCandidatesApi();
final int subElectionId = 56; // int | 

try {
    final response = api.candidatesGetAllSubElectionCandidationsCsv(subElectionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CandidatesApi->candidatesGetAllSubElectionCandidationsCsv: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subElectionId** | **int**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **candidatesGetCandidate**
> CandidateRead candidatesGetCandidate(candidateId)

Get Candidate

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCandidatesApi();
final int candidateId = 56; // int | 

try {
    final response = api.candidatesGetCandidate(candidateId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CandidatesApi->candidatesGetCandidate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **candidateId** | **int**|  | 

### Return type

[**CandidateRead**](CandidateRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **candidatesGetMyCandidations**
> BuiltList<CandidatePostRead> candidatesGetMyCandidations(electionId)

Get My Candidations

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure API key authorization: APIKeyCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('APIKeyCookie').apiKeyPrefix = 'Bearer';

final api = ApiClient().getCandidatesApi();
final int electionId = 56; // int | 

try {
    final response = api.candidatesGetMyCandidations(electionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CandidatesApi->candidatesGetMyCandidations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionId** | **int**|  | 

### Return type

[**BuiltList&lt;CandidatePostRead&gt;**](CandidatePostRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer), [APIKeyCookie](../README.md#APIKeyCookie)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

