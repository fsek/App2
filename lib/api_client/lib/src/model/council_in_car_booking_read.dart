//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'council_in_car_booking_read.g.dart';

/// CouncilInCarBookingRead
///
/// Properties:
/// * [id] 
/// * [name] 
@BuiltValue()
abstract class CouncilInCarBookingRead implements Built<CouncilInCarBookingRead, CouncilInCarBookingReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  CouncilInCarBookingRead._();

  factory CouncilInCarBookingRead([void updates(CouncilInCarBookingReadBuilder b)]) = _$CouncilInCarBookingRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CouncilInCarBookingReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CouncilInCarBookingRead> get serializer => _$CouncilInCarBookingReadSerializer();
}

class _$CouncilInCarBookingReadSerializer implements PrimitiveSerializer<CouncilInCarBookingRead> {
  @override
  final Iterable<Type> types = const [CouncilInCarBookingRead, _$CouncilInCarBookingRead];

  @override
  final String wireName = r'CouncilInCarBookingRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CouncilInCarBookingRead object, {
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
    CouncilInCarBookingRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CouncilInCarBookingReadBuilder result,
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
  CouncilInCarBookingRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CouncilInCarBookingReadBuilder();
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

