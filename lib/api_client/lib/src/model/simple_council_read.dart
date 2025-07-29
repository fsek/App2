//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'simple_council_read.g.dart';

/// SimpleCouncilRead
///
/// Properties:
/// * [id] 
/// * [nameSv] 
/// * [nameEn] 
@BuiltValue()
abstract class SimpleCouncilRead implements Built<SimpleCouncilRead, SimpleCouncilReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name_sv')
  String get nameSv;

  @BuiltValueField(wireName: r'name_en')
  String get nameEn;

  SimpleCouncilRead._();

  factory SimpleCouncilRead([void updates(SimpleCouncilReadBuilder b)]) = _$SimpleCouncilRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SimpleCouncilReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SimpleCouncilRead> get serializer => _$SimpleCouncilReadSerializer();
}

class _$SimpleCouncilReadSerializer implements PrimitiveSerializer<SimpleCouncilRead> {
  @override
  final Iterable<Type> types = const [SimpleCouncilRead, _$SimpleCouncilRead];

  @override
  final String wireName = r'SimpleCouncilRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SimpleCouncilRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'name_sv';
    yield serializers.serialize(
      object.nameSv,
      specifiedType: const FullType(String),
    );
    yield r'name_en';
    yield serializers.serialize(
      object.nameEn,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SimpleCouncilRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SimpleCouncilReadBuilder result,
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
        case r'name_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nameSv = valueDes;
          break;
        case r'name_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nameEn = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SimpleCouncilRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SimpleCouncilReadBuilder();
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

