//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'album_create.g.dart';

/// AlbumCreate
///
/// Properties:
/// * [titleSv] 
/// * [titleEn] 
/// * [descSv] 
/// * [descEn] 
/// * [year] 
/// * [location] 
/// * [date] 
@BuiltValue()
abstract class AlbumCreate implements Built<AlbumCreate, AlbumCreateBuilder> {
  @BuiltValueField(wireName: r'title_sv')
  String get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String get titleEn;

  @BuiltValueField(wireName: r'desc_sv')
  String get descSv;

  @BuiltValueField(wireName: r'desc_en')
  String get descEn;

  @BuiltValueField(wireName: r'year')
  int get year;

  @BuiltValueField(wireName: r'location')
  String get location;

  @BuiltValueField(wireName: r'date')
  DateTime get date;

  AlbumCreate._();

  factory AlbumCreate([void updates(AlbumCreateBuilder b)]) = _$AlbumCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AlbumCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AlbumCreate> get serializer => _$AlbumCreateSerializer();
}

class _$AlbumCreateSerializer implements PrimitiveSerializer<AlbumCreate> {
  @override
  final Iterable<Type> types = const [AlbumCreate, _$AlbumCreate];

  @override
  final String wireName = r'AlbumCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AlbumCreate object, {
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
    yield r'desc_sv';
    yield serializers.serialize(
      object.descSv,
      specifiedType: const FullType(String),
    );
    yield r'desc_en';
    yield serializers.serialize(
      object.descEn,
      specifiedType: const FullType(String),
    );
    yield r'year';
    yield serializers.serialize(
      object.year,
      specifiedType: const FullType(int),
    );
    yield r'location';
    yield serializers.serialize(
      object.location,
      specifiedType: const FullType(String),
    );
    yield r'date';
    yield serializers.serialize(
      object.date,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AlbumCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AlbumCreateBuilder result,
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
        case r'desc_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.descSv = valueDes;
          break;
        case r'desc_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.descEn = valueDes;
          break;
        case r'year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.year = valueDes;
          break;
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.location = valueDes;
          break;
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.date = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AlbumCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AlbumCreateBuilder();
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

