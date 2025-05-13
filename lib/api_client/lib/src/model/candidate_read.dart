//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/candidate_user_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/candidate_post_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'candidate_read.g.dart';

/// CandidateRead
///
/// Properties:
/// * [candidateId] 
/// * [electionId] 
/// * [userId] 
/// * [user] 
/// * [electionPosts] 
@BuiltValue()
abstract class CandidateRead implements Built<CandidateRead, CandidateReadBuilder> {
  @BuiltValueField(wireName: r'candidate_id')
  int get candidateId;

  @BuiltValueField(wireName: r'election_id')
  int get electionId;

  @BuiltValueField(wireName: r'user_id')
  int get userId;

  @BuiltValueField(wireName: r'user')
  CandidateUserRead get user;

  @BuiltValueField(wireName: r'election_posts')
  BuiltList<CandidatePostRead> get electionPosts;

  CandidateRead._();

  factory CandidateRead([void updates(CandidateReadBuilder b)]) = _$CandidateRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CandidateReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CandidateRead> get serializer => _$CandidateReadSerializer();
}

class _$CandidateReadSerializer implements PrimitiveSerializer<CandidateRead> {
  @override
  final Iterable<Type> types = const [CandidateRead, _$CandidateRead];

  @override
  final String wireName = r'CandidateRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CandidateRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'candidate_id';
    yield serializers.serialize(
      object.candidateId,
      specifiedType: const FullType(int),
    );
    yield r'election_id';
    yield serializers.serialize(
      object.electionId,
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
    CandidateRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CandidateReadBuilder result,
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
        case r'election_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.electionId = valueDes;
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
  CandidateRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CandidateReadBuilder();
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

