//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'img_in_album.g.dart';

/// ImgInAlbum
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class ImgInAlbum implements Built<ImgInAlbum, ImgInAlbumBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  ImgInAlbum._();

  factory ImgInAlbum([void updates(ImgInAlbumBuilder b)]) = _$ImgInAlbum;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ImgInAlbumBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ImgInAlbum> get serializer => _$ImgInAlbumSerializer();
}

class _$ImgInAlbumSerializer implements PrimitiveSerializer<ImgInAlbum> {
  @override
  final Iterable<Type> types = const [ImgInAlbum, _$ImgInAlbum];

  @override
  final String wireName = r'ImgInAlbum';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ImgInAlbum object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ImgInAlbum object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ImgInAlbumBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ImgInAlbum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ImgInAlbumBuilder();
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

