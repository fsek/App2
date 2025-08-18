//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_mission_edit.g.dart';

/// GroupMissionEdit
///
/// Properties:
/// * [adventureMissionId] 
/// * [points] 
/// * [isAccepted] 
@BuiltValue()
abstract class GroupMissionEdit implements Built<GroupMissionEdit, GroupMissionEditBuilder> {
  @BuiltValueField(wireName: r'adventure_mission_id')
  int get adventureMissionId;

  @BuiltValueField(wireName: r'points')
  int? get points;

  @BuiltValueField(wireName: r'is_accepted')
  GroupMissionEditIsAcceptedEnum? get isAccepted;
  // enum isAcceptedEnum {  Accepted,  Failed,  Review,  };

  GroupMissionEdit._();

  factory GroupMissionEdit([void updates(GroupMissionEditBuilder b)]) = _$GroupMissionEdit;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupMissionEditBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupMissionEdit> get serializer => _$GroupMissionEditSerializer();
}

class _$GroupMissionEditSerializer implements PrimitiveSerializer<GroupMissionEdit> {
  @override
  final Iterable<Type> types = const [GroupMissionEdit, _$GroupMissionEdit];

  @override
  final String wireName = r'GroupMissionEdit';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupMissionEdit object, {
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
        specifiedType: const FullType.nullable(GroupMissionEditIsAcceptedEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupMissionEdit object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupMissionEditBuilder result,
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
            specifiedType: const FullType.nullable(GroupMissionEditIsAcceptedEnum),
          ) as GroupMissionEditIsAcceptedEnum?;
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
  GroupMissionEdit deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupMissionEditBuilder();
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

class GroupMissionEditIsAcceptedEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Accepted')
  static const GroupMissionEditIsAcceptedEnum accepted = _$groupMissionEditIsAcceptedEnum_accepted;
  @BuiltValueEnumConst(wireName: r'Failed')
  static const GroupMissionEditIsAcceptedEnum failed = _$groupMissionEditIsAcceptedEnum_failed;
  @BuiltValueEnumConst(wireName: r'Review')
  static const GroupMissionEditIsAcceptedEnum review = _$groupMissionEditIsAcceptedEnum_review;

  static Serializer<GroupMissionEditIsAcceptedEnum> get serializer => _$groupMissionEditIsAcceptedEnumSerializer;

  const GroupMissionEditIsAcceptedEnum._(String name): super(name);

  static BuiltSet<GroupMissionEditIsAcceptedEnum> get values => _$groupMissionEditIsAcceptedEnumValues;
  static GroupMissionEditIsAcceptedEnum valueOf(String name) => _$groupMissionEditIsAcceptedEnumValueOf(name);
}

