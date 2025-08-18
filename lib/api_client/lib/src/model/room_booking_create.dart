//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'room_booking_create.g.dart';

/// RoomBookingCreate
///
/// Properties:
/// * [room] 
/// * [startTime] 
/// * [endTime] 
/// * [description] 
/// * [councilId] 
/// * [recurIntervalDays] 
/// * [recurUntil] 
@BuiltValue()
abstract class RoomBookingCreate implements Built<RoomBookingCreate, RoomBookingCreateBuilder> {
  @BuiltValueField(wireName: r'room')
  RoomBookingCreateRoomEnum get room;
  // enum roomEnum {  LC,  Alumni,  SK,  };

  @BuiltValueField(wireName: r'start_time')
  DateTime get startTime;

  @BuiltValueField(wireName: r'end_time')
  DateTime get endTime;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'council_id')
  int get councilId;

  @BuiltValueField(wireName: r'recur_interval_days')
  int? get recurIntervalDays;

  @BuiltValueField(wireName: r'recur_until')
  DateTime? get recurUntil;

  RoomBookingCreate._();

  factory RoomBookingCreate([void updates(RoomBookingCreateBuilder b)]) = _$RoomBookingCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoomBookingCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoomBookingCreate> get serializer => _$RoomBookingCreateSerializer();
}

class _$RoomBookingCreateSerializer implements PrimitiveSerializer<RoomBookingCreate> {
  @override
  final Iterable<Type> types = const [RoomBookingCreate, _$RoomBookingCreate];

  @override
  final String wireName = r'RoomBookingCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoomBookingCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'room';
    yield serializers.serialize(
      object.room,
      specifiedType: const FullType(RoomBookingCreateRoomEnum),
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
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'council_id';
    yield serializers.serialize(
      object.councilId,
      specifiedType: const FullType(int),
    );
    if (object.recurIntervalDays != null) {
      yield r'recur_interval_days';
      yield serializers.serialize(
        object.recurIntervalDays,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.recurUntil != null) {
      yield r'recur_until';
      yield serializers.serialize(
        object.recurUntil,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RoomBookingCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoomBookingCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'room':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RoomBookingCreateRoomEnum),
          ) as RoomBookingCreateRoomEnum;
          result.room = valueDes;
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'council_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.councilId = valueDes;
          break;
        case r'recur_interval_days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.recurIntervalDays = valueDes;
          break;
        case r'recur_until':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.recurUntil = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RoomBookingCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoomBookingCreateBuilder();
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

class RoomBookingCreateRoomEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'LC')
  static const RoomBookingCreateRoomEnum LC = _$roomBookingCreateRoomEnum_LC;
  @BuiltValueEnumConst(wireName: r'Alumni')
  static const RoomBookingCreateRoomEnum alumni = _$roomBookingCreateRoomEnum_alumni;
  @BuiltValueEnumConst(wireName: r'SK')
  static const RoomBookingCreateRoomEnum SK = _$roomBookingCreateRoomEnum_SK;

  static Serializer<RoomBookingCreateRoomEnum> get serializer => _$roomBookingCreateRoomEnumSerializer;

  const RoomBookingCreateRoomEnum._(String name): super(name);

  static BuiltSet<RoomBookingCreateRoomEnum> get values => _$roomBookingCreateRoomEnumValues;
  static RoomBookingCreateRoomEnum valueOf(String name) => _$roomBookingCreateRoomEnumValueOf(name);
}

