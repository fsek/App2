//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prereg_member_create.g.dart';

/// PreregMemberCreate
///
/// Properties:
/// * [telephoneNumber] 
/// * [stilId] 
/// * [email] 
@BuiltValue()
abstract class PreregMemberCreate implements Built<PreregMemberCreate, PreregMemberCreateBuilder> {
  @BuiltValueField(wireName: r'telephone_number')
  String? get telephoneNumber;

  @BuiltValueField(wireName: r'stil_id')
  String? get stilId;

  @BuiltValueField(wireName: r'email')
  String? get email;

  PreregMemberCreate._();

  factory PreregMemberCreate([void updates(PreregMemberCreateBuilder b)]) = _$PreregMemberCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PreregMemberCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PreregMemberCreate> get serializer => _$PreregMemberCreateSerializer();
}

class _$PreregMemberCreateSerializer implements PrimitiveSerializer<PreregMemberCreate> {
  @override
  final Iterable<Type> types = const [PreregMemberCreate, _$PreregMemberCreate];

  @override
  final String wireName = r'PreregMemberCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PreregMemberCreate object, {
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
    PreregMemberCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PreregMemberCreateBuilder result,
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
  PreregMemberCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreregMemberCreateBuilder();
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

