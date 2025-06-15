# api_client.model.EventRead

## Load the model package
```dart
import 'package:api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | 
**councilId** | **int** |  | 
**startsAt** | [**DateTime**](DateTime.md) |  | 
**endsAt** | [**DateTime**](DateTime.md) |  | 
**signupStart** | [**DateTime**](DateTime.md) |  | 
**signupEnd** | [**DateTime**](DateTime.md) |  | 
**titleSv** | **String** |  | 
**titleEn** | **String** |  | 
**descriptionSv** | **String** |  | 
**descriptionEn** | **String** |  | 
**council** | [**CouncilInEventRead**](CouncilInEventRead.md) |  | 
**location** | **String** |  | 
**maxEventUsers** | **int** |  | 
**priorities** | [**BuiltList&lt;PriorityDB&gt;**](PriorityDB.md) |  | 
**allDay** | **bool** |  | 
**signupNotOpenedYet** | **bool** |  | 
**recurring** | **bool** |  | 
**food** | **bool** |  | 
**cash** | **bool** |  | 
**closed** | **bool** |  | 
**canSignup** | **bool** |  | 
**drinkPackage** | **bool** |  | 
**isNollningEvent** | **bool** |  | 
**alcoholEventType** | **String** |  | 
**confirmedEventUsers** | [**BuiltList&lt;EventSignupRead&gt;**](EventSignupRead.md) |  | 
**reserveEventUsers** | [**BuiltList&lt;EventSignupRead&gt;**](EventSignupRead.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


