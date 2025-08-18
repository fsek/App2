//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'room_bookings_between_dates.g.dart';

/// RoomBookingsBetweenDates
///
/// Properties:
/// * [startTime] 
/// * [endTime] 
@BuiltValue()
abstract class RoomBookingsBetweenDates implements Built<RoomBookingsBetweenDates, RoomBookingsBetweenDatesBuilder> {
  @BuiltValueField(wireName: r'start_time')
  DateTime get startTime;

  @BuiltValueField(wireName: r'end_time')
  DateTime get endTime;

  RoomBookingsBetweenDates._();

  factory RoomBookingsBetweenDates([void updates(RoomBookingsBetweenDatesBuilder b)]) = _$RoomBookingsBetweenDates;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoomBookingsBetweenDatesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoomBookingsBetweenDates> get serializer => _$RoomBookingsBetweenDatesSerializer();
}

class _$RoomBookingsBetweenDatesSerializer implements PrimitiveSerializer<RoomBookingsBetweenDates> {
  @override
  final Iterable<Type> types = const [RoomBookingsBetweenDates, _$RoomBookingsBetweenDates];

  @override
  final String wireName = r'RoomBookingsBetweenDates';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoomBookingsBetweenDates object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    RoomBookingsBetweenDates object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoomBookingsBetweenDatesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RoomBookingsBetweenDates deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoomBookingsBetweenDatesBuilder();
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

