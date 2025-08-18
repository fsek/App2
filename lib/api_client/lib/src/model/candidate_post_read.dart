//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'candidate_post_read.g.dart';

/// CandidatePostRead
///
/// Properties:
/// * [postId] 
/// * [electionPostId] 
@BuiltValue()
abstract class CandidatePostRead implements Built<CandidatePostRead, CandidatePostReadBuilder> {
  @BuiltValueField(wireName: r'post_id')
  int get postId;

  @BuiltValueField(wireName: r'election_post_id')
  int get electionPostId;

  CandidatePostRead._();

  factory CandidatePostRead([void updates(CandidatePostReadBuilder b)]) = _$CandidatePostRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CandidatePostReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CandidatePostRead> get serializer => _$CandidatePostReadSerializer();
}

class _$CandidatePostReadSerializer implements PrimitiveSerializer<CandidatePostRead> {
  @override
  final Iterable<Type> types = const [CandidatePostRead, _$CandidatePostRead];

  @override
  final String wireName = r'CandidatePostRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CandidatePostRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'post_id';
    yield serializers.serialize(
      object.postId,
      specifiedType: const FullType(int),
    );
    yield r'election_post_id';
    yield serializers.serialize(
      object.electionPostId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CandidatePostRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CandidatePostReadBuilder result,
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
        case r'election_post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.electionPostId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CandidatePostRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CandidatePostReadBuilder();
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

