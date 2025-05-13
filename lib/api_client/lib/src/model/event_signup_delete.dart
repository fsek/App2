//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_signup_delete.g.dart';

/// EventSignupDelete
///
/// Properties:
/// * [userId] 
@BuiltValue()
abstract class EventSignupDelete implements Built<EventSignupDelete, EventSignupDeleteBuilder> {
  @BuiltValueField(wireName: r'user_id')
  int? get userId;

  EventSignupDelete._();

  factory EventSignupDelete([void updates(EventSignupDeleteBuilder b)]) = _$EventSignupDelete;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventSignupDeleteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventSignupDelete> get serializer => _$EventSignupDeleteSerializer();
}

class _$EventSignupDeleteSerializer implements PrimitiveSerializer<EventSignupDelete> {
  @override
  final Iterable<Type> types = const [EventSignupDelete, _$EventSignupDelete];

  @override
  final String wireName = r'EventSignupDelete';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventSignupDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userId != null) {
      yield r'user_id';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EventSignupDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventSignupDeleteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventSignupDelete deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventSignupDeleteBuilder();
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

