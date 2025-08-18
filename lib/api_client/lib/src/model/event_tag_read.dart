//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/event_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_tag_read.g.dart';

/// EventTagRead
///
/// Properties:
/// * [event] 
@BuiltValue()
abstract class EventTagRead implements Built<EventTagRead, EventTagReadBuilder> {
  @BuiltValueField(wireName: r'event')
  EventRead get event;

  EventTagRead._();

  factory EventTagRead([void updates(EventTagReadBuilder b)]) = _$EventTagRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventTagReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventTagRead> get serializer => _$EventTagReadSerializer();
}

class _$EventTagReadSerializer implements PrimitiveSerializer<EventTagRead> {
  @override
  final Iterable<Type> types = const [EventTagRead, _$EventTagRead];

  @override
  final String wireName = r'EventTagRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventTagRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'event';
    yield serializers.serialize(
      object.event,
      specifiedType: const FullType(EventRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EventTagRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventTagReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'event':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EventRead),
          ) as EventRead;
          result.event.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventTagRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventTagReadBuilder();
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

