//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_user_member.g.dart';

/// UpdateUserMember
///
/// Properties:
/// * [isMember] 
@BuiltValue()
abstract class UpdateUserMember implements Built<UpdateUserMember, UpdateUserMemberBuilder> {
  @BuiltValueField(wireName: r'is_member')
  bool get isMember;

  UpdateUserMember._();

  factory UpdateUserMember([void updates(UpdateUserMemberBuilder b)]) = _$UpdateUserMember;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateUserMemberBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateUserMember> get serializer => _$UpdateUserMemberSerializer();
}

class _$UpdateUserMemberSerializer implements PrimitiveSerializer<UpdateUserMember> {
  @override
  final Iterable<Type> types = const [UpdateUserMember, _$UpdateUserMember];

  @override
  final String wireName = r'UpdateUserMember';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateUserMember object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'is_member';
    yield serializers.serialize(
      object.isMember,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateUserMember object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateUserMemberBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  UpdateUserMember deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateUserMemberBuilder();
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

