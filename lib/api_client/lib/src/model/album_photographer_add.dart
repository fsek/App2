//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'album_photographer_add.g.dart';

/// AlbumPhotographerAdd
///
/// Properties:
/// * [userId] 
/// * [albumId] 
@BuiltValue()
abstract class AlbumPhotographerAdd implements Built<AlbumPhotographerAdd, AlbumPhotographerAddBuilder> {
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  @BuiltValueField(wireName: r'album_id')
  int get albumId;

  AlbumPhotographerAdd._();

  factory AlbumPhotographerAdd([void updates(AlbumPhotographerAddBuilder b)]) = _$AlbumPhotographerAdd;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AlbumPhotographerAddBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AlbumPhotographerAdd> get serializer => _$AlbumPhotographerAddSerializer();
}

class _$AlbumPhotographerAddSerializer implements PrimitiveSerializer<AlbumPhotographerAdd> {
  @override
  final Iterable<Type> types = const [AlbumPhotographerAdd, _$AlbumPhotographerAdd];

  @override
  final String wireName = r'AlbumPhotographerAdd';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AlbumPhotographerAdd object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(int),
    );
    yield r'album_id';
    yield serializers.serialize(
      object.albumId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AlbumPhotographerAdd object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AlbumPhotographerAddBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'album_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.albumId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AlbumPhotographerAdd deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AlbumPhotographerAddBuilder();
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

