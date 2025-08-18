//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cafe_shift_create_multi.g.dart';

/// CafeShiftCreateMulti
///
/// Properties:
/// * [startWeekStart] 
/// * [endWeekStart] 
@BuiltValue()
abstract class CafeShiftCreateMulti implements Built<CafeShiftCreateMulti, CafeShiftCreateMultiBuilder> {
  @BuiltValueField(wireName: r'startWeekStart')
  DateTime get startWeekStart;

  @BuiltValueField(wireName: r'endWeekStart')
  DateTime get endWeekStart;

  CafeShiftCreateMulti._();

  factory CafeShiftCreateMulti([void updates(CafeShiftCreateMultiBuilder b)]) = _$CafeShiftCreateMulti;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CafeShiftCreateMultiBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CafeShiftCreateMulti> get serializer => _$CafeShiftCreateMultiSerializer();
}

class _$CafeShiftCreateMultiSerializer implements PrimitiveSerializer<CafeShiftCreateMulti> {
  @override
  final Iterable<Type> types = const [CafeShiftCreateMulti, _$CafeShiftCreateMulti];

  @override
  final String wireName = r'CafeShiftCreateMulti';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CafeShiftCreateMulti object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'startWeekStart';
    yield serializers.serialize(
      object.startWeekStart,
      specifiedType: const FullType(DateTime),
    );
    yield r'endWeekStart';
    yield serializers.serialize(
      object.endWeekStart,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CafeShiftCreateMulti object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CafeShiftCreateMultiBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'startWeekStart':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startWeekStart = valueDes;
          break;
        case r'endWeekStart':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endWeekStart = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CafeShiftCreateMulti deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CafeShiftCreateMultiBuilder();
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

