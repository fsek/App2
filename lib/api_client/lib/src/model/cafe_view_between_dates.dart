//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cafe_view_between_dates.g.dart';

/// CafeViewBetweenDates
///
/// Properties:
/// * [startDate] 
/// * [endDate] 
@BuiltValue()
abstract class CafeViewBetweenDates implements Built<CafeViewBetweenDates, CafeViewBetweenDatesBuilder> {
  @BuiltValueField(wireName: r'start_date')
  DateTime get startDate;

  @BuiltValueField(wireName: r'end_date')
  DateTime get endDate;

  CafeViewBetweenDates._();

  factory CafeViewBetweenDates([void updates(CafeViewBetweenDatesBuilder b)]) = _$CafeViewBetweenDates;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CafeViewBetweenDatesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CafeViewBetweenDates> get serializer => _$CafeViewBetweenDatesSerializer();
}

class _$CafeViewBetweenDatesSerializer implements PrimitiveSerializer<CafeViewBetweenDates> {
  @override
  final Iterable<Type> types = const [CafeViewBetweenDates, _$CafeViewBetweenDates];

  @override
  final String wireName = r'CafeViewBetweenDates';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CafeViewBetweenDates object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'start_date';
    yield serializers.serialize(
      object.startDate,
      specifiedType: const FullType(DateTime),
    );
    yield r'end_date';
    yield serializers.serialize(
      object.endDate,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CafeViewBetweenDates object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CafeViewBetweenDatesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'start_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startDate = valueDes;
          break;
        case r'end_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CafeViewBetweenDates deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CafeViewBetweenDatesBuilder();
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

