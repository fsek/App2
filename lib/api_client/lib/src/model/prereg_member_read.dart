//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prereg_member_read.g.dart';

/// PreregMemberRead
///
/// Properties:
/// * [preregMemberId] 
/// * [telephoneNumber] 
/// * [stilId] 
/// * [email] 
@BuiltValue()
abstract class PreregMemberRead implements Built<PreregMemberRead, PreregMemberReadBuilder> {
  @BuiltValueField(wireName: r'prereg_member_id')
  int get preregMemberId;

  @BuiltValueField(wireName: r'telephone_number')
  String? get telephoneNumber;

  @BuiltValueField(wireName: r'stil_id')
  String? get stilId;

  @BuiltValueField(wireName: r'email')
  String? get email;

  PreregMemberRead._();

  factory PreregMemberRead([void updates(PreregMemberReadBuilder b)]) = _$PreregMemberRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PreregMemberReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PreregMemberRead> get serializer => _$PreregMemberReadSerializer();
}

class _$PreregMemberReadSerializer implements PrimitiveSerializer<PreregMemberRead> {
  @override
  final Iterable<Type> types = const [PreregMemberRead, _$PreregMemberRead];

  @override
  final String wireName = r'PreregMemberRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PreregMemberRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'prereg_member_id';
    yield serializers.serialize(
      object.preregMemberId,
      specifiedType: const FullType(int),
    );
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
    PreregMemberRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PreregMemberReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'prereg_member_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.preregMemberId = valueDes;
          break;
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
  PreregMemberRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreregMemberReadBuilder();
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

