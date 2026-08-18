//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enclose_moose_submission_read.g.dart';

/// EncloseMooseSubmissionRead
///
/// Properties:
/// * [levelId] 
/// * [submissionTime] 
/// * [playerId] 
/// * [playerScore] 
/// * [playerSolution] 
@BuiltValue()
abstract class EncloseMooseSubmissionRead implements Built<EncloseMooseSubmissionRead, EncloseMooseSubmissionReadBuilder> {
  @BuiltValueField(wireName: r'level_id')
  int get levelId;

  @BuiltValueField(wireName: r'submission_time')
  DateTime get submissionTime;

  @BuiltValueField(wireName: r'player_id')
  int get playerId;

  @BuiltValueField(wireName: r'player_score')
  int get playerScore;

  @BuiltValueField(wireName: r'player_solution')
  BuiltSet<int> get playerSolution;

  EncloseMooseSubmissionRead._();

  factory EncloseMooseSubmissionRead([void updates(EncloseMooseSubmissionReadBuilder b)]) = _$EncloseMooseSubmissionRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EncloseMooseSubmissionReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EncloseMooseSubmissionRead> get serializer => _$EncloseMooseSubmissionReadSerializer();
}

class _$EncloseMooseSubmissionReadSerializer implements PrimitiveSerializer<EncloseMooseSubmissionRead> {
  @override
  final Iterable<Type> types = const [EncloseMooseSubmissionRead, _$EncloseMooseSubmissionRead];

  @override
  final String wireName = r'EncloseMooseSubmissionRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EncloseMooseSubmissionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'level_id';
    yield serializers.serialize(
      object.levelId,
      specifiedType: const FullType(int),
    );
    yield r'submission_time';
    yield serializers.serialize(
      object.submissionTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'player_id';
    yield serializers.serialize(
      object.playerId,
      specifiedType: const FullType(int),
    );
    yield r'player_score';
    yield serializers.serialize(
      object.playerScore,
      specifiedType: const FullType(int),
    );
    yield r'player_solution';
    yield serializers.serialize(
      object.playerSolution,
      specifiedType: const FullType(BuiltSet, [FullType(int)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EncloseMooseSubmissionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EncloseMooseSubmissionReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'level_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.levelId = valueDes;
          break;
        case r'submission_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.submissionTime = valueDes;
          break;
        case r'player_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.playerId = valueDes;
          break;
        case r'player_score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.playerScore = valueDes;
          break;
        case r'player_solution':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltSet, [FullType(int)]),
          ) as BuiltSet<int>;
          result.playerSolution.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EncloseMooseSubmissionRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EncloseMooseSubmissionReadBuilder();
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

