//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_create.g.dart';

/// PostCreate
///
/// Properties:
/// * [nameSv] 
/// * [nameEn] 
/// * [councilId] 
/// * [email] 
/// * [descriptionSv] 
/// * [descriptionEn] 
/// * [electedAtSemester] 
/// * [electedBy] 
/// * [electedUserRecommendedLimit] 
/// * [electedUserMaxLimit] 
@BuiltValue()
abstract class PostCreate implements Built<PostCreate, PostCreateBuilder> {
  @BuiltValueField(wireName: r'name_sv')
  String get nameSv;

  @BuiltValueField(wireName: r'name_en')
  String get nameEn;

  @BuiltValueField(wireName: r'council_id')
  int get councilId;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'description_sv')
  String get descriptionSv;

  @BuiltValueField(wireName: r'description_en')
  String get descriptionEn;

  @BuiltValueField(wireName: r'elected_at_semester')
  PostCreateElectedAtSemesterEnum get electedAtSemester;
  // enum electedAtSemesterEnum {  HT,  VT,  HT and VT,  Other,  };

  @BuiltValueField(wireName: r'elected_by')
  PostCreateElectedByEnum get electedBy;
  // enum electedByEnum {  Guild,  Board,  Educational Council,  Board Intermediate,  Other,  };

  @BuiltValueField(wireName: r'elected_user_recommended_limit')
  int get electedUserRecommendedLimit;

  @BuiltValueField(wireName: r'elected_user_max_limit')
  int get electedUserMaxLimit;

  PostCreate._();

  factory PostCreate([void updates(PostCreateBuilder b)]) = _$PostCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostCreate> get serializer => _$PostCreateSerializer();
}

class _$PostCreateSerializer implements PrimitiveSerializer<PostCreate> {
  @override
  final Iterable<Type> types = const [PostCreate, _$PostCreate];

  @override
  final String wireName = r'PostCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'council_id';
    yield serializers.serialize(
      object.councilId,
      specifiedType: const FullType(int),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'description_sv';
    yield serializers.serialize(
      object.descriptionSv,
      specifiedType: const FullType(String),
    );
    yield r'description_en';
    yield serializers.serialize(
      object.descriptionEn,
      specifiedType: const FullType(String),
    );
    yield r'elected_at_semester';
    yield serializers.serialize(
      object.electedAtSemester,
      specifiedType: const FullType(PostCreateElectedAtSemesterEnum),
    );
    yield r'elected_by';
    yield serializers.serialize(
      object.electedBy,
      specifiedType: const FullType(PostCreateElectedByEnum),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    PostCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'council_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.councilId = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'description_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.descriptionSv = valueDes;
          break;
        case r'description_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.descriptionEn = valueDes;
          break;
        case r'elected_at_semester':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PostCreateElectedAtSemesterEnum),
          ) as PostCreateElectedAtSemesterEnum;
          result.electedAtSemester = valueDes;
          break;
        case r'elected_by':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PostCreateElectedByEnum),
          ) as PostCreateElectedByEnum;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostCreateBuilder();
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

class PostCreateElectedAtSemesterEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'HT')
  static const PostCreateElectedAtSemesterEnum HT = _$postCreateElectedAtSemesterEnum_HT;
  @BuiltValueEnumConst(wireName: r'VT')
  static const PostCreateElectedAtSemesterEnum VT = _$postCreateElectedAtSemesterEnum_VT;
  @BuiltValueEnumConst(wireName: r'HT and VT')
  static const PostCreateElectedAtSemesterEnum hTAndVT = _$postCreateElectedAtSemesterEnum_hTAndVT;
  @BuiltValueEnumConst(wireName: r'Other')
  static const PostCreateElectedAtSemesterEnum other = _$postCreateElectedAtSemesterEnum_other;

  static Serializer<PostCreateElectedAtSemesterEnum> get serializer => _$postCreateElectedAtSemesterEnumSerializer;

  const PostCreateElectedAtSemesterEnum._(String name): super(name);

  static BuiltSet<PostCreateElectedAtSemesterEnum> get values => _$postCreateElectedAtSemesterEnumValues;
  static PostCreateElectedAtSemesterEnum valueOf(String name) => _$postCreateElectedAtSemesterEnumValueOf(name);
}

class PostCreateElectedByEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Guild')
  static const PostCreateElectedByEnum guild = _$postCreateElectedByEnum_guild;
  @BuiltValueEnumConst(wireName: r'Board')
  static const PostCreateElectedByEnum board = _$postCreateElectedByEnum_board;
  @BuiltValueEnumConst(wireName: r'Educational Council')
  static const PostCreateElectedByEnum educationalCouncil = _$postCreateElectedByEnum_educationalCouncil;
  @BuiltValueEnumConst(wireName: r'Board Intermediate')
  static const PostCreateElectedByEnum boardIntermediate = _$postCreateElectedByEnum_boardIntermediate;
  @BuiltValueEnumConst(wireName: r'Other')
  static const PostCreateElectedByEnum other = _$postCreateElectedByEnum_other;

  static Serializer<PostCreateElectedByEnum> get serializer => _$postCreateElectedByEnumSerializer;

  const PostCreateElectedByEnum._(String name): super(name);

  static BuiltSet<PostCreateElectedByEnum> get values => _$postCreateElectedByEnumValues;
  static PostCreateElectedByEnum valueOf(String name) => _$postCreateElectedByEnumValueOf(name);
}

