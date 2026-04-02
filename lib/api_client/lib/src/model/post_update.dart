//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_update.g.dart';

/// PostUpdate
///
/// Properties:
/// * [nameSv] 
/// * [nameEn] 
/// * [councilId] 
/// * [descriptionSv] 
/// * [descriptionEn] 
/// * [email] 
/// * [doors] 
/// * [electedAtSemester] 
/// * [electedBy] 
/// * [electedUserRecommendedLimit] 
/// * [electedUserMaxLimit] 
@BuiltValue()
abstract class PostUpdate implements Built<PostUpdate, PostUpdateBuilder> {
  @BuiltValueField(wireName: r'name_sv')
  String? get nameSv;

  @BuiltValueField(wireName: r'name_en')
  String? get nameEn;

  @BuiltValueField(wireName: r'council_id')
  int? get councilId;

  @BuiltValueField(wireName: r'description_sv')
  String? get descriptionSv;

  @BuiltValueField(wireName: r'description_en')
  String? get descriptionEn;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'doors')
  BuiltList<PostUpdateDoorsEnum>? get doors;
  // enum doorsEnum {  Ledningscentralen,  Ambassaden,  Syster Kents,  Hilbert Cafe,  Cafeförrådet,  Pubförrådet,  Sopkomprimatorn,  Arkivet,  };

  @BuiltValueField(wireName: r'elected_at_semester')
  PostUpdateElectedAtSemesterEnum? get electedAtSemester;
  // enum electedAtSemesterEnum {  HT,  VT,  HT and VT,  Other,  };

  @BuiltValueField(wireName: r'elected_by')
  PostUpdateElectedByEnum? get electedBy;
  // enum electedByEnum {  Guild,  Board,  Educational Council,  Board Intermediate,  Other,  };

  @BuiltValueField(wireName: r'elected_user_recommended_limit')
  int? get electedUserRecommendedLimit;

  @BuiltValueField(wireName: r'elected_user_max_limit')
  int? get electedUserMaxLimit;

  PostUpdate._();

  factory PostUpdate([void updates(PostUpdateBuilder b)]) = _$PostUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostUpdate> get serializer => _$PostUpdateSerializer();
}

class _$PostUpdateSerializer implements PrimitiveSerializer<PostUpdate> {
  @override
  final Iterable<Type> types = const [PostUpdate, _$PostUpdate];

  @override
  final String wireName = r'PostUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.nameSv != null) {
      yield r'name_sv';
      yield serializers.serialize(
        object.nameSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.nameEn != null) {
      yield r'name_en';
      yield serializers.serialize(
        object.nameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.councilId != null) {
      yield r'council_id';
      yield serializers.serialize(
        object.councilId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.descriptionSv != null) {
      yield r'description_sv';
      yield serializers.serialize(
        object.descriptionSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.descriptionEn != null) {
      yield r'description_en';
      yield serializers.serialize(
        object.descriptionEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.doors != null) {
      yield r'doors';
      yield serializers.serialize(
        object.doors,
        specifiedType: const FullType.nullable(BuiltList, [FullType(PostUpdateDoorsEnum)]),
      );
    }
    if (object.electedAtSemester != null) {
      yield r'elected_at_semester';
      yield serializers.serialize(
        object.electedAtSemester,
        specifiedType: const FullType.nullable(PostUpdateElectedAtSemesterEnum),
      );
    }
    if (object.electedBy != null) {
      yield r'elected_by';
      yield serializers.serialize(
        object.electedBy,
        specifiedType: const FullType.nullable(PostUpdateElectedByEnum),
      );
    }
    if (object.electedUserRecommendedLimit != null) {
      yield r'elected_user_recommended_limit';
      yield serializers.serialize(
        object.electedUserRecommendedLimit,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.electedUserMaxLimit != null) {
      yield r'elected_user_max_limit';
      yield serializers.serialize(
        object.electedUserMaxLimit,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PostUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nameSv = valueDes;
          break;
        case r'name_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nameEn = valueDes;
          break;
        case r'council_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.councilId = valueDes;
          break;
        case r'description_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.descriptionSv = valueDes;
          break;
        case r'description_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.descriptionEn = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'doors':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(PostUpdateDoorsEnum)]),
          ) as BuiltList<PostUpdateDoorsEnum>?;
          if (valueDes == null) continue;
          result.doors.replace(valueDes);
          break;
        case r'elected_at_semester':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(PostUpdateElectedAtSemesterEnum),
          ) as PostUpdateElectedAtSemesterEnum?;
          if (valueDes == null) continue;
          result.electedAtSemester = valueDes;
          break;
        case r'elected_by':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(PostUpdateElectedByEnum),
          ) as PostUpdateElectedByEnum?;
          if (valueDes == null) continue;
          result.electedBy = valueDes;
          break;
        case r'elected_user_recommended_limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.electedUserRecommendedLimit = valueDes;
          break;
        case r'elected_user_max_limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
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
  PostUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostUpdateBuilder();
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

class PostUpdateDoorsEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Ledningscentralen')
  static const PostUpdateDoorsEnum ledningscentralen = _$postUpdateDoorsEnum_ledningscentralen;
  @BuiltValueEnumConst(wireName: r'Ambassaden')
  static const PostUpdateDoorsEnum ambassaden = _$postUpdateDoorsEnum_ambassaden;
  @BuiltValueEnumConst(wireName: r'Syster Kents')
  static const PostUpdateDoorsEnum systerKents = _$postUpdateDoorsEnum_systerKents;
  @BuiltValueEnumConst(wireName: r'Hilbert Cafe')
  static const PostUpdateDoorsEnum hilbertCafe = _$postUpdateDoorsEnum_hilbertCafe;
  @BuiltValueEnumConst(wireName: r'Cafeförrådet')
  static const PostUpdateDoorsEnum cafefrrdet = _$postUpdateDoorsEnum_cafefrrdet;
  @BuiltValueEnumConst(wireName: r'Pubförrådet')
  static const PostUpdateDoorsEnum pubfrrdet = _$postUpdateDoorsEnum_pubfrrdet;
  @BuiltValueEnumConst(wireName: r'Sopkomprimatorn')
  static const PostUpdateDoorsEnum sopkomprimatorn = _$postUpdateDoorsEnum_sopkomprimatorn;
  @BuiltValueEnumConst(wireName: r'Arkivet')
  static const PostUpdateDoorsEnum arkivet = _$postUpdateDoorsEnum_arkivet;

