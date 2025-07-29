//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/update_permission_part.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_permissions.g.dart';

/// UpdatePermissions
///
/// Properties:
/// * [postId] 
/// * [permissions] 
@BuiltValue()
abstract class UpdatePermissions implements Built<UpdatePermissions, UpdatePermissionsBuilder> {
  @BuiltValueField(wireName: r'post_id')
  int get postId;

  @BuiltValueField(wireName: r'permissions')
  BuiltList<UpdatePermissionPart> get permissions;

  UpdatePermissions._();

  factory UpdatePermissions([void updates(UpdatePermissionsBuilder b)]) = _$UpdatePermissions;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdatePermissionsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdatePermissions> get serializer => _$UpdatePermissionsSerializer();
}

class _$UpdatePermissionsSerializer implements PrimitiveSerializer<UpdatePermissions> {
  @override
  final Iterable<Type> types = const [UpdatePermissions, _$UpdatePermissions];

  @override
  final String wireName = r'UpdatePermissions';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdatePermissions object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'post_id';
    yield serializers.serialize(
      object.postId,
      specifiedType: const FullType(int),
    );
    yield r'permissions';
    yield serializers.serialize(
      object.permissions,
      specifiedType: const FullType(BuiltList, [FullType(UpdatePermissionPart)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdatePermissions object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdatePermissionsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.postId = valueDes;
          break;
        case r'permissions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UpdatePermissionPart)]),
          ) as BuiltList<UpdatePermissionPart>;
          result.permissions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdatePermissions deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdatePermissionsBuilder();
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

