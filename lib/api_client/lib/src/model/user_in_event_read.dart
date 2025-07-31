//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_in_event_read.g.dart';

/// UserInEventRead
///
/// Properties:
/// * [id] 
/// * [firstName] 
/// * [lastName] 
/// * [standardFoodPreferences] 
/// * [otherFoodPreferences] 
@BuiltValue()
abstract class UserInEventRead implements Built<UserInEventRead, UserInEventReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'first_name')
  String get firstName;

  @BuiltValueField(wireName: r'last_name')
  String get lastName;

  @BuiltValueField(wireName: r'standard_food_preferences')
  BuiltList<String>? get standardFoodPreferences;

  @BuiltValueField(wireName: r'other_food_preferences')
  String? get otherFoodPreferences;

  UserInEventRead._();

  factory UserInEventRead([void updates(UserInEventReadBuilder b)]) = _$UserInEventRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserInEventReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserInEventRead> get serializer => _$UserInEventReadSerializer();
}

class _$UserInEventReadSerializer implements PrimitiveSerializer<UserInEventRead> {
  @override
  final Iterable<Type> types = const [UserInEventRead, _$UserInEventRead];

  @override
  final String wireName = r'UserInEventRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserInEventRead object, {
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
    UserInEventRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserInEventReadBuilder result,
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
  UserInEventRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserInEventReadBuilder();
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

