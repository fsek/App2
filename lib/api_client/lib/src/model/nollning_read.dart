//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/adventure_mission_read.dart';
import 'package:api_client/src/model/nollning_group_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'nollning_read.g.dart';

/// NollningRead
///
/// Properties:
/// * [name] 
/// * [description] 
/// * [id] 
/// * [missions] 
/// * [nollningGroups] 
@BuiltValue()
abstract class NollningRead implements Built<NollningRead, NollningReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'missions')
  BuiltList<AdventureMissionRead> get missions;

  @BuiltValueField(wireName: r'nollning_groups')
  BuiltList<NollningGroupRead> get nollningGroups;

  NollningRead._();

  factory NollningRead([void updates(NollningReadBuilder b)]) = _$NollningRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NollningReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NollningRead> get serializer => _$NollningReadSerializer();
}

class _$NollningReadSerializer implements PrimitiveSerializer<NollningRead> {
  @override
  final Iterable<Type> types = const [NollningRead, _$NollningRead];

  @override
  final String wireName = r'NollningRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NollningRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'missions';
    yield serializers.serialize(
      object.missions,
      specifiedType: const FullType(BuiltList, [FullType(AdventureMissionRead)]),
    );
    yield r'nollning_groups';
    yield serializers.serialize(
      object.nollningGroups,
      specifiedType: const FullType(BuiltList, [FullType(NollningGroupRead)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NollningRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NollningReadBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'missions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AdventureMissionRead)]),
          ) as BuiltList<AdventureMissionRead>;
          result.missions.replace(valueDes);
          break;
        case r'nollning_groups':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(NollningGroupRead)]),
          ) as BuiltList<NollningGroupRead>;
          result.nollningGroups.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NollningRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NollningReadBuilder();
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

