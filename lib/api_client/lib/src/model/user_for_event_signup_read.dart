//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/group_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_for_event_signup_read.g.dart';

/// UserForEventSignupRead
///
/// Properties:
/// * [id] 
/// * [firstName] 
/// * [lastName] 
/// * [groups] 
/// * [standardFoodPreferences] 
/// * [otherFoodPreferences] 
@BuiltValue()
abstract class UserForEventSignupRead implements Built<UserForEventSignupRead, UserForEventSignupReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'first_name')
  String get firstName;

  @BuiltValueField(wireName: r'last_name')
  String get lastName;

  @BuiltValueField(wireName: r'groups')
  BuiltList<GroupRead> get groups;

  @BuiltValueField(wireName: r'standard_food_preferences')
  BuiltList<String>? get standardFoodPreferences;

  @BuiltValueField(wireName: r'other_food_preferences')
  String? get otherFoodPreferences;

  UserForEventSignupRead._();

  factory UserForEventSignupRead([void updates(UserForEventSignupReadBuilder b)]) = _$UserForEventSignupRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserForEventSignupReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserForEventSignupRead> get serializer => _$UserForEventSignupReadSerializer();
}

class _$UserForEventSignupReadSerializer implements PrimitiveSerializer<UserForEventSignupRead> {
  @override
  final Iterable<Type> types = const [UserForEventSignupRead, _$UserForEventSignupRead];

  @override
  final String wireName = r'UserForEventSignupRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserForEventSignupRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'first_name';
    yield serializers.serialize(
      object.firstName,
      specifiedType: const FullType(String),
    );
    yield r'last_name';
    yield serializers.serialize(
      object.lastName,
      specifiedType: const FullType(String),
    );
    yield r'groups';
    yield serializers.serialize(
      object.groups,
      specifiedType: const FullType(BuiltList, [FullType(GroupRead)]),
    );
    yield r'standard_food_preferences';
    yield object.standardFoodPreferences == null ? null : serializers.serialize(
      object.standardFoodPreferences,
      specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
    );
    yield r'other_food_preferences';
    yield object.otherFoodPreferences == null ? null : serializers.serialize(
      object.otherFoodPreferences,
      specifiedType: const FullType.nullable(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserForEventSignupRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserForEventSignupReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'first_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.firstName = valueDes;
          break;
        case r'last_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastName = valueDes;
          break;
        case r'groups':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(GroupRead)]),
          ) as BuiltList<GroupRead>;
          result.groups.replace(valueDes);
          break;
        case r'standard_food_preferences':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.standardFoodPreferences.replace(valueDes);
          break;
        case r'other_food_preferences':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.otherFoodPreferences = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserForEventSignupRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserForEventSignupReadBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

