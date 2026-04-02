//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'election_update.g.dart';

/// ElectionUpdate
///
/// Properties:
/// * [titleSv] 
/// * [titleEn] 
/// * [startTime] 
/// * [descriptionSv] 
/// * [descriptionEn] 
/// * [visible] 
@BuiltValue()
abstract class ElectionUpdate implements Built<ElectionUpdate, ElectionUpdateBuilder> {
  @BuiltValueField(wireName: r'title_sv')
  String? get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String? get titleEn;

  @BuiltValueField(wireName: r'start_time')
  DateTime? get startTime;

  @BuiltValueField(wireName: r'description_sv')
  String? get descriptionSv;

  @BuiltValueField(wireName: r'description_en')
  String? get descriptionEn;

  @BuiltValueField(wireName: r'visible')
  bool? get visible;

  ElectionUpdate._();

  factory ElectionUpdate([void updates(ElectionUpdateBuilder b)]) = _$ElectionUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ElectionUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ElectionUpdate> get serializer => _$ElectionUpdateSerializer();
}

class _$ElectionUpdateSerializer implements PrimitiveSerializer<ElectionUpdate> {
  @override
  final Iterable<Type> types = const [ElectionUpdate, _$ElectionUpdate];

  @override
  final String wireName = r'ElectionUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ElectionUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'title_sv';
    yield object.titleSv == null ? null : serializers.serialize(
      object.titleSv,
      specifiedType: const FullType.nullable(String),
    );
    yield r'title_en';
    yield object.titleEn == null ? null : serializers.serialize(
      object.titleEn,
      specifiedType: const FullType.nullable(String),
    );
    yield r'start_time';
    yield object.startTime == null ? null : serializers.serialize(
      object.startTime,
      specifiedType: const FullType.nullable(DateTime),
    );
    yield r'description_sv';
    yield object.descriptionSv == null ? null : serializers.serialize(
      object.descriptionSv,
      specifiedType: const FullType.nullable(String),
    );
    yield r'description_en';
    yield object.descriptionEn == null ? null : serializers.serialize(
      object.descriptionEn,
      specifiedType: const FullType.nullable(String),
    );
    yield r'visible';
    yield object.visible == null ? null : serializers.serialize(
      object.visible,
      specifiedType: const FullType.nullable(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ElectionUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ElectionUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.titleSv = valueDes;
          break;
        case r'title_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.titleEn = valueDes;
          break;
        case r'start_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.startTime = valueDes;
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
        case r'visible':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.visible = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ElectionUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ElectionUpdateBuilder();
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

