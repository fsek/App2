//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'song_category_create.g.dart';

/// SongCategoryCreate
///
/// Properties:
/// * [name] 
@BuiltValue()
abstract class SongCategoryCreate implements Built<SongCategoryCreate, SongCategoryCreateBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  SongCategoryCreate._();

  factory SongCategoryCreate([void updates(SongCategoryCreateBuilder b)]) = _$SongCategoryCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SongCategoryCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SongCategoryCreate> get serializer => _$SongCategoryCreateSerializer();
}

class _$SongCategoryCreateSerializer implements PrimitiveSerializer<SongCategoryCreate> {
  @override
  final Iterable<Type> types = const [SongCategoryCreate, _$SongCategoryCreate];

  @override
  final String wireName = r'SongCategoryCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SongCategoryCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SongCategoryCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SongCategoryCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SongCategoryCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SongCategoryCreateBuilder();
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

