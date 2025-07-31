//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/song_category_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'song_read.g.dart';

/// SongRead
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [author] 
/// * [melody] 
/// * [content] 
/// * [category] 
/// * [views] 
@BuiltValue()
abstract class SongRead implements Built<SongRead, SongReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'author')
  String? get author;

  @BuiltValueField(wireName: r'melody')
  String? get melody;

  @BuiltValueField(wireName: r'content')
  String get content;

  @BuiltValueField(wireName: r'category')
  SongCategoryRead? get category;

  @BuiltValueField(wireName: r'views')
  int get views;

  SongRead._();

  factory SongRead([void updates(SongReadBuilder b)]) = _$SongRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SongReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SongRead> get serializer => _$SongReadSerializer();
}

class _$SongReadSerializer implements PrimitiveSerializer<SongRead> {
  @override
  final Iterable<Type> types = const [SongRead, _$SongRead];

  @override
  final String wireName = r'SongRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SongRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'author';
    yield object.author == null ? null : serializers.serialize(
      object.author,
      specifiedType: const FullType.nullable(String),
    );
    yield r'melody';
    yield object.melody == null ? null : serializers.serialize(
      object.melody,
      specifiedType: const FullType.nullable(String),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    yield r'category';
    yield object.category == null ? null : serializers.serialize(
      object.category,
      specifiedType: const FullType.nullable(SongCategoryRead),
    );
    yield r'views';
    yield serializers.serialize(
      object.views,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SongRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SongReadBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'author':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.author = valueDes;
          break;
        case r'melody':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.melody = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SongCategoryRead),
          ) as SongCategoryRead?;
          if (valueDes == null) continue;
          result.category.replace(valueDes);
          break;
        case r'views':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.views = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SongRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SongReadBuilder();
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

