//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/simple_user_read.dart';
import 'package:api_client/src/model/simple_council_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'room_booking_read.g.dart';

/// RoomBookingRead
///
/// Properties:
/// * [id] 
/// * [room] 
/// * [startTime] 
/// * [endTime] 
/// * [description] 
/// * [user] 
/// * [council] 
@BuiltValue()
abstract class RoomBookingRead implements Built<RoomBookingRead, RoomBookingReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'room')
  String get room;

  @BuiltValueField(wireName: r'start_time')
  DateTime get startTime;

  @BuiltValueField(wireName: r'end_time')
  DateTime get endTime;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'user')
  SimpleUserRead get user;

  @BuiltValueField(wireName: r'council')
  SimpleCouncilRead get council;

  RoomBookingRead._();

  factory RoomBookingRead([void updates(RoomBookingReadBuilder b)]) = _$RoomBookingRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoomBookingReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoomBookingRead> get serializer => _$RoomBookingReadSerializer();
}

class _$RoomBookingReadSerializer implements PrimitiveSerializer<RoomBookingRead> {
  @override
  final Iterable<Type> types = const [RoomBookingRead, _$RoomBookingRead];

  @override
  final String wireName = r'RoomBookingRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoomBookingRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'room';
    yield serializers.serialize(
      object.room,
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
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'user';
    yield serializers.serialize(
      object.user,
      specifiedType: const FullType(SimpleUserRead),
    );
    yield r'council';
    yield serializers.serialize(
      object.council,
      specifiedType: const FullType(SimpleCouncilRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RoomBookingRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoomBookingReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'room':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SimpleUserRead),
          ) as SimpleUserRead;
          result.user.replace(valueDes);
          break;
        case r'council':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SimpleCouncilRead),
          ) as SimpleCouncilRead;
          result.council.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RoomBookingRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoomBookingReadBuilder();
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

