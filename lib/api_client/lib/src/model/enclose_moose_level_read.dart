//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/enclose_moose_submission_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enclose_moose_level_read.g.dart';

/// EncloseMooseLevelRead
///
/// Properties:
/// * [levelId] 
/// * [releaseDate] 
/// * [dayIndex] 
/// * [nameSv] 
/// * [nameEn] 
/// * [encodedGrid] 
/// * [wallBudget] 
/// * [optimalScore] 
/// * [optimalSolution] 
/// * [optimalIsUnique] 
/// * [playerSubmission] 
/// * [scoreDistribution] 
@BuiltValue()
abstract class EncloseMooseLevelRead implements Built<EncloseMooseLevelRead, EncloseMooseLevelReadBuilder> {
  @BuiltValueField(wireName: r'level_id')
  int get levelId;

  @BuiltValueField(wireName: r'release_date')
  Date get releaseDate;

  @BuiltValueField(wireName: r'day_index')
  int? get dayIndex;

  @BuiltValueField(wireName: r'name_sv')
  String get nameSv;

  @BuiltValueField(wireName: r'name_en')
  String get nameEn;

  @BuiltValueField(wireName: r'encoded_grid')
  String get encodedGrid;

  @BuiltValueField(wireName: r'wall_budget')
  int get wallBudget;

  @BuiltValueField(wireName: r'optimal_score')
  int? get optimalScore;

  @BuiltValueField(wireName: r'optimal_solution')
  BuiltSet<int>? get optimalSolution;

  @BuiltValueField(wireName: r'optimal_is_unique')
  bool? get optimalIsUnique;

  @BuiltValueField(wireName: r'player_submission')
  EncloseMooseSubmissionRead? get playerSubmission;

  @BuiltValueField(wireName: r'score_distribution')
  BuiltMap<String, int>? get scoreDistribution;

  EncloseMooseLevelRead._();

  factory EncloseMooseLevelRead([void updates(EncloseMooseLevelReadBuilder b)]) = _$EncloseMooseLevelRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EncloseMooseLevelReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EncloseMooseLevelRead> get serializer => _$EncloseMooseLevelReadSerializer();
}

class _$EncloseMooseLevelReadSerializer implements PrimitiveSerializer<EncloseMooseLevelRead> {
  @override
  final Iterable<Type> types = const [EncloseMooseLevelRead, _$EncloseMooseLevelRead];

  @override
  final String wireName = r'EncloseMooseLevelRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EncloseMooseLevelRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'level_id';
    yield serializers.serialize(
      object.levelId,
      specifiedType: const FullType(int),
    );
    yield r'release_date';
    yield serializers.serialize(
      object.releaseDate,
      specifiedType: const FullType(Date),
    );
    yield r'day_index';
    yield object.dayIndex == null ? null : serializers.serialize(
      object.dayIndex,
      specifiedType: const FullType.nullable(int),
    );
    yield r'name_sv';
    yield serializers.serialize(
      object.nameSv,
      specifiedType: const FullType(String),
    );
    yield r'name_en';
    yield serializers.serialize(
      object.nameEn,
      specifiedType: const FullType(String),
    );
    yield r'encoded_grid';
    yield serializers.serialize(
      object.encodedGrid,
      specifiedType: const FullType(String),
    );
    yield r'wall_budget';
    yield serializers.serialize(
      object.wallBudget,
      specifiedType: const FullType(int),
    );
    if (object.optimalScore != null) {
      yield r'optimal_score';
      yield serializers.serialize(
        object.optimalScore,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.optimalSolution != null) {
      yield r'optimal_solution';
      yield serializers.serialize(
        object.optimalSolution,
        specifiedType: const FullType.nullable(BuiltSet, [FullType(int)]),
      );
    }
    if (object.optimalIsUnique != null) {
      yield r'optimal_is_unique';
      yield serializers.serialize(
        object.optimalIsUnique,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.playerSubmission != null) {
      yield r'player_submission';
      yield serializers.serialize(
        object.playerSubmission,
        specifiedType: const FullType.nullable(EncloseMooseSubmissionRead),
      );
    }
    if (object.scoreDistribution != null) {
      yield r'score_distribution';
      yield serializers.serialize(
        object.scoreDistribution,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(int)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EncloseMooseLevelRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EncloseMooseLevelReadBuilder result,
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
        case r'release_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.releaseDate = valueDes;
          break;
        case r'day_index':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.dayIndex = valueDes;
          break;
        case r'name_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nameSv = valueDes;
          break;
        case r'name_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nameEn = valueDes;
          break;
        case r'encoded_grid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.encodedGrid = valueDes;
          break;
        case r'wall_budget':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.wallBudget = valueDes;
          break;
        case r'optimal_score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.optimalScore = valueDes;
          break;
        case r'optimal_solution':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltSet, [FullType(int)]),
          ) as BuiltSet<int>?;
          if (valueDes == null) continue;
          result.optimalSolution.replace(valueDes);
          break;
        case r'optimal_is_unique':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.optimalIsUnique = valueDes;
          break;
        case r'player_submission':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(EncloseMooseSubmissionRead),
          ) as EncloseMooseSubmissionRead?;
          if (valueDes == null) continue;
          result.playerSubmission.replace(valueDes);
          break;
        case r'score_distribution':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(int)]),
          ) as BuiltMap<String, int>?;
          if (valueDes == null) continue;
          result.scoreDistribution.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EncloseMooseLevelRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EncloseMooseLevelReadBuilder();
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

