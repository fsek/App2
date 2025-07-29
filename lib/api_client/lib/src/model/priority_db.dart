//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'priority_db.g.dart';

/// PriorityDB
///
/// Properties:
/// * [priority] 
/// * [eventId] 
@BuiltValue()
abstract class PriorityDB implements Built<PriorityDB, PriorityDBBuilder> {
  @BuiltValueField(wireName: r'priority')
  String get priority;

  @BuiltValueField(wireName: r'event_id')
  int get eventId;

  PriorityDB._();

  factory PriorityDB([void updates(PriorityDBBuilder b)]) = _$PriorityDB;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PriorityDBBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PriorityDB> get serializer => _$PriorityDBSerializer();
}

class _$PriorityDBSerializer implements PrimitiveSerializer<PriorityDB> {
  @override
  final Iterable<Type> types = const [PriorityDB, _$PriorityDB];

  @override
  final String wireName = r'PriorityDB';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PriorityDB object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'priority';
    yield serializers.serialize(
      object.priority,
      specifiedType: const FullType(String),
    );
    yield r'event_id';
    yield serializers.serialize(
      object.eventId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PriorityDB object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PriorityDBBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'priority':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.priority = valueDes;
          break;
        case r'event_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.eventId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PriorityDB deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PriorityDBBuilder();
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

