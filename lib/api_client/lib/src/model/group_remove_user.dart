//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_remove_user.g.dart';

/// GroupRemoveUser
///
/// Properties:
/// * [userId] 
@BuiltValue()
abstract class GroupRemoveUser implements Built<GroupRemoveUser, GroupRemoveUserBuilder> {
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  GroupRemoveUser._();

  factory GroupRemoveUser([void updates(GroupRemoveUserBuilder b)]) = _$GroupRemoveUser;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupRemoveUserBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupRemoveUser> get serializer => _$GroupRemoveUserSerializer();
}

class _$GroupRemoveUserSerializer implements PrimitiveSerializer<GroupRemoveUser> {
  @override
  final Iterable<Type> types = const [GroupRemoveUser, _$GroupRemoveUser];

  @override
  final String wireName = r'GroupRemoveUser';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupRemoveUser object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupRemoveUser object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupRemoveUserBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupRemoveUser deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupRemoveUserBuilder();
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

