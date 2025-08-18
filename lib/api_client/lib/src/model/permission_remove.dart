//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'permission_remove.g.dart';

/// PermissionRemove
///
/// Properties:
/// * [action] 
/// * [target] 
@BuiltValue()
abstract class PermissionRemove implements Built<PermissionRemove, PermissionRemoveBuilder> {
  @BuiltValueField(wireName: r'action')
  PermissionRemoveActionEnum get action;
  // enum actionEnum {  view,  manage,  super,  };

  @BuiltValueField(wireName: r'target')
  PermissionRemoveTargetEnum get target;
  // enum targetEnum {  Event,  Document,  User,  Post,  UserPost,  Permission,  News,  Song,  Ads,  Gallery,  Car,  Cafe,  Election,  Groups,  AdventureMissions,  Nollning,  UserDoorAccess,  Tags,  Council,  RoomBookings,  Moosegame,  MailAlias,  };

  PermissionRemove._();

  factory PermissionRemove([void updates(PermissionRemoveBuilder b)]) = _$PermissionRemove;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PermissionRemoveBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PermissionRemove> get serializer => _$PermissionRemoveSerializer();
}

class _$PermissionRemoveSerializer implements PrimitiveSerializer<PermissionRemove> {
  @override
  final Iterable<Type> types = const [PermissionRemove, _$PermissionRemove];

  @override
  final String wireName = r'PermissionRemove';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PermissionRemove object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'action';
    yield serializers.serialize(
      object.action,
      specifiedType: const FullType(PermissionRemoveActionEnum),
    );
    yield r'target';
    yield serializers.serialize(
      object.target,
      specifiedType: const FullType(PermissionRemoveTargetEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PermissionRemove object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PermissionRemoveBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'action':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PermissionRemoveActionEnum),
          ) as PermissionRemoveActionEnum;
          result.action = valueDes;
          break;
        case r'target':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PermissionRemoveTargetEnum),
          ) as PermissionRemoveTargetEnum;
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
  PermissionRemove deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PermissionRemoveBuilder();
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

class PermissionRemoveActionEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'view')
  static const PermissionRemoveActionEnum view = _$permissionRemoveActionEnum_view;
  @BuiltValueEnumConst(wireName: r'manage')
  static const PermissionRemoveActionEnum manage = _$permissionRemoveActionEnum_manage;
  @BuiltValueEnumConst(wireName: r'super')
  static const PermissionRemoveActionEnum super_ = _$permissionRemoveActionEnum_super_;

  static Serializer<PermissionRemoveActionEnum> get serializer => _$permissionRemoveActionEnumSerializer;

  const PermissionRemoveActionEnum._(String name): super(name);

  static BuiltSet<PermissionRemoveActionEnum> get values => _$permissionRemoveActionEnumValues;
  static PermissionRemoveActionEnum valueOf(String name) => _$permissionRemoveActionEnumValueOf(name);
}

class PermissionRemoveTargetEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Event')
  static const PermissionRemoveTargetEnum event = _$permissionRemoveTargetEnum_event;
  @BuiltValueEnumConst(wireName: r'Document')
  static const PermissionRemoveTargetEnum document = _$permissionRemoveTargetEnum_document;
  @BuiltValueEnumConst(wireName: r'User')
  static const PermissionRemoveTargetEnum user = _$permissionRemoveTargetEnum_user;
  @BuiltValueEnumConst(wireName: r'Post')
  static const PermissionRemoveTargetEnum post = _$permissionRemoveTargetEnum_post;
  @BuiltValueEnumConst(wireName: r'UserPost')
  static const PermissionRemoveTargetEnum userPost = _$permissionRemoveTargetEnum_userPost;
  @BuiltValueEnumConst(wireName: r'Permission')
  static const PermissionRemoveTargetEnum permission = _$permissionRemoveTargetEnum_permission;
  @BuiltValueEnumConst(wireName: r'News')
  static const PermissionRemoveTargetEnum news = _$permissionRemoveTargetEnum_news;
  @BuiltValueEnumConst(wireName: r'Song')
  static const PermissionRemoveTargetEnum song = _$permissionRemoveTargetEnum_song;
  @BuiltValueEnumConst(wireName: r'Ads')
  static const PermissionRemoveTargetEnum ads = _$permissionRemoveTargetEnum_ads;
  @BuiltValueEnumConst(wireName: r'Gallery')
  static const PermissionRemoveTargetEnum gallery = _$permissionRemoveTargetEnum_gallery;
  @BuiltValueEnumConst(wireName: r'Car')
  static const PermissionRemoveTargetEnum car = _$permissionRemoveTargetEnum_car;
  @BuiltValueEnumConst(wireName: r'Cafe')
  static const PermissionRemoveTargetEnum cafe = _$permissionRemoveTargetEnum_cafe;
  @BuiltValueEnumConst(wireName: r'Election')
  static const PermissionRemoveTargetEnum election = _$permissionRemoveTargetEnum_election;
  @BuiltValueEnumConst(wireName: r'Groups')
  static const PermissionRemoveTargetEnum groups = _$permissionRemoveTargetEnum_groups;
  @BuiltValueEnumConst(wireName: r'AdventureMissions')
  static const PermissionRemoveTargetEnum adventureMissions = _$permissionRemoveTargetEnum_adventureMissions;
  @BuiltValueEnumConst(wireName: r'Nollning')
  static const PermissionRemoveTargetEnum nollning = _$permissionRemoveTargetEnum_nollning;
  @BuiltValueEnumConst(wireName: r'UserDoorAccess')
  static const PermissionRemoveTargetEnum userDoorAccess = _$permissionRemoveTargetEnum_userDoorAccess;
  @BuiltValueEnumConst(wireName: r'Tags')
  static const PermissionRemoveTargetEnum tags = _$permissionRemoveTargetEnum_tags;
  @BuiltValueEnumConst(wireName: r'Council')
  static const PermissionRemoveTargetEnum council = _$permissionRemoveTargetEnum_council;
  @BuiltValueEnumConst(wireName: r'RoomBookings')
  static const PermissionRemoveTargetEnum roomBookings = _$permissionRemoveTargetEnum_roomBookings;
  @BuiltValueEnumConst(wireName: r'Moosegame')
  static const PermissionRemoveTargetEnum moosegame = _$permissionRemoveTargetEnum_moosegame;
  @BuiltValueEnumConst(wireName: r'MailAlias')
  static const PermissionRemoveTargetEnum mailAlias = _$permissionRemoveTargetEnum_mailAlias;

  static Serializer<PermissionRemoveTargetEnum> get serializer => _$permissionRemoveTargetEnumSerializer;

  const PermissionRemoveTargetEnum._(String name): super(name);

  static BuiltSet<PermissionRemoveTargetEnum> get values => _$permissionRemoveTargetEnumValues;
  static PermissionRemoveTargetEnum valueOf(String name) => _$permissionRemoveTargetEnumValueOf(name);
}

