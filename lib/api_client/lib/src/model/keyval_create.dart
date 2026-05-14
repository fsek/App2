//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'keyval_create.g.dart';

/// KeyvalCreate
///
/// Properties:
/// * [key] 
/// * [value] 
@BuiltValue()
abstract class KeyvalCreate implements Built<KeyvalCreate, KeyvalCreateBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'value')
  String get value;

  KeyvalCreate._();

  factory KeyvalCreate([void updates(KeyvalCreateBuilder b)]) = _$KeyvalCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(KeyvalCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<KeyvalCreate> get serializer => _$KeyvalCreateSerializer();
}

class _$KeyvalCreateSerializer implements PrimitiveSerializer<KeyvalCreate> {
  @override
  final Iterable<Type> types = const [KeyvalCreate, _$KeyvalCreate];

  @override
  final String wireName = r'KeyvalCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    KeyvalCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    KeyvalCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required KeyvalCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  KeyvalCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = KeyvalCreateBuilder();
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

