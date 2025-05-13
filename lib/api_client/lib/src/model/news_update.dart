//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'news_update.g.dart';

/// NewsUpdate
///
/// Properties:
/// * [titleSv] 
/// * [titleEn] 
/// * [contentSv] 
/// * [contentEn] 
/// * [pinnedFrom] 
/// * [pinnedTo] 
@BuiltValue()
abstract class NewsUpdate implements Built<NewsUpdate, NewsUpdateBuilder> {
  @BuiltValueField(wireName: r'title_sv')
  String? get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String? get titleEn;

  @BuiltValueField(wireName: r'content_sv')
  String? get contentSv;

  @BuiltValueField(wireName: r'content_en')
  String? get contentEn;

  @BuiltValueField(wireName: r'pinned_from')
  DateTime? get pinnedFrom;

  @BuiltValueField(wireName: r'pinned_to')
  DateTime? get pinnedTo;

  NewsUpdate._();

  factory NewsUpdate([void updates(NewsUpdateBuilder b)]) = _$NewsUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NewsUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NewsUpdate> get serializer => _$NewsUpdateSerializer();
}

class _$NewsUpdateSerializer implements PrimitiveSerializer<NewsUpdate> {
  @override
  final Iterable<Type> types = const [NewsUpdate, _$NewsUpdate];

  @override
  final String wireName = r'NewsUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NewsUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.titleSv != null) {
      yield r'title_sv';
      yield serializers.serialize(
        object.titleSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.titleEn != null) {
      yield r'title_en';
      yield serializers.serialize(
        object.titleEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.contentSv != null) {
      yield r'content_sv';
      yield serializers.serialize(
        object.contentSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.contentEn != null) {
      yield r'content_en';
      yield serializers.serialize(
        object.contentEn,
        specifiedType: const FullType.nullable(String),
      );
    }
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
    NewsUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NewsUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.titleSv = valueDes;
          break;
        case r'title_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.titleEn = valueDes;
          break;
        case r'content_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.contentSv = valueDes;
          break;
        case r'content_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
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
  NewsUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NewsUpdateBuilder();
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

