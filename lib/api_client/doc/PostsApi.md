# api_client.api.PostsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**postsCreatePost**](PostsApi.md#postscreatepost) | **POST** /posts/ | Create Post
[**postsDeletePost**](PostsApi.md#postsdeletepost) | **DELETE** /posts/{post_id} | Delete Post
[**postsGetAllPosts**](PostsApi.md#postsgetallposts) | **GET** /posts/ | Get All Posts
[**postsUpdatePost**](PostsApi.md#postsupdatepost) | **PATCH** /posts/{post_id} | Update Post


# **postsCreatePost**
> PostRead postsCreatePost(postCreate)

Create Post

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getPostsApi();
final PostCreate postCreate = ; // PostCreate | 

try {
    final response = api.postsCreatePost(postCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PostsApi->postsCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postCreate** | [**PostCreate**](PostCreate.md)|  | 

### Return type

[**PostRead**](PostRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsDeletePost**
> postsDeletePost(postId)

Delete Post

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getPostsApi();
final int postId = 56; // int | 

try {
    api.postsDeletePost(postId);
} catch on DioException (e) {
    print('Exception when calling PostsApi->postsDeletePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsGetAllPosts**
> BuiltList<PostRead> postsGetAllPosts()

Get All Posts

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getPostsApi();

try {
    final response = api.postsGetAllPosts();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PostsApi->postsGetAllPosts: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;PostRead&gt;**](PostRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsUpdatePost**
> PostRead postsUpdatePost(postId, postUpdate)

Update Post

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getPostsApi();
final int postId = 56; // int | 
final PostUpdate postUpdate = ; // PostUpdate | 

try {
    final response = api.postsUpdatePost(postId, postUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PostsApi->postsUpdatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 
 **postUpdate** | [**PostUpdate**](PostUpdate.md)|  | 

### Return type

[**PostRead**](PostRead.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

