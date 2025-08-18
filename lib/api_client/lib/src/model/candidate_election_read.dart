//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/candidate_user_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/candidate_post_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'candidate_election_read.g.dart';

/// CandidateElectionRead
///
/// Properties:
/// * [candidateId] 
/// * [userId] 
/// * [user] 
/// * [electionPosts] 
@BuiltValue()
abstract class CandidateElectionRead implements Built<CandidateElectionRead, CandidateElectionReadBuilder> {
  @BuiltValueField(wireName: r'candidate_id')
  int get candidateId;

  @BuiltValueField(wireName: r'user_id')
  int get userId;

  @BuiltValueField(wireName: r'user')
  CandidateUserRead get user;

  @BuiltValueField(wireName: r'election_posts')
  BuiltList<CandidatePostRead> get electionPosts;

  CandidateElectionRead._();

  factory CandidateElectionRead([void updates(CandidateElectionReadBuilder b)]) = _$CandidateElectionRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CandidateElectionReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CandidateElectionRead> get serializer => _$CandidateElectionReadSerializer();
}

class _$CandidateElectionReadSerializer implements PrimitiveSerializer<CandidateElectionRead> {
  @override
  final Iterable<Type> types = const [CandidateElectionRead, _$CandidateElectionRead];

  @override
  final String wireName = r'CandidateElectionRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CandidateElectionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'candidate_id';
    yield serializers.serialize(
      object.candidateId,
      specifiedType: const FullType(int),
    );
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(int),
    );
    yield r'user';
    yield serializers.serialize(
      object.user,
      specifiedType: const FullType(CandidateUserRead),
    );
    yield r'election_posts';
    yield serializers.serialize(
      object.electionPosts,
      specifiedType: const FullType(BuiltList, [FullType(CandidatePostRead)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CandidateElectionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CandidateElectionReadBuilder result,
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
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CandidateUserRead),
          ) as CandidateUserRead;
          result.user.replace(valueDes);
          break;
        case r'election_posts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CandidatePostRead)]),
          ) as BuiltList<CandidatePostRead>;
          result.electionPosts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CandidateElectionRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CandidateElectionReadBuilder();
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

