//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_access_create.g.dart';

/// UserAccessCreate
///
/// Properties:
/// * [userId] 
/// * [door] 
/// * [starttime] 
/// * [stoptime] 
@BuiltValue()
abstract class UserAccessCreate implements Built<UserAccessCreate, UserAccessCreateBuilder> {
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  @BuiltValueField(wireName: r'door')
  UserAccessCreateDoorEnum get door;
  // enum doorEnum {  LC,  Bunkern,  Syster Kents,  Cafét,  Caféförrådet,  Pubförrådet,  Containern,  Arkivet,  };

  @BuiltValueField(wireName: r'starttime')
  DateTime get starttime;

  @BuiltValueField(wireName: r'stoptime')
  DateTime get stoptime;

  UserAccessCreate._();

  factory UserAccessCreate([void updates(UserAccessCreateBuilder b)]) = _$UserAccessCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserAccessCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserAccessCreate> get serializer => _$UserAccessCreateSerializer();
}

class _$UserAccessCreateSerializer implements PrimitiveSerializer<UserAccessCreate> {
  @override
  final Iterable<Type> types = const [UserAccessCreate, _$UserAccessCreate];

  @override
  final String wireName = r'UserAccessCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserAccessCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(int),
    );
    yield r'door';
    yield serializers.serialize(
      object.door,
      specifiedType: const FullType(UserAccessCreateDoorEnum),
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
    UserAccessCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserAccessCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'door':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserAccessCreateDoorEnum),
          ) as UserAccessCreateDoorEnum;
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
  UserAccessCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserAccessCreateBuilder();
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

class UserAccessCreateDoorEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'LC')
  static const UserAccessCreateDoorEnum LC = _$userAccessCreateDoorEnum_LC;
  @BuiltValueEnumConst(wireName: r'Bunkern')
  static const UserAccessCreateDoorEnum bunkern = _$userAccessCreateDoorEnum_bunkern;
  @BuiltValueEnumConst(wireName: r'Syster Kents')
  static const UserAccessCreateDoorEnum systerKents = _$userAccessCreateDoorEnum_systerKents;
  @BuiltValueEnumConst(wireName: r'Cafét')
  static const UserAccessCreateDoorEnum caft = _$userAccessCreateDoorEnum_caft;
  @BuiltValueEnumConst(wireName: r'Caféförrådet')
  static const UserAccessCreateDoorEnum caffrrdet = _$userAccessCreateDoorEnum_caffrrdet;
  @BuiltValueEnumConst(wireName: r'Pubförrådet')
  static const UserAccessCreateDoorEnum pubfrrdet = _$userAccessCreateDoorEnum_pubfrrdet;
  @BuiltValueEnumConst(wireName: r'Containern')
  static const UserAccessCreateDoorEnum containern = _$userAccessCreateDoorEnum_containern;
  @BuiltValueEnumConst(wireName: r'Arkivet')
  static const UserAccessCreateDoorEnum arkivet = _$userAccessCreateDoorEnum_arkivet;

  static Serializer<UserAccessCreateDoorEnum> get serializer => _$userAccessCreateDoorEnumSerializer;

  const UserAccessCreateDoorEnum._(String name): super(name);

  static BuiltSet<UserAccessCreateDoorEnum> get values => _$userAccessCreateDoorEnumValues;
  static UserAccessCreateDoorEnum valueOf(String name) => _$userAccessCreateDoorEnumValueOf(name);
}

