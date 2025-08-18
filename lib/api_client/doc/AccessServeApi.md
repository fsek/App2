# api_client.api.AccessServeApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accessServeGetAllAccessIds**](AccessServeApi.md#accessservegetallaccessids) | **GET** /access-serve/{door} | Get All Access Ids


# **accessServeGetAllAccessIds**
> BuiltList<String> accessServeGetAllAccessIds(door)

Get All Access Ids

Get all STIL IDs that have access to a specific door.  This endpoint allows the serving of LU's servers by providing STIL IDs for door systems. Access can be granted through: 1. Direct user door access assignments 2. Post (group) memberships that include door access  The actual serving is done on the frontend. TODO: Ideally we should communicate with LU to get them some better non-public API.

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAccessServeApi();
final String door = door_example; // String | 

try {
    final response = api.accessServeGetAllAccessIds(door);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AccessServeApi->accessServeGetAllAccessIds: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **door** | **String**|  | 

### Return type

**BuiltList&lt;String&gt;**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

