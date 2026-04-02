//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/candidate_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/election_post_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sub_election_read.g.dart';

/// SubElectionRead
///
/// Properties:
/// * [subElectionId] 
/// * [electionId] 
/// * [titleSv] 
/// * [titleEn] 
/// * [endTime] 
/// * [electionPosts] 
/// * [candidates] 
@BuiltValue()
abstract class SubElectionRead implements Built<SubElectionRead, SubElectionReadBuilder> {
  @BuiltValueField(wireName: r'sub_election_id')
  int get subElectionId;

  @BuiltValueField(wireName: r'election_id')
  int get electionId;

  @BuiltValueField(wireName: r'title_sv')
  String get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String get titleEn;

  @BuiltValueField(wireName: r'end_time')
  DateTime get endTime;

  @BuiltValueField(wireName: r'election_posts')
  BuiltList<ElectionPostRead> get electionPosts;

  @BuiltValueField(wireName: r'candidates')
  BuiltList<CandidateRead> get candidates;

  SubElectionRead._();

  factory SubElectionRead([void updates(SubElectionReadBuilder b)]) = _$SubElectionRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubElectionReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubElectionRead> get serializer => _$SubElectionReadSerializer();
}

class _$SubElectionReadSerializer implements PrimitiveSerializer<SubElectionRead> {
  @override
  final Iterable<Type> types = const [SubElectionRead, _$SubElectionRead];

  @override
  final String wireName = r'SubElectionRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubElectionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'sub_election_id';
    yield serializers.serialize(
      object.subElectionId,
      specifiedType: const FullType(int),
    );
    yield r'election_id';
    yield serializers.serialize(
      object.electionId,
      specifiedType: const FullType(int),
    );
    yield r'title_sv';
    yield serializers.serialize(
      object.titleSv,
      specifiedType: const FullType(String),
    );
    yield r'title_en';
    yield serializers.serialize(
      object.titleEn,
      specifiedType: const FullType(String),
    );
    yield r'end_time';
    yield serializers.serialize(
      object.endTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'election_posts';
    yield serializers.serialize(
      object.electionPosts,
      specifiedType: const FullType(BuiltList, [FullType(ElectionPostRead)]),
    );
    yield r'candidates';
    yield serializers.serialize(
      object.candidates,
      specifiedType: const FullType(BuiltList, [FullType(CandidateRead)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SubElectionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubElectionReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sub_election_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.subElectionId = valueDes;
          break;
        case r'election_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.electionId = valueDes;
          break;
        case r'title_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.titleSv = valueDes;
          break;
        case r'title_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.titleEn = valueDes;
          break;
        case r'end_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endTime = valueDes;
          break;
        case r'election_posts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ElectionPostRead)]),
          ) as BuiltList<ElectionPostRead>;
          result.electionPosts.replace(valueDes);
          break;
        case r'candidates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CandidateRead)]),
          ) as BuiltList<CandidateRead>;
          result.candidates.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubElectionRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubElectionReadBuilder();
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

