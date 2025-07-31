//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'body_auth_reset_forgot_password.g.dart';

/// BodyAuthResetForgotPassword
///
/// Properties:
/// * [email] 
@BuiltValue()
abstract class BodyAuthResetForgotPassword implements Built<BodyAuthResetForgotPassword, BodyAuthResetForgotPasswordBuilder> {
  @BuiltValueField(wireName: r'email')
  String get email;

  BodyAuthResetForgotPassword._();

  factory BodyAuthResetForgotPassword([void updates(BodyAuthResetForgotPasswordBuilder b)]) = _$BodyAuthResetForgotPassword;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BodyAuthResetForgotPasswordBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BodyAuthResetForgotPassword> get serializer => _$BodyAuthResetForgotPasswordSerializer();
}

class _$BodyAuthResetForgotPasswordSerializer implements PrimitiveSerializer<BodyAuthResetForgotPassword> {
  @override
  final Iterable<Type> types = const [BodyAuthResetForgotPassword, _$BodyAuthResetForgotPassword];

  @override
  final String wireName = r'BodyAuthResetForgotPassword';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BodyAuthResetForgotPassword object, {
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
    BodyAuthResetForgotPassword object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BodyAuthResetForgotPasswordBuilder result,
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
  BodyAuthResetForgotPassword deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BodyAuthResetForgotPasswordBuilder();
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

