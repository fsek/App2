//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_permission.g.dart';

/// UpdatePermission
///
/// Properties:
/// * [postId] 
/// * [change] 
/// * [permissionId] 
@BuiltValue()
abstract class UpdatePermission implements Built<UpdatePermission, UpdatePermissionBuilder> {
  @BuiltValueField(wireName: r'post_id')
  int get postId;

  @BuiltValueField(wireName: r'change')
  UpdatePermissionChangeEnum get change;
  // enum changeEnum {  add,  remove,  };

  @BuiltValueField(wireName: r'permission_id')
  int get permissionId;

  UpdatePermission._();

  factory UpdatePermission([void updates(UpdatePermissionBuilder b)]) = _$UpdatePermission;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdatePermissionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdatePermission> get serializer => _$UpdatePermissionSerializer();
}

class _$UpdatePermissionSerializer implements PrimitiveSerializer<UpdatePermission> {
  @override
  final Iterable<Type> types = const [UpdatePermission, _$UpdatePermission];

  @override
  final String wireName = r'UpdatePermission';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdatePermission object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'post_id';
    yield serializers.serialize(
      object.postId,
      specifiedType: const FullType(int),
    );
    yield r'change';
    yield serializers.serialize(
      object.change,
      specifiedType: const FullType(UpdatePermissionChangeEnum),
    );
    yield r'permission_id';
    yield serializers.serialize(
      object.permissionId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdatePermission object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdatePermissionBuilder result,
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
        case r'change':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpdatePermissionChangeEnum),
          ) as UpdatePermissionChangeEnum;
          result.change = valueDes;
          break;
        case r'permission_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.permissionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdatePermission deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdatePermissionBuilder();
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

class UpdatePermissionChangeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'add')
  static const UpdatePermissionChangeEnum add = _$updatePermissionChangeEnum_add;
  @BuiltValueEnumConst(wireName: r'remove')
  static const UpdatePermissionChangeEnum remove = _$updatePermissionChangeEnum_remove;

  static Serializer<UpdatePermissionChangeEnum> get serializer => _$updatePermissionChangeEnumSerializer;

  const UpdatePermissionChangeEnum._(String name): super(name);

  static BuiltSet<UpdatePermissionChangeEnum> get values => _$updatePermissionChangeEnumValues;
  static UpdatePermissionChangeEnum valueOf(String name) => _$updatePermissionChangeEnumValueOf(name);
}

