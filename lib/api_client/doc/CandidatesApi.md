# api_client.api.CandidatesApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**candidatesCreateCandidation**](CandidatesApi.md#candidatescreatecandidation) | **POST** /candidate/{election_id} | Create Candidation
[**candidatesCreateCandidations**](CandidatesApi.md#candidatescreatecandidations) | **POST** /candidate/many/{election_id} | Create Candidations
[**candidatesGetAllCandidations**](CandidatesApi.md#candidatesgetallcandidations) | **GET** /candidate/{election_id} | Get All Candidations


# **candidatesCreateCandidation**
> CandidateRead candidatesCreateCandidation(electionId, postId)

Create Candidation

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCandidatesApi();
final int electionId = 56; // int | 
final int postId = 56; // int | 

try {
    final response = api.candidatesCreateCandidation(electionId, postId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CandidatesApi->candidatesCreateCandidation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionId** | **int**|  | 
 **postId** | **int**|  | 

### Return type

[**CandidateRead**](CandidateRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **candidatesCreateCandidations**
> CandidateRead candidatesCreateCandidations(electionId, candidateElectionCreate)

Create Candidations

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCandidatesApi();
final int electionId = 56; // int | 
final CandidateElectionCreate candidateElectionCreate = ; // CandidateElectionCreate | 

try {
    final response = api.candidatesCreateCandidations(electionId, candidateElectionCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CandidatesApi->candidatesCreateCandidations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionId** | **int**|  | 
 **candidateElectionCreate** | [**CandidateElectionCreate**](CandidateElectionCreate.md)|  | 

### Return type

[**CandidateRead**](CandidateRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **candidatesGetAllCandidations**
> BuiltList<CandidateRead> candidatesGetAllCandidations(electionId)

Get All Candidations

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getCandidatesApi();
final int electionId = 56; // int | 

try {
    final response = api.candidatesGetAllCandidations(electionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CandidatesApi->candidatesGetAllCandidations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **electionId** | **int**|  | 

### Return type

[**BuiltList&lt;CandidateRead&gt;**](CandidateRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

