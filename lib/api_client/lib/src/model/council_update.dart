//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'council_update.g.dart';

/// CouncilUpdate
///
/// Properties:
/// * [nameSv] 
/// * [nameEn] 
/// * [descriptionSv] 
/// * [descriptionEn] 
@BuiltValue()
abstract class CouncilUpdate implements Built<CouncilUpdate, CouncilUpdateBuilder> {
  @BuiltValueField(wireName: r'name_sv')
  String? get nameSv;

  @BuiltValueField(wireName: r'name_en')
  String? get nameEn;

  @BuiltValueField(wireName: r'description_sv')
  String? get descriptionSv;

  @BuiltValueField(wireName: r'description_en')
  String? get descriptionEn;

  CouncilUpdate._();

  factory CouncilUpdate([void updates(CouncilUpdateBuilder b)]) = _$CouncilUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CouncilUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CouncilUpdate> get serializer => _$CouncilUpdateSerializer();
}

class _$CouncilUpdateSerializer implements PrimitiveSerializer<CouncilUpdate> {
  @override
  final Iterable<Type> types = const [CouncilUpdate, _$CouncilUpdate];

  @override
  final String wireName = r'CouncilUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CouncilUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.nameSv != null) {
      yield r'name_sv';
      yield serializers.serialize(
        object.nameSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.nameEn != null) {
      yield r'name_en';
      yield serializers.serialize(
        object.nameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.descriptionSv != null) {
      yield r'description_sv';
      yield serializers.serialize(
        object.descriptionSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.descriptionEn != null) {
      yield r'description_en';
      yield serializers.serialize(
        object.descriptionEn,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CouncilUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CouncilUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nameSv = valueDes;
          break;
        case r'name_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nameEn = valueDes;
          break;
        case r'description_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.descriptionSv = valueDes;
          break;
        case r'description_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.descriptionEn = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CouncilUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CouncilUpdateBuilder();
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

