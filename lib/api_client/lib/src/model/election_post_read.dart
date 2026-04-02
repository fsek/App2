//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'election_post_read.g.dart';

/// ElectionPostRead
///
/// Properties:
/// * [electionPostId] 
/// * [postId] 
/// * [nameSv] 
/// * [nameEn] 
/// * [electedAtSemester] 
/// * [electedBy] 
/// * [electedUserRecommendedLimit] 
/// * [electedUserMaxLimit] 
/// * [councilId] 
/// * [candidationCount] 
@BuiltValue()
abstract class ElectionPostRead implements Built<ElectionPostRead, ElectionPostReadBuilder> {
  @BuiltValueField(wireName: r'election_post_id')
  int get electionPostId;

  @BuiltValueField(wireName: r'post_id')
  int get postId;

  @BuiltValueField(wireName: r'name_sv')
  String get nameSv;

  @BuiltValueField(wireName: r'name_en')
  String get nameEn;

  @BuiltValueField(wireName: r'elected_at_semester')
  String? get electedAtSemester;

  @BuiltValueField(wireName: r'elected_by')
  String? get electedBy;

  @BuiltValueField(wireName: r'elected_user_recommended_limit')
  int get electedUserRecommendedLimit;

  @BuiltValueField(wireName: r'elected_user_max_limit')
  int get electedUserMaxLimit;

  @BuiltValueField(wireName: r'council_id')
  int get councilId;

  @BuiltValueField(wireName: r'candidation_count')
  int get candidationCount;

  ElectionPostRead._();

  factory ElectionPostRead([void updates(ElectionPostReadBuilder b)]) = _$ElectionPostRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ElectionPostReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ElectionPostRead> get serializer => _$ElectionPostReadSerializer();
}

class _$ElectionPostReadSerializer implements PrimitiveSerializer<ElectionPostRead> {
  @override
  final Iterable<Type> types = const [ElectionPostRead, _$ElectionPostRead];

  @override
  final String wireName = r'ElectionPostRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ElectionPostRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'election_post_id';
    yield serializers.serialize(
      object.electionPostId,
      specifiedType: const FullType(int),
    );
    yield r'post_id';
    yield serializers.serialize(
      object.postId,
      specifiedType: const FullType(int),
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
    yield r'elected_at_semester';
    yield object.electedAtSemester == null ? null : serializers.serialize(
      object.electedAtSemester,
      specifiedType: const FullType.nullable(String),
    );
    yield r'elected_by';
    yield object.electedBy == null ? null : serializers.serialize(
      object.electedBy,
      specifiedType: const FullType.nullable(String),
    );
    yield r'elected_user_recommended_limit';
    yield serializers.serialize(
      object.electedUserRecommendedLimit,
      specifiedType: const FullType(int),
    );
    yield r'elected_user_max_limit';
    yield serializers.serialize(
      object.electedUserMaxLimit,
      specifiedType: const FullType(int),
    );
    yield r'council_id';
    yield serializers.serialize(
      object.councilId,
      specifiedType: const FullType(int),
    );
    yield r'candidation_count';
    yield serializers.serialize(
      object.candidationCount,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ElectionPostRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ElectionPostReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'election_post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.electionPostId = valueDes;
          break;
        case r'post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.postId = valueDes;
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
        case r'elected_at_semester':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.electedAtSemester = valueDes;
          break;
        case r'elected_by':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.electedBy = valueDes;
          break;
        case r'elected_user_recommended_limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.electedUserRecommendedLimit = valueDes;
          break;
        case r'elected_user_max_limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.electedUserMaxLimit = valueDes;
          break;
        case r'council_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.councilId = valueDes;
          break;
        case r'candidation_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.candidationCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ElectionPostRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ElectionPostReadBuilder();
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

