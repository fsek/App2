//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/election_post_create.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'election_add_posts.g.dart';

/// ElectionAddPosts
///
/// Properties:
/// * [posts] 
@BuiltValue()
abstract class ElectionAddPosts implements Built<ElectionAddPosts, ElectionAddPostsBuilder> {
  @BuiltValueField(wireName: r'posts')
  BuiltList<ElectionPostCreate> get posts;

  ElectionAddPosts._();

  factory ElectionAddPosts([void updates(ElectionAddPostsBuilder b)]) = _$ElectionAddPosts;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ElectionAddPostsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ElectionAddPosts> get serializer => _$ElectionAddPostsSerializer();
}

class _$ElectionAddPostsSerializer implements PrimitiveSerializer<ElectionAddPosts> {
  @override
  final Iterable<Type> types = const [ElectionAddPosts, _$ElectionAddPosts];

  @override
  final String wireName = r'ElectionAddPosts';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ElectionAddPosts object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'posts';
    yield serializers.serialize(
      object.posts,
      specifiedType: const FullType(BuiltList, [FullType(ElectionPostCreate)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ElectionAddPosts object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ElectionAddPostsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'posts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ElectionPostCreate)]),
          ) as BuiltList<ElectionPostCreate>;
          result.posts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ElectionAddPosts deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ElectionAddPostsBuilder();
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

