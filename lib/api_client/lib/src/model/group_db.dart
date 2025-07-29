//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_db.g.dart';

/// GroupDB
///
/// Properties:
/// * [name] 
/// * [groupType] 
@BuiltValue()
abstract class GroupDB implements Built<GroupDB, GroupDBBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'group_type')
  String? get groupType;

  GroupDB._();

  factory GroupDB([void updates(GroupDBBuilder b)]) = _$GroupDB;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupDBBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupDB> get serializer => _$GroupDBSerializer();
}

class _$GroupDBSerializer implements PrimitiveSerializer<GroupDB> {
  @override
  final Iterable<Type> types = const [GroupDB, _$GroupDB];

  @override
  final String wireName = r'GroupDB';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupDB object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.groupType != null) {
      yield r'group_type';
      yield serializers.serialize(
        object.groupType,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupDB object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupDBBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'group_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.groupType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupDB deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupDBBuilder();
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

