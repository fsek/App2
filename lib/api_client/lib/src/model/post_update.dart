//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_update.g.dart';

/// PostUpdate
///
/// Properties:
/// * [name] 
/// * [councilId] 
@BuiltValue()
abstract class PostUpdate implements Built<PostUpdate, PostUpdateBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'council_id')
  int get councilId;

  PostUpdate._();

  factory PostUpdate([void updates(PostUpdateBuilder b)]) = _$PostUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostUpdate> get serializer => _$PostUpdateSerializer();
}

class _$PostUpdateSerializer implements PrimitiveSerializer<PostUpdate> {
  @override
  final Iterable<Type> types = const [PostUpdate, _$PostUpdate];

  @override
  final String wireName = r'PostUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'council_id';
    yield serializers.serialize(
      object.councilId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PostUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostUpdateBuilder result,
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
        case r'council_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.councilId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostUpdateBuilder();
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

