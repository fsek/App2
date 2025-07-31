//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/user_in_group_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_user_read.g.dart';

/// GroupUserRead
///
/// Properties:
/// * [user] 
/// * [groupUserType] 
@BuiltValue()
abstract class GroupUserRead implements Built<GroupUserRead, GroupUserReadBuilder> {
  @BuiltValueField(wireName: r'user')
  UserInGroupRead get user;

  @BuiltValueField(wireName: r'group_user_type')
  GroupUserReadGroupUserTypeEnum get groupUserType;
  // enum groupUserTypeEnum {  Mentor,  Mentee,  Default,  };

  GroupUserRead._();

  factory GroupUserRead([void updates(GroupUserReadBuilder b)]) = _$GroupUserRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupUserReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupUserRead> get serializer => _$GroupUserReadSerializer();
}

class _$GroupUserReadSerializer implements PrimitiveSerializer<GroupUserRead> {
  @override
  final Iterable<Type> types = const [GroupUserRead, _$GroupUserRead];

  @override
  final String wireName = r'GroupUserRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupUserRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user';
    yield serializers.serialize(
      object.user,
      specifiedType: const FullType(UserInGroupRead),
    );
    yield r'group_user_type';
    yield serializers.serialize(
      object.groupUserType,
      specifiedType: const FullType(GroupUserReadGroupUserTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupUserRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupUserReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserInGroupRead),
          ) as UserInGroupRead;
          result.user.replace(valueDes);
          break;
        case r'group_user_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GroupUserReadGroupUserTypeEnum),
          ) as GroupUserReadGroupUserTypeEnum;
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
  GroupUserRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupUserReadBuilder();
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

class GroupUserReadGroupUserTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Mentor')
  static const GroupUserReadGroupUserTypeEnum mentor = _$groupUserReadGroupUserTypeEnum_mentor;
  @BuiltValueEnumConst(wireName: r'Mentee')
  static const GroupUserReadGroupUserTypeEnum mentee = _$groupUserReadGroupUserTypeEnum_mentee;
  @BuiltValueEnumConst(wireName: r'Default')
  static const GroupUserReadGroupUserTypeEnum default_ = _$groupUserReadGroupUserTypeEnum_default_;

  static Serializer<GroupUserReadGroupUserTypeEnum> get serializer => _$groupUserReadGroupUserTypeEnumSerializer;

  const GroupUserReadGroupUserTypeEnum._(String name): super(name);

  static BuiltSet<GroupUserReadGroupUserTypeEnum> get values => _$groupUserReadGroupUserTypeEnumValues;
  static GroupUserReadGroupUserTypeEnum valueOf(String name) => _$groupUserReadGroupUserTypeEnumValueOf(name);
}

