# api_client.model.UserRead

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
**posts** | [**BuiltList&lt;UserPostRead&gt;**](UserPostRead.md) |  | 
**events** | [**BuiltList&lt;UserEventRead&gt;**](UserEventRead.md) |  | 
**telephoneNumber** | **String** |  | 
**startYear** | **int** |  | 
**accountCreated** | [**DateTime**](DateTime.md) |  | 
**wantNotifications** | **bool** |  | 
**stilId** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


