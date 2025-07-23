//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_event_tag.g.dart';

/// AddEventTag
///
/// Properties:
/// * [eventId] 
/// * [tagId] 
@BuiltValue()
abstract class AddEventTag implements Built<AddEventTag, AddEventTagBuilder> {
  @BuiltValueField(wireName: r'event_id')
  int get eventId;

  @BuiltValueField(wireName: r'tag_id')
  int get tagId;

  AddEventTag._();

  factory AddEventTag([void updates(AddEventTagBuilder b)]) = _$AddEventTag;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddEventTagBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddEventTag> get serializer => _$AddEventTagSerializer();
}

class _$AddEventTagSerializer implements PrimitiveSerializer<AddEventTag> {
  @override
  final Iterable<Type> types = const [AddEventTag, _$AddEventTag];

  @override
  final String wireName = r'AddEventTag';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddEventTag object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'event_id';
    yield serializers.serialize(
      object.eventId,
      specifiedType: const FullType(int),
    );
    yield r'tag_id';
    yield serializers.serialize(
      object.tagId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddEventTag object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddEventTagBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'event_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.eventId = valueDes;
          break;
        case r'tag_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.tagId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddEventTag deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddEventTagBuilder();
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

