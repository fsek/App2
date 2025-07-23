//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'body_auth_verify_request_token.g.dart';

/// BodyAuthVerifyRequestToken
///
/// Properties:
/// * [email] 
@BuiltValue()
abstract class BodyAuthVerifyRequestToken implements Built<BodyAuthVerifyRequestToken, BodyAuthVerifyRequestTokenBuilder> {
  @BuiltValueField(wireName: r'email')
  String get email;

  BodyAuthVerifyRequestToken._();

  factory BodyAuthVerifyRequestToken([void updates(BodyAuthVerifyRequestTokenBuilder b)]) = _$BodyAuthVerifyRequestToken;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BodyAuthVerifyRequestTokenBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BodyAuthVerifyRequestToken> get serializer => _$BodyAuthVerifyRequestTokenSerializer();
}

class _$BodyAuthVerifyRequestTokenSerializer implements PrimitiveSerializer<BodyAuthVerifyRequestToken> {
  @override
  final Iterable<Type> types = const [BodyAuthVerifyRequestToken, _$BodyAuthVerifyRequestToken];

  @override
  final String wireName = r'BodyAuthVerifyRequestToken';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BodyAuthVerifyRequestToken object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BodyAuthVerifyRequestToken object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BodyAuthVerifyRequestTokenBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BodyAuthVerifyRequestToken deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BodyAuthVerifyRequestTokenBuilder();
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

