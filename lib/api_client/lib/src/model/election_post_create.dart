//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'election_post_create.g.dart';

/// ElectionPostCreate
///
/// Properties:
/// * [postId] 
/// * [description] 
@BuiltValue()
abstract class ElectionPostCreate implements Built<ElectionPostCreate, ElectionPostCreateBuilder> {
  @BuiltValueField(wireName: r'post_id')
  int get postId;

  @BuiltValueField(wireName: r'description')
  String? get description;

  ElectionPostCreate._();

  factory ElectionPostCreate([void updates(ElectionPostCreateBuilder b)]) = _$ElectionPostCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ElectionPostCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ElectionPostCreate> get serializer => _$ElectionPostCreateSerializer();
}

class _$ElectionPostCreateSerializer implements PrimitiveSerializer<ElectionPostCreate> {
  @override
  final Iterable<Type> types = const [ElectionPostCreate, _$ElectionPostCreate];

  @override
  final String wireName = r'ElectionPostCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ElectionPostCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'post_id';
    yield serializers.serialize(
      object.postId,
      specifiedType: const FullType(int),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ElectionPostCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ElectionPostCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.postId = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ElectionPostCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ElectionPostCreateBuilder();
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

