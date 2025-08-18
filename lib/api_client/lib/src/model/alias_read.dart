//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'alias_read.g.dart';

/// AliasRead
///
/// Properties:
/// * [alias] 
/// * [members] 
@BuiltValue()
abstract class AliasRead implements Built<AliasRead, AliasReadBuilder> {
  @BuiltValueField(wireName: r'alias')
  String get alias;

  @BuiltValueField(wireName: r'members')
  BuiltList<String> get members;

  AliasRead._();

  factory AliasRead([void updates(AliasReadBuilder b)]) = _$AliasRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AliasReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AliasRead> get serializer => _$AliasReadSerializer();
}

class _$AliasReadSerializer implements PrimitiveSerializer<AliasRead> {
  @override
  final Iterable<Type> types = const [AliasRead, _$AliasRead];

  @override
  final String wireName = r'AliasRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AliasRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'alias';
    yield serializers.serialize(
      object.alias,
      specifiedType: const FullType(String),
    );
    yield r'members';
    yield serializers.serialize(
      object.members,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AliasRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AliasReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'alias':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.alias = valueDes;
          break;
        case r'members':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.members.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AliasRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AliasReadBuilder();
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

