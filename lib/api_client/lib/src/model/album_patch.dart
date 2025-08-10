//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'album_patch.g.dart';

/// AlbumPatch
///
/// Properties:
/// * [titleSv] 
/// * [titleEn] 
/// * [descSv] 
/// * [descEn] 
/// * [location] 
@BuiltValue()
abstract class AlbumPatch implements Built<AlbumPatch, AlbumPatchBuilder> {
  @BuiltValueField(wireName: r'title_sv')
  String? get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String? get titleEn;

  @BuiltValueField(wireName: r'desc_sv')
  String? get descSv;

  @BuiltValueField(wireName: r'desc_en')
  String? get descEn;

  @BuiltValueField(wireName: r'location')
  String? get location;

  AlbumPatch._();

  factory AlbumPatch([void updates(AlbumPatchBuilder b)]) = _$AlbumPatch;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AlbumPatchBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AlbumPatch> get serializer => _$AlbumPatchSerializer();
}

class _$AlbumPatchSerializer implements PrimitiveSerializer<AlbumPatch> {
  @override
  final Iterable<Type> types = const [AlbumPatch, _$AlbumPatch];

  @override
  final String wireName = r'AlbumPatch';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AlbumPatch object, {
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
    if (object.descSv != null) {
      yield r'desc_sv';
      yield serializers.serialize(
        object.descSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.descEn != null) {
      yield r'desc_en';
      yield serializers.serialize(
        object.descEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.location != null) {
      yield r'location';
      yield serializers.serialize(
        object.location,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AlbumPatch object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AlbumPatchBuilder result,
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
        case r'desc_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.descSv = valueDes;
          break;
        case r'desc_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.descEn = valueDes;
          break;
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.location = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AlbumPatch deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AlbumPatchBuilder();
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

