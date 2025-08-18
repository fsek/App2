//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/group_user_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_read.g.dart';

/// GroupRead
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [groupType] 
/// * [groupUsers] 
@BuiltValue()
abstract class GroupRead implements Built<GroupRead, GroupReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'group_type')
  GroupReadGroupTypeEnum get groupType;
  // enum groupTypeEnum {  Mentor,  Mission,  Default,  Committee,  };

  @BuiltValueField(wireName: r'group_users')
  BuiltList<GroupUserRead> get groupUsers;

  GroupRead._();

  factory GroupRead([void updates(GroupReadBuilder b)]) = _$GroupRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupRead> get serializer => _$GroupReadSerializer();
}

class _$GroupReadSerializer implements PrimitiveSerializer<GroupRead> {
  @override
  final Iterable<Type> types = const [GroupRead, _$GroupRead];

  @override
  final String wireName = r'GroupRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'group_type';
    yield serializers.serialize(
      object.groupType,
      specifiedType: const FullType(GroupReadGroupTypeEnum),
    );
    yield r'group_users';
    yield serializers.serialize(
      object.groupUsers,
      specifiedType: const FullType(BuiltList, [FullType(GroupUserRead)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupReadBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'group_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GroupReadGroupTypeEnum),
          ) as GroupReadGroupTypeEnum;
          result.groupType = valueDes;
          break;
        case r'group_users':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(GroupUserRead)]),
          ) as BuiltList<GroupUserRead>;
          result.groupUsers.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupReadBuilder();
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

class GroupReadGroupTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Mentor')
  static const GroupReadGroupTypeEnum mentor = _$groupReadGroupTypeEnum_mentor;
  @BuiltValueEnumConst(wireName: r'Mission')
  static const GroupReadGroupTypeEnum mission = _$groupReadGroupTypeEnum_mission;
  @BuiltValueEnumConst(wireName: r'Default')
  static const GroupReadGroupTypeEnum default_ = _$groupReadGroupTypeEnum_default_;
  @BuiltValueEnumConst(wireName: r'Committee')
  static const GroupReadGroupTypeEnum committee = _$groupReadGroupTypeEnum_committee;

  static Serializer<GroupReadGroupTypeEnum> get serializer => _$groupReadGroupTypeEnumSerializer;

  const GroupReadGroupTypeEnum._(String name): super(name);

  static BuiltSet<GroupReadGroupTypeEnum> get values => _$groupReadGroupTypeEnumValues;
  static GroupReadGroupTypeEnum valueOf(String name) => _$groupReadGroupTypeEnumValueOf(name);
}

