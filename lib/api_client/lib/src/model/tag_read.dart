//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/event_tag_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/news_tag_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tag_read.g.dart';

/// TagRead
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [newsTags] 
/// * [eventTags] 
@BuiltValue()
abstract class TagRead implements Built<TagRead, TagReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'news_tags')
  BuiltList<NewsTagRead> get newsTags;

  @BuiltValueField(wireName: r'event_tags')
  BuiltList<EventTagRead> get eventTags;

  TagRead._();

  factory TagRead([void updates(TagReadBuilder b)]) = _$TagRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TagReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TagRead> get serializer => _$TagReadSerializer();
}

class _$TagReadSerializer implements PrimitiveSerializer<TagRead> {
  @override
  final Iterable<Type> types = const [TagRead, _$TagRead];

  @override
  final String wireName = r'TagRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TagRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'news_tags';
    yield serializers.serialize(
      object.newsTags,
      specifiedType: const FullType(BuiltList, [FullType(NewsTagRead)]),
    );
    yield r'event_tags';
    yield serializers.serialize(
      object.eventTags,
      specifiedType: const FullType(BuiltList, [FullType(EventTagRead)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TagRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TagReadBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'news_tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(NewsTagRead)]),
          ) as BuiltList<NewsTagRead>;
          result.newsTags.replace(valueDes);
          break;
        case r'event_tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(EventTagRead)]),
          ) as BuiltList<EventTagRead>;
          result.eventTags.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TagRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TagReadBuilder();
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

