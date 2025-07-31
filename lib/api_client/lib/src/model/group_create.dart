//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_create.g.dart';

/// GroupCreate
///
/// Properties:
/// * [name] 
/// * [groupType] 
@BuiltValue()
abstract class GroupCreate implements Built<GroupCreate, GroupCreateBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'group_type')
  GroupCreateGroupTypeEnum get groupType;
  // enum groupTypeEnum {  Mentor,  Mission,  Default,  Committee,  };

  GroupCreate._();

  factory GroupCreate([void updates(GroupCreateBuilder b)]) = _$GroupCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupCreate> get serializer => _$GroupCreateSerializer();
}

class _$GroupCreateSerializer implements PrimitiveSerializer<GroupCreate> {
  @override
  final Iterable<Type> types = const [GroupCreate, _$GroupCreate];

  @override
  final String wireName = r'GroupCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'group_type';
    yield serializers.serialize(
      object.groupType,
      specifiedType: const FullType(GroupCreateGroupTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
            specifiedType: const FullType(GroupCreateGroupTypeEnum),
          ) as GroupCreateGroupTypeEnum;
          result.groupType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupCreateBuilder();
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

class GroupCreateGroupTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Mentor')
  static const GroupCreateGroupTypeEnum mentor = _$groupCreateGroupTypeEnum_mentor;
  @BuiltValueEnumConst(wireName: r'Mission')
  static const GroupCreateGroupTypeEnum mission = _$groupCreateGroupTypeEnum_mission;
  @BuiltValueEnumConst(wireName: r'Default')
  static const GroupCreateGroupTypeEnum default_ = _$groupCreateGroupTypeEnum_default_;
  @BuiltValueEnumConst(wireName: r'Committee')
  static const GroupCreateGroupTypeEnum committee = _$groupCreateGroupTypeEnum_committee;

  static Serializer<GroupCreateGroupTypeEnum> get serializer => _$groupCreateGroupTypeEnumSerializer;

  const GroupCreateGroupTypeEnum._(String name): super(name);

  static BuiltSet<GroupCreateGroupTypeEnum> get values => _$groupCreateGroupTypeEnumValues;
  static GroupCreateGroupTypeEnum valueOf(String name) => _$groupCreateGroupTypeEnumValueOf(name);
}

