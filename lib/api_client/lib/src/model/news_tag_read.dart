//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/news_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'news_tag_read.g.dart';

/// NewsTagRead
///
/// Properties:
/// * [news] 
@BuiltValue()
abstract class NewsTagRead implements Built<NewsTagRead, NewsTagReadBuilder> {
  @BuiltValueField(wireName: r'news')
  NewsRead get news;

  NewsTagRead._();

  factory NewsTagRead([void updates(NewsTagReadBuilder b)]) = _$NewsTagRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NewsTagReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NewsTagRead> get serializer => _$NewsTagReadSerializer();
}

class _$NewsTagReadSerializer implements PrimitiveSerializer<NewsTagRead> {
  @override
  final Iterable<Type> types = const [NewsTagRead, _$NewsTagRead];

  @override
  final String wireName = r'NewsTagRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NewsTagRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'news';
    yield serializers.serialize(
      object.news,
      specifiedType: const FullType(NewsRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NewsTagRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NewsTagReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'news':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(NewsRead),
          ) as NewsRead;
          result.news.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NewsTagRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NewsTagReadBuilder();
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

