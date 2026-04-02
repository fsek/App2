//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/admin_user_read_for_cafe_shifts.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_cafe_shift_read.g.dart';

/// AdminCafeShiftRead
///
/// Properties:
/// * [id] 
/// * [userId] 
/// * [startsAt] 
/// * [endsAt] 
/// * [user] 
@BuiltValue()
abstract class AdminCafeShiftRead implements Built<AdminCafeShiftRead, AdminCafeShiftReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'user_id')
  int? get userId;

  @BuiltValueField(wireName: r'starts_at')
  DateTime get startsAt;

  @BuiltValueField(wireName: r'ends_at')
  DateTime get endsAt;

  @BuiltValueField(wireName: r'user')
  AdminUserReadForCafeShifts? get user;

  AdminCafeShiftRead._();

  factory AdminCafeShiftRead([void updates(AdminCafeShiftReadBuilder b)]) = _$AdminCafeShiftRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCafeShiftReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCafeShiftRead> get serializer => _$AdminCafeShiftReadSerializer();
}

class _$AdminCafeShiftReadSerializer implements PrimitiveSerializer<AdminCafeShiftRead> {
  @override
  final Iterable<Type> types = const [AdminCafeShiftRead, _$AdminCafeShiftRead];

  @override
  final String wireName = r'AdminCafeShiftRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCafeShiftRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'user_id';
    yield object.userId == null ? null : serializers.serialize(
      object.userId,
      specifiedType: const FullType.nullable(int),
    );
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
    yield r'user';
    yield object.user == null ? null : serializers.serialize(
      object.user,
      specifiedType: const FullType.nullable(AdminUserReadForCafeShifts),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCafeShiftRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminCafeShiftReadBuilder result,
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
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
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
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AdminUserReadForCafeShifts),
          ) as AdminUserReadForCafeShifts?;
          if (valueDes == null) continue;
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
  AdminCafeShiftRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCafeShiftReadBuilder();
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

