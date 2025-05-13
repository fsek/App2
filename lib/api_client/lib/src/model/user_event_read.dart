//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_event_read.g.dart';

/// UserEventRead
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class UserEventRead implements Built<UserEventRead, UserEventReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  UserEventRead._();

  factory UserEventRead([void updates(UserEventReadBuilder b)]) = _$UserEventRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserEventReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserEventRead> get serializer => _$UserEventReadSerializer();
}

class _$UserEventReadSerializer implements PrimitiveSerializer<UserEventRead> {
  @override
  final Iterable<Type> types = const [UserEventRead, _$UserEventRead];

  @override
  final String wireName = r'UserEventRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserEventRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserEventRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserEventReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserEventRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserEventReadBuilder();
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

