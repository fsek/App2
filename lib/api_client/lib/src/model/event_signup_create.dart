//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_signup_create.g.dart';

/// EventSignupCreate
///
/// Properties:
/// * [userId] 
/// * [priority] 
/// * [groupName] 
/// * [drinkPackage] 
@BuiltValue()
abstract class EventSignupCreate implements Built<EventSignupCreate, EventSignupCreateBuilder> {
  @BuiltValueField(wireName: r'user_id')
  int? get userId;

  @BuiltValueField(wireName: r'priority')
  String? get priority;

  @BuiltValueField(wireName: r'group_name')
  String? get groupName;

  @BuiltValueField(wireName: r'drinkPackage')
  EventSignupCreateDrinkPackageEnum? get drinkPackage;
  // enum drinkPackageEnum {  None,  AlcoholFree,  Alcohol,  };

  EventSignupCreate._();

  factory EventSignupCreate([void updates(EventSignupCreateBuilder b)]) = _$EventSignupCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventSignupCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventSignupCreate> get serializer => _$EventSignupCreateSerializer();
}

class _$EventSignupCreateSerializer implements PrimitiveSerializer<EventSignupCreate> {
  @override
  final Iterable<Type> types = const [EventSignupCreate, _$EventSignupCreate];

  @override
  final String wireName = r'EventSignupCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventSignupCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userId != null) {
      yield r'user_id';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.priority != null) {
      yield r'priority';
      yield serializers.serialize(
        object.priority,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.groupName != null) {
      yield r'group_name';
      yield serializers.serialize(
        object.groupName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.drinkPackage != null) {
      yield r'drinkPackage';
      yield serializers.serialize(
        object.drinkPackage,
        specifiedType: const FullType.nullable(EventSignupCreateDrinkPackageEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EventSignupCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventSignupCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'priority':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.priority = valueDes;
          break;
        case r'group_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.groupName = valueDes;
          break;
        case r'drinkPackage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(EventSignupCreateDrinkPackageEnum),
          ) as EventSignupCreateDrinkPackageEnum?;
          if (valueDes == null) continue;
          result.drinkPackage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventSignupCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventSignupCreateBuilder();
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

class EventSignupCreateDrinkPackageEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'None')
  static const EventSignupCreateDrinkPackageEnum none = _$eventSignupCreateDrinkPackageEnum_none;
  @BuiltValueEnumConst(wireName: r'AlcoholFree')
  static const EventSignupCreateDrinkPackageEnum alcoholFree = _$eventSignupCreateDrinkPackageEnum_alcoholFree;
  @BuiltValueEnumConst(wireName: r'Alcohol')
  static const EventSignupCreateDrinkPackageEnum alcohol = _$eventSignupCreateDrinkPackageEnum_alcohol;

  static Serializer<EventSignupCreateDrinkPackageEnum> get serializer => _$eventSignupCreateDrinkPackageEnumSerializer;

  const EventSignupCreateDrinkPackageEnum._(String name): super(name);

  static BuiltSet<EventSignupCreateDrinkPackageEnum> get values => _$eventSignupCreateDrinkPackageEnumValues;
  static EventSignupCreateDrinkPackageEnum valueOf(String name) => _$eventSignupCreateDrinkPackageEnumValueOf(name);
}

