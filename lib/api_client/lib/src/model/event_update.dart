//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_update.g.dart';

/// EventUpdate
///
/// Properties:
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
/// * [signupNotOpenedYet] 
/// * [recurring] 
/// * [drink] 
/// * [food] 
/// * [cash] 
/// * [closed] 
/// * [canSignup] 
/// * [drinkPackage] 
@BuiltValue()
abstract class EventUpdate implements Built<EventUpdate, EventUpdateBuilder> {
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
  String get location;

  @BuiltValueField(wireName: r'max_event_users')
  int? get maxEventUsers;

  @BuiltValueField(wireName: r'all_day')
  bool? get allDay;

  @BuiltValueField(wireName: r'signup_not_opened_yet')
  bool? get signupNotOpenedYet;

  @BuiltValueField(wireName: r'recurring')
  bool? get recurring;

  @BuiltValueField(wireName: r'drink')
  bool? get drink;

  @BuiltValueField(wireName: r'food')
  bool? get food;

  @BuiltValueField(wireName: r'cash')
  bool? get cash;

  @BuiltValueField(wireName: r'closed')
  bool? get closed;

  @BuiltValueField(wireName: r'can_signup')
  bool? get canSignup;

  @BuiltValueField(wireName: r'drink_package')
  bool? get drinkPackage;

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
    yield r'location';
    yield serializers.serialize(
      object.location,
      specifiedType: const FullType(String),
    );
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
    if (object.signupNotOpenedYet != null) {
      yield r'signup_not_opened_yet';
      yield serializers.serialize(
        object.signupNotOpenedYet,
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
    if (object.drink != null) {
      yield r'drink';
      yield serializers.serialize(
        object.drink,
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
    if (object.cash != null) {
      yield r'cash';
      yield serializers.serialize(
        object.cash,
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
            specifiedType: const FullType(String),
          ) as String;
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
        case r'signup_not_opened_yet':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.signupNotOpenedYet = valueDes;
          break;
        case r'recurring':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.recurring = valueDes;
          break;
        case r'drink':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.drink = valueDes;
          break;
        case r'food':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.food = valueDes;
          break;
        case r'cash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.cash = valueDes;
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

