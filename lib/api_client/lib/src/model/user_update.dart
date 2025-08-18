//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_update.g.dart';

/// UserUpdate
///
/// Properties:
/// * [firstName] 
/// * [lastName] 
/// * [startYear] 
/// * [program] 
/// * [notifications] 
/// * [stilId] 
/// * [standardFoodPreferences] 
/// * [otherFoodPreferences] 
/// * [telephoneNumber] 
/// * [mooseGameName] 
@BuiltValue()
abstract class UserUpdate implements Built<UserUpdate, UserUpdateBuilder> {
  @BuiltValueField(wireName: r'first_name')
  String? get firstName;

  @BuiltValueField(wireName: r'last_name')
  String? get lastName;

  @BuiltValueField(wireName: r'start_year')
  int? get startYear;

  @BuiltValueField(wireName: r'program')
  UserUpdateProgramEnum? get program;
  // enum programEnum {  Oklart,  F,  Pi,  N,  };

  @BuiltValueField(wireName: r'notifications')
  bool? get notifications;

  @BuiltValueField(wireName: r'stil_id')
  String? get stilId;

  @BuiltValueField(wireName: r'standard_food_preferences')
  BuiltList<String>? get standardFoodPreferences;

  @BuiltValueField(wireName: r'other_food_preferences')
  String? get otherFoodPreferences;

  @BuiltValueField(wireName: r'telephone_number')
  String? get telephoneNumber;

  @BuiltValueField(wireName: r'moose_game_name')
  String? get mooseGameName;

  UserUpdate._();

  factory UserUpdate([void updates(UserUpdateBuilder b)]) = _$UserUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserUpdate> get serializer => _$UserUpdateSerializer();
}

class _$UserUpdateSerializer implements PrimitiveSerializer<UserUpdate> {
  @override
  final Iterable<Type> types = const [UserUpdate, _$UserUpdate];

  @override
  final String wireName = r'UserUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.firstName != null) {
      yield r'first_name';
      yield serializers.serialize(
        object.firstName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.lastName != null) {
      yield r'last_name';
      yield serializers.serialize(
        object.lastName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.startYear != null) {
      yield r'start_year';
      yield serializers.serialize(
        object.startYear,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.program != null) {
      yield r'program';
      yield serializers.serialize(
        object.program,
        specifiedType: const FullType.nullable(UserUpdateProgramEnum),
      );
    }
    if (object.notifications != null) {
      yield r'notifications';
      yield serializers.serialize(
        object.notifications,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.stilId != null) {
      yield r'stil_id';
      yield serializers.serialize(
        object.stilId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.standardFoodPreferences != null) {
      yield r'standard_food_preferences';
      yield serializers.serialize(
        object.standardFoodPreferences,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.otherFoodPreferences != null) {
      yield r'other_food_preferences';
      yield serializers.serialize(
        object.otherFoodPreferences,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.telephoneNumber != null) {
      yield r'telephone_number';
      yield serializers.serialize(
        object.telephoneNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.mooseGameName != null) {
      yield r'moose_game_name';
      yield serializers.serialize(
        object.mooseGameName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'first_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.firstName = valueDes;
          break;
        case r'last_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.lastName = valueDes;
          break;
        case r'start_year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.startYear = valueDes;
          break;
        case r'program':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UserUpdateProgramEnum),
          ) as UserUpdateProgramEnum?;
          if (valueDes == null) continue;
          result.program = valueDes;
          break;
        case r'notifications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.notifications = valueDes;
          break;
        case r'stil_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.stilId = valueDes;
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
        case r'telephone_number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.telephoneNumber = valueDes;
          break;
        case r'moose_game_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.mooseGameName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserUpdateBuilder();
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

class UserUpdateProgramEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Oklart')
  static const UserUpdateProgramEnum oklart = _$userUpdateProgramEnum_oklart;
  @BuiltValueEnumConst(wireName: r'F')
  static const UserUpdateProgramEnum F = _$userUpdateProgramEnum_F;
  @BuiltValueEnumConst(wireName: r'Pi')
  static const UserUpdateProgramEnum pi = _$userUpdateProgramEnum_pi;
  @BuiltValueEnumConst(wireName: r'N')
  static const UserUpdateProgramEnum N = _$userUpdateProgramEnum_N;

  static Serializer<UserUpdateProgramEnum> get serializer => _$userUpdateProgramEnumSerializer;

  const UserUpdateProgramEnum._(String name): super(name);

  static BuiltSet<UserUpdateProgramEnum> get values => _$userUpdateProgramEnumValues;
  static UserUpdateProgramEnum valueOf(String name) => _$userUpdateProgramEnumValueOf(name);
}

