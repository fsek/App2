//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'car_booking_create.g.dart';

/// CarBookingCreate
///
/// Properties:
/// * [description] 
/// * [startTime] 
/// * [endTime] 
/// * [personal] 
/// * [councilId] 
@BuiltValue()
abstract class CarBookingCreate implements Built<CarBookingCreate, CarBookingCreateBuilder> {
  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'start_time')
  DateTime get startTime;

  @BuiltValueField(wireName: r'end_time')
  DateTime get endTime;

  @BuiltValueField(wireName: r'personal')
  bool get personal;

  @BuiltValueField(wireName: r'council_id')
  int? get councilId;

  CarBookingCreate._();

  factory CarBookingCreate([void updates(CarBookingCreateBuilder b)]) = _$CarBookingCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CarBookingCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CarBookingCreate> get serializer => _$CarBookingCreateSerializer();
}

class _$CarBookingCreateSerializer implements PrimitiveSerializer<CarBookingCreate> {
  @override
  final Iterable<Type> types = const [CarBookingCreate, _$CarBookingCreate];

  @override
  final String wireName = r'CarBookingCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CarBookingCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'start_time';
    yield serializers.serialize(
      object.startTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'end_time';
    yield serializers.serialize(
      object.endTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'personal';
    yield serializers.serialize(
      object.personal,
      specifiedType: const FullType(bool),
    );
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
    CarBookingCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CarBookingCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'start_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startTime = valueDes;
          break;
        case r'end_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endTime = valueDes;
          break;
        case r'personal':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
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
  CarBookingCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CarBookingCreateBuilder();
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

