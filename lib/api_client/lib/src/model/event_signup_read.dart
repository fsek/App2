//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/user_in_event_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_signup_read.g.dart';

/// EventSignupRead
///
/// Properties:
/// * [user] 
/// * [eventId] 
/// * [priority] 
/// * [groupName] 
/// * [drinkPackage] 
@BuiltValue()
abstract class EventSignupRead implements Built<EventSignupRead, EventSignupReadBuilder> {
  @BuiltValueField(wireName: r'user')
  UserInEventRead get user;

  @BuiltValueField(wireName: r'event_id')
  int get eventId;

  @BuiltValueField(wireName: r'priority')
  String get priority;

  @BuiltValueField(wireName: r'group_name')
  String get groupName;

  @BuiltValueField(wireName: r'drinkPackage')
  EventSignupReadDrinkPackageEnum get drinkPackage;
  // enum drinkPackageEnum {  None,  AlcoholFree,  Alcohol,  };

  EventSignupRead._();

  factory EventSignupRead([void updates(EventSignupReadBuilder b)]) = _$EventSignupRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventSignupReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventSignupRead> get serializer => _$EventSignupReadSerializer();
}

class _$EventSignupReadSerializer implements PrimitiveSerializer<EventSignupRead> {
  @override
  final Iterable<Type> types = const [EventSignupRead, _$EventSignupRead];

  @override
  final String wireName = r'EventSignupRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventSignupRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user';
    yield serializers.serialize(
      object.user,
      specifiedType: const FullType(UserInEventRead),
    );
    yield r'event_id';
    yield serializers.serialize(
      object.eventId,
      specifiedType: const FullType(int),
    );
    yield r'priority';
    yield serializers.serialize(
      object.priority,
      specifiedType: const FullType(String),
    );
    yield r'group_name';
    yield serializers.serialize(
      object.groupName,
      specifiedType: const FullType(String),
    );
    yield r'drinkPackage';
    yield serializers.serialize(
      object.drinkPackage,
      specifiedType: const FullType(EventSignupReadDrinkPackageEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EventSignupRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventSignupReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserInEventRead),
          ) as UserInEventRead;
          result.user.replace(valueDes);
          break;
        case r'event_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.eventId = valueDes;
          break;
        case r'priority':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.priority = valueDes;
          break;
        case r'group_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.groupName = valueDes;
          break;
        case r'drinkPackage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EventSignupReadDrinkPackageEnum),
          ) as EventSignupReadDrinkPackageEnum;
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
  EventSignupRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventSignupReadBuilder();
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

class EventSignupReadDrinkPackageEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'None')
  static const EventSignupReadDrinkPackageEnum none = _$eventSignupReadDrinkPackageEnum_none;
  @BuiltValueEnumConst(wireName: r'AlcoholFree')
  static const EventSignupReadDrinkPackageEnum alcoholFree = _$eventSignupReadDrinkPackageEnum_alcoholFree;
  @BuiltValueEnumConst(wireName: r'Alcohol')
  static const EventSignupReadDrinkPackageEnum alcohol = _$eventSignupReadDrinkPackageEnum_alcohol;

  static Serializer<EventSignupReadDrinkPackageEnum> get serializer => _$eventSignupReadDrinkPackageEnumSerializer;

  const EventSignupReadDrinkPackageEnum._(String name): super(name);

  static BuiltSet<EventSignupReadDrinkPackageEnum> get values => _$eventSignupReadDrinkPackageEnumValues;
  static EventSignupReadDrinkPackageEnum valueOf(String name) => _$eventSignupReadDrinkPackageEnumValueOf(name);
}

