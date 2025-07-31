//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'news_create.g.dart';

/// NewsCreate
///
/// Properties:
/// * [titleSv] 
/// * [titleEn] 
/// * [contentSv] 
/// * [contentEn] 
/// * [pinnedFrom] 
/// * [pinnedTo] 
@BuiltValue()
abstract class NewsCreate implements Built<NewsCreate, NewsCreateBuilder> {
  @BuiltValueField(wireName: r'title_sv')
  String get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String get titleEn;

  @BuiltValueField(wireName: r'content_sv')
  String get contentSv;

  @BuiltValueField(wireName: r'content_en')
  String get contentEn;

  @BuiltValueField(wireName: r'pinned_from')
  DateTime? get pinnedFrom;

  @BuiltValueField(wireName: r'pinned_to')
  DateTime? get pinnedTo;

  NewsCreate._();

  factory NewsCreate([void updates(NewsCreateBuilder b)]) = _$NewsCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NewsCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NewsCreate> get serializer => _$NewsCreateSerializer();
}

class _$NewsCreateSerializer implements PrimitiveSerializer<NewsCreate> {
  @override
  final Iterable<Type> types = const [NewsCreate, _$NewsCreate];

  @override
  final String wireName = r'NewsCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NewsCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    if (object.pinnedFrom != null) {
      yield r'pinned_from';
      yield serializers.serialize(
        object.pinnedFrom,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.pinnedTo != null) {
      yield r'pinned_to';
      yield serializers.serialize(
        object.pinnedTo,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    NewsCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NewsCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  NewsCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NewsCreateBuilder();
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

