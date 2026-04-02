//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/post_door_access_read.dart';
import 'package:api_client/src/model/post_permission_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_read.g.dart';

/// PostRead
///
/// Properties:
/// * [id] 
/// * [nameSv] 
/// * [nameEn] 
/// * [councilId] 
/// * [permissions] 
/// * [descriptionSv] 
/// * [descriptionEn] 
/// * [email] 
/// * [postDoorAccesses] 
/// * [electedAtSemester] 
/// * [electedBy] 
/// * [electedUserRecommendedLimit] 
/// * [electedUserMaxLimit] 
@BuiltValue()
abstract class PostRead implements Built<PostRead, PostReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name_sv')
  String get nameSv;

  @BuiltValueField(wireName: r'name_en')
  String get nameEn;

  @BuiltValueField(wireName: r'council_id')
  int get councilId;

  @BuiltValueField(wireName: r'permissions')
  BuiltList<PostPermissionRead> get permissions;

  @BuiltValueField(wireName: r'description_sv')
  String get descriptionSv;

  @BuiltValueField(wireName: r'description_en')
  String get descriptionEn;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'post_door_accesses')
  BuiltList<PostDoorAccessRead> get postDoorAccesses;

  @BuiltValueField(wireName: r'elected_at_semester')
  PostReadElectedAtSemesterEnum? get electedAtSemester;
  // enum electedAtSemesterEnum {  HT,  VT,  HT and VT,  Other,  };

  @BuiltValueField(wireName: r'elected_by')
  PostReadElectedByEnum? get electedBy;
  // enum electedByEnum {  Guild,  Board,  Educational Council,  Board Intermediate,  Other,  };

  @BuiltValueField(wireName: r'elected_user_recommended_limit')
  int get electedUserRecommendedLimit;

  @BuiltValueField(wireName: r'elected_user_max_limit')
  int get electedUserMaxLimit;

  PostRead._();

  factory PostRead([void updates(PostReadBuilder b)]) = _$PostRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostRead> get serializer => _$PostReadSerializer();
}

class _$PostReadSerializer implements PrimitiveSerializer<PostRead> {
  @override
  final Iterable<Type> types = const [PostRead, _$PostRead];

  @override
  final String wireName = r'PostRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
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
    yield r'council_id';
    yield serializers.serialize(
      object.councilId,
      specifiedType: const FullType(int),
    );
    yield r'permissions';
    yield serializers.serialize(
      object.permissions,
      specifiedType: const FullType(BuiltList, [FullType(PostPermissionRead)]),
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
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'post_door_accesses';
    yield serializers.serialize(
      object.postDoorAccesses,
      specifiedType: const FullType(BuiltList, [FullType(PostDoorAccessRead)]),
    );
    yield r'elected_at_semester';
    yield object.electedAtSemester == null ? null : serializers.serialize(
      object.electedAtSemester,
      specifiedType: const FullType.nullable(PostReadElectedAtSemesterEnum),
    );
    yield r'elected_by';
    yield object.electedBy == null ? null : serializers.serialize(
      object.electedBy,
      specifiedType: const FullType.nullable(PostReadElectedByEnum),
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
    PostRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
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
        case r'council_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.councilId = valueDes;
          break;
        case r'permissions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PostPermissionRead)]),
          ) as BuiltList<PostPermissionRead>;
          result.permissions.replace(valueDes);
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
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'post_door_accesses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PostDoorAccessRead)]),
          ) as BuiltList<PostDoorAccessRead>;
          result.postDoorAccesses.replace(valueDes);
          break;
        case r'elected_at_semester':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(PostReadElectedAtSemesterEnum),
          ) as PostReadElectedAtSemesterEnum?;
          if (valueDes == null) continue;
          result.electedAtSemester = valueDes;
          break;
        case r'elected_by':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(PostReadElectedByEnum),
          ) as PostReadElectedByEnum?;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostReadBuilder();
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

class PostReadElectedAtSemesterEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'HT')
  static const PostReadElectedAtSemesterEnum HT = _$postReadElectedAtSemesterEnum_HT;
  @BuiltValueEnumConst(wireName: r'VT')
  static const PostReadElectedAtSemesterEnum VT = _$postReadElectedAtSemesterEnum_VT;
  @BuiltValueEnumConst(wireName: r'HT and VT')
  static const PostReadElectedAtSemesterEnum hTAndVT = _$postReadElectedAtSemesterEnum_hTAndVT;
  @BuiltValueEnumConst(wireName: r'Other')
  static const PostReadElectedAtSemesterEnum other = _$postReadElectedAtSemesterEnum_other;

  static Serializer<PostReadElectedAtSemesterEnum> get serializer => _$postReadElectedAtSemesterEnumSerializer;

  const PostReadElectedAtSemesterEnum._(String name): super(name);

  static BuiltSet<PostReadElectedAtSemesterEnum> get values => _$postReadElectedAtSemesterEnumValues;
  static PostReadElectedAtSemesterEnum valueOf(String name) => _$postReadElectedAtSemesterEnumValueOf(name);
}

class PostReadElectedByEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Guild')
  static const PostReadElectedByEnum guild = _$postReadElectedByEnum_guild;
  @BuiltValueEnumConst(wireName: r'Board')
  static const PostReadElectedByEnum board = _$postReadElectedByEnum_board;
  @BuiltValueEnumConst(wireName: r'Educational Council')
  static const PostReadElectedByEnum educationalCouncil = _$postReadElectedByEnum_educationalCouncil;
  @BuiltValueEnumConst(wireName: r'Board Intermediate')
  static const PostReadElectedByEnum boardIntermediate = _$postReadElectedByEnum_boardIntermediate;
  @BuiltValueEnumConst(wireName: r'Other')
  static const PostReadElectedByEnum other = _$postReadElectedByEnum_other;

  static Serializer<PostReadElectedByEnum> get serializer => _$postReadElectedByEnumSerializer;

  const PostReadElectedByEnum._(String name): super(name);

  static BuiltSet<PostReadElectedByEnum> get values => _$postReadElectedByEnumValues;
  static PostReadElectedByEnum valueOf(String name) => _$postReadElectedByEnumValueOf(name);
}

