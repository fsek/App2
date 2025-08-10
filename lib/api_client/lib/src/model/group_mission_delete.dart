//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_mission_delete.g.dart';

/// GroupMissionDelete
///
/// Properties:
/// * [adventureMissionId] 
@BuiltValue()
abstract class GroupMissionDelete implements Built<GroupMissionDelete, GroupMissionDeleteBuilder> {
  @BuiltValueField(wireName: r'adventure_mission_id')
  int get adventureMissionId;

  GroupMissionDelete._();

  factory GroupMissionDelete([void updates(GroupMissionDeleteBuilder b)]) = _$GroupMissionDelete;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupMissionDeleteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupMissionDelete> get serializer => _$GroupMissionDeleteSerializer();
}

class _$GroupMissionDeleteSerializer implements PrimitiveSerializer<GroupMissionDelete> {
  @override
  final Iterable<Type> types = const [GroupMissionDelete, _$GroupMissionDelete];

  @override
  final String wireName = r'GroupMissionDelete';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupMissionDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'adventure_mission_id';
    yield serializers.serialize(
      object.adventureMissionId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupMissionDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupMissionDeleteBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupMissionDelete deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupMissionDeleteBuilder();
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

