# api_client.model.AdminUserRead

## Load the model package
```dart
import 'package:api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | 
**email** | **String** |  | 
**isActive** | **bool** |  | [optional] [default to true]
**isSuperuser** | **bool** |  | [optional] [default to false]
**isVerified** | **bool** |  | [optional] [default to false]
**firstName** | **String** |  | 
**lastName** | **String** |  | 
**program** | **String** |  | 
**posts** | [**BuiltList&lt;PostRead&gt;**](PostRead.md) |  | 
**events** | [**BuiltList&lt;UserEventRead&gt;**](UserEventRead.md) |  | 
**telephoneNumber** | **String** |  | 
**startYear** | **int** |  | 
**accountCreated** | [**DateTime**](DateTime.md) |  | 
**wantNotifications** | **bool** |  | 
**stilId** | **String** |  | [optional] 
**standardFoodPreferences** | **BuiltList&lt;String&gt;** |  | 
**otherFoodPreferences** | **String** |  | 
**accesses** | [**BuiltList&lt;SimpleUserAccessRead&gt;**](SimpleUserAccessRead.md) |  | 
**isMember** | **bool** |  | 
**groups** | [**BuiltList&lt;GroupRead&gt;**](GroupRead.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


