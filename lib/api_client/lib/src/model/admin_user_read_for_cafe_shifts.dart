//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_user_read_for_cafe_shifts.g.dart';

/// AdminUserReadForCafeShifts
///
/// Properties:
/// * [id] 
/// * [firstName] 
/// * [lastName] 
/// * [email] 
/// * [telephoneNumber] 
/// * [stilId] 
@BuiltValue()
abstract class AdminUserReadForCafeShifts implements Built<AdminUserReadForCafeShifts, AdminUserReadForCafeShiftsBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'first_name')
  String get firstName;

  @BuiltValueField(wireName: r'last_name')
  String get lastName;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'telephone_number')
  String get telephoneNumber;

  @BuiltValueField(wireName: r'stil_id')
  String? get stilId;

  AdminUserReadForCafeShifts._();

  factory AdminUserReadForCafeShifts([void updates(AdminUserReadForCafeShiftsBuilder b)]) = _$AdminUserReadForCafeShifts;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminUserReadForCafeShiftsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminUserReadForCafeShifts> get serializer => _$AdminUserReadForCafeShiftsSerializer();
}

class _$AdminUserReadForCafeShiftsSerializer implements PrimitiveSerializer<AdminUserReadForCafeShifts> {
  @override
  final Iterable<Type> types = const [AdminUserReadForCafeShifts, _$AdminUserReadForCafeShifts];

  @override
  final String wireName = r'AdminUserReadForCafeShifts';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminUserReadForCafeShifts object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'first_name';
    yield serializers.serialize(
      object.firstName,
      specifiedType: const FullType(String),
    );
    yield r'last_name';
    yield serializers.serialize(
      object.lastName,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'telephone_number';
    yield serializers.serialize(
      object.telephoneNumber,
      specifiedType: const FullType(String),
    );
    yield r'stil_id';
    yield object.stilId == null ? null : serializers.serialize(
      object.stilId,
      specifiedType: const FullType.nullable(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminUserReadForCafeShifts object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminUserReadForCafeShiftsBuilder result,
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
        case r'first_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.firstName = valueDes;
          break;
        case r'last_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastName = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'telephone_number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.telephoneNumber = valueDes;
          break;
        case r'stil_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.stilId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminUserReadForCafeShifts deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminUserReadForCafeShiftsBuilder();
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

