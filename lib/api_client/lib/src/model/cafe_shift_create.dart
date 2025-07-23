//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cafe_shift_create.g.dart';

/// CafeShiftCreate
///
/// Properties:
/// * [startsAt] 
/// * [endsAt] 
@BuiltValue()
abstract class CafeShiftCreate implements Built<CafeShiftCreate, CafeShiftCreateBuilder> {
  @BuiltValueField(wireName: r'starts_at')
  DateTime get startsAt;

  @BuiltValueField(wireName: r'ends_at')
  DateTime get endsAt;

  CafeShiftCreate._();

  factory CafeShiftCreate([void updates(CafeShiftCreateBuilder b)]) = _$CafeShiftCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CafeShiftCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CafeShiftCreate> get serializer => _$CafeShiftCreateSerializer();
}

class _$CafeShiftCreateSerializer implements PrimitiveSerializer<CafeShiftCreate> {
  @override
  final Iterable<Type> types = const [CafeShiftCreate, _$CafeShiftCreate];

  @override
  final String wireName = r'CafeShiftCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CafeShiftCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    CafeShiftCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CafeShiftCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CafeShiftCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CafeShiftCreateBuilder();
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

