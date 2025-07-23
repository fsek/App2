//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/simple_user_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_access_read.g.dart';

/// UserAccessRead
///
/// Properties:
/// * [userAccessId] 
/// * [user] 
/// * [door] 
/// * [starttime] 
/// * [stoptime] 
@BuiltValue()
abstract class UserAccessRead implements Built<UserAccessRead, UserAccessReadBuilder> {
  @BuiltValueField(wireName: r'user_access_id')
  int get userAccessId;

  @BuiltValueField(wireName: r'user')
  SimpleUserRead get user;

  @BuiltValueField(wireName: r'door')
  String get door;

  @BuiltValueField(wireName: r'starttime')
  DateTime get starttime;

  @BuiltValueField(wireName: r'stoptime')
  DateTime get stoptime;

  UserAccessRead._();

  factory UserAccessRead([void updates(UserAccessReadBuilder b)]) = _$UserAccessRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserAccessReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserAccessRead> get serializer => _$UserAccessReadSerializer();
}

class _$UserAccessReadSerializer implements PrimitiveSerializer<UserAccessRead> {
  @override
  final Iterable<Type> types = const [UserAccessRead, _$UserAccessRead];

  @override
  final String wireName = r'UserAccessRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserAccessRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_access_id';
    yield serializers.serialize(
      object.userAccessId,
      specifiedType: const FullType(int),
    );
    yield r'user';
    yield serializers.serialize(
      object.user,
      specifiedType: const FullType(SimpleUserRead),
    );
    yield r'door';
    yield serializers.serialize(
      object.door,
      specifiedType: const FullType(String),
    );
    yield r'starttime';
    yield serializers.serialize(
      object.starttime,
      specifiedType: const FullType(DateTime),
    );
    yield r'stoptime';
    yield serializers.serialize(
      object.stoptime,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserAccessRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserAccessReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_access_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userAccessId = valueDes;
          break;
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SimpleUserRead),
          ) as SimpleUserRead;
          result.user.replace(valueDes);
          break;
        case r'door':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.door = valueDes;
          break;
        case r'starttime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.starttime = valueDes;
          break;
        case r'stoptime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.stoptime = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserAccessRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserAccessReadBuilder();
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

