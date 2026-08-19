//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prereg_member_update.g.dart';

/// PreregMemberUpdate
///
/// Properties:
/// * [telephoneNumber] 
/// * [stilId] 
/// * [email] 
@BuiltValue()
abstract class PreregMemberUpdate implements Built<PreregMemberUpdate, PreregMemberUpdateBuilder> {
  @BuiltValueField(wireName: r'telephone_number')
  String? get telephoneNumber;

  @BuiltValueField(wireName: r'stil_id')
  String? get stilId;

  @BuiltValueField(wireName: r'email')
  String? get email;

  PreregMemberUpdate._();

  factory PreregMemberUpdate([void updates(PreregMemberUpdateBuilder b)]) = _$PreregMemberUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PreregMemberUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PreregMemberUpdate> get serializer => _$PreregMemberUpdateSerializer();
}

class _$PreregMemberUpdateSerializer implements PrimitiveSerializer<PreregMemberUpdate> {
  @override
  final Iterable<Type> types = const [PreregMemberUpdate, _$PreregMemberUpdate];

  @override
  final String wireName = r'PreregMemberUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PreregMemberUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.telephoneNumber != null) {
      yield r'telephone_number';
      yield serializers.serialize(
        object.telephoneNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.stilId != null) {
      yield r'stil_id';
      yield serializers.serialize(
        object.stilId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PreregMemberUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PreregMemberUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'telephone_number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.telephoneNumber = valueDes;
          break;
        case r'stil_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.stilId = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
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
  PreregMemberUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreregMemberUpdateBuilder();
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

