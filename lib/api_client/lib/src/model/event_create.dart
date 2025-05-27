//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_create.g.dart';

/// EventCreate
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
/// * [priorities] 
/// * [allDay] 
/// * [signupNotOpenedYet] 
/// * [recurring] 
/// * [drink] 
/// * [food] 
/// * [cash] 
/// * [closed] 
/// * [canSignup] 
/// * [drinkPackage] 
/// * [isNollningEvent] 
@BuiltValue()
abstract class EventCreate implements Built<EventCreate, EventCreateBuilder> {
  @BuiltValueField(wireName: r'council_id')
  int get councilId;

  @BuiltValueField(wireName: r'starts_at')
  DateTime get startsAt;

  @BuiltValueField(wireName: r'ends_at')
  DateTime get endsAt;

  @BuiltValueField(wireName: r'signup_start')
  DateTime get signupStart;

  @BuiltValueField(wireName: r'signup_end')
  DateTime get signupEnd;

  @BuiltValueField(wireName: r'title_sv')
  String get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String get titleEn;

  @BuiltValueField(wireName: r'description_sv')
  String get descriptionSv;

  @BuiltValueField(wireName: r'description_en')
  String get descriptionEn;

  @BuiltValueField(wireName: r'location')
  String get location;

  @BuiltValueField(wireName: r'max_event_users')
  int get maxEventUsers;

  @BuiltValueField(wireName: r'priorities')
  BuiltList<EventCreatePrioritiesEnum> get priorities;
  // enum prioritiesEnum {  photographer,  ordförande,  dinmamma,  };

  @BuiltValueField(wireName: r'all_day')
  bool get allDay;

  @BuiltValueField(wireName: r'signup_not_opened_yet')
  bool get signupNotOpenedYet;

  @BuiltValueField(wireName: r'recurring')
  bool get recurring;

  @BuiltValueField(wireName: r'drink')
  bool get drink;

  @BuiltValueField(wireName: r'food')
  bool get food;

  @BuiltValueField(wireName: r'cash')
  bool get cash;

  @BuiltValueField(wireName: r'closed')
  bool get closed;

  @BuiltValueField(wireName: r'can_signup')
  bool get canSignup;

  @BuiltValueField(wireName: r'drink_package')
  bool get drinkPackage;

  @BuiltValueField(wireName: r'is_nollning_event')
  bool get isNollningEvent;

  EventCreate._();

  factory EventCreate([void updates(EventCreateBuilder b)]) = _$EventCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventCreate> get serializer => _$EventCreateSerializer();
}

class _$EventCreateSerializer implements PrimitiveSerializer<EventCreate> {
  @override
  final Iterable<Type> types = const [EventCreate, _$EventCreate];

