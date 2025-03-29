# api_client.api.DefaultApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**helloRoute**](DefaultApi.md#helloroute) | **GET** / | Hello Route
[**manageEventOnlypermissionRoute**](DefaultApi.md#manageeventonlypermissionroute) | **GET** /manage-event-only | Permission Route
[**memberOnlymemberOnly**](DefaultApi.md#memberonlymemberonly) | **GET** /member-only | Member Only
[**userOnlyuserOnly**](DefaultApi.md#useronlyuseronly) | **GET** /user-only | User Only


# **helloRoute**
> JsonObject helloRoute()

Hello Route

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getDefaultApi();

try {
    final response = api.helloRoute();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->helloRoute: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **manageEventOnlypermissionRoute**
> JsonObject manageEventOnlypermissionRoute()

Permission Route

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getDefaultApi();

try {
    final response = api.manageEventOnlypermissionRoute();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->manageEventOnlypermissionRoute: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memberOnlymemberOnly**
> JsonObject memberOnlymemberOnly()

Member Only

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getDefaultApi();

try {
    final response = api.memberOnlymemberOnly();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->memberOnlymemberOnly: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userOnlyuserOnly**
> JsonObject userOnlyuserOnly()

User Only

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getDefaultApi();

try {
    final response = api.userOnlyuserOnly();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->userOnlyuserOnly: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

