//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/memberroles.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_update.g.dart';

/// EventUpdate
///
/// Properties:
/// * [councilId] 
/// * [startsAt] 
/// * [endsAt] 
/// * [signupStart] 
/// * [signupEnd] 
/// * [titleSv] 
/// * [titleEn] 
/// * [descriptionSv] 
/// * [descriptionEn] 
/// * [location] 
/// * [maxEventUsers] 
/// * [allDay] 
/// * [recurring] 
/// * [food] 
/// * [closed] 
/// * [canSignup] 
/// * [drinkPackage] 
/// * [isNollningEvent] 
/// * [priorities] 
/// * [alcoholEventType] 
/// * [dressCode] 
/// * [price] 
/// * [dot] 
@BuiltValue()
abstract class EventUpdate implements Built<EventUpdate, EventUpdateBuilder> {
  @BuiltValueField(wireName: r'council_id')
  int? get councilId;

  @BuiltValueField(wireName: r'starts_at')
  DateTime? get startsAt;

  @BuiltValueField(wireName: r'ends_at')
  DateTime? get endsAt;

  @BuiltValueField(wireName: r'signup_start')
  DateTime? get signupStart;

  @BuiltValueField(wireName: r'signup_end')
  DateTime? get signupEnd;

  @BuiltValueField(wireName: r'title_sv')
  String? get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String? get titleEn;

  @BuiltValueField(wireName: r'description_sv')
  String? get descriptionSv;

  @BuiltValueField(wireName: r'description_en')
  String? get descriptionEn;

  @BuiltValueField(wireName: r'location')
  String? get location;

  @BuiltValueField(wireName: r'max_event_users')
  int? get maxEventUsers;

  @BuiltValueField(wireName: r'all_day')
  bool? get allDay;

  @BuiltValueField(wireName: r'recurring')
  bool? get recurring;

  @BuiltValueField(wireName: r'food')
  bool? get food;

  @BuiltValueField(wireName: r'closed')
  bool? get closed;

  @BuiltValueField(wireName: r'can_signup')
  bool? get canSignup;

  @BuiltValueField(wireName: r'drink_package')
  bool? get drinkPackage;

  @BuiltValueField(wireName: r'is_nollning_event')
  bool? get isNollningEvent;

  @BuiltValueField(wireName: r'priorities')
  BuiltList<MEMBERROLES>? get priorities;

  @BuiltValueField(wireName: r'alcohol_event_type')
  EventUpdateAlcoholEventTypeEnum? get alcoholEventType;
  // enum alcoholEventTypeEnum {  Alcohol,  Alcohol-Served,  None,  };

  @BuiltValueField(wireName: r'dress_code')
  String? get dressCode;

  @BuiltValueField(wireName: r'price')
  int? get price;

  @BuiltValueField(wireName: r'dot')
  EventUpdateDotEnum? get dot;
  // enum dotEnum {  None,  Single,  Double,  };

  EventUpdate._();

  factory EventUpdate([void updates(EventUpdateBuilder b)]) = _$EventUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventUpdate> get serializer => _$EventUpdateSerializer();
}

class _$EventUpdateSerializer implements PrimitiveSerializer<EventUpdate> {
  @override
  final Iterable<Type> types = const [EventUpdate, _$EventUpdate];

