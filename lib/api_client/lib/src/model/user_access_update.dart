//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_access_update.g.dart';

/// UserAccessUpdate
///
/// Properties:
/// * [accessId] 
/// * [door] 
/// * [starttime] 
/// * [stoptime] 
@BuiltValue()
abstract class UserAccessUpdate implements Built<UserAccessUpdate, UserAccessUpdateBuilder> {
  @BuiltValueField(wireName: r'access_id')
  int get accessId;

  @BuiltValueField(wireName: r'door')
  UserAccessUpdateDoorEnum? get door;
  // enum doorEnum {  LC,  Bunkern,  Syster Kents,  Cafét,  Caféförrådet,  Pubförrådet,  Containern,  Arkivet,  };

  @BuiltValueField(wireName: r'starttime')
  DateTime? get starttime;

  @BuiltValueField(wireName: r'stoptime')
  DateTime? get stoptime;

  UserAccessUpdate._();

  factory UserAccessUpdate([void updates(UserAccessUpdateBuilder b)]) = _$UserAccessUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserAccessUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserAccessUpdate> get serializer => _$UserAccessUpdateSerializer();
}

class _$UserAccessUpdateSerializer implements PrimitiveSerializer<UserAccessUpdate> {
  @override
  final Iterable<Type> types = const [UserAccessUpdate, _$UserAccessUpdate];

  @override
  final String wireName = r'UserAccessUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserAccessUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'access_id';
    yield serializers.serialize(
      object.accessId,
      specifiedType: const FullType(int),
    );
    if (object.door != null) {
      yield r'door';
      yield serializers.serialize(
        object.door,
        specifiedType: const FullType.nullable(UserAccessUpdateDoorEnum),
      );
    }
    if (object.starttime != null) {
      yield r'starttime';
      yield serializers.serialize(
        object.starttime,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.stoptime != null) {
      yield r'stoptime';
      yield serializers.serialize(
        object.stoptime,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserAccessUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserAccessUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'access_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.accessId = valueDes;
          break;
        case r'door':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UserAccessUpdateDoorEnum),
          ) as UserAccessUpdateDoorEnum?;
          if (valueDes == null) continue;
          result.door = valueDes;
          break;
        case r'starttime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.starttime = valueDes;
          break;
        case r'stoptime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
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
  UserAccessUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserAccessUpdateBuilder();
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

class UserAccessUpdateDoorEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'LC')
  static const UserAccessUpdateDoorEnum LC = _$userAccessUpdateDoorEnum_LC;
  @BuiltValueEnumConst(wireName: r'Bunkern')
  static const UserAccessUpdateDoorEnum bunkern = _$userAccessUpdateDoorEnum_bunkern;
  @BuiltValueEnumConst(wireName: r'Syster Kents')
  static const UserAccessUpdateDoorEnum systerKents = _$userAccessUpdateDoorEnum_systerKents;
  @BuiltValueEnumConst(wireName: r'Cafét')
  static const UserAccessUpdateDoorEnum caft = _$userAccessUpdateDoorEnum_caft;
  @BuiltValueEnumConst(wireName: r'Caféförrådet')
  static const UserAccessUpdateDoorEnum caffrrdet = _$userAccessUpdateDoorEnum_caffrrdet;
  @BuiltValueEnumConst(wireName: r'Pubförrådet')
  static const UserAccessUpdateDoorEnum pubfrrdet = _$userAccessUpdateDoorEnum_pubfrrdet;
  @BuiltValueEnumConst(wireName: r'Containern')
  static const UserAccessUpdateDoorEnum containern = _$userAccessUpdateDoorEnum_containern;
  @BuiltValueEnumConst(wireName: r'Arkivet')
  static const UserAccessUpdateDoorEnum arkivet = _$userAccessUpdateDoorEnum_arkivet;

  static Serializer<UserAccessUpdateDoorEnum> get serializer => _$userAccessUpdateDoorEnumSerializer;

  const UserAccessUpdateDoorEnum._(String name): super(name);

  static BuiltSet<UserAccessUpdateDoorEnum> get values => _$userAccessUpdateDoorEnumValues;
  static UserAccessUpdateDoorEnum valueOf(String name) => _$userAccessUpdateDoorEnumValueOf(name);
}

