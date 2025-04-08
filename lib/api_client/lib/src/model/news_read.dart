//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/user_in_news_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'news_read.g.dart';

/// NewsRead
///
/// Properties:
/// * [id] 
/// * [titleSv] 
/// * [titleEn] 
/// * [contentSv] 
/// * [contentEn] 
/// * [authorId] 
/// * [author] 
/// * [createdAt] 
/// * [bumpedAt] 
/// * [pinnedFrom] 
/// * [pinnedTo] 
@BuiltValue()
abstract class NewsRead implements Built<NewsRead, NewsReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title_sv')
  String get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String get titleEn;

  @BuiltValueField(wireName: r'content_sv')
  String get contentSv;

  @BuiltValueField(wireName: r'content_en')
  String get contentEn;

  @BuiltValueField(wireName: r'author_id')
  int get authorId;

  @BuiltValueField(wireName: r'author')
  UserInNewsRead get author;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'bumped_at')
  DateTime? get bumpedAt;

  @BuiltValueField(wireName: r'pinned_from')
  DateTime? get pinnedFrom;

  @BuiltValueField(wireName: r'pinned_to')
  DateTime? get pinnedTo;

  NewsRead._();

  factory NewsRead([void updates(NewsReadBuilder b)]) = _$NewsRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NewsReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NewsRead> get serializer => _$NewsReadSerializer();
}

class _$NewsReadSerializer implements PrimitiveSerializer<NewsRead> {
  @override
  final Iterable<Type> types = const [NewsRead, _$NewsRead];

  @override
  final String wireName = r'NewsRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NewsRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
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
    yield r'content_sv';
    yield serializers.serialize(
      object.contentSv,
      specifiedType: const FullType(String),
    );
    yield r'content_en';
    yield serializers.serialize(
      object.contentEn,
      specifiedType: const FullType(String),
    );
    yield r'author_id';
    yield serializers.serialize(
      object.authorId,
      specifiedType: const FullType(int),
    );
    yield r'author';
    yield serializers.serialize(
      object.author,
      specifiedType: const FullType(UserInNewsRead),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'bumped_at';
    yield object.bumpedAt == null ? null : serializers.serialize(
      object.bumpedAt,
      specifiedType: const FullType.nullable(DateTime),
    );
    yield r'pinned_from';
    yield object.pinnedFrom == null ? null : serializers.serialize(
      object.pinnedFrom,
      specifiedType: const FullType.nullable(DateTime),
    );
    yield r'pinned_to';
    yield object.pinnedTo == null ? null : serializers.serialize(
      object.pinnedTo,
      specifiedType: const FullType.nullable(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NewsRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NewsReadBuilder result,
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
        case r'content_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.contentSv = valueDes;
          break;
        case r'content_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.contentEn = valueDes;
          break;
        case r'author_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.authorId = valueDes;
          break;
        case r'author':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserInNewsRead),
          ) as UserInNewsRead;
          result.author.replace(valueDes);
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'bumped_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.bumpedAt = valueDes;
          break;
        case r'pinned_from':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.pinnedFrom = valueDes;
          break;
        case r'pinned_to':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.pinnedTo = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NewsRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NewsReadBuilder();
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

