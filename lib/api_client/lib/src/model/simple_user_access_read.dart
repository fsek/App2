//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'simple_user_access_read.g.dart';

/// SimpleUserAccessRead
///
/// Properties:
/// * [door] 
/// * [starttime] 
/// * [endtime] 
@BuiltValue()
abstract class SimpleUserAccessRead implements Built<SimpleUserAccessRead, SimpleUserAccessReadBuilder> {
  @BuiltValueField(wireName: r'door')
  String get door;

  @BuiltValueField(wireName: r'starttime')
  DateTime get starttime;

  @BuiltValueField(wireName: r'endtime')
  DateTime get endtime;

  SimpleUserAccessRead._();

  factory SimpleUserAccessRead([void updates(SimpleUserAccessReadBuilder b)]) = _$SimpleUserAccessRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SimpleUserAccessReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SimpleUserAccessRead> get serializer => _$SimpleUserAccessReadSerializer();
}

class _$SimpleUserAccessReadSerializer implements PrimitiveSerializer<SimpleUserAccessRead> {
  @override
  final Iterable<Type> types = const [SimpleUserAccessRead, _$SimpleUserAccessRead];

  @override
  final String wireName = r'SimpleUserAccessRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SimpleUserAccessRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'door';
    yield serializers.serialize(
      object.door,
      specifiedType: const FullType(String),
    );
    yield r'starttime';
    yield serializers.serialize(
      object.starttime,
      specifiedType: const FullType(DateTime),
    );
    yield r'endtime';
    yield serializers.serialize(
      object.endtime,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SimpleUserAccessRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SimpleUserAccessReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'door':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.door = valueDes;
          break;
        case r'starttime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.starttime = valueDes;
          break;
        case r'endtime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endtime = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SimpleUserAccessRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SimpleUserAccessReadBuilder();
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

