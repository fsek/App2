//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_add_user.g.dart';

/// GroupAddUser
///
/// Properties:
/// * [userId] 
/// * [groupUserType] 
@BuiltValue()
abstract class GroupAddUser implements Built<GroupAddUser, GroupAddUserBuilder> {
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  @BuiltValueField(wireName: r'group_user_type')
  GroupAddUserGroupUserTypeEnum get groupUserType;
  // enum groupUserTypeEnum {  Mentor,  Mentee,  Default,  };

  GroupAddUser._();

  factory GroupAddUser([void updates(GroupAddUserBuilder b)]) = _$GroupAddUser;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupAddUserBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupAddUser> get serializer => _$GroupAddUserSerializer();
}

class _$GroupAddUserSerializer implements PrimitiveSerializer<GroupAddUser> {
  @override
  final Iterable<Type> types = const [GroupAddUser, _$GroupAddUser];

  @override
  final String wireName = r'GroupAddUser';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupAddUser object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(int),
    );
    yield r'group_user_type';
    yield serializers.serialize(
      object.groupUserType,
      specifiedType: const FullType(GroupAddUserGroupUserTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupAddUser object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupAddUserBuilder result,
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
        case r'group_user_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GroupAddUserGroupUserTypeEnum),
          ) as GroupAddUserGroupUserTypeEnum;
          result.groupUserType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupAddUser deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupAddUserBuilder();
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

class GroupAddUserGroupUserTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Mentor')
  static const GroupAddUserGroupUserTypeEnum mentor = _$groupAddUserGroupUserTypeEnum_mentor;
  @BuiltValueEnumConst(wireName: r'Mentee')
  static const GroupAddUserGroupUserTypeEnum mentee = _$groupAddUserGroupUserTypeEnum_mentee;
  @BuiltValueEnumConst(wireName: r'Default')
  static const GroupAddUserGroupUserTypeEnum default_ = _$groupAddUserGroupUserTypeEnum_default_;

  static Serializer<GroupAddUserGroupUserTypeEnum> get serializer => _$groupAddUserGroupUserTypeEnumSerializer;

  const GroupAddUserGroupUserTypeEnum._(String name): super(name);

  static BuiltSet<GroupAddUserGroupUserTypeEnum> get values => _$groupAddUserGroupUserTypeEnumValues;
  static GroupAddUserGroupUserTypeEnum valueOf(String name) => _$groupAddUserGroupUserTypeEnumValueOf(name);
}