  @override
  final String wireName = r'EventCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'council_id';
    yield serializers.serialize(
      object.councilId,
      specifiedType: const FullType(int),
    );
    yield r'starts_at';
    yield serializers.serialize(
      object.startsAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'ends_at';
    yield serializers.serialize(
      object.endsAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'signup_start';
    yield serializers.serialize(
      object.signupStart,
      specifiedType: const FullType(DateTime),
    );
    yield r'signup_end';
    yield serializers.serialize(
      object.signupEnd,
      specifiedType: const FullType(DateTime),
    );
    yield r'title_sv';
    yield serializers.serialize(
      object.titleSv,
      specifiedType: const FullType(String),
    );
    yield r'title_en';
    yield serializers.serialize(
      object.titleEn,
      specifiedType: const FullType(String),
    );
    yield r'description_sv';
    yield serializers.serialize(
      object.descriptionSv,
      specifiedType: const FullType(String),
    );
    yield r'description_en';
    yield serializers.serialize(
      object.descriptionEn,
      specifiedType: const FullType(String),
    );
    yield r'location';
    yield serializers.serialize(
      object.location,
      specifiedType: const FullType(String),
    );
    yield r'max_event_users';
    yield serializers.serialize(
      object.maxEventUsers,
      specifiedType: const FullType(int),
    );
    yield r'priorities';
    yield serializers.serialize(
      object.priorities,
      specifiedType: const FullType(BuiltList, [FullType(EventCreatePrioritiesEnum)]),
    );
    yield r'all_day';
    yield serializers.serialize(
      object.allDay,
      specifiedType: const FullType(bool),
    );
    yield r'signup_not_opened_yet';
    yield serializers.serialize(
      object.signupNotOpenedYet,
      specifiedType: const FullType(bool),
    );
    yield r'recurring';
    yield serializers.serialize(
      object.recurring,
      specifiedType: const FullType(bool),
    );
    yield r'drink';
    yield serializers.serialize(
      object.drink,
      specifiedType: const FullType(bool),
    );
    yield r'food';
    yield serializers.serialize(
      object.food,
      specifiedType: const FullType(bool),
    );
    yield r'cash';
    yield serializers.serialize(
      object.cash,
      specifiedType: const FullType(bool),
    );
    yield r'closed';
    yield serializers.serialize(
      object.closed,
      specifiedType: const FullType(bool),
    );
    yield r'can_signup';
    yield serializers.serialize(
      object.canSignup,
      specifiedType: const FullType(bool),
    );
    yield r'drink_package';
    yield serializers.serialize(
      object.drinkPackage,
      specifiedType: const FullType(bool),
    );
    yield r'is_nollning_event';
    yield serializers.serialize(
      object.isNollningEvent,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EventCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'council_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.councilId = valueDes;
          break;
        case r'starts_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startsAt = valueDes;
          break;
        case r'ends_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endsAt = valueDes;
          break;
        case r'signup_start':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.signupStart = valueDes;
          break;
        case r'signup_end':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.signupEnd = valueDes;
          break;
        case r'title_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.titleSv = valueDes;
          break;
        case r'title_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.titleEn = valueDes;
          break;
        case r'description_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.descriptionSv = valueDes;
          break;
        case r'description_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.descriptionEn = valueDes;
          break;
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.location = valueDes;
          break;
        case r'max_event_users':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxEventUsers = valueDes;
          break;
        case r'priorities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(EventCreatePrioritiesEnum)]),
          ) as BuiltList<EventCreatePrioritiesEnum>;
          result.priorities.replace(valueDes);
          break;
        case r'all_day':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.allDay = valueDes;
          break;
        case r'signup_not_opened_yet':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.signupNotOpenedYet = valueDes;
          break;
        case r'recurring':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.recurring = valueDes;
          break;
        case r'drink':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.drink = valueDes;
          break;
        case r'food':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.food = valueDes;
          break;
        case r'cash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.cash = valueDes;
          break;
        case r'closed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.closed = valueDes;
          break;
        case r'can_signup':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.canSignup = valueDes;
          break;
        case r'drink_package':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.drinkPackage = valueDes;
          break;
        case r'is_nollning_event':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isNollningEvent = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventCreateBuilder();
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

class EventCreatePrioritiesEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'photographer')
  static const EventCreatePrioritiesEnum photographer = _$eventCreatePrioritiesEnum_photographer;
  @BuiltValueEnumConst(wireName: r'ordförande')
  static const EventCreatePrioritiesEnum ordfrande = _$eventCreatePrioritiesEnum_ordfrande;
  @BuiltValueEnumConst(wireName: r'dinmamma')
  static const EventCreatePrioritiesEnum dinmamma = _$eventCreatePrioritiesEnum_dinmamma;

  static Serializer<EventCreatePrioritiesEnum> get serializer => _$eventCreatePrioritiesEnumSerializer;

  const EventCreatePrioritiesEnum._(String name): super(name);

  static BuiltSet<EventCreatePrioritiesEnum> get values => _$eventCreatePrioritiesEnumValues;
  static EventCreatePrioritiesEnum valueOf(String name) => _$eventCreatePrioritiesEnumValueOf(name);
}