  static Serializer<PostUpdateDoorsEnum> get serializer => _$postUpdateDoorsEnumSerializer;

  const PostUpdateDoorsEnum._(String name): super(name);

  static BuiltSet<PostUpdateDoorsEnum> get values => _$postUpdateDoorsEnumValues;
  static PostUpdateDoorsEnum valueOf(String name) => _$postUpdateDoorsEnumValueOf(name);
}

class PostUpdateElectedAtSemesterEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'HT')
  static const PostUpdateElectedAtSemesterEnum HT = _$postUpdateElectedAtSemesterEnum_HT;
  @BuiltValueEnumConst(wireName: r'VT')
  static const PostUpdateElectedAtSemesterEnum VT = _$postUpdateElectedAtSemesterEnum_VT;
  @BuiltValueEnumConst(wireName: r'HT and VT')
  static const PostUpdateElectedAtSemesterEnum hTAndVT = _$postUpdateElectedAtSemesterEnum_hTAndVT;
  @BuiltValueEnumConst(wireName: r'Other')
  static const PostUpdateElectedAtSemesterEnum other = _$postUpdateElectedAtSemesterEnum_other;

  static Serializer<PostUpdateElectedAtSemesterEnum> get serializer => _$postUpdateElectedAtSemesterEnumSerializer;

  const PostUpdateElectedAtSemesterEnum._(String name): super(name);

  static BuiltSet<PostUpdateElectedAtSemesterEnum> get values => _$postUpdateElectedAtSemesterEnumValues;
  static PostUpdateElectedAtSemesterEnum valueOf(String name) => _$postUpdateElectedAtSemesterEnumValueOf(name);
}

class PostUpdateElectedByEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Guild')
  static const PostUpdateElectedByEnum guild = _$postUpdateElectedByEnum_guild;
  @BuiltValueEnumConst(wireName: r'Board')
  static const PostUpdateElectedByEnum board = _$postUpdateElectedByEnum_board;
  @BuiltValueEnumConst(wireName: r'Educational Council')
  static const PostUpdateElectedByEnum educationalCouncil = _$postUpdateElectedByEnum_educationalCouncil;
  @BuiltValueEnumConst(wireName: r'Board Intermediate')
  static const PostUpdateElectedByEnum boardIntermediate = _$postUpdateElectedByEnum_boardIntermediate;
  @BuiltValueEnumConst(wireName: r'Other')
  static const PostUpdateElectedByEnum other = _$postUpdateElectedByEnum_other;

  static Serializer<PostUpdateElectedByEnum> get serializer => _$postUpdateElectedByEnumSerializer;

  const PostUpdateElectedByEnum._(String name): super(name);

  static BuiltSet<PostUpdateElectedByEnum> get values => _$postUpdateElectedByEnumValues;
  static PostUpdateElectedByEnum valueOf(String name) => _$postUpdateElectedByEnumValueOf(name);
}

