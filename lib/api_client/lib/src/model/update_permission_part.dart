//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_permission_part.g.dart';

/// UpdatePermissionPart
///
/// Properties:
/// * [change] 
/// * [permissionId] 
@BuiltValue()
abstract class UpdatePermissionPart implements Built<UpdatePermissionPart, UpdatePermissionPartBuilder> {
  @BuiltValueField(wireName: r'change')
  UpdatePermissionPartChangeEnum get change;
  // enum changeEnum {  add,  remove,  };

  @BuiltValueField(wireName: r'permission_id')
  int get permissionId;

  UpdatePermissionPart._();

  factory UpdatePermissionPart([void updates(UpdatePermissionPartBuilder b)]) = _$UpdatePermissionPart;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdatePermissionPartBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdatePermissionPart> get serializer => _$UpdatePermissionPartSerializer();
}

class _$UpdatePermissionPartSerializer implements PrimitiveSerializer<UpdatePermissionPart> {
  @override
  final Iterable<Type> types = const [UpdatePermissionPart, _$UpdatePermissionPart];

  @override
  final String wireName = r'UpdatePermissionPart';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdatePermissionPart object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'change';
    yield serializers.serialize(
      object.change,
      specifiedType: const FullType(UpdatePermissionPartChangeEnum),
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
    UpdatePermissionPart object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdatePermissionPartBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'change':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpdatePermissionPartChangeEnum),
          ) as UpdatePermissionPartChangeEnum;
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
  UpdatePermissionPart deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdatePermissionPartBuilder();
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

class UpdatePermissionPartChangeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'add')
  static const UpdatePermissionPartChangeEnum add = _$updatePermissionPartChangeEnum_add;
  @BuiltValueEnumConst(wireName: r'remove')
  static const UpdatePermissionPartChangeEnum remove = _$updatePermissionPartChangeEnum_remove;

  static Serializer<UpdatePermissionPartChangeEnum> get serializer => _$updatePermissionPartChangeEnumSerializer;

  const UpdatePermissionPartChangeEnum._(String name): super(name);

  static BuiltSet<UpdatePermissionPartChangeEnum> get values => _$updatePermissionPartChangeEnumValues;
  static UpdatePermissionPartChangeEnum valueOf(String name) => _$updatePermissionPartChangeEnumValueOf(name);
}

