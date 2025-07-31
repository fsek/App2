//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'body_auth_reset_reset_password.g.dart';

/// BodyAuthResetResetPassword
///
/// Properties:
/// * [token] 
/// * [password] 
@BuiltValue()
abstract class BodyAuthResetResetPassword implements Built<BodyAuthResetResetPassword, BodyAuthResetResetPasswordBuilder> {
  @BuiltValueField(wireName: r'token')
  String get token;

  @BuiltValueField(wireName: r'password')
  String get password;

  BodyAuthResetResetPassword._();

  factory BodyAuthResetResetPassword([void updates(BodyAuthResetResetPasswordBuilder b)]) = _$BodyAuthResetResetPassword;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BodyAuthResetResetPasswordBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BodyAuthResetResetPassword> get serializer => _$BodyAuthResetResetPasswordSerializer();
}

class _$BodyAuthResetResetPasswordSerializer implements PrimitiveSerializer<BodyAuthResetResetPassword> {
  @override
  final Iterable<Type> types = const [BodyAuthResetResetPassword, _$BodyAuthResetResetPassword];

  @override
  final String wireName = r'BodyAuthResetResetPassword';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BodyAuthResetResetPassword object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'token';
    yield serializers.serialize(
      object.token,
      specifiedType: const FullType(String),
    );
    yield r'password';
    yield serializers.serialize(
      object.password,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BodyAuthResetResetPassword object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BodyAuthResetResetPasswordBuilder result,
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
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BodyAuthResetResetPassword deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BodyAuthResetResetPasswordBuilder();
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

