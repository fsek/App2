//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'permission_create.g.dart';

/// PermissionCreate
///
/// Properties:
/// * [action] 
/// * [target] 
@BuiltValue()
abstract class PermissionCreate implements Built<PermissionCreate, PermissionCreateBuilder> {
  @BuiltValueField(wireName: r'action')
  PermissionCreateActionEnum get action;
  // enum actionEnum {  view,  manage,  super,  };

  @BuiltValueField(wireName: r'target')
  PermissionCreateTargetEnum get target;
  // enum targetEnum {  Event,  Document,  User,  Post,  Permission,  News,  Song,  Ads,  Gallery,  Car,  Cafe,  Election,  Groups,  AdventureMissions,  Nollning,  UserDoorAccess,  Tags,  Council,  RoomBookings,  Moosegame,  };

  PermissionCreate._();

  factory PermissionCreate([void updates(PermissionCreateBuilder b)]) = _$PermissionCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PermissionCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PermissionCreate> get serializer => _$PermissionCreateSerializer();
}

class _$PermissionCreateSerializer implements PrimitiveSerializer<PermissionCreate> {
  @override
  final Iterable<Type> types = const [PermissionCreate, _$PermissionCreate];

  @override
  final String wireName = r'PermissionCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PermissionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'action';
    yield serializers.serialize(
      object.action,
      specifiedType: const FullType(PermissionCreateActionEnum),
    );
    yield r'target';
    yield serializers.serialize(
      object.target,
      specifiedType: const FullType(PermissionCreateTargetEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PermissionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PermissionCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'action':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PermissionCreateActionEnum),
          ) as PermissionCreateActionEnum;
          result.action = valueDes;
          break;
        case r'target':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PermissionCreateTargetEnum),
          ) as PermissionCreateTargetEnum;
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
  PermissionCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PermissionCreateBuilder();
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

class PermissionCreateActionEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'view')
  static const PermissionCreateActionEnum view = _$permissionCreateActionEnum_view;
  @BuiltValueEnumConst(wireName: r'manage')
  static const PermissionCreateActionEnum manage = _$permissionCreateActionEnum_manage;
  @BuiltValueEnumConst(wireName: r'super')
  static const PermissionCreateActionEnum super_ = _$permissionCreateActionEnum_super_;

  static Serializer<PermissionCreateActionEnum> get serializer => _$permissionCreateActionEnumSerializer;

  const PermissionCreateActionEnum._(String name): super(name);

  static BuiltSet<PermissionCreateActionEnum> get values => _$permissionCreateActionEnumValues;
  static PermissionCreateActionEnum valueOf(String name) => _$permissionCreateActionEnumValueOf(name);
}

class PermissionCreateTargetEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Event')
  static const PermissionCreateTargetEnum event = _$permissionCreateTargetEnum_event;
  @BuiltValueEnumConst(wireName: r'Document')
  static const PermissionCreateTargetEnum document = _$permissionCreateTargetEnum_document;
  @BuiltValueEnumConst(wireName: r'User')
  static const PermissionCreateTargetEnum user = _$permissionCreateTargetEnum_user;
  @BuiltValueEnumConst(wireName: r'Post')
  static const PermissionCreateTargetEnum post = _$permissionCreateTargetEnum_post;
  @BuiltValueEnumConst(wireName: r'Permission')
  static const PermissionCreateTargetEnum permission = _$permissionCreateTargetEnum_permission;
  @BuiltValueEnumConst(wireName: r'News')
  static const PermissionCreateTargetEnum news = _$permissionCreateTargetEnum_news;
  @BuiltValueEnumConst(wireName: r'Song')
  static const PermissionCreateTargetEnum song = _$permissionCreateTargetEnum_song;
  @BuiltValueEnumConst(wireName: r'Ads')
  static const PermissionCreateTargetEnum ads = _$permissionCreateTargetEnum_ads;
  @BuiltValueEnumConst(wireName: r'Gallery')
  static const PermissionCreateTargetEnum gallery = _$permissionCreateTargetEnum_gallery;
  @BuiltValueEnumConst(wireName: r'Car')
  static const PermissionCreateTargetEnum car = _$permissionCreateTargetEnum_car;
  @BuiltValueEnumConst(wireName: r'Cafe')
  static const PermissionCreateTargetEnum cafe = _$permissionCreateTargetEnum_cafe;
  @BuiltValueEnumConst(wireName: r'Election')
  static const PermissionCreateTargetEnum election = _$permissionCreateTargetEnum_election;
  @BuiltValueEnumConst(wireName: r'Groups')
  static const PermissionCreateTargetEnum groups = _$permissionCreateTargetEnum_groups;
  @BuiltValueEnumConst(wireName: r'AdventureMissions')
  static const PermissionCreateTargetEnum adventureMissions = _$permissionCreateTargetEnum_adventureMissions;
  @BuiltValueEnumConst(wireName: r'Nollning')
  static const PermissionCreateTargetEnum nollning = _$permissionCreateTargetEnum_nollning;
  @BuiltValueEnumConst(wireName: r'UserDoorAccess')
  static const PermissionCreateTargetEnum userDoorAccess = _$permissionCreateTargetEnum_userDoorAccess;
  @BuiltValueEnumConst(wireName: r'Tags')
  static const PermissionCreateTargetEnum tags = _$permissionCreateTargetEnum_tags;
  @BuiltValueEnumConst(wireName: r'Council')
  static const PermissionCreateTargetEnum council = _$permissionCreateTargetEnum_council;
  @BuiltValueEnumConst(wireName: r'RoomBookings')
  static const PermissionCreateTargetEnum roomBookings = _$permissionCreateTargetEnum_roomBookings;
  @BuiltValueEnumConst(wireName: r'Moosegame')
  static const PermissionCreateTargetEnum moosegame = _$permissionCreateTargetEnum_moosegame;

  static Serializer<PermissionCreateTargetEnum> get serializer => _$permissionCreateTargetEnumSerializer;

  const PermissionCreateTargetEnum._(String name): super(name);

  static BuiltSet<PermissionCreateTargetEnum> get values => _$permissionCreateTargetEnumValues;
  static PermissionCreateTargetEnum valueOf(String name) => _$permissionCreateTargetEnumValueOf(name);
}

