//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'nollning_delete_mission.g.dart';

/// NollningDeleteMission
///
/// Properties:
/// * [groupId] 
/// * [missionId] 
@BuiltValue()
abstract class NollningDeleteMission implements Built<NollningDeleteMission, NollningDeleteMissionBuilder> {
  @BuiltValueField(wireName: r'group_id')
  int get groupId;

  @BuiltValueField(wireName: r'mission_id')
  int get missionId;

  NollningDeleteMission._();

  factory NollningDeleteMission([void updates(NollningDeleteMissionBuilder b)]) = _$NollningDeleteMission;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NollningDeleteMissionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NollningDeleteMission> get serializer => _$NollningDeleteMissionSerializer();
}

class _$NollningDeleteMissionSerializer implements PrimitiveSerializer<NollningDeleteMission> {
  @override
  final Iterable<Type> types = const [NollningDeleteMission, _$NollningDeleteMission];

  @override
  final String wireName = r'NollningDeleteMission';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NollningDeleteMission object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'group_id';
    yield serializers.serialize(
      object.groupId,
      specifiedType: const FullType(int),
    );
    yield r'mission_id';
    yield serializers.serialize(
      object.missionId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NollningDeleteMission object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NollningDeleteMissionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'group_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.groupId = valueDes;
          break;
        case r'mission_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.missionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NollningDeleteMission deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NollningDeleteMissionBuilder();
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

