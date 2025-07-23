//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/election_post_read.dart';
import 'package:api_client/src/model/candidate_election_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'election_read.g.dart';

/// ElectionRead
///
/// Properties:
/// * [electionId] 
/// * [title] 
/// * [startTime] 
/// * [endTime] 
/// * [description] 
/// * [posts] 
/// * [candidates] 
@BuiltValue()
abstract class ElectionRead implements Built<ElectionRead, ElectionReadBuilder> {
  @BuiltValueField(wireName: r'election_id')
  int get electionId;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'start_time')
  DateTime get startTime;

  @BuiltValueField(wireName: r'end_time')
  DateTime get endTime;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'posts')
  BuiltList<ElectionPostRead> get posts;

  @BuiltValueField(wireName: r'candidates')
  BuiltList<CandidateElectionRead> get candidates;

  ElectionRead._();

  factory ElectionRead([void updates(ElectionReadBuilder b)]) = _$ElectionRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ElectionReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ElectionRead> get serializer => _$ElectionReadSerializer();
}

class _$ElectionReadSerializer implements PrimitiveSerializer<ElectionRead> {
  @override
  final Iterable<Type> types = const [ElectionRead, _$ElectionRead];

  @override
  final String wireName = r'ElectionRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ElectionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'election_id';
    yield serializers.serialize(
      object.electionId,
      specifiedType: const FullType(int),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'start_time';
    yield serializers.serialize(
      object.startTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'end_time';
    yield serializers.serialize(
      object.endTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'description';
    yield object.description == null ? null : serializers.serialize(
      object.description,
      specifiedType: const FullType.nullable(String),
    );
    yield r'posts';
    yield serializers.serialize(
      object.posts,
      specifiedType: const FullType(BuiltList, [FullType(ElectionPostRead)]),
    );
    yield r'candidates';
    yield serializers.serialize(
      object.candidates,
      specifiedType: const FullType(BuiltList, [FullType(CandidateElectionRead)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ElectionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ElectionReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'election_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.electionId = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'start_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startTime = valueDes;
          break;
        case r'end_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endTime = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'posts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ElectionPostRead)]),
          ) as BuiltList<ElectionPostRead>;
          result.posts.replace(valueDes);
          break;
        case r'candidates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CandidateElectionRead)]),
          ) as BuiltList<CandidateElectionRead>;
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
  ElectionRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ElectionReadBuilder();
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

