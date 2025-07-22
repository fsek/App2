//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
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

