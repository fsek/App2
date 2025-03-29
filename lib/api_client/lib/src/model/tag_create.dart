//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tag_create.g.dart';

/// TagCreate
///
/// Properties:
/// * [name] 
@BuiltValue()
abstract class TagCreate implements Built<TagCreate, TagCreateBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  TagCreate._();

  factory TagCreate([void updates(TagCreateBuilder b)]) = _$TagCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TagCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TagCreate> get serializer => _$TagCreateSerializer();
}

class _$TagCreateSerializer implements PrimitiveSerializer<TagCreate> {
  @override
  final Iterable<Type> types = const [TagCreate, _$TagCreate];

  @override
  final String wireName = r'TagCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TagCreate object, {
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
    TagCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TagCreateBuilder result,
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
  TagCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TagCreateBuilder();
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

