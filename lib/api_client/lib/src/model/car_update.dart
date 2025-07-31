//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'car_update.g.dart';

/// CarUpdate
///
/// Properties:
/// * [description] 
/// * [startTime] 
/// * [endTime] 
@BuiltValue()
abstract class CarUpdate implements Built<CarUpdate, CarUpdateBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'start_time')
  DateTime? get startTime;

  @BuiltValueField(wireName: r'end_time')
  DateTime? get endTime;

  CarUpdate._();

  factory CarUpdate([void updates(CarUpdateBuilder b)]) = _$CarUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CarUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CarUpdate> get serializer => _$CarUpdateSerializer();
}

class _$CarUpdateSerializer implements PrimitiveSerializer<CarUpdate> {
  @override
  final Iterable<Type> types = const [CarUpdate, _$CarUpdate];

  @override
  final String wireName = r'CarUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CarUpdate object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    CarUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CarUpdateBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CarUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CarUpdateBuilder();
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

