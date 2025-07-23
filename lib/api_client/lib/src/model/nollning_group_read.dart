//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/group_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'nollning_group_read.g.dart';

/// NollningGroupRead
///
/// Properties:
/// * [id] 
/// * [group] 
/// * [nollningId] 
@BuiltValue()
abstract class NollningGroupRead implements Built<NollningGroupRead, NollningGroupReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'group')
  GroupRead get group;

  @BuiltValueField(wireName: r'nollning_id')
  int get nollningId;

  NollningGroupRead._();

  factory NollningGroupRead([void updates(NollningGroupReadBuilder b)]) = _$NollningGroupRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NollningGroupReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NollningGroupRead> get serializer => _$NollningGroupReadSerializer();
}

class _$NollningGroupReadSerializer implements PrimitiveSerializer<NollningGroupRead> {
  @override
  final Iterable<Type> types = const [NollningGroupRead, _$NollningGroupRead];

  @override
  final String wireName = r'NollningGroupRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NollningGroupRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'group';
    yield serializers.serialize(
      object.group,
      specifiedType: const FullType(GroupRead),
    );
    yield r'nollning_id';
    yield serializers.serialize(
      object.nollningId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NollningGroupRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NollningGroupReadBuilder result,
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
        case r'group':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GroupRead),
          ) as GroupRead;
          result.group.replace(valueDes);
          break;
        case r'nollning_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.nollningId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NollningGroupRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NollningGroupReadBuilder();
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

