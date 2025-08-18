//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_mission_create.g.dart';

/// GroupMissionCreate
///
/// Properties:
/// * [adventureMissionId] 
/// * [points] 
/// * [isAccepted] 
@BuiltValue()
abstract class GroupMissionCreate implements Built<GroupMissionCreate, GroupMissionCreateBuilder> {
  @BuiltValueField(wireName: r'adventure_mission_id')
  int get adventureMissionId;

  @BuiltValueField(wireName: r'points')
  int? get points;

  @BuiltValueField(wireName: r'is_accepted')
  GroupMissionCreateIsAcceptedEnum? get isAccepted;
  // enum isAcceptedEnum {  Accepted,  Failed,  Review,  };

  GroupMissionCreate._();

  factory GroupMissionCreate([void updates(GroupMissionCreateBuilder b)]) = _$GroupMissionCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupMissionCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupMissionCreate> get serializer => _$GroupMissionCreateSerializer();
}

class _$GroupMissionCreateSerializer implements PrimitiveSerializer<GroupMissionCreate> {
  @override
  final Iterable<Type> types = const [GroupMissionCreate, _$GroupMissionCreate];

  @override
  final String wireName = r'GroupMissionCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupMissionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'adventure_mission_id';
    yield serializers.serialize(
      object.adventureMissionId,
      specifiedType: const FullType(int),
    );
    if (object.points != null) {
      yield r'points';
      yield serializers.serialize(
        object.points,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.isAccepted != null) {
      yield r'is_accepted';
      yield serializers.serialize(
        object.isAccepted,
        specifiedType: const FullType.nullable(GroupMissionCreateIsAcceptedEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupMissionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupMissionCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'adventure_mission_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.adventureMissionId = valueDes;
          break;
        case r'points':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.points = valueDes;
          break;
        case r'is_accepted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(GroupMissionCreateIsAcceptedEnum),
          ) as GroupMissionCreateIsAcceptedEnum?;
          if (valueDes == null) continue;
          result.isAccepted = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupMissionCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupMissionCreateBuilder();
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

class GroupMissionCreateIsAcceptedEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Accepted')
  static const GroupMissionCreateIsAcceptedEnum accepted = _$groupMissionCreateIsAcceptedEnum_accepted;
  @BuiltValueEnumConst(wireName: r'Failed')
  static const GroupMissionCreateIsAcceptedEnum failed = _$groupMissionCreateIsAcceptedEnum_failed;
  @BuiltValueEnumConst(wireName: r'Review')
  static const GroupMissionCreateIsAcceptedEnum review = _$groupMissionCreateIsAcceptedEnum_review;

  static Serializer<GroupMissionCreateIsAcceptedEnum> get serializer => _$groupMissionCreateIsAcceptedEnumSerializer;

  const GroupMissionCreateIsAcceptedEnum._(String name): super(name);

  static BuiltSet<GroupMissionCreateIsAcceptedEnum> get values => _$groupMissionCreateIsAcceptedEnumValues;
  static GroupMissionCreateIsAcceptedEnum valueOf(String name) => _$groupMissionCreateIsAcceptedEnumValueOf(name);
}

