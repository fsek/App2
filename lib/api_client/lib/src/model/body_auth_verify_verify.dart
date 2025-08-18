//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'body_auth_verify_verify.g.dart';

/// BodyAuthVerifyVerify
///
/// Properties:
/// * [token] 
@BuiltValue()
abstract class BodyAuthVerifyVerify implements Built<BodyAuthVerifyVerify, BodyAuthVerifyVerifyBuilder> {
  @BuiltValueField(wireName: r'token')
  String get token;

  BodyAuthVerifyVerify._();

  factory BodyAuthVerifyVerify([void updates(BodyAuthVerifyVerifyBuilder b)]) = _$BodyAuthVerifyVerify;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BodyAuthVerifyVerifyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BodyAuthVerifyVerify> get serializer => _$BodyAuthVerifyVerifySerializer();
}

class _$BodyAuthVerifyVerifySerializer implements PrimitiveSerializer<BodyAuthVerifyVerify> {
  @override
  final Iterable<Type> types = const [BodyAuthVerifyVerify, _$BodyAuthVerifyVerify];

  @override
  final String wireName = r'BodyAuthVerifyVerify';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BodyAuthVerifyVerify object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'token';
    yield serializers.serialize(
      object.token,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BodyAuthVerifyVerify object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BodyAuthVerifyVerifyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BodyAuthVerifyVerify deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BodyAuthVerifyVerifyBuilder();
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

