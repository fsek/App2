//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'keyval_update.g.dart';

/// KeyvalUpdate
///
/// Properties:
/// * [value] 
@BuiltValue()
abstract class KeyvalUpdate implements Built<KeyvalUpdate, KeyvalUpdateBuilder> {
  @BuiltValueField(wireName: r'value')
  String get value;

  KeyvalUpdate._();

  factory KeyvalUpdate([void updates(KeyvalUpdateBuilder b)]) = _$KeyvalUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(KeyvalUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<KeyvalUpdate> get serializer => _$KeyvalUpdateSerializer();
}

class _$KeyvalUpdateSerializer implements PrimitiveSerializer<KeyvalUpdate> {
  @override
  final Iterable<Type> types = const [KeyvalUpdate, _$KeyvalUpdate];

  @override
  final String wireName = r'KeyvalUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    KeyvalUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    KeyvalUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required KeyvalUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  KeyvalUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = KeyvalUpdateBuilder();
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

