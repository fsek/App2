//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'council_in_event_read.g.dart';

/// CouncilInEventRead
///
/// Properties:
/// * [id] 
/// * [name] 
@BuiltValue()
abstract class CouncilInEventRead implements Built<CouncilInEventRead, CouncilInEventReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  CouncilInEventRead._();

  factory CouncilInEventRead([void updates(CouncilInEventReadBuilder b)]) = _$CouncilInEventRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CouncilInEventReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CouncilInEventRead> get serializer => _$CouncilInEventReadSerializer();
}

class _$CouncilInEventReadSerializer implements PrimitiveSerializer<CouncilInEventRead> {
  @override
  final Iterable<Type> types = const [CouncilInEventRead, _$CouncilInEventRead];

  @override
  final String wireName = r'CouncilInEventRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CouncilInEventRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CouncilInEventRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CouncilInEventReadBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CouncilInEventRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CouncilInEventReadBuilder();
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

