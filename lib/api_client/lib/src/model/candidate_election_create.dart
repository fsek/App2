//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'candidate_election_create.g.dart';

/// CandidateElectionCreate
///
/// Properties:
/// * [postIds] 
@BuiltValue()
abstract class CandidateElectionCreate implements Built<CandidateElectionCreate, CandidateElectionCreateBuilder> {
  @BuiltValueField(wireName: r'post_ids')
  BuiltList<int> get postIds;

  CandidateElectionCreate._();

  factory CandidateElectionCreate([void updates(CandidateElectionCreateBuilder b)]) = _$CandidateElectionCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CandidateElectionCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CandidateElectionCreate> get serializer => _$CandidateElectionCreateSerializer();
}

class _$CandidateElectionCreateSerializer implements PrimitiveSerializer<CandidateElectionCreate> {
  @override
  final Iterable<Type> types = const [CandidateElectionCreate, _$CandidateElectionCreate];

  @override
  final String wireName = r'CandidateElectionCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CandidateElectionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'post_ids';
    yield serializers.serialize(
      object.postIds,
      specifiedType: const FullType(BuiltList, [FullType(int)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CandidateElectionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CandidateElectionCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'post_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(int)]),
          ) as BuiltList<int>;
          result.postIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CandidateElectionCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CandidateElectionCreateBuilder();
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

