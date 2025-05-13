//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_permission_read.g.dart';

/// PostPermissionRead
///
/// Properties:
/// * [id] 
/// * [action] 
/// * [target] 
@BuiltValue()
abstract class PostPermissionRead implements Built<PostPermissionRead, PostPermissionReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'action')
  String get action;

  @BuiltValueField(wireName: r'target')
  String get target;

  PostPermissionRead._();

  factory PostPermissionRead([void updates(PostPermissionReadBuilder b)]) = _$PostPermissionRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostPermissionReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostPermissionRead> get serializer => _$PostPermissionReadSerializer();
}

class _$PostPermissionReadSerializer implements PrimitiveSerializer<PostPermissionRead> {
  @override
  final Iterable<Type> types = const [PostPermissionRead, _$PostPermissionRead];

  @override
  final String wireName = r'PostPermissionRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostPermissionRead object, {
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
      specifiedType: const FullType(String),
    );
    yield r'target';
    yield serializers.serialize(
      object.target,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PostPermissionRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostPermissionReadBuilder result,
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
            specifiedType: const FullType(String),
          ) as String;
          result.action = valueDes;
          break;
        case r'target':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
  PostPermissionRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostPermissionReadBuilder();
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

