//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'car_booking_update.g.dart';

/// CarBookingUpdate
///
/// Properties:
/// * [description] 
/// * [startTime] 
/// * [endTime] 
/// * [confirmed] 
/// * [personal] 
/// * [councilId] 
@BuiltValue()
abstract class CarBookingUpdate implements Built<CarBookingUpdate, CarBookingUpdateBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'start_time')
  DateTime? get startTime;

  @BuiltValueField(wireName: r'end_time')
  DateTime? get endTime;

  @BuiltValueField(wireName: r'confirmed')
  bool? get confirmed;

  @BuiltValueField(wireName: r'personal')
  bool? get personal;

  @BuiltValueField(wireName: r'council_id')
  int? get councilId;

  CarBookingUpdate._();

  factory CarBookingUpdate([void updates(CarBookingUpdateBuilder b)]) = _$CarBookingUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CarBookingUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CarBookingUpdate> get serializer => _$CarBookingUpdateSerializer();
}

class _$CarBookingUpdateSerializer implements PrimitiveSerializer<CarBookingUpdate> {
  @override
  final Iterable<Type> types = const [CarBookingUpdate, _$CarBookingUpdate];

  @override
  final String wireName = r'CarBookingUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CarBookingUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.startTime != null) {
      yield r'start_time';
      yield serializers.serialize(
        object.startTime,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.endTime != null) {
      yield r'end_time';
      yield serializers.serialize(
        object.endTime,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.confirmed != null) {
      yield r'confirmed';
      yield serializers.serialize(
        object.confirmed,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.personal != null) {
      yield r'personal';
      yield serializers.serialize(
        object.personal,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.councilId != null) {
      yield r'council_id';
      yield serializers.serialize(
        object.councilId,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CarBookingUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CarBookingUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'start_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.startTime = valueDes;
          break;
        case r'end_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.endTime = valueDes;
          break;
        case r'confirmed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.confirmed = valueDes;
          break;
        case r'personal':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.personal = valueDes;
          break;
        case r'council_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.councilId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CarBookingUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CarBookingUpdateBuilder();
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