  @override
  final String wireName = r'EventUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.councilId != null) {
      yield r'council_id';
      yield serializers.serialize(
        object.councilId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.startsAt != null) {
      yield r'starts_at';
      yield serializers.serialize(
        object.startsAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.endsAt != null) {
      yield r'ends_at';
      yield serializers.serialize(
        object.endsAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.signupStart != null) {
      yield r'signup_start';
      yield serializers.serialize(
        object.signupStart,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.signupEnd != null) {
      yield r'signup_end';
      yield serializers.serialize(
        object.signupEnd,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.titleSv != null) {
      yield r'title_sv';
      yield serializers.serialize(
        object.titleSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.titleEn != null) {
      yield r'title_en';
      yield serializers.serialize(
        object.titleEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.descriptionSv != null) {
      yield r'description_sv';
      yield serializers.serialize(
        object.descriptionSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.descriptionEn != null) {
      yield r'description_en';
      yield serializers.serialize(
        object.descriptionEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.location != null) {
      yield r'location';
      yield serializers.serialize(
        object.location,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.maxEventUsers != null) {
      yield r'max_event_users';
      yield serializers.serialize(
        object.maxEventUsers,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.allDay != null) {
      yield r'all_day';
      yield serializers.serialize(
        object.allDay,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.recurring != null) {
      yield r'recurring';
      yield serializers.serialize(
        object.recurring,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.food != null) {
      yield r'food';
      yield serializers.serialize(
        object.food,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.closed != null) {
      yield r'closed';
      yield serializers.serialize(
        object.closed,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.canSignup != null) {
      yield r'can_signup';
      yield serializers.serialize(
        object.canSignup,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.drinkPackage != null) {
      yield r'drink_package';
      yield serializers.serialize(
        object.drinkPackage,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.isNollningEvent != null) {
      yield r'is_nollning_event';
      yield serializers.serialize(
        object.isNollningEvent,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.priorities != null) {
      yield r'priorities';
      yield serializers.serialize(
        object.priorities,
        specifiedType: const FullType.nullable(BuiltList, [FullType(MEMBERROLES)]),
      );
    }
    if (object.alcoholEventType != null) {
      yield r'alcohol_event_type';
      yield serializers.serialize(
        object.alcoholEventType,
        specifiedType: const FullType.nullable(EventUpdateAlcoholEventTypeEnum),
      );
    }
    if (object.dressCode != null) {
      yield r'dress_code';
      yield serializers.serialize(
        object.dressCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.price != null) {
      yield r'price';
      yield serializers.serialize(
        object.price,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.dot != null) {
      yield r'dot';
      yield serializers.serialize(
        object.dot,
        specifiedType: const FullType.nullable(EventUpdateDotEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EventUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'council_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.councilId = valueDes;
          break;
        case r'starts_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.startsAt = valueDes;
          break;
        case r'ends_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.endsAt = valueDes;
          break;
        case r'signup_start':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.signupStart = valueDes;
          break;
        case r'signup_end':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.signupEnd = valueDes;
          break;
        case r'title_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.titleSv = valueDes;
          break;
        case r'title_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.titleEn = valueDes;
          break;
        case r'description_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.descriptionSv = valueDes;
          break;
        case r'description_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.descriptionEn = valueDes;
          break;
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.location = valueDes;
          break;
        case r'max_event_users':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.maxEventUsers = valueDes;
          break;
        case r'all_day':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.allDay = valueDes;
          break;
        case r'recurring':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.recurring = valueDes;
          break;
        case r'food':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.food = valueDes;
          break;
        case r'closed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.closed = valueDes;
          break;
        case r'can_signup':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.canSignup = valueDes;
          break;
        case r'drink_package':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.drinkPackage = valueDes;
          break;
        case r'is_nollning_event':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isNollningEvent = valueDes;
          break;
        case r'priorities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(MEMBERROLES)]),
          ) as BuiltList<MEMBERROLES>?;
          if (valueDes == null) continue;
          result.priorities.replace(valueDes);
          break;
        case r'alcohol_event_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(EventUpdateAlcoholEventTypeEnum),
          ) as EventUpdateAlcoholEventTypeEnum?;
          if (valueDes == null) continue;
          result.alcoholEventType = valueDes;
          break;
        case r'dress_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dressCode = valueDes;
          break;
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.price = valueDes;
          break;
        case r'dot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(EventUpdateDotEnum),
          ) as EventUpdateDotEnum?;
          if (valueDes == null) continue;
          result.dot = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventUpdateBuilder();
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

class EventUpdateAlcoholEventTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Alcohol')
  static const EventUpdateAlcoholEventTypeEnum alcohol = _$eventUpdateAlcoholEventTypeEnum_alcohol;
  @BuiltValueEnumConst(wireName: r'Alcohol-Served')
  static const EventUpdateAlcoholEventTypeEnum alcoholServed = _$eventUpdateAlcoholEventTypeEnum_alcoholServed;
  @BuiltValueEnumConst(wireName: r'None')
  static const EventUpdateAlcoholEventTypeEnum none = _$eventUpdateAlcoholEventTypeEnum_none;

  static Serializer<EventUpdateAlcoholEventTypeEnum> get serializer => _$eventUpdateAlcoholEventTypeEnumSerializer;

  const EventUpdateAlcoholEventTypeEnum._(String name): super(name);

  static BuiltSet<EventUpdateAlcoholEventTypeEnum> get values => _$eventUpdateAlcoholEventTypeEnumValues;
  static EventUpdateAlcoholEventTypeEnum valueOf(String name) => _$eventUpdateAlcoholEventTypeEnumValueOf(name);
}

class EventUpdateDotEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'None')
  static const EventUpdateDotEnum none = _$eventUpdateDotEnum_none;
  @BuiltValueEnumConst(wireName: r'Single')
  static const EventUpdateDotEnum single = _$eventUpdateDotEnum_single;
  @BuiltValueEnumConst(wireName: r'Double')
  static const EventUpdateDotEnum double_ = _$eventUpdateDotEnum_double_;

  static Serializer<EventUpdateDotEnum> get serializer => _$eventUpdateDotEnumSerializer;

  const EventUpdateDotEnum._(String name): super(name);

  static BuiltSet<EventUpdateDotEnum> get values => _$eventUpdateDotEnumValues;
  static EventUpdateDotEnum valueOf(String name) => _$eventUpdateDotEnumValueOf(name);
}

