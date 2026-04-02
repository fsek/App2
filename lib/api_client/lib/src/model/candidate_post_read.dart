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
/// * [candidateId] 
/// * [postId] 
/// * [electionPostId] 
/// * [subElectionId] 
/// * [createdAt] 
@BuiltValue()
abstract class CandidatePostRead implements Built<CandidatePostRead, CandidatePostReadBuilder> {
  @BuiltValueField(wireName: r'candidate_id')
  int get candidateId;

  @BuiltValueField(wireName: r'post_id')
  int get postId;

  @BuiltValueField(wireName: r'election_post_id')
  int get electionPostId;

  @BuiltValueField(wireName: r'sub_election_id')
  int get subElectionId;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

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
    yield r'candidate_id';
    yield serializers.serialize(
      object.candidateId,
      specifiedType: const FullType(int),
    );
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
    yield r'sub_election_id';
    yield serializers.serialize(
      object.subElectionId,
      specifiedType: const FullType(int),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
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
        case r'candidate_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.candidateId = valueDes;
          break;
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
        case r'sub_election_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.subElectionId = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
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

