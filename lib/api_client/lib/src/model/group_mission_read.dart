//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/adventure_mission_read.dart';
import 'package:api_client/src/model/nollning_group_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_mission_read.g.dart';

/// GroupMissionRead
///
/// Properties:
/// * [points] 
/// * [adventureMission] 
/// * [nollningGroup] 
@BuiltValue()
abstract class GroupMissionRead implements Built<GroupMissionRead, GroupMissionReadBuilder> {
  @BuiltValueField(wireName: r'points')
  int get points;

  @BuiltValueField(wireName: r'adventure_mission')
  AdventureMissionRead get adventureMission;

  @BuiltValueField(wireName: r'nollning_group')
  NollningGroupRead get nollningGroup;

  GroupMissionRead._();

  factory GroupMissionRead([void updates(GroupMissionReadBuilder b)]) = _$GroupMissionRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupMissionReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupMissionRead> get serializer => _$GroupMissionReadSerializer();
}

class _$GroupMissionReadSerializer implements PrimitiveSerializer<GroupMissionRead> {
  @override
  final Iterable<Type> types = const [GroupMissionRead, _$GroupMissionRead];

  @override
  final String wireName = r'GroupMissionRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupMissionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'points';
    yield serializers.serialize(
      object.points,
      specifiedType: const FullType(int),
    );
    yield r'adventure_mission';
    yield serializers.serialize(
      object.adventureMission,
      specifiedType: const FullType(AdventureMissionRead),
    );
    yield r'nollning_group';
    yield serializers.serialize(
      object.nollningGroup,
      specifiedType: const FullType(NollningGroupRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupMissionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupMissionReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'points':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.points = valueDes;
          break;
        case r'adventure_mission':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdventureMissionRead),
          ) as AdventureMissionRead;
          result.adventureMission.replace(valueDes);
          break;
        case r'nollning_group':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(NollningGroupRead),
          ) as NollningGroupRead;
          result.nollningGroup.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupMissionRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupMissionReadBuilder();
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

