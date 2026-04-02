//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/admin_user_read_for_car_bookings.dart';
import 'package:api_client/src/model/simple_council_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_car_booking_read.g.dart';

/// AdminCarBookingRead
///
/// Properties:
/// * [bookingId] 
/// * [description] 
/// * [startTime] 
/// * [endTime] 
/// * [confirmed] 
/// * [personal] 
/// * [councilId] 
/// * [council] 
/// * [user] 
@BuiltValue()
abstract class AdminCarBookingRead implements Built<AdminCarBookingRead, AdminCarBookingReadBuilder> {
  @BuiltValueField(wireName: r'booking_id')
  int get bookingId;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'start_time')
  DateTime get startTime;

  @BuiltValueField(wireName: r'end_time')
  DateTime get endTime;

  @BuiltValueField(wireName: r'confirmed')
  bool get confirmed;

  @BuiltValueField(wireName: r'personal')
  bool get personal;

  @BuiltValueField(wireName: r'council_id')
  int? get councilId;

  @BuiltValueField(wireName: r'council')
  SimpleCouncilRead? get council;

  @BuiltValueField(wireName: r'user')
  AdminUserReadForCarBookings get user;

  AdminCarBookingRead._();

  factory AdminCarBookingRead([void updates(AdminCarBookingReadBuilder b)]) = _$AdminCarBookingRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCarBookingReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCarBookingRead> get serializer => _$AdminCarBookingReadSerializer();
}

class _$AdminCarBookingReadSerializer implements PrimitiveSerializer<AdminCarBookingRead> {
  @override
  final Iterable<Type> types = const [AdminCarBookingRead, _$AdminCarBookingRead];

  @override
  final String wireName = r'AdminCarBookingRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCarBookingRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'booking_id';
    yield serializers.serialize(
      object.bookingId,
      specifiedType: const FullType(int),
    );
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
    yield r'confirmed';
    yield serializers.serialize(
      object.confirmed,
      specifiedType: const FullType(bool),
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
    if (object.council != null) {
      yield r'council';
      yield serializers.serialize(
        object.council,
        specifiedType: const FullType.nullable(SimpleCouncilRead),
      );
    }
    yield r'user';
    yield serializers.serialize(
      object.user,
      specifiedType: const FullType(AdminUserReadForCarBookings),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCarBookingRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminCarBookingReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'booking_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.bookingId = valueDes;
          break;
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
        case r'confirmed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.confirmed = valueDes;
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
        case r'council':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SimpleCouncilRead),
          ) as SimpleCouncilRead?;
          if (valueDes == null) continue;
          result.council.replace(valueDes);
          break;
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminUserReadForCarBookings),
          ) as AdminUserReadForCarBookings;
          result.user.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminCarBookingRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCarBookingReadBuilder();
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

