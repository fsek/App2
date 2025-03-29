//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'nollning_add_group.g.dart';

/// NollningAddGroup
///
/// Properties:
/// * [groupId] 
@BuiltValue()
abstract class NollningAddGroup implements Built<NollningAddGroup, NollningAddGroupBuilder> {
  @BuiltValueField(wireName: r'group_id')
  int get groupId;

  NollningAddGroup._();

  factory NollningAddGroup([void updates(NollningAddGroupBuilder b)]) = _$NollningAddGroup;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NollningAddGroupBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NollningAddGroup> get serializer => _$NollningAddGroupSerializer();
}

class _$NollningAddGroupSerializer implements PrimitiveSerializer<NollningAddGroup> {
  @override
  final Iterable<Type> types = const [NollningAddGroup, _$NollningAddGroup];

  @override
  final String wireName = r'NollningAddGroup';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NollningAddGroup object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'group_id';
    yield serializers.serialize(
      object.groupId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NollningAddGroup object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NollningAddGroupBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NollningAddGroup deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NollningAddGroupBuilder();
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

