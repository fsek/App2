//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/simple_user_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'photographer_in_album_read.g.dart';

/// PhotographerInAlbumRead
///
/// Properties:
/// * [user] 
@BuiltValue()
abstract class PhotographerInAlbumRead implements Built<PhotographerInAlbumRead, PhotographerInAlbumReadBuilder> {
  @BuiltValueField(wireName: r'user')
  SimpleUserRead get user;

  PhotographerInAlbumRead._();

  factory PhotographerInAlbumRead([void updates(PhotographerInAlbumReadBuilder b)]) = _$PhotographerInAlbumRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PhotographerInAlbumReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PhotographerInAlbumRead> get serializer => _$PhotographerInAlbumReadSerializer();
}

class _$PhotographerInAlbumReadSerializer implements PrimitiveSerializer<PhotographerInAlbumRead> {
  @override
  final Iterable<Type> types = const [PhotographerInAlbumRead, _$PhotographerInAlbumRead];

  @override
  final String wireName = r'PhotographerInAlbumRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PhotographerInAlbumRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user';
    yield serializers.serialize(
      object.user,
      specifiedType: const FullType(SimpleUserRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PhotographerInAlbumRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PhotographerInAlbumReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SimpleUserRead),
          ) as SimpleUserRead;
          result.user.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PhotographerInAlbumRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PhotographerInAlbumReadBuilder();
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

