//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/img_in_album.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'album_read.g.dart';

/// AlbumRead
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [year] 
/// * [imgs] 
@BuiltValue()
abstract class AlbumRead implements Built<AlbumRead, AlbumReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'year')
  int get year;

  @BuiltValueField(wireName: r'imgs')
  BuiltList<ImgInAlbum> get imgs;

  AlbumRead._();

  factory AlbumRead([void updates(AlbumReadBuilder b)]) = _$AlbumRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AlbumReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AlbumRead> get serializer => _$AlbumReadSerializer();
}

class _$AlbumReadSerializer implements PrimitiveSerializer<AlbumRead> {
  @override
  final Iterable<Type> types = const [AlbumRead, _$AlbumRead];

  @override
  final String wireName = r'AlbumRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AlbumRead object, {
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
    yield r'year';
    yield serializers.serialize(
      object.year,
      specifiedType: const FullType(int),
    );
    yield r'imgs';
    yield serializers.serialize(
      object.imgs,
      specifiedType: const FullType(BuiltList, [FullType(ImgInAlbum)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AlbumRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AlbumReadBuilder result,
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
        case r'year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.year = valueDes;
          break;
        case r'imgs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ImgInAlbum)]),
          ) as BuiltList<ImgInAlbum>;
          result.imgs.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AlbumRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AlbumReadBuilder();
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

