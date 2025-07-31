//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cafe_shift_update.g.dart';

/// CafeShiftUpdate
///
/// Properties:
/// * [startsAt] 
/// * [endsAt] 
/// * [userId] 
@BuiltValue()
abstract class CafeShiftUpdate implements Built<CafeShiftUpdate, CafeShiftUpdateBuilder> {
  @BuiltValueField(wireName: r'starts_at')
  DateTime? get startsAt;

  @BuiltValueField(wireName: r'ends_at')
  DateTime? get endsAt;

  @BuiltValueField(wireName: r'user_id')
  int? get userId;

  CafeShiftUpdate._();

  factory CafeShiftUpdate([void updates(CafeShiftUpdateBuilder b)]) = _$CafeShiftUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CafeShiftUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CafeShiftUpdate> get serializer => _$CafeShiftUpdateSerializer();
}

class _$CafeShiftUpdateSerializer implements PrimitiveSerializer<CafeShiftUpdate> {
  @override
  final Iterable<Type> types = const [CafeShiftUpdate, _$CafeShiftUpdate];

  @override
  final String wireName = r'CafeShiftUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CafeShiftUpdate object, {
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
    if (object.userId != null) {
      yield r'user_id';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CafeShiftUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CafeShiftUpdateBuilder result,
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
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CafeShiftUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CafeShiftUpdateBuilder();
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

