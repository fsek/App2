//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'permission_read.g.dart';

/// PermissionRead
///
/// Properties:
/// * [id] 
/// * [action] 
/// * [target] 
@BuiltValue()
abstract class PermissionRead implements Built<PermissionRead, PermissionReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'action')
  PermissionReadActionEnum get action;
  // enum actionEnum {  view,  manage,  };

  @BuiltValueField(wireName: r'target')
  PermissionReadTargetEnum get target;
  // enum targetEnum {  Event,  User,  Post,  Permission,  News,  Song,  Ads,  Gallery,  Car,  Cafe,  Election,  Groups,  Adventure Missions,  Nollning,  UserDoorAccess,  Tags,  Council,  };

  PermissionRead._();

  factory PermissionRead([void updates(PermissionReadBuilder b)]) = _$PermissionRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PermissionReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PermissionRead> get serializer => _$PermissionReadSerializer();
}

class _$PermissionReadSerializer implements PrimitiveSerializer<PermissionRead> {
  @override
  final Iterable<Type> types = const [PermissionRead, _$PermissionRead];

  @override
  final String wireName = r'PermissionRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PermissionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'action';
    yield serializers.serialize(
      object.action,
      specifiedType: const FullType(PermissionReadActionEnum),
    );
    yield r'target';
    yield serializers.serialize(
      object.target,
      specifiedType: const FullType(PermissionReadTargetEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PermissionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PermissionReadBuilder result,
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
        case r'action':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PermissionReadActionEnum),
          ) as PermissionReadActionEnum;
          result.action = valueDes;
          break;
        case r'target':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PermissionReadTargetEnum),
          ) as PermissionReadTargetEnum;
          result.target = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PermissionRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PermissionReadBuilder();
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

class PermissionReadActionEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'view')
  static const PermissionReadActionEnum view = _$permissionReadActionEnum_view;
  @BuiltValueEnumConst(wireName: r'manage')
  static const PermissionReadActionEnum manage = _$permissionReadActionEnum_manage;

  static Serializer<PermissionReadActionEnum> get serializer => _$permissionReadActionEnumSerializer;

  const PermissionReadActionEnum._(String name): super(name);

  static BuiltSet<PermissionReadActionEnum> get values => _$permissionReadActionEnumValues;
  static PermissionReadActionEnum valueOf(String name) => _$permissionReadActionEnumValueOf(name);
}

class PermissionReadTargetEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Event')
  static const PermissionReadTargetEnum event = _$permissionReadTargetEnum_event;
  @BuiltValueEnumConst(wireName: r'User')
  static const PermissionReadTargetEnum user = _$permissionReadTargetEnum_user;
  @BuiltValueEnumConst(wireName: r'Post')
  static const PermissionReadTargetEnum post = _$permissionReadTargetEnum_post;
  @BuiltValueEnumConst(wireName: r'Permission')
  static const PermissionReadTargetEnum permission = _$permissionReadTargetEnum_permission;
  @BuiltValueEnumConst(wireName: r'News')
  static const PermissionReadTargetEnum news = _$permissionReadTargetEnum_news;
  @BuiltValueEnumConst(wireName: r'Song')
  static const PermissionReadTargetEnum song = _$permissionReadTargetEnum_song;
  @BuiltValueEnumConst(wireName: r'Ads')
  static const PermissionReadTargetEnum ads = _$permissionReadTargetEnum_ads;
  @BuiltValueEnumConst(wireName: r'Gallery')
  static const PermissionReadTargetEnum gallery = _$permissionReadTargetEnum_gallery;
  @BuiltValueEnumConst(wireName: r'Car')
  static const PermissionReadTargetEnum car = _$permissionReadTargetEnum_car;
  @BuiltValueEnumConst(wireName: r'Cafe')
  static const PermissionReadTargetEnum cafe = _$permissionReadTargetEnum_cafe;
  @BuiltValueEnumConst(wireName: r'Election')
  static const PermissionReadTargetEnum election = _$permissionReadTargetEnum_election;
  @BuiltValueEnumConst(wireName: r'Groups')
  static const PermissionReadTargetEnum groups = _$permissionReadTargetEnum_groups;
  @BuiltValueEnumConst(wireName: r'Adventure Missions')
  static const PermissionReadTargetEnum adventureMissions = _$permissionReadTargetEnum_adventureMissions;
  @BuiltValueEnumConst(wireName: r'Nollning')
  static const PermissionReadTargetEnum nollning = _$permissionReadTargetEnum_nollning;
  @BuiltValueEnumConst(wireName: r'UserDoorAccess')
  static const PermissionReadTargetEnum userDoorAccess = _$permissionReadTargetEnum_userDoorAccess;
  @BuiltValueEnumConst(wireName: r'Tags')
  static const PermissionReadTargetEnum tags = _$permissionReadTargetEnum_tags;
  @BuiltValueEnumConst(wireName: r'Council')
  static const PermissionReadTargetEnum council = _$permissionReadTargetEnum_council;

  static Serializer<PermissionReadTargetEnum> get serializer => _$permissionReadTargetEnumSerializer;

  const PermissionReadTargetEnum._(String name): super(name);

  static BuiltSet<PermissionReadTargetEnum> get values => _$permissionReadTargetEnumValues;
  static PermissionReadTargetEnum valueOf(String name) => _$permissionReadTargetEnumValueOf(name);
}

