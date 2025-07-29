//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_user_member_multiple.g.dart';

/// UpdateUserMemberMultiple
///
/// Properties:
/// * [userId] 
/// * [isMember] 
@BuiltValue()
abstract class UpdateUserMemberMultiple implements Built<UpdateUserMemberMultiple, UpdateUserMemberMultipleBuilder> {
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  @BuiltValueField(wireName: r'is_member')
  bool get isMember;

  UpdateUserMemberMultiple._();

  factory UpdateUserMemberMultiple([void updates(UpdateUserMemberMultipleBuilder b)]) = _$UpdateUserMemberMultiple;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateUserMemberMultipleBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateUserMemberMultiple> get serializer => _$UpdateUserMemberMultipleSerializer();
}

class _$UpdateUserMemberMultipleSerializer implements PrimitiveSerializer<UpdateUserMemberMultiple> {
  @override
  final Iterable<Type> types = const [UpdateUserMemberMultiple, _$UpdateUserMemberMultiple];

  @override
  final String wireName = r'UpdateUserMemberMultiple';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateUserMemberMultiple object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(int),
    );
    yield r'is_member';
    yield serializers.serialize(
      object.isMember,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateUserMemberMultiple object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateUserMemberMultipleBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'is_member':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isMember = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateUserMemberMultiple deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateUserMemberMultipleBuilder();
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

